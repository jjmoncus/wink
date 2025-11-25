#' Get weighted percentages or totals
#'
#' Takes a categorical variable and returns the weighted or unweighted
#' percentage or total of each category. Can include a grouping variable. Can be
#' used to compare weights versus one another.
#'
#' @param data The \code{data.frame} containing the variables to be tabulated.
#' @param var \code{character}, indicating the name of the variable to be tabulated
#' @param wt A \code{character} vector containing the name(s) of the weight variable(s)
#' to be used in tabulating results. If nothing is passed, results will be unweighted.
#' @param by For creating cross-tabulations, an optional \code{character} variable
#' containing the name of the variable to be crossed with \code{var}. Can pass
#' multiple variables in as a vector.
#' Defaults to \code{FALSE}.
#' @param digits The number of decimal points displayed. Defaults to value specified
#' in \code{options("digits")}.
#' @param complete TRUE/FALSE: Should empty levels of `var` and `by` be
#' included in the results? Defaults to \code{TRUE}.
#' @param na.rm Should `NA` values of `var` and `by` be included as their own
#' levels? If \code{TRUE}, columns and rows for `"(Missing)"` values appear. If FALSE,
#' any \code{NA} values in \code{var} are excluded from the denominator of percentages, and
#' any `"(Missing)"` column for `by` is dropped
#'
#' @return A \code{data.frame} with a column for the levels of `var`, along with additional
#' columns of percentages, as specified by arguments to this function.
#'
#' @details If no arguments are supplied to \code{by}, then the output has one
#' column named "total". If arguments are supplied to \code{by}, then the
#' column names will be the categories of the grouping variable.
#'

get_totals <- function(data, var, by = NULL, wt = NULL,
                       digits = NULL, complete = TRUE, na.rm = FALSE) {

  # Initial error handling

  if (!is.character(var)) stop("The var argument only accepts character strings")
  if (length(var) > 1) stop("Only one string at a time can be passed to the var argument")
  if (var == "") stop("Empty strings not allowed for var argument")

  # Pre-processing stage

  # make sure data isn't grouped
  data <- ungroup(data)

  # If no argument is passed to wt, create a variable in the dataset called "unweighted" and set it to 1
  if (is.null(wt)) {
    data <- data %>% mutate(unweighted = 1)
    wt <- "unweighted"
  }

  # ----- level handling (var)
  data[[var]] <- as.factor(data[[var]])
  if (!complete) data[[var]] <- fct_drop(data[[var]])
  if (na.rm) {
    data <- data %>% filter(!is.na(data[[var]]))
  } else {
    # only cast na to level if there are actually na's
    if (any(is.na(data[[var]]))) data[[var]] <- fct_na_value_to_level(data[[var]], level = "(Missing)")
    }

  # ----- level handling (by)
  if(!is.null(by)) {

    data[[var]] <- as.factor(data[[var]])
    if (!complete) data[[by]] <- fct_drop(data[[by]])
    if (na.rm) {
      data <- data %>% filter(!is.na(data[[by]]))
    } else {
      # only cast na to level if there are actually na's
      if (any(is.na(data[[by]]))) data[[by]] <- fct_na_value_to_level(data[[by]], level = "(Missing)")
      }

    }


  # Main internal function
  make_weighted_crosstab <- function(var, data_in, wt_var) {

    # If `data_in` has 0 rows, manually construct a matrix of zeros
    # This ensures all the output is of the same class, allowing for functions such as bind_rows() to work
    if (nrow(data_in) == 0) {

      # this is guaranteed to have the right nunmber of levels because we've already added or subtracted them
      # based on complete and na.rm
      out <- matrix(0, nrow = length(levels( data_in[[var]] )), ncol = 1)
      dimnames(out) <- list(levels( data_in[[var]] ),
                            "empty")
      return(out)
    }


    # if wt_var contains NA values, filter data_in to not include them and print a warning
    # message indicating how many observations were removed
    if (anyNA(data_in[[wt_var]])) {
      num_NAs <- sum(is.na(data_in[[wt_var]]))
      data_in <- data_in %>%
        filter_at(.vars = wt_var, .vars_predicate = all_vars(!is.na(.)))
      warning(sprintf("Removed %s rows containing missing values for %s", num_NAs, wt_var))
    }

    # Convert totals to percent (scaling ._wt to add to 100)
    data_in[[wt_var]] <- 100* data_in[[wt_var]] / sum(data_in[[wt_var]])

    # actually do the math
    form <- glue("~{var} + 0") %>% as.formula()
    X <- sparse.model.matrix(form, data = data_in)
    W <- as.matrix(data_in[[wt_var]])
    out <- crossprod(X, W)
    dimnames(out)[[1]] <- dimnames(out)[[1]] %>% str_remove(pattern = var)

    return( as.matrix(out) )
  }

  # If no arguments are passed to `by`, get `total` percentages
  if (is.null(by)) {

    out <- make_weighted_crosstab(var, data, wt)
    dimnames(out)[[2]] <- "total"

  } else {

    # otherwise, split by `by`
    # If more than one argument is passed to by, split along all level combinations
    out <- purrr::imap(data %>% split(.[, by], sep = ":"), function(data_by, category) {

      mat <- make_weighted_crosstab(var, data_by, wt)
      dimnames(mat)[2] <- category
      mat
    }) %>% reduce(cbind)

  }

  # round if specified
  if (!is.null(digits)) out <- round(out, digits = digits)

  # at this point, `out` is a matrix with rownames
  out <-
    # convert to data frame so numbers display properly
    as.data.frame(out) %>%
    # make rownames its own column
    rownames_to_column(var = var)

  # Replace NAs with zeroes
  # out <- out %>% mutate_if(is.numeric, replace_if, NA, 0)
  return(out)
}
