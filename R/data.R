#' @title Synthetic Survey Data on Food Attitudes and Eating Styles
#'
#' @description
#' A synthetic dataset containing responses from 2,000 fictional U.S. adult survey respondents
#' regarding their ratings of various food types and their self-reported likelihood of
#' adopting different eating styles (Pescetarian, Vegetarian, Vegan) in the next 12 months.
#'
#' This dataset is intended for use in package examples, tutorials, and unit testing.
#'
#' @format A \code{tibble} with 2,000 rows and 10 variables:
#' \describe{
#'   \item{\code{unique_id}}{(\emph{Integer, Label: "Unique ID"}) A unique identifier for each respondent.}
#'
#'   \item{\code{age}}{(\emph{Integer, Label: "S1. How old are you?"}) Respondent's age, ranging from 18 to 80.}
#'   \item{\code{gender}}{(\emph{Factor, Label: "S2. which of the following best describes you?"}) Self-reported gender identity.}
#'   \item{\code{region}}{(\emph{Factor, Label: "S3. What region of the U.S. are you from?"}) The U.S. region of residence, including categories like "West Coast" and "Mountain West".}
#'
#'   \item{\code{rating_meat}}{(\emph{Ordered Factor, Label: "Q1a...:Meat"}) Rating of how much the respondent likes meat.}
#'   \item{\code{rating_pizza}}{(\emph{Ordered Factor, Label: "Q1b...:Pizza"}) Rating of how much the respondent likes pizza.}
#'   \item{\code{rating_sushi}}{(\emph{Ordered Factor, Label: "Q1c...:Sushi"}) Rating of how much the respondent likes sushi.}
#'   \item{\code{rating_veg}}{(\emph{Ordered Factor, Label: "Q1d...:Vegetables"}) Rating of how much the respondent likes vegetables.}
#'
#'   \item{\code{pescetarian}}{(\emph{Ordered Factor, Label: "Q2. How likely are you to eat pescetarian..."}) Self-reported likelihood of choosing a pescetarian diet.}
#'   \item{\code{veggie}}{(\emph{Ordered Factor, Label: "Q3. How likely are you to eat vegetarian..."}) Self-reported likelihood of choosing a vegetarian diet.}
#'   \item{\code{vegan}}{(\emph{Ordered Factor, Label: "Q4. How likely are you to eat vegan..."}) Self-reported likelihood of choosing a vegan diet.}
#' }
#'
#' @details
#' The rating scales used for the food items (Q1a-Q1d) are 5-point Likert scales with the following levels:
#' \enumerate{
#'   \item Very much dislike
#'   \item Somewhat dislike
#'   \item About equally like and dislike
#'   \item Somewhat like
#'   \item Very much like
#' }
#'
#' The likelihood scales used for the eating styles (Q2-Q4) are 5-point scales with the following levels:
#' \enumerate{
#'   \item Very Low
#'   \item Low
#'   \item Moderate
#'   \item High
#'   \item Very High
#' }
#'
#' @source
#' This is a synthetically generated dataset created for demonstration and testing purposes.
#'
#' @keywords datasets survey synthetic
"food"
