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


