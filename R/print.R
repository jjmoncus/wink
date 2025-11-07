

#' Constructor for `wink_banner` class
#'
#'
constructor_banner <- function(data) {


  data %>%
    structure(
      class = c("wink_banner", class(data))
    )
}


#' Print method for 'wink_banner' class
#'
#' Implements the custom print behavior for 'wink_banner' tables
#'
#' @param data An object of class 'wink_banner'.
#' @param ... Additional arguments (can ignore for now)
#'
#' @return The input object 'data' (invisibly)
#'
#' @export
#'
#' @method print wink_banner
print.wink_banner <- function(data, ...) {

  data %>%
    gt() %>%
    print()

  # The print method must return the object invisibly (a standard R convention)
  invisible(data)
}
