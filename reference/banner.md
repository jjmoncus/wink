# Create banner crosstabs and apply signficance testing across groups

Generates multiple crosstabs of variables `bys` against a target
variable `var`, applying significance testing across columns of each
`by` and combining the results into a single table

## Usage

``` r
banner(
  data,
  var,
  bys,
  weight = NULL,
  var_nets = NULL,
  digits = 0,
  min_group_n = 100,
  exclude_var = NULL,
  exclude_bys = NULL,
  na.rm = TRUE
)
```

## Arguments

- data:

  (data.frame) A data frame of survey respondents

- var:

  (chr) the target variable (i.e. dependent variable)

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

- exclude_var:

  (chr) a regex - matching levels are excluded from `var` rows. If NULL,
  removes nothing

- na.rm:

  (lgl) Whether to remove missing values from `var` before calculating
  values

- by:

  (chr) The variable to be cross-tabulated with `var` (i.e. independent
  variable)

- st_col_start:

  (int) the letter of the alphabet used as the first label for
  significance testing comparisons

- exclude_by:

  (chr) a regex - matching levels are excluded from `by` columns. If
  NULL, removes nothing

## Value

A data frame, where rows represent levels of `var` and columns represent
levels of `bys`, as well as the total distribution across the entire
sample in the front. Each column contains the distribution of respones
to `var`, conditional on each `by` level.

## Details

`exclude_bys` must have length 1 or `length(bys)`. If length ==
`length(bys)`, then each pattern in `exclude_bys` is applied to each by
of `bys` in turn. If length == 1, then the same pattern is applied to
all `bys`. All other settings throw an error.

In the case that `var` and `by` are the same, the result might include
extra padding rows corresponding to any levels of `var/by` that were
empty, or if `na.rm = FALSE` is set and `var/by`'s missing values
resulted in an extra row for "(Missing)". In both cases, padding rows
are added to ensure the Total columns and subsequent crosstabs align
properly.

## See also

[`crosstab`](https://jjmoncus.github.io/wink/reference/crosstab.md) for
the underlying crosstab function

## Examples

``` r
if (FALSE) { # \dontrun{

# `food` is a dataset provided in the package.
banners(
  data = food,
  var = "vegan",
  bys = c("rating_meat", "rating_sushi", "rating_veg")
)
} # }
```
