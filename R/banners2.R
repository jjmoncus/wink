
#' Create Banner Crosstabs with Statistical Testing
#'
#' This function generates multiple crosstabs using banner variables against a target variable,
#' applying statistical testing across columns. It combines the results into a single table
#' with appropriate column dividers for presentation.
#'
#' @param data The survey data to us
#' @param var A character string specifying the target variable name to be analyzed
#'   against the banner variables
#' @param bys A vector of character strings, where each element represents a banner
#'   variable name to be cross-tabulated with the target variable
#' @param min_group_n An integer specifying the minimum sample size threshold for statistical
#'   testing. Cells with fewer observations may not be included in testing. Default is 100.
#' @param design A survey design object (typically from the survey package) containing
#'   the survey data and design specifications, if you would like weighted percentages. Defaults to NULL
#'
#' @return A data frame containing the combined crosstab results with the following attributes:
#'   \itemize{
#'     \item \code{col_dividers}: A numeric vector indicating where column divisions occur
#'     \item \code{var}: The target variable name used in the analysis
#'     \item \code{bys}: The list of banner variables used in the analysis
#'   }
#'
#' @details
#' The function processes each banner variable sequentially, creating crosstabs via
#' \code{crosstab()} with statistical testing. Statistical testing starts at column B
#' and progresses through subsequent columns based on the number of columns in each table.
#'
#' Column dividers are tracked and stored as attributes to facilitate proper formatting
#' and presentation of the combined results.
#'
#' @examples
#' \dontrun{
#' # Create a survey design object
#' library(survey)
#' design <- svydesign(ids = ~1, data = my_data, weights = ~weight)
#'
#' # Define banner variables
#' my_bys <- list("age_group", "gender", "region")
#'
#' # Generate banner crosstabs
#' result <- banners(
#'   design = design,
#'   var = "satisfaction",
#'   bys = my_bys,
#'   min_group_n = 50
#' )
#'
#' # Access column dividers
#' attr(result, "col_dividers")
#' }
#'
#' @importFrom dplyr select bind_cols rename
#' @importFrom purrr map_dbl
#' @importFrom tidyr pivot_longer
#' @importFrom tibble add_row
#'
#' @seealso \code{\link{crosstab}} for the underlying crosstab function
#'
#' @export
banner <- function(data,
                   var,
                   bys,
                   weight = NULL,
                   var_nets = NULL,
                   digits = 0,
                   min_group_n = 100) {

  # ------------------------------------------------------------------- #
  # ----- gathering function params (same as for crosstab2) ----------- #
  # ------------------------------------------------------------------- #

  # If no argument is passed to weight, create a variable in the dataset called "unweighted" and set it to 1
  if (is.null(weight)) {
    data <- data %>% mutate(unweighted = 1)
    weight <- "unweighted"
    sym_weight <- sym(weight)
  }

  if (!(var %in% names(data))) abort("'var' must be in 'data' ")
  bad_bys <- keep(bys, \(x) {!(x %in% names(data))})
  if (length(bad_bys) > 0) abort(glue("{str_flatten(bad_bys, ', ', last = ' and ')} must be in 'data'"))

  # --------------------------------------------------------------- #
  # ----------------- numbers for Total col ----------------------- #
  # --------------------------------------------------------------- #

  total_params <- calculate_deff(data[[weight]]) %>%
    select(n, deff, moe) %>%
    pivot_longer(cols = everything(), names_to = "levels",
                 values_to = "Total")
  total_cols <- get_totals(var,
                           data,
                           wt = weight,
                           digits = digits) %>%
    mutate(!!sym(var) := as.character(!!sym(var)))
  # if var_nets are provided, ensure they're of the right form
  # and add `var_recode` to the data
  if (!is.null(var_nets)) {

    var_nets <- var_nets %>%
      map(function(x) {
        if (is.numeric(x)) {
          levels(data[[var]])[x]
        } else if (is.character(x)) {
          x
        }
      })

    data <- data %>%
      mutate(var_recode = fct_collapse(!!sym(var), !!!var_nets))

    # calculate `var_recode` values and insert them into the `baby_crosstab` in the right spot
    nets_percents <- get_totals(var = "var_recode",
                                df = data,
                                wt = weight,
                                digits = digits) %>%
      filter(var_recode %in% names(var_nets)) %>%
      mutate(var_recode = glue("NET: {var_recode}")) %>%
      rename(!!sym(var) := var_recode) %>%
      # have to convert to character to match the columns in the forthcoming crosstabs
      mutate(!!sym(var) := as.character(!!sym(var)))

    # each row of nets_percent needs to go right above the first row of its correspnding parent levels
    for (i in 1:nrow(nets_percents)) {

      total_cols <- total_cols %>% add_row(!!!slice(nets_percents, i),
                                           .before = which(total_cols[[var]] == var_nets[[i]][1]))
    }
  }

  # final edits to total_cols
  total_cols <- total_cols  %>%
    rename(levels = !!sym(var),
           Total = !!sym(weight)) %>%
    {mutate(., levels = factor(levels, levels = .$levels))} %>%
    split(~levels) %>%
    map(\(x) x %>% add_row(levels = "..",
                           Total := NA_real_)) %>%
    bind_rows() %>%
    # attach params
    bind_rows(total_params) %>%
    # have to convert to character to match the columns in the forthcoming crosstabs
    mutate(across(everything(), as.character))
  # this will take up the first two columns


  # --------------------------------------------------------------- #
  # ----------------------- other crosstabs ----------------------- #
  # --------------------------------------------------------------- #

  ticker <- 3 # force to start at letter C, given total_cols above

  tables <- list()
  for (i in seq_along(bys)) {

    tables[[i]] <- crosstab2(data,
                             var,
                             bys[[i]],
                             weight = weight,
                             var_nets = var_nets,
                             digits = digits,
                             min_group_n = min_group_n,
                             st_col_start = ticker)
    if (ncol(tables[[i]]) != 1) {
      # at this time, might have more columns than "cols_used" below, so cant interchange them
      # so long as the crosstab didnt error, it will have ncol > 1
      # if so, can safely remove the first columen (var) from the appropriate ones
        tables[[i]] <- tables[[i]] %>% select(-!!sym(var))
    }
    # raise start based on previous values
    cols_used <- ncol(tables[[i]])
    if (i == 1)  {
      tables[[i]] <- structure(tables[[i]], "col_divider" = cols_used + 2) # the first one is pushed forward by the 2 total cols
    } else {
      prev_cols_used <- tables[[i - 1]] %>% attr("col_divider")
      tables[[i]] <- structure(tables[[i]], "col_divider" = prev_cols_used + cols_used) # we dont have to push by 2 again, that's already captured in the i = 1 case
    }

    ticker <- ticker + cols_used
  }

  bind_cols(total_cols, tables) %>%
    as_tibble() %>%
    structure(
      col_dividers = c(2, # brute force a divider after the total columsn
                       map_dbl(tables, ~ attr(.x, "col_divider"))), # gather all the dividers after each crosstab
      var = var,
      bys = bys,
      var_label = attr(data[[var]], "label")
    )

}















