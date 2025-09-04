
#' Export Banner Crosstabs to Formatted Excel Workbook
#'
#' This function takes a list of banner crosstab tables and exports them to a
#' formatted Excel workbook. Each table becomes a separate worksheet with appropriate
#' styling, including borders and column dividers. A Table of Contents sheet with
#' hyperlinks is automatically generated.
#'
#' @param banners_list A list of data frames, typically the output from banner analysis
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
#'   banners_list = list(satisfaction = banner_results),
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
#'   banners_list = multiple_results,
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
#' @seealso
#' \code{\link{banners}} for creating banner analysis results,
#' \code{\link[openxlsx]{createWorkbook}} for Excel workbook creation,
#' \code{\link[openxlsx]{addWorksheet}} for adding worksheets,
#' \code{\link[openxlsx]{saveWorkbook}} for saving Excel files
#'
#' @importFrom openxlsx createWorkbook addWorksheet writeData createStyle addStyle
#'   setColWidths writeFormula worksheetOrder saveWorkbook
#' @importFrom purrr walk map_chr
#'
#' @export
write_banners <- function(banners_list, file, overwrite = TRUE) {
  # Create a new workbook
  wb <- createWorkbook()

  # for each element of the banners list, create sheet + add table + add stylings
  walk(banners_list, function(data) {
    name <- attr(data, "target")

    # Add a sheet
    addWorksheet(wb, sheetName = name)

    # Write data to the sheet
    writeData(wb, sheet = name, x = data)

    # Define a style for the rest of the columns (e.g., left border)
    rightBorder <- createStyle(border = "right", borderStyle = "medium")

    # Apply the style to the columns
    addStyle(
      wb,
      sheet = name,
      style = rightBorder,
      rows = 0:nrow(data) + 1,
      cols = c(1, attr(data, "col_dividers")),
      gridExpand = TRUE,
      stack = TRUE
    )

    # Define the style for the borders (e.g., top border)
    bottom_border <- createStyle(border = "bottom", borderStyle = "medium")

    # Apply the style to the column headers (first row)
    addStyle(
      wb,
      sheet = name,
      style = bottom_border,
      rows = 1,
      cols = 1:ncol(data),
      gridExpand = TRUE,
      stack = TRUE
    )
  })

  addWorksheet(wb, "Table of Contents", tabColour = "#4F81BD")


  # Get all sheet names except TOC
  sheets <- setdiff(names(wb), "Table of Contents")

  # Get labels (attr label or fallback to sheet name)
  sheet_labels <- map_chr(banners_list, ~ {
    lbl <- attr(.x, "label")
    if (is.null(lbl) || is.na(lbl) || lbl == "") {
      attr(.x, "target")  # fallback to sheet name
    } else {
      lbl
    }
  })

  # Write TOC header
  writeData(
    wb,
    "Table of Contents",
    "Table of Contents",
    startRow = 1,
    startCol = 1
  )

  # Write sheet labels as links starting row 2
  writeData(
    wb,
    "Table of Contents",
    sheet_labels,
    startRow = 2,
    startCol = 1,
    colNames = FALSE
  )

  # Add hyperlinks to each label pointing to the respective sheet's A1 cell (I DON'T THINK THIS PART WORKS?)
  for (i in seq_along(sheets)) {
    link <- paste0("#'", sheets[i], "'!A1")
    formula <- sprintf('HYPERLINK("%s", "%s")', link, sheet_labels[i])
    writeFormula(
      wb,
      "Table of Contents",
      x = formula,
      startRow = i + 1,
      startCol = 1
    )
  }

  #format TOC header row bold + bigger font
  setColWidths(wb, "Table of Contents", cols = 1, widths = 50)
  header_style <- createStyle(fontSize = 14,
                              textDecoration = "bold",
                              halign = "center")
  addStyle(
    wb,
    "Table of Contents",
    style = header_style,
    rows = 1,
    cols = 1,
    gridExpand = TRUE
  )

  #Set the TOC to be the first sheet
  worksheetOrder(wb) <- c(which(names(wb) == "Table of Contents"), which(names(wb) != "Table of Contents"))

  # Save workbook
  saveWorkbook(wb, file, overwrite = overwrite)
}
