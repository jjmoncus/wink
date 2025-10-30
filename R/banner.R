
#' Create banner crosstabs and apply signficance testing across groups
#'
#' Generates multiple crosstabs of variables `bys` against a target variable `var`,
#' applying significance testing across columns of each `by` and combining the results into a single table
#'
#' @param data (data.frame) A data frame of survey respondents
#' @param var (chr) the target variable (i.e. dependent variable)
#' @param by (chr) The variable to be cross-tabulated with `var` (i.e. independent variable)
#' @param weight (chr) A weight variable. If NULL, produces unweighted estimates
#' @param var_nets (list) Each element is either a character vector of factor levels of `var`, or a vector of integers, which are the converted to factor levels of `var`
#' @param digits (int) How many decimal places to round all numeric values to. NULL results in the default behavior of `pewmethods::get_totals` (i.e. many decimal places).
#' @param min_group_n (int) n-size threshold to be flagged within `by` groups.
#' @param st_col_start (int) the letter of the alphabet used as the first label for significance testing comparisons
#' @param exclude_var (chr) a regex - matching levels are excluded from `var` rows. If NULL, removes nothing
#' @param exclude_by (chr) a regex - matching levels are excluded from `by` columns. If NULL, removes nothing
#' @param na.rm (lgl) Whether to remove missing values from `var` before calculating values
#'
#'
#' @return
#' A data frame, where rows represent levels of `var` and columns represent levels of `bys`, as well as
#' the total distribution across the entire sample in the front. Each column contains the distribution of respones
#' to `var`, conditional on each `by` level.
#'

