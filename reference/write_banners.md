# Export banners to a n excel workbook

Takes banners (generated with
[`banner()`](https://jjmoncus.github.io/wink/reference/banner.md)) and
prints them to a formatted excel workbook. Each banner is printed to a
separate worksheet with appropriate styling, including borders and
column dividers. A Table of Contents sheet with hyperlinks is added to
the front.

## Usage

``` r
write_banners(banners, file, overwrite = TRUE, format_numbers = TRUE)
```

## Arguments

- banners:

  A banner or list of banners, generated with
  [`banner`](https://jjmoncus.github.io/wink/reference/banner.md)

- file:

  (chr) The file path to save the output to. Should include the ".xlsx"
  extension

- overwrite:

  (lgl) Whether to overwrite an existing file. Default is TRUE. If
  FALSE, will throw an error a file with the same name already exists.

- format_numbers:

  (lgl) Whether to format numeric values (percentages, n-sizes, etc).
  per default styling. If TRUE, percentages and n-sizes are formatted to
  integer values, and design effects and margins of error are formatted
  to two decimal places.

## Value

Invisibly returns NULL. The function is called for its side effect of
creating and writing an Excel file.

The Excel file has several properties:

- **Table of Contents**: A dedicated first sheet with hyperlinks to all
  banners. Each banner also includes a button back to the table of
  contents.

- **worksheets**: Each banner is written to a separate sheet, named
  after the `var` variable used to generate it.

- **formatting**: Borders are added to separate sections of the table.
  Numbers are saved and formatted per rules, and text is saved as text.

## See also

`banners` for creating banner analysis results,
[`createWorkbook`](https://rdrr.io/pkg/openxlsx/man/createWorkbook.html)
for Excel workbook creation,
[`addWorksheet`](https://rdrr.io/pkg/openxlsx/man/addWorksheet.html) for
adding worksheets,
[`saveWorkbook`](https://rdrr.io/pkg/openxlsx/man/saveWorkbook.html) for
saving Excel files

## Examples

``` r
if (FALSE) { # \dontrun{

# Make some banners
# `food` is a dataset provided in the package
results <- banners(
  data = food,
  target = "vegan",
  banners = c("rating_meat", "rating_sushi")
)

# Export to Excel with default settings
write_banners(
  banners = results,
  file = "results.xlsx",
  overwrite = TRUE,
  format_numbers = TRUE
)
} # }
```
