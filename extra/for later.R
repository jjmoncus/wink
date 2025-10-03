var_label <- attr(data[[var]], "label")

varname_row <- tibble(
  !!sym_var := var_label,
  !!!setNames(as.list(rep(by, length(by_levels_to_use)
  )), by_levels_to_use))

rows_list[[1]] <- varname_row
