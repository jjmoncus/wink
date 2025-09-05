
#' Create Banner Crosstabs with Statistical Testing
#'
#' This function generates multiple crosstabs using banner variables against a target variable,
#' applying statistical testing across columns. It combines the results into a single table
#' with appropriate column dividers for presentation.
#'
#' @param design A survey design object (typically from the survey package) containing
#'   the survey data and design specifications
#' @param target A character string specifying the target variable name to be analyzed
#'   against the banner variables
#' @param banners A vector of character strings, where each element represents a banner
#'   variable name to be cross-tabulated with the target variable
#' @param min_n An integer specifying the minimum sample size threshold for statistical
#'   testing. Cells with fewer observations may not be included in testing. Default is 100.
#'
#' @return A data frame containing the combined crosstab results with the following attributes:
#'   \itemize{
#'     \item \code{col_dividers}: A numeric vector indicating where column divisions occur
#'     \item \code{target}: The target variable name used in the analysis
#'     \item \code{banners}: The list of banner variables used in the analysis
#'   }
#'   The first banner table retains the Target column, while subsequent banner tables
#'   have the Target column removed to avoid duplication.
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
#' my_banners <- list("age_group", "gender", "region")
#'
#' # Generate banner crosstabs
#' result <- banners(
#'   design = design,
#'   target = "satisfaction",
#'   banners = my_banners,
#'   min_n = 50
#' )
#'
#' # Access column dividers
#' attr(result, "col_dividers")
#' }
#'
#' @importFrom dplyr select bind_cols
#' @importFrom purrr map_dbl
#'
#' @seealso \code{\link{crosstab}} for the underlying crosstab function
#'
#' @export
banners <- function(design, target, banners, min_n = 100) {
  tables <- list()
  ticker <- 2 # force to start at letter B
  for (i in seq_along(banners)) {
    tables[[i]] <- crosstab(design,
                            target,
                            banners[[i]],
                            min_n = min_n,
                            stat_testing_start = ticker)
    if (ncol(tables[[i]]) != 1) {
      # at this time, might have more columns than "cols_used" below, so cant interchange them
      # so long as the crosstab didnt error, it will have ncol > 1
      # if so, can safely remove the first columen (Target) from the appropriate ones
      if (i != 1)
        tables[[i]] <- tables[[i]] %>% select(-Target)
    }
    # raise start based on previous values
    cols_used <- ncol(tables[[i]])
    if (i == 1)
      ticker <- ticker + cols_used - 1
    else
      ticker <- ticker + cols_used

    if (i == 1)  {
      tables[[i]] <- structure(tables[[i]], "col_divider" = cols_used)
    } else {
      # tables[[i]] <- tables[[i]] %>% select(-Target)
      prev_cols_used <- tables[[i - 1]] %>% attr("col_divider")
      tables[[i]] <- structure(tables[[i]], "col_divider" = prev_cols_used + cols_used)
    }
  }

  bind_cols(tables) %>%
    structure(
      col_dividers = map_dbl(tables, ~ attr(.x, "col_divider")),
      target = target,
      banners = banners
    )

} #rename this something about the stat testing only?
