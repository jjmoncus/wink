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
hardcode_sig_test <- function(p1, n1, deff1, p2, n2, deff2) {

  if (p1 > 1 || p2 > 1) abort("Percentages must be <= 1")
  if (identical(p1, p2)) return(FALSE) # we would otherwise get TRUE default, due to the -0,009 error term below

  raw_tol <- sqrt( (deff1 * (p1*(1-p1)) / n1) + (deff2 * (p2 * (1 - p2)) / n2) )

  (abs(p1 - p2)) - (raw_tol*1.96) > -0.009

}

