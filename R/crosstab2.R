

#' Do significance testing on a crosstab
#'
#' Isolating the functionality related to significance testing, for easier maintenance
#'
#' @importFrom purrr pmap_lgl
#'
sig_test_table <- function(baby_crosstab,
                           n_unweighteds,
                           deffs,
                           col_start = 3) {

  # ------------------------------------------------- #
  # --------- Prepare stat testing indicators --------#
  # ------------------------------------------------- #

  var <- attr(baby_crosstab, "var")
  by_levels_used <- attr(baby_crosstab, "by_levels_used")
  # this is not technically levels(var) -
  # it's levels(var) + whatever NET categories have been added
  # but we leave it named "var_levels" for now
  var_levels <- baby_crosstab[[var]]

  col_end <- col_start + length(by_levels_used) - 1
  col_letters <- col_start:col_end %>% map_chr(num_to_excel_col)

  # ----------------------------------------------------------- #
  # ------- get an empty table based on `baby_crosstab` --------#
  # ----------------------------------------------------------- #


  letters_df <- tibble(!!sym(var) := var_levels) # we can name this var anything, it doesnt matter, we wont ever pull this column
  for (i in seq_along(by_levels_used)) {
    letters_df[[by_levels_used[i]]] <- ""
  }

  # ----------------------------------------------------------- #
  # ------------- fill it with significance tests --------------#
  # ----------------------------------------------------------- #

  # we compare every col to every other col
  # so there is some duplication
  # we choose to only paste letters under the col with the larger of the two percentages

  for (x in by_levels_used) {
    p1s <- baby_crosstab[[x]] / 100
    n1 <- n_unweighteds[x]
    deff1 <- deffs[x]

    letters_for_this <- rep("", length(var_levels))

    for (y in by_levels_used) {
      if (identical(y, x))
        next

      p2s <- baby_crosstab[[y]] / 100
      n2 <- n_unweighteds[y]
      deff2 <- deffs[y]

      sig <- tibble(p1 = p1s, n1, deff1, p2 = p2s, n2, deff2) %>%
        pmap_lgl(., hardcode_sig_test)

      diff_checks <- sig & (p1s > p2s) # only declare a letter for the cell where percentage is bigger (so we convey the same sig info twice)
      diff_checks[is.na(diff_checks)] <- FALSE

      letters_for_this[diff_checks] <- paste(
        letters_for_this[diff_checks],
        col_letters[which(by_levels_used %in% y)], sep = " ") %>%
        str_trim()
    }

    letters_df[[x]] <- letters_for_this
  }

  return(letters_df)
}


#' Building a crosstab from its inputs
#'
#' @importFrom tibble as_tibble
#' @importFrom tidyselect everything
crosstab_builder <- function(baby_crosstab,
                             sig_test_table,
                             n_unweighted_row,
                             deff_row,
                             mose_row) {

  var <- attr(baby_crosstab, "var")
  by_levels_used <- attr(baby_crosstab, "by_levels_used")
  var_levels <- attr(baby_crosstab, "var_levels")

  # start by pairing percentage rows with their significance rows
  map(seq_len(nrow(baby_crosstab)), function(k) {
    bind_rows(baby_crosstab %>% mutate(across(everything(), as.character)) %>% slice(k),
              sig_test_table %>% mutate(!!sym(var) := "..") %>% slice(k))}) %>%
    # collapse together
    bind_rows() %>%
    # then add each metadata row we care about
    add_row(n_unweighted_row %>% mutate(across(everything(), as.character))) %>%
    add_row(deff_row %>% mutate(across(everything(), as.character))) %>%
    add_row(mose_row %>% mutate(across(everything(), as.character))) %>%
    as_tibble() # was previously just a dataframe
}



