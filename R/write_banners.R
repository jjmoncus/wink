
#' Export Banner Crosstabs to Formatted Excel Workbook
#'
#' This function takes a list of banner crosstab tables and exports them to a
#' formatted Excel workbook. Each table becomes a separate worksheet with appropriate
#' styling, including borders and column dividers. A Table of Contents sheet with
#' hyperlinks is automatically generated.
#'
#' @param banners A list of data frames, typically the output from banner analysis
#'   functions. Each element should have the following attributes:
#'   \itemize{
#'     \item \code{target}: Character string used as the worksheet name
#'     \item \code{col_dividers}: Numeric vector indicating column positions for right borders
#'     \item \code{label}: Optional character string for display labels (falls back to target name)
#'   }
#' @param file A character string specifying the output file path for the Excel workbook.
#'   Should include the .xlsx extension.
#' @param overwrite A logical value indicating whether to overwrite an existing file.
#'   Default is TRUE.
#'
#' @return Invisibly returns NULL. The function is called for its side effect of creating and writing
#'   an Excel file.
#'
#' @details
#' The function creates a formatted Excel workbook with the following features:
#' \itemize{
#'   \item \strong{worksheets}: Each element in the input list becomes a separate sheet
#'   \item \strong{formatting}: Applies medium borders to column dividers and headers
#'   \item \strong{Table of Contents}: A dedicated first sheet with hyperlinks to all other sheets
#'   \item \strong{Styled borders}: Right borders at column divider positions and bottom borders on headers
#'   \item \strong{Automatic naming}: Uses the \code{target} attribute for sheet names
#' }
#'
#' The Table of Contents sheet is automatically positioned as the first sheet and includes:
#' \itemize{
#'   \item A formatted header with larger, bold text
#'   \item Hyperlinked entries for each worksheet (note: hyperlink functionality may have limitations)
#'   \item Wider column width for better readability
#'   \item Blue tab color for visual distinction
#' }
#'
#' Column dividers are applied based on the \code{col_dividers} attribute, which should
#' contain the column numbers where right borders should be applied to visually separate
#' different banner sections.
#'
#' @examples
#' \dontrun{
#' # Assuming you have banner analysis results
#' banner_results <- banners(
#'   design = my_design,
#'   target = "satisfaction",
#'   banners = list("age_group", "gender", "region")
#' )
#'
#' # Export to Excel with default settings
#' write_banners(
#'   banners = list(satisfaction = banner_results),
#'   file = "survey_banners.xlsx"
#' )
#'
#' # Export multiple banner analyses
#' multiple_results <- list(
#'   satisfaction = banner_results,
#'   awareness = other_banner_results
#' )
#'
#' write_banners(
#'   banners = multiple_results,
#'   file = "all_survey_results.xlsx",
#'   overwrite = FALSE
#' )
#' }
#'
#' @note
#'
#' The hyperlink functionality in the Table of Contents may have limitations depending on
#' Excel version and settings (as noted in the function comments).
#'
#' Each data frame in the input list must have the required attributes (\code{target} and
#' \code{col_dividers}) for proper formatting. Missing attributes may result in errors
#' or suboptimal formatting.
#'
#' @importFrom openxlsx createWorkbook addWorksheet writeData createStyle addStyle setColWidths writeFormula worksheetOrder worksheetOrder<- saveWorkbook mergeCells setRowHeights
#' @importFrom purrr walk map_chr
#'
#' @seealso
#' \code{\link{banners}} for creating banner analysis results,
#' \code{\link[openxlsx]{createWorkbook}} for Excel workbook creation,
#' \code{\link[openxlsx]{addWorksheet}} for adding worksheets,
#' \code{\link[openxlsx]{saveWorkbook}} for saving Excel files
#'
#' @export
write_banners <- function(banners, file, overwrite = TRUE) {

  # ------------------------------------------- #
  # ----- gathering function params ----------- #
  # ------------------------------------------- #


  if (inherits(banners, "data.frame")) {

    # if it's a table, we presume you've just passed one banner,
    # need to wrap it in a list for the rest to move forward
    banners <- list(banners)
  }

  # Get labels (`var_label` or fallback to `var`)
  question_wordings <- banners %>%
    set_names(map_chr(banners, ~attr(.x, "var"))) %>%
    map_chr(~ {
    lbl <- attr(.x, "var_label")
    if (is.null(lbl) || is.na(lbl) || lbl == "") {
      out <- attr(.x, "var")  # fallback to sheet name if `var_label` from banner is empty
    } else {
      out <- lbl
    }
    return(out %>% set_names(attr(.x, "var")))
  })

  # ----------------------------------------- #
  # ----------- create a workbook ----------- #
  # ----------------------------------------- #

  wb <- createWorkbook()

  # ------------------------------------------------- #
  # ----------- add banners to each sheet ----------- #
  # ------------------------------------------------- #

  # for each element of the banners list, create sheet + add table + add stylings
  walk(banners, function(data) {

    var_name <- attr(data, "var")

    # Add a sheet
    # The sheet will be named whatever the list is named
    # (typically, the variable name, or the full question wording, of that variable,
    # but we are agnostic to that at this point)
    addWorksheet(wb, sheetName = var_name)

    # in top row, add button back to table of contents
    link <- paste0("#'Table of Contents'!A1")
    formula <- sprintf('HYPERLINK("%s", "%s")', link, "Back to TOC")
    writeFormula(wb, var_name, x = formula, startRow = 1, startCol = 1)

    # in the second row, paste the full question wording (or whatever else we default to if we dont have it)
    writeData(wb, var_name, x = question_wordings[var_name], startRow = 2, startCol = 1)

    # give a little room, skip row 3

    # in the row 4, write the names of bys across cells so that corresponding groups can be merged together
    for (i in seq_along(attr(data, "bys"))) {

      # writing the `by` name
      writeData(wb,
                sheet = var_name,
                x = attr(data, "bys")[i],
                startRow = 4,
                startCol = attr(data, "col_dividers")[i] + 1) # place the name of the `by` right after the previous group's col divider

      # merge with corresponding cells
      mergeCells(wb,
                 sheet = var_name,
                 cols = (attr(data, "col_dividers")[i] + 1):attr(data, "col_dividers")[i+1],
                 rows = 4)

      # center the text
      addStyle(wb,
               sheet = var_name,
               rows = 4,
               cols = attr(data, "col_dividers")[i] + 1,
               style = createStyle(halign = "center"))
    }

    # in row 5, do the same thing, but with by_labels instead
    for (i in seq_along(attr(data, "by_labels"))) { # currently doing this by position, likely need to change to names in the future

      # writing the `by` name
      writeData(wb,
                sheet = var_name,
                x = attr(data, "by_labels")[i],
                startRow = 5,
                startCol = attr(data, "col_dividers")[i] + 1) # place the name of the `by` right after the previous group's col divider

      # merge with corresponding cells
      mergeCells(wb,
                 sheet = var_name,
                 rows = 5,
                 cols = (attr(data, "col_dividers")[i] + 1):attr(data, "col_dividers")[i+1])

      # center the text
      addStyle(wb,
               sheet = var_name,
               rows = 5,
               cols = attr(data, "col_dividers")[i] + 1,
               style = createStyle(halign = "center"))
    }
    # declare how many rows of "buffer" there are, and work from there
    buffer_rows <- 5
    # Write data to the sheet (starting in row 5)
    writeData(wb, sheet = var_name, x = data, startRow = buffer_rows + 1, startCol = 1)

    # Apply right border style to the divider columns
    addStyle(
      wb,
      sheet = var_name,
      style = createStyle(border = "right", borderStyle = "medium"),
      rows = 4:(nrow(data) + 6),
      cols = c(1, attr(data, "col_dividers")),
      gridExpand = TRUE,
      stack = TRUE
    )

    # Apply bottom border style to column headers
    addStyle(
      wb,
      sheet = var_name,
      style = createStyle(border = "bottom", borderStyle = "medium"),
      rows = 4,
      cols = 1:ncol(data),
      gridExpand = TRUE,
      stack = TRUE
    )

    # Apply top border style to column headers
    addStyle(
      wb,
      sheet = var_name,
      style = createStyle(border = "top", borderStyle = "medium"),
      rows = 4,
      cols = 1:ncol(data),
      gridExpand = TRUE,
      stack = TRUE
    )

    # Apply bottom border style to bottom of the full table
    addStyle(
      wb,
      sheet = var_name,
      style = createStyle(border = "bottom", borderStyle = "medium"),
      rows = nrow(data) + 6,
      cols = 1:ncol(data),
      gridExpand = TRUE,
      stack = TRUE
    )

    # allow automatic column widths for most cols
    setColWidths(wb, var_name, cols = 1, widths = 30)
    setColWidths(wb, var_name, cols = 2:ncol(data), widths = "auto")
    # we start "auto" colWidths at column 2, since column 1 might eventually contain
    # very long strings (like the full question wording, other metadata below the table, etc)
    # and we're not interested in wrapping that text yet

    # widen height of rows, just to make it easier to read
    setRowHeights(wb, var_name,
                  rows = 4:(nrow(data) + buffer_rows + 1), # have to add extra rows for however many rows are taken up above the data
                  heights = 28)

    # --- color `too_low_n` cells red

    # a) identify which excel row is now the one with "n" values in it
    row_where_n <- which(data$levels == "n") + buffer_rows + 1 # have to add all the buffer rows
    too_low_n_cols <- attr(data, "too_low_n")
    addStyle(
      wb,
      sheet = var_name,
      style = createStyle(fontColour = "#800000",
                          fgFill = "#fadadd"),
      rows = row_where_n,
      cols = too_low_n_cols,
      gridExpand = FALSE,
      stack = TRUE
    )

    # --- add extra messaging rows beneath the table, for whatever
    # start with min_n statement

    total_rows_used <- buffer_rows + nrow(data) + 1
    first_avail <- total_rows_used + 1
    writeData(wb,
              sheet = var_name,
              glue("Flagging groups with n-sizes less than {attr(data, 'min_group_n')}"),
              startRow = first_avail,
              startCol = 1)


  })

  # --------------------------------------------- #
  # ----------- Add Table of Contents ----------- #
  # --------------------------------------------- #

  addWorksheet(wb, "Table of Contents", tabColour = "#4F81BD")

  # Get all sheet names except TOC
  banner_sheets <- setdiff(names(wb), "Table of Contents")

  # Write TOC header
  writeData(
    wb,
    sheet = "Table of Contents",
    x = "Table of Contents",
    startRow = 1,
    startCol = 1
  )

  #format TOC header row bold + bigger font
  header_style <- createStyle(fontSize = 14,
                              textDecoration = "bold",
                              halign = "left") # not sure we need to specify halign, but fine for now
  addStyle(
    wb,
    "Table of Contents",
    style = header_style,
    rows = 1,
    cols = 1,
    gridExpand = TRUE
  )

  # Add hyperlinks to each label pointing to the respective sheet's A1 cell
  for (i in seq_along(banner_sheets)) {
    link <- paste0("#'", banner_sheets[i], "'!A1")
    formula <- sprintf('HYPERLINK("%s", "%s")', link, glue("{banner_sheets[i]}: {question_wordings[i]}")) # I would have written this using `glue`, but fine enough for now
    writeFormula(
      wb,
      "Table of Contents",
      x = formula,
      startRow = i + 2, # has to correspond to whatever the startRow of the labels is above ^^,
      startCol = 1
    )
  }

  #Set the TOC to be the first sheet
  worksheetOrder(wb) <- c(which(names(wb) == "Table of Contents"), which(names(wb) != "Table of Contents"))


  # --------------------------------------------- #
  # ----------------- Save out ------------------ #
  # --------------------------------------------- #

  # Save workbook
  saveWorkbook(wb, file, overwrite = overwrite)
}
