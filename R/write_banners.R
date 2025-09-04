
write_banners <- function(kffbanners_list, file, overwrite = TRUE) {
  # Create a new workbook
  wb <- createWorkbook()

  # for each element of the KFF Banners list, create sheet + add table + add stylings
  walk(kffbanners_list, function(data) {
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
  sheet_labels <- map_chr(kffbanners_list, ~ {
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
