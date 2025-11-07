# This script generates a large, fake dataset for testing package functions.
# The data simulates survey responses on attitudes towards different food types.

library(tibble)

n_respondents <- 2000
rating_scale <- c("Very much dislike", "Somewhat dislike", "About equally like and dislike", "Somewhat like", "Very much like", "DK/Refused")
likelihood_scale <- c("Very Low", "Low", "Moderate", "High", "Very High", "DK/Refused")

# Generate synthetic data vectors
respondent_ids <- 1:n_respondents

# Age: Random integers between 18 and 80
age_data <- sample(
  c("18-35", "36-49", "50-64", "65+", "DK/Refused", NA_character_),
  n_respondents,
  replace = TRUE,
  prob = c(0.25, 0.29, 0.21, 0.19, .03,.03)
) %>% factor(levels = c("18-35", "36-49", "50-64", "65+"))

# Gender: Sampled with different probabilities for variety (optional, but realistic)
gender_data <- sample(
  c("Woman", "Man", "Other", "DK/Refused", NA_character_),
  n_respondents,
  replace = TRUE,
  prob = c(0.45, 0.42, 0.05, 0.05, .03)
) %>% factor(levels = c("Woman", "Man", "Other", "DK/Refused"))

income_data <- sample(
  c("Low income", "Middle income", "High income", "DK/Refused", NA_character_),
  n_respondents,
  replace = TRUE,
  prob = c(0.35, 0.31, 0.25, 0.05, .04)
) %>% factor(levels = c("Low income", "Middle income", "High income", "DK/Refused"))

# Region: Sampled with equal probability
regions <- c("West Coast", "East Coast", "Midwest", "South", "Mountain West", "Southwest", "DK/Refused")
region_data <- sample(
  c(regions, NA_character_),
  n_respondents,
  prob = c(.15, .15, .15, .15, .15, .15, .075, .025),
  replace = TRUE
  ) %>% factor(levels = regions)

# party lean
party_lean_data <- sample(
  c("Dem/Lean Dem", "Rep/Lean Rep", "DK/Refused", NA_character_),
  n_respondents,
  replace = TRUE,
  prob = c(0.45, 0.45, 0.05, 0.05)
) %>% factor(levels = c("Dem/Lean Dem", "Rep/Lean Rep", "DK/Refused"))

# food ratings
meat_rating <- sample(c(rating_scale, NA_character_), n_respondents, replace = TRUE, prob = c(.05, .25, .20, .34, .10, .05, .01)) %>% factor(levels = rating_scale)
pizza_rating <- sample(c(rating_scale, NA_character_), n_respondents, replace = TRUE, prob = c(.05, .20, .25, .34, .10, .05, .01)) %>% factor(levels = rating_scale)
sushi_rating <- sample(c(rating_scale, NA_character_), n_respondents, replace = TRUE, prob = c(.09, .22, .27, .26, .10, .05, .01)) %>% factor(levels = rating_scale)
vegetables_rating <- sample(c(rating_scale, NA_character_), n_respondents, replace = TRUE, prob = c(.15, .30, .29, .15, .05, .05, .01)) %>% factor(levels = rating_scale)

# eating styles
pesc <- sample(c(likelihood_scale, NA_character_), n_respondents, replace = TRUE, prob = c(.1, .15, .30, .24, .5, .05, .01)) %>% factor(levels = likelihood_scale)
veggie <- sample(c(likelihood_scale, NA_character_), n_respondents, replace = TRUE, prob = c(.15, .25, .35, .14, .05, .05, .01)) %>% factor(levels = likelihood_scale)
vegan <- sample(c(likelihood_scale, NA_character_), n_respondents, replace = TRUE, prob = c(.13, .24, .40, .14, .03, .05, .01)) %>% factor(levels = likelihood_scale)


# Create the final tibble 'food'
food <- tibble(
  unique_id = respondent_ids %>% structure("label" = "Unique ID"),

  # demos
  age = age_data %>% structure(label = "AGE. age groups (recode)"),
  gender = gender_data %>% structure(label = "S2. which of the following best describes you?"),
  income = income_data %>% structure(label = "INCOME. income (recode)"),
  region = region_data %>% structure(label = "S3. What region of the U.S. are you from?"),
  party_lean = party_lean_data %>% structure(label = "PARTY_LEAN. party affiliation (recode)"),

  # food ratings
  rating_meat = pizza_rating %>% structure(label = "Q1a. Please indicate how much you like or dislike each of the following foods.:Meat"),
  rating_pizza = pizza_rating %>% structure(label = "Q1b. Please indicate how much you like or dislike each of the following foods.:Pizza"),
  rating_sushi = sushi_rating %>% structure(label = "Q1c. Please indicate how much you like or dislike each of the following foods.:Sushi"),
  rating_veg = vegetables_rating %>% structure(label = "Q1d. Please indicate how much you like or dislike each of the following foods.:Vegetables"),

  # eating styles
  pescetarian = pesc %>% structure(label = "Q2. How likely are you to choose to eat pescetarian within the coming 12 months?"),
  veggie = veggie %>% structure(label = "Q3. How likely are you to choose to eat vegetarian within the coming 12 months?"),
  vegan = vegan %>% structure(label = "Q4. How likely are you to choose to eat vegan within the coming 12 months?"),
)


