# wink

The `wink` package provides functions for generating client-ready survey
tables, complete with significance testing and report-ready export
features.

The goal is to make Excel outputs that [look like
this](https://jjmoncus.github.io/wink/articles/my_survey_results.xlsx).

(^That link may only work when viewing this vignette from inside
RStudio - apologies, hopefully I can resolve this soon!)

The two main functions demonstrated here are:

- [`banner()`](https://jjmoncus.github.io/wink/reference/banner.md):
  Generates multiple, statistically tested crosstab tables against a
  common target variable and combines them into one wide “banner” table.

- [`write_banners()`](https://jjmoncus.github.io/wink/reference/write_banners.md):
  Exports banner tables to a formatted Excel workbook.

A typical workflow will be to generate lists of tables using
[`banner()`](https://jjmoncus.github.io/wink/reference/banner.md) and
then export them with
[`write_banners()`](https://jjmoncus.github.io/wink/reference/write_banners.md).

The workhorse underneath
[`banner()`](https://jjmoncus.github.io/wink/reference/banner.md) is
[`crosstab()`](https://jjmoncus.github.io/wink/reference/crosstab.md),
which generates the percentages for a single crosstab, and which most
user will not need to use. It is meant to be the guts for how the rest
of the package works and is exposed just for convenience. See
[`crosstab()`](https://jjmoncus.github.io/wink/reference/crosstab.md)’s
documentation for the specifics.

## Setup and Data

You can install the most up-to-date version of the package via the
github repo.

``` r
pak::pak("jjmoncus/wink")
```

Or if you want to make sure you build vignettes:

``` r
devtools::install_github("jjmoncus/wink",
                         build_vignettes = TRUE,
                         force = TRUE)
```

For this example, we’ll use the synthetic `food` dataset that comes with
the package.

``` r
# In a real session, the data loads automatically when your package is attached.
head(food, n = 5)
#> # A tibble: 5 × 13
#>   unique_id age   gender income      region  party_lean rating_meat rating_pizza
#>       <int> <fct> <fct>  <fct>       <fct>   <fct>      <fct>       <fct>       
#> 1         1 65+   Man    High income Midwest Rep/Lean … Somewhat l… Somewhat li…
#> 2         2 18-35 Woman  High income West C… Rep/Lean … Somewhat l… Somewhat li…
#> 3         3 18-35 Woman  High income West C… Dem/Lean … About equa… About equal…
#> 4         4 18-35 Man    Low income  Mounta… Dem/Lean … DK/Refused  DK/Refused  
#> 5         5 50-64 Woman  NA          West C… Dem/Lean … Somewhat l… Somewhat li…
#> # ℹ 5 more variables: rating_sushi <fct>, rating_veg <fct>, pescetarian <fct>,
#> #   veggie <fct>, vegan <fct>
```

The `food` dataset contains 2000 fictional survey responses, including
demographics and food attitude ratings.

## 1. `banner()`: Generating crosstabs

### Percentages of `var`, split by `bys`

The [`banner()`](https://jjmoncus.github.io/wink/reference/banner.md)
function generates a percentage table for one variable (`var`) broken
down others (`bys`) and performs column-to-column statistical testing
(represented by letter rows).

unweighted N’s, Design Effects (DEFF), and Margins of Sampling Error
(MOSE) for each group are included at the bottom..

Here’s a banner for the likelihood of being pescetarian (`pescetarian`),
by taste for meat (`rating_meat`). The default
[`print()`](https://rdrr.io/r/base/print.html) method tries to mimic how
the table would appear in the final Excel output.

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = "age"
)
```

[TABLE]

By default,
[`banner()`](https://jjmoncus.github.io/wink/reference/banner.md),
includes a Total column in the front, with percentages across `var` for
the full sample (i.e. split by nothing.)

As you add more `bys`, each new crosstab is concatenated to the next.

If two or more `bys` share factor levels, then we would naturally end up
with columns with the same name, so these are renamed according to
`tibble()` rules (might come back to this later).

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean")
)
#> New names:
#> • `DK/Refused` -> `DK/Refused...10`
#> • `DK/Refused` -> `DK/Refused...14`
#> • `DK/Refused` -> `DK/Refused...21`
#> • `DK/Refused` -> `DK/Refused...24`
```

[TABLE]

Metadata about each crosstab of the banner is stored underneath as
attributes. Some attributes let you know what was called in order to
generate the table (`var`, `by`, `min_group_n`), while others are useful
for writing banners to Excel outputs (`col_dividers`, `too_low_n`).

``` r
x <- banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean")
)
#> New names:
#> • `DK/Refused` -> `DK/Refused...10`
#> • `DK/Refused` -> `DK/Refused...14`
#> • `DK/Refused` -> `DK/Refused...21`
#> • `DK/Refused` -> `DK/Refused...24`

attributes(x)
#> $class
#> [1] "wink_banner" "tbl_df"      "tbl"         "data.frame" 
#> 
#> $row.names
#>  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
#> 
#> $names
#>  [1] "levels"          "Total"           "18-35"           "36-49"          
#>  [5] "50-64"           "65+"             "Low income"      "Middle income"  
#>  [9] "High income"     "DK/Refused...10" "Woman"           "Man"            
#> [13] "Other"           "DK/Refused...14" "West Coast"      "East Coast"     
#> [17] "Midwest"         "South"           "Mountain West"   "Southwest"      
#> [21] "DK/Refused...21" "Dem/Lean Dem"    "Rep/Lean Rep"    "DK/Refused...24"
#> 
#> $col_dividers
#> [1]  2  6 10 14 21 24
#> 
#> $var
#> [1] "pescetarian"
#> 
#> $bys
#> [1] "age"        "income"     "gender"     "region"     "party_lean"
#> 
#> $var_label
#> [1] "Q2. How likely are you to choose to eat pescetarian within the coming 12 months?"
#> 
#> $by_labels
#> $by_labels$age
#> [1] "AGE. age groups (recode)"
#> 
#> $by_labels$income
#> [1] "INCOME. income (recode)"
#> 
#> $by_labels$gender
#> [1] "S2. which of the following best describes you?"
#> 
#> $by_labels$region
#> [1] "S3. What region of the U.S. are you from?"
#> 
#> $by_labels$party_lean
#> [1] "PARTY_LEAN. party affiliation (recode)"
#> 
#> 
#> $min_group_n
#> [1] 100
#> 
#> $too_low_n
#> [1] 10 14
#> 
#> $na.rm
#> [1] TRUE
#> 
#> $n_removed
#> [1] 12
```

### Weighting

Specifying `weight` generates weighted estimates.

Unweighted estimates will naturally have design effects equal to 1,
whereas weighted estimates will have unique `deff` values for each
group.

``` r
# for example, here's add an arbitrary weight variable
food <- food %>%
  dplyr::mutate(weight_1 = runif(nrow(food), 0, 3)) # randomly give everyone a weight between 0 and 3

banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  weight = "weight_1"
)
#> New names:
#> • `DK/Refused` -> `DK/Refused...10`
#> • `DK/Refused` -> `DK/Refused...14`
#> • `DK/Refused` -> `DK/Refused...21`
#> • `DK/Refused` -> `DK/Refused...24`
```

[TABLE]

### Rounding

[`banner()`](https://jjmoncus.github.io/wink/reference/banner.md)
automatically rounds to whole percentages, but you can specify using
`digits`.

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  digits = 2
)
#> New names:
#> • `DK/Refused` -> `DK/Refused...10`
#> • `DK/Refused` -> `DK/Refused...14`
#> • `DK/Refused` -> `DK/Refused...21`
#> • `DK/Refused` -> `DK/Refused...24`
```

[TABLE]

### Adding Net Categories

You can define NET (summary) categories using the `var_nets` argument,
which takes a named list of character vectors. Each NET category is
inserted into the table right above the first level contributing to it.

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  var_nets = list(
    "Low"  = c("Very Low", "Low"),
    "High" = c("High", "Very High")
    )
  )
#> New names:
#> • `DK/Refused` -> `DK/Refused...10`
#> • `DK/Refused` -> `DK/Refused...14`
#> • `DK/Refused` -> `DK/Refused...21`
#> • `DK/Refused` -> `DK/Refused...24`
```

[TABLE]

You can also specify `var_nets` with levels numbers.

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  var_nets = list(
    "Low"  = 1:2,
    "High" = 4:5
    )
  )
#> New names:
#> • `DK/Refused` -> `DK/Refused...10`
#> • `DK/Refused` -> `DK/Refused...14`
#> • `DK/Refused` -> `DK/Refused...21`
#> • `DK/Refused` -> `DK/Refused...24`
```

[TABLE]

`var_nets` doesn’t have to be named. If you just provide the groups,
[`banner()`](https://jjmoncus.github.io/wink/reference/banner.md)
creates suitable names for you.

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  var_nets = list(1:2, 4:5)
  )
#> New names:
#> • `DK/Refused` -> `DK/Refused...10`
#> • `DK/Refused` -> `DK/Refused...14`
#> • `DK/Refused` -> `DK/Refused...21`
#> • `DK/Refused` -> `DK/Refused...24`
```

[TABLE]

### Excluding columns or rows

You may want to selectively leave out columns of `bys` or rows of `var`
that aren’t of interest. Supply a regex to `exclude_var` or
`exclude_bys` to remove any columns/rows that match, without disrupting
significance testing. Both are NULL by default (i.e. removing nothing).

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("rating_meat", "rating_sushi", "rating_veg"),
  exclude_var = "Moderate"
  )
#> New names:
#> • `Very much dislike` -> `Very much dislike...3`
#> • `Somewhat dislike` -> `Somewhat dislike...4`
#> • `About equally like and dislike` -> `About equally like and dislike...5`
#> • `Somewhat like` -> `Somewhat like...6`
#> • `Very much like` -> `Very much like...7`
#> • `DK/Refused` -> `DK/Refused...8`
#> • `Very much dislike` -> `Very much dislike...9`
#> • `Somewhat dislike` -> `Somewhat dislike...10`
#> • `About equally like and dislike` -> `About equally like and dislike...11`
#> • `Somewhat like` -> `Somewhat like...12`
#> • `Very much like` -> `Very much like...13`
#> • `DK/Refused` -> `DK/Refused...14`
#> • `Very much dislike` -> `Very much dislike...15`
#> • `Somewhat dislike` -> `Somewhat dislike...16`
#> • `About equally like and dislike` -> `About equally like and dislike...17`
#> • `Somewhat like` -> `Somewhat like...18`
#> • `Very much like` -> `Very much like...19`
#> • `DK/Refused` -> `DK/Refused...20`
```

[TABLE]

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("rating_meat", "rating_sushi", "rating_veg"),
  exclude_bys = "equal" # providing one pattern recycles across all bys
  )
#> New names:
#> • `Very much dislike` -> `Very much dislike...3`
#> • `Somewhat dislike` -> `Somewhat dislike...4`
#> • `Somewhat like` -> `Somewhat like...5`
#> • `Very much like` -> `Very much like...6`
#> • `DK/Refused` -> `DK/Refused...7`
#> • `Very much dislike` -> `Very much dislike...8`
#> • `Somewhat dislike` -> `Somewhat dislike...9`
#> • `Somewhat like` -> `Somewhat like...10`
#> • `Very much like` -> `Very much like...11`
#> • `DK/Refused` -> `DK/Refused...12`
#> • `Very much dislike` -> `Very much dislike...13`
#> • `Somewhat dislike` -> `Somewhat dislike...14`
#> • `Somewhat like` -> `Somewhat like...15`
#> • `Very much like` -> `Very much like...16`
#> • `DK/Refused` -> `DK/Refused...17`
```

[TABLE]

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("rating_meat", "rating_sushi", "rating_veg"),
  exclude_bys = c("Very much dislike", "equally", "Very much like") # Otherwise, add as many patterns as there are `bys`
  )
#> New names:
#> • `Somewhat dislike` -> `Somewhat dislike...3`
#> • `About equally like and dislike` -> `About equally like and dislike...4`
#> • `Somewhat like` -> `Somewhat like...5`
#> • `Very much like` -> `Very much like...6`
#> • `DK/Refused` -> `DK/Refused...7`
#> • `Very much dislike` -> `Very much dislike...8`
#> • `Somewhat dislike` -> `Somewhat dislike...9`
#> • `Somewhat like` -> `Somewhat like...10`
#> • `Very much like` -> `Very much like...11`
#> • `DK/Refused` -> `DK/Refused...12`
#> • `Very much dislike` -> `Very much dislike...13`
#> • `Somewhat dislike` -> `Somewhat dislike...14`
#> • `About equally like and dislike` -> `About equally like and dislike...15`
#> • `Somewhat like` -> `Somewhat like...16`
#> • `DK/Refused` -> `DK/Refused...17`
```

[TABLE]

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("rating_meat", "rating_sushi", "rating_veg"),
  exclude_bys = c("Very much dislike", "Very much like") # adding fewer than `length(bys)` gives you an error
  )
```

### Removing respondents

`na.rm = TRUE` by default, meaning if `var` contains any missing values,
they are excluded from the denominator of survey estimates.
`na.rm = FALSE` includes them and would report a “(Missing)” row for
these new empty respondents.

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  na.rm = FALSE
  )
#> New names:
#> • `DK/Refused` -> `DK/Refused...10`
#> • `DK/Refused` -> `DK/Refused...14`
#> • `DK/Refused` -> `DK/Refused...21`
#> • `DK/Refused` -> `DK/Refused...24`
```

[TABLE]

## 3. `write_banners()`: Exporting to Excel

[`write_banners()`](https://jjmoncus.github.io/wink/reference/write_banners.md)
takes a list of banners from
[`banner()`](https://jjmoncus.github.io/wink/reference/banner.md) and
exports them to a single, formatted Excel file. It separates banner
groups with borders, adds merged-cell subheads over each group of
by-columns, and creates a hyperlinked Table of Contents.

Any by-groups with n less than `min_group_n` will be highlighted in red,
and there will be a message just below the table specifying what
`min_group_n` value was used for comparisons.

We also message whether `na.rm` was TRUE or FALSE, and how many were
removed from `var` if so.

The typical workflow would be to write a list of banners using
[`purrr::map()`](https://purrr.tidyverse.org/reference/map.html)

``` r
banners <- c("pescetarian", "veggie", "vegan") %>%
  purrr::set_names() %>% # name the vector after itself, not required for `write_banners` but maybe convenient for you later
  purrr::map(function(x) {
    
    banner(
      data = food, 
      var = x,
      bys = c("age", "gender", "income", "region", "party_lean", paste0("rating_", c("meat", "pizza", "sushi", "veg")))
      )
  })

write_banners(banners, file = "my_survey_results.xlsx")
```

You can also write a single banner, if you so choose (i.e. it doesn’t
need to be preemptively wrapped in a list).

``` r
x <- banner(food, "pescetarian", bys = c("age", "gender", "income", "region", "party_lean", paste0("rating_", c("meat", "pizza", "sushi", "veg"))))

x %>% write_banners(file = "single_banner.xlsx")
```

By default, you will overwrite any files with the same name
(i.e. `overwrite = TRUE`). If you flip `overwrite = FALSE`, you will
throw an error if the file already exists.

``` r
# rerunning the export from above would throw an error if `overwrite = FALSE`
x %>% write_banners(file = "single_banner.xlsx", overwrite = FALSE)
```

Number rows are saved as number values, and character values are saved
as text.
[`write_banners()`](https://jjmoncus.github.io/wink/reference/write_banners.md)
by default formats the percentage rows as integers, and the “deff +
mose” rows with two decimal places. If you’d prefer them presented as
raw, full-decimal-place values, use `format_numbers = FALSE`.

``` r
x %>% write_banners(file = "no_formatting.xlsx", format_numbers = FALSE)
```
