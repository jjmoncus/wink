# Synthetic Survey Data on Attitudes about Food

A synthetic dataset of 2,000 fictional U.S. adult survey respondents
regarding their ratings of various foods and eating styles (pescetarian,
vegetarian, vegan)

This dataset is intended for use in package examples, tutorials, unit
testing, and for beginners wanting to explore how the package works.

## Usage

``` r
food
```

## Format

A `tibble`:

- `unique_id`:

  (*Integer*) A unique identifier for each respondent.

- `age`:

  (*Integer*) Respondent's age, grouped.

- `gender`:

  (*Factor*) Gender identity.

- `income`:

  (*Factor*) Income.

- `region`:

  (*Factor*) The U.S. region of residence.

- `rating_meat`:

  (*Factor*) How much the respondent likes meat.

- `rating_pizza`:

  (*Factor*) How much the respondent likes pizza.

- `rating_sushi`:

  (*Factor*) How much the respondent likes sushi.

- `rating_veg`:

  (*Factor*) How much the respondent likes vegetables.

- `pescetarian`:

  (*Factor*) Likelihood of choosing a pescetarian diet.

- `veggie`:

  (*Factor*) Likelihood of choosing a vegetarian diet.

- `vegan`:

  (*Factor*) Likelihood of choosing a vegan diet.
