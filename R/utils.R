#' Switch between numbers and Excel lettered columns
#'
num_to_excel_col <- function(x) {

  rounds <- floor(x/26)
  remainder <- x %% 26

  if (identical(remainder, 0)) rounds <- rounds - 1
  prefix <- ifelse(identical(rounds, 0),
                   "",
                   LETTERS[rounds])
  suffix <- ifelse(identical(remainder, 0),
                   "Z",
                   LETTERS[remainder])
  paste0(prefix, suffix)
}




#' safely coerce something to a double, or not
#'
#' Might use this to write values to excel sheets as numbers instead of text, when necessary
double_or_not <- function(x) {

  suppressWarnings(

    ifelse(is.na(as.double(x)),
         x,
         as.double(x))

    )
  }

#' hardcoded test for significant differences between two percentages
hardcode_sig_test <- function(p1s, n1, deff1, p2s, n2, deff2) {

  if (any(p1s > 1) || any(p2s > 1)) abort("Percentages must be <= 1")


  raw_tols <- sqrt( (deff1 * (p1s*(1-p1s)) / n1) + (deff2 * (p2s * (1 - p2s)) / n2) )

  out <- (abs(p1s - p2s)) - (raw_tols*1.96) > -0.009

  # overwrite any pairs where p1 and p2 are exactly the same
  # they would get TRUE by default, due to the -0,009 error term below
  out[(p1s - p2s == 0)] <- FALSE

  return( out )
}

