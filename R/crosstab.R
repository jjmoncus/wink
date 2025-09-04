
crosstab <- function(design,
                        banner_var,
                        target_var,
                        min_n = 90,
                        stat_testing_start = 2) {
  # gather your inputs
  design_sub <- subset(design,!is.na(design$variables[[banner_var]]) &
                         !is.na(design$variables[[target_var]]))

  banner_levels_all <- levels(design_sub$variables[[banner_var]])
  target_levels <- levels(design_sub$variables[[target_var]])

  # Calculate unweighted N, DEFF, MOSE for all banner groups first

  n_unweighted <- function(banner_levels_all, design_sub) {
    n_unweighted_list <- numeric()

    for (banner_level in banner_levels_all) {
      design_grp <- subset(design_sub, design_sub$variables[[banner_var]] == banner_level)
      weights_grp <- weights(design_grp)
      n_unweighted <- nrow(design_grp$variables)

      n_unweighted_list <- c(n_unweighted_list, n_unweighted)
    }
    names(n_unweighted_list) <- banner_levels_all

    return(n_unweighted_list)
  }
  deff <- function(banner_levels_all, design_sub) {
    deff_values <- numeric()

    for (banner_level in banner_levels_all) {
      design_grp <- subset(design_sub, design_sub$variables[[banner_var]] == banner_level)
      weights_grp <- weights(design_grp)
      n_unweighted <- nrow(design_grp$variables)
      sum_w <- sum(weights_grp)
      sum_w2 <- sum(weights_grp^2)

      deff <- n_unweighted / ((sum_w)^2 / sum_w2)
      deff_values <- c(deff_values, round(deff, 2))

    }

    names(deff_values) <- banner_levels_all
    return(deff_values)
  }

  mose <- function(banner_levels_all, design_sub) {
    mose_values <- numeric()

    for (banner_level in banner_levels_all) {
      design_grp <- subset(design_sub, design_sub$variables[[banner_var]] == banner_level)
      weights_grp <- weights(design_grp)
      n_unweighted <- nrow(design_grp$variables)
      sum_w <- sum(weights_grp)
      sum_w2 <- sum(weights_grp^2)

      deff <- n_unweighted / ((sum_w)^2 / sum_w2)
      mose <- (sqrt(deff) * 1.96 * sqrt(0.25 / n_unweighted)) * 100
      mose_values <- c(mose_values, round(mose, 0))

    }

    names(mose_values) <- banner_levels_all
    return(mose_values)
  }


  n_unweighted_list <- n_unweighted(banner_levels_all, design_sub)
  deff_values <- deff(banner_levels_all, design_sub)
  mose_values <- mose(banner_levels_all, design_sub)

  # Filter banner groups by min unweighted N (default is 100)
  banner_levels <- banner_levels_all[n_unweighted_list > min_n]
  n_unweighted_list <- n_unweighted_list[banner_levels]
  deff_values <- deff_values[banner_levels]
  mose_values <- mose_values[banner_levels]

  # Return basic table if none pass cutoff
  if (length(banner_levels) == 0) {
    final_table <- tibble("{banner_var}" := paste0("No banner groups with unweighted N > ", min_n))
    # otherwise continue
  } else {
    # Build weighted % tables for each banner group passing cutoff
    weighted_tables <- function(banner_levels, design_sub) {
      list_dfs <- list()

      for (banner_level in banner_levels) {
        design_grp <- subset(design_sub, design_sub$variables[[banner_var]] == banner_level)

        indicators <- model.matrix( ~ 0 + get(target_var), data = design_grp$variables)
        colnames(indicators) <- levels(design_grp$variables[[target_var]])
        design_grp$variables <- cbind(design_grp$variables, indicators)

        weighted_props <- sapply(target_levels, function(tl) {
          svymean(as.formula(paste0("~`", tl, "`")), design_grp, na.rm = TRUE)[1]
        })

        df <- data.frame(
          Target = target_levels,
          WeightedPct = round(weighted_props * 100, 0),
          BannerGroup = banner_level,
          stringsAsFactors = FALSE
        )

        list_dfs[[banner_level]] <- df
      }

      return(list_dfs)
    }
    list_dfs <- weighted_tables(banner_levels, design_sub)
    combined <- bind_rows(list_dfs)
    combined_wide <- combined %>%
      pivot_wider(names_from = BannerGroup, values_from = WeightedPct)

    # Prepare DEFF row
    deff_row_builder <- function(banner_levels, deff_values) {
      deff_row <- data.frame(Target = "DEFF")
      for (i in seq_along(banner_levels)) {
        deff_row[[banner_levels[i]]] <- as.character(deff_values[i])
      }
      return(deff_row)
    }
    deff_row <- deff_row_builder(banner_levels, deff_values)


    # Prepare MOSE row
    mose_row_builder <- function(banner_levels, mose_values) {
      mose_row <- data.frame(Target = "MOSE")
      for (i in seq_along(banner_levels)) {
        mose_row[[banner_levels[i]]] <- as.character(mose_values[i])
      }
      return(mose_row)
    }
    mose_row <- mose_row_builder(banner_levels, mose_values)



    # Prepare unweighted N row
    n_row_builder <- function(banner_levels, n_unweighted_list) {
      n_row <- data.frame(Target = "N")
      for (i in seq_along(banner_levels)) {
        n_row[[banner_levels[i]]] <- as.character(n_unweighted_list[i])
      }
      return(n_row)
    }

    n_row <- n_row_builder(banner_levels, n_unweighted_list)

    # do stat testing
    stat_testing <- function(banner_levels,
                             combined_wide,
                             target_levels,
                             n_unweighted_list,
                             deff_values,
                             col_start = 2) {
      # Prepare stat testing indicators
      banner_letters <- LETTERS[col_start:(col_start + length(banner_levels) - 1)]
      answer_rows <- combined_wide$Target %in% target_levels

      letters_df <- data.frame(Target = target_levels, stringsAsFactors = FALSE)
      for (i in seq_along(banner_levels)) {
        letters_df[[banner_levels[i]]] <- ""
      }

      for (i in seq_along(banner_levels)) {
        current_pct <- as.numeric(combined_wide[[banner_levels[i]]][answer_rows]) / 100
        current_n <- n_unweighted_list[i]
        current_deff <- deff_values[i]

        letters_for_this <- rep("", length(target_levels))

        for (j in seq_along(banner_levels)) {
          if (i == j)
            next

          compare_pct <- as.numeric(combined_wide[[banner_levels[j]]][answer_rows]) / 100
          compare_n <- n_unweighted_list[j]
          compare_deff <- deff_values[j]

          #tolerance level for 0.05 confidence
          raw_tol <- sqrt(
            current_deff * (current_pct * (1 - current_pct)) / current_n +
              compare_deff * (compare_pct * (1 - compare_pct)) / compare_n
          )

          diff_check <- (abs(current_pct - compare_pct) - raw_tol > 0) &
            (current_pct > compare_pct)
          diff_check[is.na(diff_check)] <- FALSE

          letters_for_this[diff_check] <- paste0(letters_for_this[diff_check], banner_letters[j])
        }

        letters_df[[banner_levels[i]]] <- letters_for_this
      }

      return(letters_df)

    }
    letters_df <- stat_testing(
      banner_levels,
      combined_wide,
      target_levels,
      n_unweighted_list,
      deff_values,
      col_start = stat_testing_start
    )

    # Build final table rows: header, N row, each answer row + stat testing indicator row, design effect row
    final_table_builder <- function(banner_levels,
                                    n_row,
                                    combined_wide,
                                    target_levels,
                                    letters_df,
                                    deff_row,
                                    mose_row) {
      rows_list <- list()

      target_var_label <- paste(attr(data[[target_var]], "label"))
      banner_var_name <- as.character(banner_var)

      varname_row <- tibble::tibble(Target = target_var_label, !!!setNames(as.list(rep(
        banner_var_name, length(banner_levels)
      )), banner_levels))

      rows_list[[1]] <- varname_row

      # Add Target header row (just Target column)
      rows_list[[length(rows_list) + 1]] <- tibble::tibble(Target = "Target", !!!setNames(as.list(banner_levels), banner_levels))

      # Add N row
      rows_list[[length(rows_list) + 1]] <- n_row

      # Add answer rows and letters rows
      for (k in seq_len(nrow(combined_wide))) {
        rows_list[[length(rows_list) + 1]] <- combined_wide[k, c("Target", banner_levels)]
        if (combined_wide$Target[k] %in% target_levels) {
          new_row <- letters_df %>%
            filter(Target == combined_wide$Target[k]) %>%
            mutate(Target = "..") %>%
            select(Target, all_of(banner_levels))
          rows_list[[length(rows_list) + 1]] <- new_row
        }
      }

      # Add DEFF row
      rows_list[[length(rows_list) + 1]] <- deff_row

      # Add MOSE row
      rows_list[[length(rows_list) + 1]] <- mose_row

      # Convert banner columns to character for binding
      rows_list <- map(rows_list, function(df)
        df %>% mutate(across(everything(), as.character)))


      final_table <- bind_rows(rows_list) %>%
        #remove extraneous top row
        slice(-2)

      return(final_table)
    }
    final_table <- final_table_builder(
      banner_levels,
      n_row,
      combined_wide,
      target_levels,
      letters_df,
      deff_row,
      mose_row
    )
  }

  return(final_table %>%
           structure("banner_levels_kept" = length(banner_levels)))
}
