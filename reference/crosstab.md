# Make a single crosstab

Make a single crosstab

## Usage

``` r
crosstab(
  data,
  var,
  by,
  weight = NULL,
  var_nets = NULL,
  digits = 0,
  min_group_n = 100,
  st_col_start = 3,
  exclude_var = NULL,
  exclude_by = NULL,
  na.rm = TRUE
)
```

## Arguments

- data:

  (data.frame) A data frame of survey respondents

- var:

  (chr) the target variable (i.e. dependent variable)

- by:

  (chr) The variable to be cross-tabulated with `var` (i.e. independent
  variable)

- weight:

  (chr) A weight variable. If NULL, produces unweighted estimates

- var_nets:

  (list) Each element is either a character vector of factor levels of
  `var`, or a vector of integers, which are the converted to factor
  levels of `var`

- digits:

  (int) How many decimal places to round all numeric values to. NULL
  results in the default behavior of
  [`pewmethods::get_totals`](https://rdrr.io/pkg/pewmethods/man/get_totals.html)
  (i.e. many decimal places).

- min_group_n:

  (int) n-size threshold to be flagged within `by` groups.

- st_col_start:

  (int) the letter of the alphabet used as the first label for
  significance testing comparisons

- exclude_var:

  (chr) a regex - matching levels are excluded from `var` rows. If NULL,
  removes nothing

- exclude_by:

  (chr) a regex - matching levels are excluded from `by` columns. If
  NULL, removes nothing

- na.rm:

  (lgl) Whether to remove missing values from `var` before calculating
  values

## Value

A data frame, where rows represent levels of `var` and columns represent
levels of `by`. Each column contains the distribution of respones to
`var`, conditional on each `by` level.

## Details

When specifying `var_nets` using numbers instead of characters, remember
to specify integers with reference to the *original factor levels of the
variable*, as opposed to the number-row of the table you think each
level corresponds to. Interactions with `exclude_var` and `exclude_by`,
might result in number-rows no longer matching the original levels

Silently drops levels of `by` for which there are no observations.
