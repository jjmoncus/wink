
#' Create Survey Crosstab with Statistical Testing and Design Effects
#'
#' This function generates a comprehensive crosstab table for survey data that includes
#' weighted percentages, statistical significance testing between banner groups, and
#' survey design statistics (DEFF, MOSE, and unweighted N). Banner groups with
#' insufficient sample sizes are automatically excluded from analysis.
#'
#' @param data The survey data to us
#' @param target_var A character string specifying the target variable name (the variable
#'   that defines the rows in the crosstab)
#' @param banner_var A character string specifying the banner variable name (the variable
#'   that defines the columns in the crosstab)
#' @param min_n An integer specifying the minimum unweighted sample size threshold for
#'   banner groups. Groups with fewer observations are excluded from analysis. Default is 90.
#' @param stat_testing_start An integer specifying which column letter to start statistical
#'   testing with (1=A, 2=B, etc.). This allows for proper letter assignment when combining
#'   multiple crosstabs. Default is 2 (column B).
#' @param design A survey design object (typically from the survey package) containing
#'   the survey data and design specifications, if you would like weighted percentages. Defaults to NULL
#'
#' @return A data frame containing the formatted crosstab with the following structure:
#'   \itemize{
#'     \item Variable labels row showing the target variable label and banner variable name
#'     \item Column headers showing banner group names
#'     \item Unweighted sample sizes (N) for each banner group
#'     \item Target variable response percentages for each banner group
#'     \item Statistical significance indicators (..) showing which groups differ significantly
#'     \item Design Effect (DEFF) values for each banner group
#'     \item Margin of Sampling Error (MOSE) values for each banner group
#'   }
#'
#'   The returned object has an attribute \code{banner_levels_kept} indicating the number
#'   of banner groups that met the minimum sample size requirement.
#'
#' @details
#' The function performs several key operations:
#' \itemize{
#'   \item Filters out cases with missing values in either variable
#'   \item Calculates unweighted N, Design Effect (DEFF), and Margin of Sampling Error (MOSE)
#'   \item Excludes banner groups not meeting the minimum sample size threshold
#'   \item Computes weighted percentages using survey weights
#'   \item Performs pairwise statistical significance testing between banner groups
#'   \item Formats results into a presentation-ready table
#' }
#'
#' Statistical testing uses a 95% confidence level and accounts for survey design effects.
#' Significant differences are indicated by letters (A, B, C, etc.) showing which groups
#' a particular group significantly differs from.
#'
#' DEFF (Design Effect) measures how much the survey design increases variance compared
#' to simple random sampling. MOSE (Margin of Sampling Error) provides the margin of
#' error at 95% confidence assuming a 50/50 split.
#'
#' @examples
#' \dontrun{
#' # Create a survey design object
#' library(survey)
#' library(dplyr)
#' design <- svydesign(ids = ~1, data = my_survey_data, weights = ~survey_weight)
#'
#' # Generate a basic crosstab
#' result <- crosstab(
#'   design = design,
#'   target_var = "satisfaction",
#'   banner_var = "age_group",
#'   min_n = 100
#' )
#'
#' # Check how many banner groups were retained
#' attr(result, "banner_levels_kept")
#'
#' # Use in a multi-banner context with custom stat testing start
#' result2 <- crosstab(
#'   design = design,
#'   target_var = "satisfaction",
#'   banner_var = "region",
#'   min_n = 50,
#'   stat_testing_start = 5  # Start at column E
#' )
#' }
#'
#' @note
#' `banner` and `target` variables must be factors. The function expects variable labels to be stored as attributes
#' (e.g., using the \code{attr(data$variable, "label")} format).
#'
#' If no banner groups meet the minimum sample size requirement, the function returns
#' a simple table indicating no levels were kept.
#'
#' @importFrom dplyr bind_rows filter mutate across slice select all_of
#' @importFrom tidyr pivot_wider
#' @importFrom tibble tibble
#' @importFrom survey svymean svydesign
#' @importFrom stats model.matrix weights
#' @importFrom purrr map
#' @importFrom stringr str_trim
#'
#' @seealso
#' \code{\link[survey]{svydesign}} for creating survey design objects,
#' \code{\link[survey]{svymean}} for weighted calculations,
#'
#'
crosstab <- function(data,
                     target_var,
                     banner_var,
                     min_n = 100,
                     stat_testing_start = 2,
                     design = NULL) {

  if (is.null(design)) {

    # if you dont specify a design, you get unweighted percentages,
    # otherwise, have to specify a design
    design <- svydesign(ids = ~ 1,
                        data = data,
                        weights = NULL)
  }

  # gather your inputs
  design_sub <- subset(design,!is.na(design$variables[[banner_var]]) &
                         !is.na(design$variables[[target_var]]))

  banner_levels_all <- levels(design_sub$variables[[banner_var]])
  target_levels <- levels(design_sub$variables[[target_var]])

  # Calculate unweighted N, DEFF, MOSE for all banner groups first

  n_unweighted <- function(banner_levels_all, design_sub) {
    banner_levels_all %>%
      set_names() %>%
    map_dbl(function(banner_level) {
      design_grp <- subset(design_sub, design_sub$variables[[banner_var]] == banner_level)
      return(nrow(design_grp$variables))
    })
  }
  deff <- function(banner_levels_all, design_sub) {

    banner_levels_all %>%
      set_names() %>%
      map_dbl(function(banner_level) {

        design_grp <- subset(design_sub, design_sub$variables[[banner_var]] == banner_level)
        weights_grp <- weights(design_grp)
        n_unweighted <- nrow(design_grp$variables)
        sum_w <- sum(weights_grp)
        sum_w2 <- sum(weights_grp^2)

        deff <- n_unweighted / ((sum_w)^2 / sum_w2)
      })
  }

  mose <- function(banner_levels_all, design_sub) {

    banner_levels_all %>%
      set_names() %>%
      map_dbl(function(banner_level) {
        design_grp <- subset(design_sub, design_sub$variables[[banner_var]] == banner_level)
        weights_grp <- weights(design_grp)
        n_unweighted <- nrow(design_grp$variables)
        sum_w <- sum(weights_grp)
        sum_w2 <- sum(weights_grp^2)

        deff <- n_unweighted / ((sum_w)^2 / sum_w2)
        return((sqrt(deff) * 1.96 * sqrt(0.25 / n_unweighted)) * 100)
      })
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

      col_end <- col_start + length(banner_levels) - 1
      banner_letters <- col_start:col_end %>% map_chr(num_to_excel_col)

      answer_rows <- combined_wide$Target %in% target_levels

      letters_df <- data.frame(Target = target_levels, stringsAsFactors = FALSE)
      for (i in seq_along(banner_levels)) {
        letters_df[[banner_levels[i]]] <- ""
      }

      for (i in seq_along(banner_levels)) {
        current_pct <- combined_wide[[banner_levels[i]]][answer_rows] / 100
        current_n <- n_unweighted_list[i]
        current_deff <- deff_values[i]

        letters_for_this <- rep("", length(target_levels))

        for (j in seq_along(banner_levels)) {
          if (i == j)
            next

          compare_pct <- combined_wide[[banner_levels[j]]][answer_rows] / 100
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

          letters_for_this[diff_check] <- paste(letters_for_this[diff_check], banner_letters[j], sep = " ") %>% str_trim()
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







#' Rewriting the crosstab function
crosstab2 <- function(data,
                      var,
                      by,
                      weight = NULL,
                      digits = 0,
                      min_group_n = 100,
                      st_col_start = 2) {

  # If no argument is passed to weight, create a variable in the dataset called "unweighted" and set it to 1
  if (is.null(weight)) {
    data <- data %>% mutate(unweighted = 1)
    weight <- "unweighted"
    sym_weight <- sym(weight)
  }

  sym_var <- sym(var)
  var_levels <- levels(data[[var]])

  sym_by <- sym(by)
  by_levels <- levels(data[[by]])

  # Calculate unweighted N, DEFF, MOSE for 'total' col and by groups first (if applicable)

 total_params = calculate_deff(data[[weight]])
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
    # Build weighted % tables for each banner group passing cutoff

    by_levels_to_cut <- setdiff(by_levels, by_levels_to_use)
    combined_wide <- get_totals(var = var,
                                df = data,
                                wt = weight,
                                by = by,
                                by_total = TRUE,
                                digits = digits) %>%
      select(-weight_name, -any_of(by_levels_to_cut))

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

    # do stat testing
    stat_testing <- function(by_levels_to_use,
                             combined_wide,
                             var_levels,
                             n_unweighteds,
                             deffs,
                             col_start = 2) {
      # Prepare stat testing indicators

      col_end <- col_start + length(by_levels_to_use) - 1
      col_letters <- col_start:col_end %>% map_chr(num_to_excel_col)

      letters_df <- tibble(!!sym_var := var_levels)
      for (i in seq_along(by_levels_to_use)) {
        letters_df[[by_levels_to_use[i]]] <- ""
      }

      for (x in by_levels_to_use) {
        p1 <- combined_wide[[x]] / 100
        n1 <- n_unweighteds[x]
        deff1 <- deffs[x]

        letters_for_this <- rep("", length(var_levels))

        for (y in by_levels_to_use) {
          if (identical(y, x))
            next

          p2 <- combined_wide[[y]] / 100
          n2 <- n_unweighteds[y]
          deff2 <- deffs[y]

          #tolerance level for 0.05 confidence
          raw_tol <- sqrt( (deff1 * (p1*(1-p1)) / n1) + (deff2 * (p2 * (1 - p2)) / n2) )

          diff_check <-(((abs(p1 - p2)) - (raw_tol*1.96)) > -0.009) & (p1 > p2)
          diff_check[is.na(diff_check)] <- FALSE

          letters_for_this[diff_check] <- paste(letters_for_this[diff_check], col_letters[which(by_levels_to_use %in% y)], sep = " ") %>% str_trim()
        }

        letters_df[[by_levels_to_use[i]]] <- letters_for_this
      }

      return(letters_df)
    }

    letters_df <- stat_testing(
      by_levels_to_use,
      combined_wide,
      var_levels,
      n_unweighteds,
      deffs,
      col_start = st_col_start
    )

    # Build final table rows: header, N row, each answer row + stat testing indicator row, design effect row
    final_table_builder <- function(by_levels_to_use,
                                    n_unweighted_row,
                                    combined_wide,
                                    var_levels,
                                    letters_df,
                                    deff_row,
                                    mose_row) {
      rows_list <- list()

      var_label <- attr(data[[var]], "label")

      varname_row <- tibble(
        !!sym_var := var_label,
        !!!setNames(as.list(rep(by, length(by_levels_to_use)
      )), by_levels_to_use))

      rows_list[[1]] <- varname_row

      # Add var header row (just var column)
      rows_list[[length(rows_list) + 1]] <- tibble::tibble(!!sym_var := "..", !!!setNames(as.list(by_levels_to_use), by_levels_to_use))

      # Add N row
      rows_list[[length(rows_list) + 1]] <- n_unweighted_row

      # Add answer rows and letters rows
      for (k in seq_len(nrow(combined_wide))) {
        rows_list[[length(rows_list) + 1]] <- combined_wide[k, c(var, by_levels_to_use)]

        new_row <- letters_df %>%
          filter(!!sym_var == combined_wide[[var]][k]) %>%
          mutate(!!sym_var := "..") %>%
          select(!!sym_var, all_of(by_levels_to_use))
        rows_list[[length(rows_list) + 1]] <- new_row
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
      by_levels_to_use,
      n_unweighted_row,
      combined_wide,
      var_levels,
      letters_df,
      deff_row,
      mose_row
    )
  }

  return(final_table %>%
           structure("by_levels_kept" = length(by_levels_to_use)))
}
