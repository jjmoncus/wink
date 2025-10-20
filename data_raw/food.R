# This script generates a large, fake dataset for testing package functions.
# The data simulates survey responses on attitudes towards different food types.

library(tibble)

n_respondents <- 2000
rating_scale <- c("Very much dislike", "Somewhat dislike", "About equally like and dislike", "Somewhat like", "Very much like")
likelihood_scale <- c("Very Low", "Low", "Moderate", "High", "Very High")

# Generate synthetic data vectors
respondent_ids <- 1:n_respondents

# Age: Random integers between 18 and 80
age_data <- sample(18:80, n_respondents, replace = TRUE)

# Gender: Sampled with different probabilities for variety (optional, but realistic)
gender_data <- sample(
  c("Female", "Male", "Non-binary", "Prefer not to say"),
  n_respondents,
  replace = TRUE,
  prob = c(0.45, 0.45, 0.05, 0.05)
) %>% factor(levels = c("Female", "Male", "Non-binary", "Prefer not to say"))

# Region: Sampled with equal probability
regions <- c("West Coast", "East Coast", "Midwest", "South", "Mountain West", "Southwest")
region_data <- sample(regions, n_respondents, replace = TRUE) %>% factor(levels = regions)

# food ratings
meat_rating <- sample(rating_scale, n_respondents, replace = TRUE, prob = c(.05, .25, .25, .3, .15)) %>% factor(levels = rating_scale)
pizza_rating <- sample(rating_scale, n_respondents, replace = TRUE, prob = c(.05, .20, .30, .35, .10)) %>% factor(levels = rating_scale)
sushi_rating <- sample(rating_scale, n_respondents, replace = TRUE, prob = c(.10, .25, .30, .25, .10)) %>% factor(levels = rating_scale)
vegetables_rating <- sample(rating_scale, n_respondents, replace = TRUE, prob = c(.15, .35, .25, .2, .05)) %>% factor(levels = rating_scale)

# eating styles
pesc <- sample(likelihood_scale, n_respondents, replace = TRUE, prob = c(.15, .15, .30, .2, .2)) %>% factor(levels = likelihood_scale)
veggie <- sample(likelihood_scale, n_respondents, replace = TRUE, prob = c(.15, .25, .40, .1, .1)) %>% factor(levels = likelihood_scale)
vegan <- sample(likelihood_scale, n_respondents, replace = TRUE, prob = c(.15, .25, .40, .15, .05)) %>% factor(levels = likelihood_scale)


# Create the final tibble 'food'
food <- tibble(
  unique_id = respondent_ids %>% structure("label" = "Unique ID"),

  # demos
  age = age_data %>% structure(label = "S1. How old are you?"),
  gender = gender_data %>% structure(label = "S2. which of the following best describes you?"),
  region = region_data %>% structure(label = "S3. What region of the U.S. are you from?"),

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


