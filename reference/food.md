# Synthetic Survey Data on Food Attitudes and Eating Styles

A synthetic dataset containing responses from 2,000 fictional U.S. adult
survey respondents regarding their ratings of various food types and
their self-reported likelihood of adopting different eating styles
(Pescetarian, Vegetarian, Vegan) in the next 12 months.

This dataset is intended for use in package examples, tutorials, and
unit testing.

## Usage

``` r
food
```

## Format

A `tibble` with 2,000 rows and 10 variables:

- `unique_id`:

  (*Integer, Label: "Unique ID"*) A unique identifier for each
  respondent.

- `age`:

  (*Integer, Label: "S1. How old are you?"*) Respondent's age, ranging
  from 18 to 80.

- `gender`:

  (*Factor, Label: "S2. which of the following best describes you?"*)
  Self-reported gender identity.

- `region`:

  (*Factor, Label: "S3. What region of the U.S. are you from?"*) The
  U.S. region of residence, including categories like "West Coast" and
  "Mountain West".

- `rating_meat`:

  (*Ordered Factor, Label: "Q1a...:Meat"*) Rating of how much the
  respondent likes meat.

- `rating_pizza`:

  (*Ordered Factor, Label: "Q1b...:Pizza"*) Rating of how much the
  respondent likes pizza.

- `rating_sushi`:

  (*Ordered Factor, Label: "Q1c...:Sushi"*) Rating of how much the
  respondent likes sushi.

- `rating_veg`:

  (*Ordered Factor, Label: "Q1d...:Vegetables"*) Rating of how much the
  respondent likes vegetables.

- `pescetarian`:

  (*Ordered Factor, Label: "Q2. How likely are you to eat
  pescetarian..."*) Self-reported likelihood of choosing a pescetarian
  diet.

- `veggie`:

  (*Ordered Factor, Label: "Q3. How likely are you to eat
  vegetarian..."*) Self-reported likelihood of choosing a vegetarian
  diet.

- `vegan`:

  (*Ordered Factor, Label: "Q4. How likely are you to eat vegan..."*)
  Self-reported likelihood of choosing a vegan diet.

## Source

This is a synthetically generated dataset created for demonstration and
testing purposes.

## Details

The rating scales used for the food items (Q1a-Q1d) are 5-point Likert
scales with the following levels:

1.  Very much dislike

2.  Somewhat dislike

3.  About equally like and dislike

4.  Somewhat like

5.  Very much like

The likelihood scales used for the eating styles (Q2-Q4) are 5-point
scales with the following levels:

1.  Very Low

2.  Low

3.  Moderate

4.  High

5.  Very High