#' Rewriting the crosstab function
#'
#' @importFrom tibble add_column
#' @importFrom tidyselect any_of
#' @importFrom pewmethods get_totals calculate_deff
#' @importFrom dplyr pull
#' @importFrom tidyr pivot_wider
#'
crosstab2 <- function(data,
                      var,
                      by,
                      weight = NULL,
                      var_nets = NULL,
                      digits = 0,
                      min_group_n = 100,
                      st_col_start = 3) {

  # ------------------------------------------- #
  # ----- gathering function params ----------- #
  # ------------------------------------------- #

  # If no argument is passed to weight, create a variable in the dataset called "unweighted" and set it to 1
  if (is.null(weight)) {
    data <- data %>% mutate(unweighted = 1)
    weight <- "unweighted"
    sym_weight <- sym(weight)
  }

  if (!(var %in% names(data))) abort("'var' must be in 'data' ")
  if (!(by %in% names(data))) abort("'by' must be in 'data' ")
  if (!(weight %in% names(data))) abort("'weight' must be in 'data' ")

  sym_var <- sym(var)
  var_levels <- levels(data[[var]])

  sym_by <- sym(by)
  by_levels <- levels(data[[by]])

  # if var_nets are provided,
  # ensure they're of the right form
  # and add `var_recode` to the data
  if (!is.null(var_nets)) {

    var_nets <- var_nets %>%
      map(function(x) {
        if (is.numeric(x)) {
          levels(data[[var]])[x]
        } else if (is.character(x)) {
          x
        }
      })

    data <- data %>%
      mutate(var_recode = fct_collapse(!!sym_var, !!!var_nets))
  }

  # ------------------------------------------- #
  # ------ calculating table params ----------- #
  # ------------------------------------------- #

  by_params <- by_levels %>%
    set_names() %>%
    map(function(x) {
      calculate_deff(data %>%
                       filter(!!sym_by == x) %>%
                       .[[weight]])}) %>%
    bind_rows(.id = "by_level")

  # Filter banner groups by min unweighted N (default is 100)
  by_levels_to_use <- by_params %>% filter(n >= min_group_n) %>% pull(by_level)
  n_unweighteds <- by_params %>% filter(by_level %in% by_levels_to_use) %>% pull(n) %>% set_names(by_levels_to_use)
  deffs <- by_params %>% filter(by_level %in% by_levels_to_use) %>% pull(deff) %>% set_names(by_levels_to_use)
  moses <- by_params %>% filter(by_level %in% by_levels_to_use) %>% pull(moe) %>% set_names(by_levels_to_use)

  # Return basic table if none pass cutoff
  if (length(by_levels_to_use) == 0) {
    final_table <- tibble("{by}" := paste0("No groups with unweighted N > ", min_group_n))
    # otherwise continue
  } else {

    # ------------------------------------------- #
    # ------- calculating percentages ----------- #
    # ------------------------------------------- #

    by_levels_to_cut <- setdiff(by_levels, by_levels_to_use)
    baby_crosstab <- get_totals(var = var,
                                df = data,
                                wt = weight,
                                by = by,
                                by_total = FALSE,
                                digits = digits) %>%
      mutate(!!sym_var := as.character(!!sym_var))

    if (!is.null(var_nets)) { # calculate `var_recode` values and insert them into the `baby_crosstab` in the right spot

      nets_percents <- get_totals(var = "var_recode",
                                  df = data,
                                  wt = weight,
                                  by = by,
                                  by_total = FALSE,
                                  digits = digits) %>%
        filter(var_recode %in% names(var_nets)) %>%
        mutate(var_recode = glue("NET: {var_recode}")) %>%
        rename(!!sym_var := var_recode) # this renaming is just so the rows can be added by column name below

      # each row of nets_percent needs to go right above the first row of its correspnding parent levels
      for (i in 1:nrow(nets_percents)) {

        baby_crosstab <- baby_crosstab %>% add_row(!!!slice(nets_percents, i),
                                                   .before = which(baby_crosstab[[var]] == var_nets[[i]][1]))
      }
    }

    baby_crosstab <- baby_crosstab %>%
      select(-weight_name, -any_of(by_levels_to_cut)) %>%
      structure("var" = var,
                "by_levels_used" = by_levels_to_use,
                "var_levels" = var_levels)




    # -------------------------------------------------- #
    # -------------- significance testing -------------- #
    # -------------------------------------------------- #

    sig_test_out <- sig_test_table(
      baby_crosstab,
      n_unweighteds,
      deffs,
      col_start = st_col_start
    )

    # --------------------------------------------------------- #
    # ------- preparing param rows for output table ----------- #
    # --------------------------------------------------------- #

    # Prepare DEFF row
    deff_row <- by_params[c("by_level", "deff")] %>%
      filter(by_level %in% by_levels_to_use) %>%
      pivot_wider(names_from = by_level, values_from = deff) %>%
      add_column(!!sym_var := "DEFF", .before = 1)


    # Prepare MOSE row
    mose_row <- by_params[c("by_level", "moe")] %>%
      filter(by_level %in% by_levels_to_use) %>%
      pivot_wider(names_from = by_level, values_from = moe) %>%
      add_column(!!sym_var := "MOSE", .before = 1)


    # Prepare unweighted N row
    n_unweighted_row <- by_params[c("by_level", "n")] %>%
      filter(by_level %in% by_levels_to_use) %>%
      pivot_wider(names_from = by_level, values_from = n) %>%
      add_column(!!sym_var := "N", .before = 1)


    # --------------------------------------------- #
    # -------------- making final table ----------- #
    # --------------------------------------------- #

    out <- crosstab_builder(baby_crosstab,
                            sig_test_out,
                            n_unweighted_row,
                            deff_row,
                            mose_row)
    }

  return(out %>%
           structure(
             "var" = var,
             "by" = by,
             "by_levels_kept" = length(by_levels_to_use)))
}




