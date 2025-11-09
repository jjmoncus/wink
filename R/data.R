#' @title Synthetic Survey Data on Attitudes about Food
#'
#' @description
#' A synthetic dataset of 2,000 fictional U.S. adult survey respondents
#' regarding their ratings of various foods and eating styles (pescetarian, vegetarian, vegan)
#'
#' This dataset is intended for use in package examples, tutorials, unit testing, and
#' for beginners wanting to explore how the package works.
#'
#' @format A \code{tibble}:
#' \describe{
#'   \item{\code{unique_id}}{(\emph{Integer}) A unique identifier for each respondent.}
#'
#'   \item{\code{age}}{(\emph{Integer}) Respondent's age, grouped.}
#'   \item{\code{gender}}{(\emph{Factor}) Gender identity.}
#'   \item{\code{income}}{(\emph{Factor}) Income.}
#'   \item{\code{region}}{(\emph{Factor}) The U.S. region of residence.}
#'
#'   \item{\code{rating_meat}}{(\emph{Factor}) How much the respondent likes meat.}
#'   \item{\code{rating_pizza}}{(\emph{Factor}) How much the respondent likes pizza.}
#'   \item{\code{rating_sushi}}{(\emph{Factor}) How much the respondent likes sushi.}
#'   \item{\code{rating_veg}}{(\emph{Factor}) How much the respondent likes vegetables.}
#'
#'   \item{\code{pescetarian}}{(\emph{Factor}) Likelihood of choosing a pescetarian diet.}
#'   \item{\code{veggie}}{(\emph{Factor}) Likelihood of choosing a vegetarian diet.}
#'   \item{\code{vegan}}{(\emph{Factor}) Likelihood of choosing a vegan diet.}
#' }
#'
#'
#' @keywords datasets survey synthetic
"food"
