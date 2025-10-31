# wink 0.0.4

* throw an error when `var_nets` items overlap.
* In the edge case when `var` and `by`, we don't want to pause execution, so we instead fill the gaps with "padding rows" so all crosstabs in the banner line up correctly. This holds for both `na.rm = TRUE/FALSE`

# wink 0.0.3

* `write_banners()` exports numbers as numbers and characters as text, and default formats percentages as integers, deff + mose with 2 decimal places
* `na.rm` added to `banner()` and `crosstab()`, `TRUE` by default, removes missing values from `var` and messages in `write_banners()` how many were removed.


# wink 0.0.2

* `var_nets` is now order agnostic (fixed lots of bugs related to weird forms)
* `write_banners()` can write just one banner, no need to wrap into list
* labels for by variables are also printed underneath the group header (when available)
* added `exclude_by` and `exclude_var` args for excluding variable levels from the table without affecting significance testing
