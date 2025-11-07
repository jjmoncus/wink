

#' Constructor for `wink_banner` class
#'
#'
constructor_banner <- function(data) {


  data %>%
    structure(
      class = c("wink_banner", class(data))
    )
}


#' Print method for 'wink_banner' class
#'
#' Implements the custom print behavior for 'wink_banner' tables
#'
#' @param data An object of class 'wink_banner'.
#' @param ... Additional arguments (can ignore for now)
#'
#' @return The input object 'data' (invisibly)
#'
#' @export
#'
#' @method print wink_banner
#'
#' @importFrom gt gt tab_spanner tab_style cell_borders cells_body cell_text cells_column_labels opt_table_font tab_source_note cell_fill tab_header opt_align_table_header px
print.wink_banner <- function(data, ...) {


  # need spanner ids to be monotonically increasing
  # extra total spanners just to get excel letters to overlap
  total_spanner_params <- map(
    1:2,
    function(i) {
      list(
        list(label = str_c(rep("", times = 2*i - 1), collapse = "."), # this is just so labels dont repeat across spanners, to avoid an error
             columns = i,
             id = 30*i-1),
        list(label = str_c(rep("", times = 2*i), collapse = "."),
             columns = i,
             id = 30*i))
    }) %>%
    list_flatten()

  # tab_spanners for by columns
  by_spanner_params <- map(1:length(attr(data, "bys")),
                  function(i) {

                    cols_to_use <- (attr(data, "col_dividers")[i]+1):attr(data, "col_dividers")[i+1] # col_dividers has length one more than length(bys)

                    by_pulled <- attr(data, "bys")[i]
                    label_pulled <- attr(data, "by_labels")[i]

                    list(
                      list(label = label_pulled,
                           columns = cols_to_use,
                           id = 80*i
                           ),
                      # trying another one above it
                      list(label = by_pulled,
                           columns = cols_to_use,
                           id = 80*i+1)
                      )
                    }) %>%
    list_flatten() # puts all calls to tab_spanner on the same level

  excel_spanner_params <- map(
    1:ncol(data),
    function(i) {
      list(label = num_to_excel_col(i),
           columns = i,
           id = 10000+i)
      })

  apply_spanner <- function(g, args) {

    g %>%
      tab_spanner(label = args$label,
                  columns = args$columns,
                  id = args$id)
  }

  na.rm_statement <- ifelse(attr(data, "na.rm"),
                            paste0("na.rm = TRUE. ", attr(data, 'n_removed')," respondents with missing values were removed from `", attr(data, 'var'), "`"),
                            paste0("na.rm = FALSE"))

  row_where_n <- which(data$levels == "n")

  data %>%
    gt() %>%
    # separate `by` groups with darker borders
    tab_style(
      style = cell_borders(sides = "right", color = "lightgrey", weight = px(.5)),
      locations = cells_body()
    ) %>%
    # separate `by` groups with darker borders
    tab_style(
      style = cell_borders(sides = "right", weight = px(1)),
      locations = cells_body(columns = attr(data, "col_dividers"))
    ) %>%
    # center align column headers
    tab_style(
      style = cell_text(align = "center"),
      locations = cells_column_labels()
    ) %>%
    # right align all text
    tab_style(
      style = cell_text(align = "right"),
      locations = cells_body()
    ) %>%
    # left align just first column
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_body(columns = 1)
    ) %>%
    # make all font smaller
    opt_table_font(size = 11) %>%
    # captions below table for n-size and `na.rm`
    tab_source_note(glue("Flagging groups with n-sizes less than {attr(data, 'min_group_n')}")) %>%
    tab_source_note(na.rm_statement) %>%
    # color low n-size cells in red
    tab_style(
     style = list(
       cell_fill(color = "#fadadd"),
       cell_text(color = "#800000")
       ),
     locations = cells_body(rows = row_where_n,
                            columns = attr(data, "too_low_n"))
     ) %>%
    # add by spanner column headers
    {reduce(by_spanner_params, apply_spanner, .init = .)} %>%
    # adding column letters to mimic Excel sheets
    {reduce(total_spanner_params, apply_spanner, .init = .)} %>%
    {reduce(excel_spanner_params, apply_spanner, .init = .)} %>%
    # header with var_label
    tab_header(title = attr(data, "var_label")) %>%
    opt_align_table_header(align = "left") %>%
    # trying to format numbers next
    print()

  # The print method must return the object invisibly (a standard R convention)
  invisible(data)
}
