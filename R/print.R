

#' Constructor for `wink_banner` class
#'
#'
constructor_banner <- function(data) {


  data %>%
    structure(
      class = c("wink_banner", class(data))
    )
}
