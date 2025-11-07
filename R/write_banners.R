#' Get the guts of a banner
#'
#' An internal function (used in `write_banners()`) that facilitates printing banners to excel such that
#' numbers are saved as numbers and numbers are saved as text.
#'
#' @importFrom purrr list_flatten
#'
fix_guts <- function(data) {

  data %>%
    mutate(rownum = 1:nrow(data)) %>%
    split(~rownum) %>%
    map(function(x) {

      x <- x %>% select(-rownum)
      rest <- x[2:length(x)]
      # if coercing to numeric causes problems, do nothing, otherwise coerse
      condition <- suppressWarnings(as.numeric(rest[[1]]) %>% is.na())
      if (condition) {
        #
      } else {
        rest <- rest %>% mutate(across(everything(), as.numeric))
      }

      rest %>% structure(mode = ifelse(condition, "else", "numeric"))
    }) %>%
    list_flatten()
}






#' Export banners to a n excel workbook
#'
#' Takes banners (generated with `banner()`) and prints them to a
#' formatted excel workbook. Each banner is printed to a separate worksheet with appropriate
#' styling, including borders and column dividers. A Table of Contents sheet with
#' hyperlinks is added to the front.
#'
#' @param banners A banner or list of banners, generated with  \code{\link{banner}}
#' @param file (chr) The file path to save the output to. Should include the ".xlsx" extension
#' @param overwrite (lgl) Whether to overwrite an existing file. Default is TRUE. If FALSE, will
#' throw an error a file with the same name already exists.
#' @param format_numbers (lgl) Whether to format numeric values (percentages, n-sizes, etc). per default
#' styling. If TRUE, percentages and n-sizes are formatted to integer values, and design effects and margins of error
#' are formatted to two decimal places.
#'
#' @return Invisibly returns NULL. The function is called for its side effect of creating and writing
#'   an Excel file.
#'
#' The Excel file has several properties:
#' \itemize{
#'   \item \strong{Table of Contents}: A dedicated first sheet with hyperlinks to all banners. Each banner also includes a button back to the table of contents.
#'   \item \strong{worksheets}: Each banner is written to a separate sheet, named after the `var` variable used to generate it.
#'   \item \strong{formatting}: Borders are added to separate sections of the table. Numbers are saved and formatted per rules, and text is saved as text.
#' }
#'
#'
#'
#' @examples
#' \dontrun{
#'
#' # Make some banners
#' # `food` is a dataset provided in the package
#' results <- banners(
#'   data = food,
#'   target = "vegan",
#'   banners = c("rating_meat", "rating_sushi")
#' )
#'
#' # Export to Excel with default settings
#' write_banners(
#'   banners = results,
#'   file = "results.xlsx",
#'   overwrite = TRUE,
#'   format_numbers = TRUE
#' )
#' }
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
write_banners <- function(banners, file, overwrite = TRUE, format_numbers = TRUE) {

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

      # center and wrap the text BEFORE MERGING
      addStyle(wb,
               sheet = var_name,
               rows = 5,
               cols = attr(data, "col_dividers")[i] + 1,
               style = createStyle(halign = "center", wrapText = TRUE))

      # merge with corresponding cells
      mergeCells(wb,
                 sheet = var_name,
                 rows = 5,
                 cols = (attr(data, "col_dividers")[i] + 1):attr(data, "col_dividers")[i+1])

      # the idea for wrapping before merging was that it would fix the row height not auto-fitting to all text
      # this doesnt accomplish that, need to turn back to this
    }
    # declare how many rows of "buffer" there are, and work from there
    buffer_rows <- 5

    # Write data to the sheet (starting in row 6)
    # --- instead of just writing the data as is
    # --- we first write the column headers, the first column, and then iteratively the "guts" of the table
    # --- this is what allows us to export numbers as numbers and text as text

    # --- col names - this will by default write horizontally because we're passing a tibble (sneaky) but have to specify colNames = FALSE
    writeData(wb, sheet = var_name, x = tibble(!!!names(data)), startRow = buffer_rows + 1, startCol = 1, colNames = FALSE)
    # --- first col data - this will by default be written column wise because we are passing a vector
    writeData(wb, sheet = var_name, x = data[[1]], startRow = buffer_rows + 1 + 1, # the extra 1 here makes sure we line up with the "+ i" below
              startCol = 1)
    # --- write each row iteratively
    banner_guts <- fix_guts(data)
    for (i in 1:nrow(data)) {
      # will write horizontally, since each item is a tbl - colNames = FALSE is very important here
      writeData(wb, sheet = var_name, x = banner_guts[[i]], startRow = buffer_rows + 1 + i, startCol = 2, colNames = FALSE)
    }

    if (format_numbers) {

      # if the user wants us to do standard formatting, then we add some styles
      # otherwise, we leave the table exactly is
      for (i in 1:nrow(data)) {
        # start by just formatting the whole table as integers
        addStyle(wb, sheet = var_name, style = createStyle(numFmt = "0"), rows = buffer_rows + 1 + i, cols = 2:ncol(data), stack = TRUE)
      }
      # now overwrite the previous one with two decimals for deff and moe rows
      row_where_deff <- which(data$levels == "deff") + buffer_rows + 1 # have to add all the buffer rows, same as below
      addStyle(wb, sheet = var_name, style = createStyle(numFmt = "0.00"), rows = row_where_deff:(row_where_deff+1), cols = 2:ncol(data), stack = TRUE, gridExpand = TRUE)
    }

    # wrap the column headers in row 6, in case they're very long
    addStyle(wb, sheet = var_name, style = createStyle(wrapText = TRUE), rows = 6, cols = 1:ncol(data), stack = TRUE)

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
    setColWidths(wb, var_name, cols = 2:ncol(data), widths = 18)
    # we would ideally like to set colwidths to "auto" so they will snap to the width of the longest text
    # but the inclusion of the long `by_labels` above messes it up,
    # so we force it for now.
    #
    # column 1 might eventually contain very long strings (like the full question wording,
    # other metadata below the table, etc), and we're not interested in wrapping that text yet,
    # so we would want to force its width, anyway

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
    total_rows_used <- buffer_rows + nrow(data) + 1
    first_avail <- total_rows_used + 1

    # start with min_n statement
    writeData(wb,
              sheet = var_name,
              paste0("Flagging groups with n-sizes less than ", attr(data, 'min_group_n')),
              startRow = first_avail + 1,
              startCol = 1)
    # na.rm statement
    na.rm_statement <- ifelse(attr(data, "na.rm"),
                              paste0("na.rm = TRUE. ", attr(data, 'n_removed')," respondents with missing values were removed from `", attr(data, 'var'), "`"),
                              paste0("na.rm = FALSE"))
    writeData(wb,
              sheet = var_name,
              x = na.rm_statement,
              startRow = first_avail + 2,
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