#' @details
#' `exclude_bys` must have length 1 or `length(bys)`. If length == `length(bys)`, then each
#' pattern in `exclude_bys` is applied to each by of `bys` in turn. If length == 1, then
#' the same pattern is applied to all `bys`. All other settings throw an error.
#'
#' In the case that `var` and `by` are the same, the result might include extra padding rows corresponding to any
#' levels of `var/by` that were empty, or if `na.rm = FALSE` is set and `var/by`'s missing values resulted in an
#' extra row for "(Missing)". In both cases, padding rows are added to ensure the Total columns and subsequent
#' crosstabs align properly.
#'
#' @examples
#' \dontrun{
#'
#' # `food` is a dataset provided in the package.
#' banners(
#'   data = food,
#'   var = "vegan",
#'   bys = c("rating_meat", "rating_sushi", "rating_veg")
#' )
#'}
#' @importFrom dplyr select bind_cols rename
#' @importFrom purrr map_dbl
#' @importFrom tidyr pivot_longer
#' @importFrom tibble add_row
#'
#' @seealso \code{\link{crosstab}} for the underlying crosstab function
#'
#' @export
#'
banner <- function(data,
                   var,
                   bys,
                   weight = NULL,
                   var_nets = NULL,
                   digits = 0,
                   min_group_n = 100,
                   exclude_var = NULL,
                   exclude_bys = NULL,
                   na.rm = TRUE) {

  # ------------------------------------------------------------------- #
  # ----- gathering function params (same as for crosstab) ----------- #
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

  # need another check for `exclude_var` here, since it wont pass through `crosstab`'s checks when generating "Total" values
  if (is.null(exclude_var)) exclude_var <- "jh93f96gt006gbk075gj5k9g7ejkhg"
  # we allow exclude_bys to be just one pattern, recycled
  # or full length of bys
  # but not in between - i.e. recycling seems dangerous
  if (length(exclude_bys) == 1) {
    # fine, recycle
    exclude_bys <- rep(exclude_bys, times = length(bys))
  } else if (identical(length(exclude_bys), length(bys))) {
    # fine, do nothing
  } else if (is.null(exclude_bys)) {
    # fine, do nothing
  } else {

    abort(glue("'exclude_bys' must have length 1 or {length(bys)}, not {length(exclude_bys)}"))
  }

  if (na.rm) {
    removals <- data %>% filter(is.na(!!sym(var)))
    data <- data %>% filter(!is.na(!!sym(var)))
    }

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
                           digits = digits,
                           na.rm = FALSE) %>%
    mutate(!!sym(var) := as.character(!!sym(var)))

  # if var_nets are provided,
  # ensure they're of the right form
  # and add `var_recode` to the data
  if (!is.null(var_nets)) {

    var_nets <- fix_var_nets(var_nets, data, var)
    data <- data %>% mutate(var_recode = fct_collapse(!!sym(var), !!!var_nets))

    # calculate `var_recode` values and insert them into the `baby_crosstab` in the right spot
    nets_percents <- get_totals(var = "var_recode",
                                df = data,
                                wt = weight,
                                digits = digits,
                                na.rm = FALSE) %>%
      filter(var_recode %in% names(var_nets)) %>%
      mutate(var_recode = glue("NET: {var_recode}")) %>%
      rename(!!sym(var) := var_recode) %>%
      # have to convert to character to match the columns in the forthcoming crosstabs
      mutate(!!sym(var) := as.character(!!sym(var)))

    for (x in names(var_nets)) {

      net_row <- nets_percents %>% filter(!!sym(var) == glue("NET: {x}"))
      first_child_row <- total_cols %>% pull(!!sym(var)) %>% {which(. %in% var_nets[[x]])} %>% .[[1]]
      total_cols <- total_cols %>% add_row(net_row,
                                           .before = first_child_row)
    }
  }

  # final edits to total_cols
  total_cols <- total_cols  %>%
    rename(levels = !!sym(var),
           Total = !!sym(weight)) %>%
    # here we have to filter out the `exclude_var` matches so that `bind_cols` works later
    filter(!str_detect(levels, exclude_var)) %>%
    # THEN we make factor, so the factor variable doesn't contain any levels which have been excluded
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

  ticker <- 3 # force to start at letter C, given `total_cols` above

  tables <- list()
  for (i in seq_along(bys)) {

    tables[[i]] <- crosstab(data,
                            var,
                            bys[[i]],
                            weight = weight,
                            var_nets = var_nets,
                            digits = digits,
                            min_group_n = min_group_n,
                            st_col_start = ticker,
                            exclude_var = exclude_var,
                            exclude_by = exclude_bys[[i]],
                            na.rm = na.rm) # we will be duplicating the step of removing missings from `var`, fine for now

    # an edge case where var and by are the same
    if (identical(var, bys[[i]])) {

      # if there are empty levels in var/by, or if na.rm = FALSE resuled in an extra "Missing" row in total_cols
      # we have to fill in new rows for them
      empty_levels <- setdiff(total_cols[[1]], tables[[i]][[1]])
      empty_level_slots <- which(total_cols[[1]] %in% empty_levels)


      for (empty_level in empty_levels) {

        new_rows <- list(
          c(empty_level, rep(NA, times = length(names(tables[[i]])) - 1)),
          c("..", rep(NA, times = length(names(tables[[i]])) - 1))
        ) %>%
          map(~set_names(.x, names(tables[[i]])) %>%
                {tibble(!!!.)}) %>%
          bind_rows()

        # the insertion needs to happen in correspondence with total_cols above
        where_to_insert <-  which(total_cols$levels == empty_level)

        tables[[i]] <- tables[[i]] %>%
          add_row(new_rows, .after = where_to_insert - 1)

      }
    }

    if (ncol(tables[[i]]) != 1) {
      # at this time, might have more columns than "cols_used" below, so cant interchange them
      # so long as the crosstab didnt error, it will have ncol > 1
      # if so, can safely remove the first column (var) from the later ones
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

  out <- bind_cols(total_cols, tables) %>%
    as_tibble()

  out %>%
    structure(
      col_dividers = c(2, # brute force a divider after the total column
                       map_dbl(tables, ~ attr(.x, "col_divider"))), # gather all the dividers after each crosstab
      var = var,
      bys = bys,
      var_label = attr(data[[var]], "label"),
      by_labels = set_names(bys) %>% map( ~data[[.x]] %>% attr("label")),
      min_group_n = min_group_n,
      too_low_n = out %>% filter(levels == "n") %>% unlist() %>% {which(as.numeric(.) < min_group_n)} %>% suppressWarnings(), # we know we're introducing NAs by coercion on the first column, dont message this
      na.rm = na.rm,
      n_removed = ifelse(na.rm, nrow(removals), NA) # if na.rm = FALSE, removals wont exist, so initialize to NA instead
    )
}


