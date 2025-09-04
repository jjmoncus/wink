
banners <- function(design, target, banners, min_n = 100) {
  tables <- list()
  ticker <- 2 # force to start at letter B
  for (i in seq_along(banners)) {
    tables[[i]] <- KFFcrosstab(design,
                               banners[[i]],
                               target,
                               min_n = min_n,
                               stat_testing_start = ticker)
    if (ncol(tables[[i]]) != 1) {
      # at this time, might have more columns than "cols_used" below, so cant interchange them
      # so long as the crosstab didnt error, it will have ncol > 1
      # if so, can safely remove the first columen (Target) from the appropriate ones
      if (i != 1)
        tables[[i]] <- tables[[i]] %>% select(-Target)
    }
    # raise start based on previous values
    cols_used <- ncol(tables[[i]])
    if (i == 1)
      ticker <- ticker + cols_used - 1
    else
      ticker <- ticker + cols_used

    if (i == 1)  {
      tables[[i]] <- structure(tables[[i]], "col_divider" = cols_used)
    } else {
      # tables[[i]] <- tables[[i]] %>% select(-Target)
      prev_cols_used <- tables[[i - 1]] %>% attr("col_divider")
      tables[[i]] <- structure(tables[[i]], "col_divider" = prev_cols_used + cols_used)
    }
  }

  bind_cols(tables) %>%
    structure(
      col_dividers = map_dbl(tables, ~ attr(.x, "col_divider")),
      target = target,
      banners = banners
    )

} #rename this something about the stat testing only?
