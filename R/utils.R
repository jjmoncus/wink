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

num_to_excel_col(40)

