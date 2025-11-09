# wink

The `wink` package provides functions for generating banners of survey
estimates, complete with significance testing and exportable to Excel

The goal is to make Excel outputs that [look like
this](https://jjmoncus.github.io/wink/articles/my_survey_results.xlsx).

(^This link may only work when viewing this vignette from inside
RStudio - apologies, hopefully I can resolve this soon!)

You’ll principally use two main functions:

- [`banner()`](https://jjmoncus.github.io/wink/reference/banner.md):
  Generates statistically-tested crosstabs against a common target
  variable and combines them into one wide “banner” table.

- [`write_banners()`](https://jjmoncus.github.io/wink/reference/write_banners.md):
  Exports banners to a formatted Excel workbook.

A typical workflow will be to generate lists of banners using
[`banner()`](https://jjmoncus.github.io/wink/reference/banner.md) and
then export them with
[`write_banners()`](https://jjmoncus.github.io/wink/reference/write_banners.md).

The workhorse underneath
[`banner()`](https://jjmoncus.github.io/wink/reference/banner.md) is
[`crosstab()`](https://jjmoncus.github.io/wink/reference/crosstab.md),
which generates the percentages for a single crosstab, and which most
users will not need to use. It is the guts for how the rest of the
package works and is exposed just for convenience. See
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
the package. It contains 2000 fictional survey responses, including
demographics and respondents’ attitudes about various foods.

``` r
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

## 1. `banner()`: Generating crosstabs

### Percentages of `var`, split by `bys`

[`banner()`](https://jjmoncus.github.io/wink/reference/banner.md)
generates a table of survey estimates for one variable (`var`) broken
down by others (`bys`) and performs column-to-column significance
testing (represented by letter rows). If a letter appears underneath a
given cell, then the given survey estimate is statistically
significantly different (at 95% confidence) from the corresponding
column’s cell (see below for an example).

A “Total” column is included in the front, with percentages across `var`
for the full sample.

Unweighted n-sizes (n), design effects (deff), and margins of sampling
error (moe) for each group are included at the bottom.

Below is a banner for a question about eating pescetarian
(`pescetarian`), by age (`age`). The default
[`print()`](https://rdrr.io/r/base/print.html) method renders the output
using `gt`, which tries to mimic how the Excel output would look when
exported.

You would read the banner like this: among 18- to 35-year-old
respondents, 14% responded “Low” when asked about their likelihood to
eat pescetarian - and this is significantly different from the 9% of
those 65-years-old and up who also said “Low.” However, it is *not*
significantly different from the 12% of those 36 to 49 and those 50 to
64 who said the same.

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = "age"
)
```

[TABLE]

As you add more `bys`, each new crosstab is concatenated to the next,
and the table gets wider (hover over it and scroll to the right).

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

(Note: If two or more `bys` share factor levels, then you might end up
with columns that share a name, in which case they get renamed according
to default `tibble()` rules. We might address this later).

### Metadata

Metadata about each crosstab in the banner is stored underneath as
attributes. Some attributes let you know what was called in order to
generate the table (`var`, `by`, `min_group_n`), while others are useful
for writing banners to Excel outputs (`col_dividers`, `too_low_n`). The
typical user won’t need to see this, but it’s there in case you need to
check how any banners were created after the fact.

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

Estimates are by default unweighted, but specifying `weight` generates
weighted estimates.

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

### Flagging too-low n-sizes

`min_group_n` allows you to specify what threshold of an n-size is
considered too low. Estimates are still generated for any group that
doesn’t meet the threshold, but the corresponding n-size cell is colored
red.

``` r

banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  digits = 2,
  min_group_n = 500 # setting `min_group_n` very high will naturally flag lots of groups
)
#> New names:
#> • `DK/Refused` -> `DK/Refused...10`
#> • `DK/Refused` -> `DK/Refused...14`
#> • `DK/Refused` -> `DK/Refused...21`
#> • `DK/Refused` -> `DK/Refused...24`
```

[TABLE]

### Adding Net Categories

You can define NET (summary) categories using `var_nets`, which accepts
a list of name-value pairs. Each NET category is inserted into the table
right above the first level contributing to it.

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  digits = 2,
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

You can also specify `var_nets` with just level numbers, instead of
writing out the level text (this can be convenient when response options
are long).

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  digits = 2,
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
  digits = 2,
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

You may want to leave out some columns of `bys` or rows of `var` that
aren’t of interest. Supply a regular expression to `exclude_var` or
`exclude_bys` to remove any columns/rows that match, without disrupting
significance testing. Both are `NULL` by default (i.e. not removing
anything).

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  exclude_var = "Moderate"
  )
#> New names:
#> • `DK/Refused` -> `DK/Refused...10`
#> • `DK/Refused` -> `DK/Refused...14`
#> • `DK/Refused` -> `DK/Refused...21`
#> • `DK/Refused` -> `DK/Refused...24`
```

[TABLE]

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  exclude_bys = "DK/Refused" # providing one pattern recycles across all `bys`
  )
```

[TABLE]

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean"),
  exclude_bys = c("65+", "DK/Refused", "Other|DK/Refused", "DK/Refused", "DK/Refused") # Otherwise, add as many patterns as there are `bys`
  )
```

[TABLE]

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("rating_meat", "rating_sushi", "rating_veg"),
  exclude_bys = c("65+", "DK/Refused") # adding fewer than `length(bys)` gives you an error
  )
```

### Removing respondents

We’ve set `na.rm = TRUE` by default, meaning if `var` contains any
missing values, they are excluded from the denominator of survey
estimates. `na.rm = FALSE` includes them and would report a “(Missing)”
row for these new empty respondents.

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
takes banners from
[`banner()`](https://jjmoncus.github.io/wink/reference/banner.md) and
exports them to a single, formatted Excel file. It separates banner
groups with borders, adds merged-cell subheads over each group of
by-columns, and creates a hyperlinked Table of Contents.

Any by-groups with `n` less than `min_group_n` will be highlighted in
red, and there will be a message just below the table specifying what
`min_group_n` value was used for comparisons.

We also message whether `na.rm` was `TRUE` or `FALSE`, and how many were
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
      bys = c("age", "gender", "income", "region", "party_lean")
      )
  })

write_banners(banners, file = "my_survey_results.xlsx")
```

You can also export a single banner (i.e. it doesn’t need to be wrapped
in a list).

``` r
x <- banner(food, "pescetarian", bys = c("age", "gender", "income", "region", "party_lean"))

x %>% write_banners(file = "single_banner.xlsx")
```

By default, you will overwrite any files with the same name
(i.e. `overwrite = TRUE`). If you flip `overwrite = FALSE`, you will
throw an error if the file already exists.

``` r
# rexport the above would throw an error if `overwrite = FALSE`
x %>% write_banners(file = "single_banner.xlsx", overwrite = FALSE)
```

Numeric rows are saved as number values, and character rows are saved as
text.
[`write_banners()`](https://jjmoncus.github.io/wink/reference/write_banners.md)
by default formats the percentage rows as integers, and the “deff +
mose” rows with two decimal places. If you’d prefer them presented as
raw, full-decimal-place values, use `format_numbers = FALSE`.

``` r
x %>% write_banners(file = "no_formatting.xlsx", format_numbers = FALSE)
```
