
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wink <a href="https://jjmoncus.github.io/wink/"><img src="man/figures/logo.png" align="right" height="139" /></a>

<!-- badges: start -->
<!-- badges: end -->

## Overview

A banner is a set of crosstabs of survey estimates stitched together,
and with significance testing performed column-by-column within each
crosstab.

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = "age"
)
```

<div id="utayincntm"
style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">

<style>#utayincntm table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#utayincntm thead, #utayincntm tbody, #utayincntm tfoot, #utayincntm tr, #utayincntm td, #utayincntm th {
  border-style: none;
}
&#10;#utayincntm p {
  margin: 0;
  padding: 0;
}
&#10;#utayincntm .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 11px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#utayincntm .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#utayincntm .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#utayincntm .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#utayincntm .gt_heading {
  background-color: #FFFFFF;
  text-align: left;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#utayincntm .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#utayincntm .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#utayincntm .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#utayincntm .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#utayincntm .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#utayincntm .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#utayincntm .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#utayincntm .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#utayincntm .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#utayincntm .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#utayincntm .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#utayincntm .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#utayincntm .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#utayincntm .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#utayincntm .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#utayincntm .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#utayincntm .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#utayincntm .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#utayincntm .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#utayincntm .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#utayincntm .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#utayincntm .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#utayincntm .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#utayincntm .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#utayincntm .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#utayincntm .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#utayincntm .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#utayincntm .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#utayincntm .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#utayincntm .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#utayincntm .gt_left {
  text-align: left;
}
&#10;#utayincntm .gt_center {
  text-align: center;
}
&#10;#utayincntm .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#utayincntm .gt_font_normal {
  font-weight: normal;
}
&#10;#utayincntm .gt_font_bold {
  font-weight: bold;
}
&#10;#utayincntm .gt_font_italic {
  font-style: italic;
}
&#10;#utayincntm .gt_super {
  font-size: 65%;
}
&#10;#utayincntm .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#utayincntm .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#utayincntm .gt_indent_1 {
  text-indent: 5px;
}
&#10;#utayincntm .gt_indent_2 {
  text-indent: 10px;
}
&#10;#utayincntm .gt_indent_3 {
  text-indent: 15px;
}
&#10;#utayincntm .gt_indent_4 {
  text-indent: 20px;
}
&#10;#utayincntm .gt_indent_5 {
  text-indent: 25px;
}
&#10;#utayincntm .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#utayincntm div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
<thead>
<tr class="gt_heading">
<td colspan="6" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>
Q2. How likely are you to choose to eat pescetarian within the coming 12
months?
</td>
</tr>
<tr class="gt_col_headings gt_spanner_row">
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10001">

<div class="gt_column_spanner">

A

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10002">

<div class="gt_column_spanner">

B

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10003">

<div class="gt_column_spanner">

C

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10004">

<div class="gt_column_spanner">

D

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10005">

<div class="gt_column_spanner">

E

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10006">

<div class="gt_column_spanner">

F

</div>

</th>
</tr>
<tr class="gt_col_headings gt_spanner_row">
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="30">

<div class="gt_column_spanner">

.

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="60">

<div class="gt_column_spanner">

…

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="81">

<div class="gt_column_spanner">

age

</div>

</th>
</tr>
<tr class="gt_col_headings gt_spanner_row">
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="29">

<div class="gt_column_spanner">

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="59">

<div class="gt_column_spanner">

..

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="80">

<div class="gt_column_spanner">

AGE. age groups (recode)

</div>

</th>
</tr>
<tr class="gt_col_headings">
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="levels">
levels
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Total">
Total
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="a18-35">
18-35
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="a36-49">
36-49
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="a50-64">
50-64
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="a65+">
65+
</th>
</tr>
</thead>
<tbody class="gt_table_body">
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
Very Low
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
7
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
6
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
6
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
8
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
8
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
Low
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
12
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
14
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
12
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
12
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
9
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
F
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
Moderate
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
23
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
23
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
23
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
22
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
23
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
High
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
16
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
14
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
18
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
17
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
15
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
C
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
Very High
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
38
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
39
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
36
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
38
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
41
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
DK/Refused
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
4
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
4
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
n
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
1988
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
486
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
570
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
448
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
359
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
deff
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
1
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
1
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
moe
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
2.19795038967966
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4.44537027393984
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4.10476830125862
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4.63006479436303
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
5.17224217689874
</td>
</tr>
</tbody>
<tfoot class="gt_sourcenotes">
<tr>
<td class="gt_sourcenote" colspan="6">
Flagging groups with n-sizes less than 100
</td>
</tr>
<tr>
<td class="gt_sourcenote" colspan="6">
na.rm = TRUE. 12 respondents with missing values were removed from
`pescetarian`
</td>
</tr>
</tfoot>
</table>

</div>

As you add more variables to split by, each new crosstab is added on the
end, without disrupting the significance testing results of previous
ones.

``` r
banner(
  data = food,
  var = "pescetarian",
  bys = c("age", "income", "gender", "region", "party_lean")
)
```

<div id="mxnpigcjho"
style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">

<style>#mxnpigcjho table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#mxnpigcjho thead, #mxnpigcjho tbody, #mxnpigcjho tfoot, #mxnpigcjho tr, #mxnpigcjho td, #mxnpigcjho th {
  border-style: none;
}
&#10;#mxnpigcjho p {
  margin: 0;
  padding: 0;
}
&#10;#mxnpigcjho .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 11px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#mxnpigcjho .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#mxnpigcjho .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#mxnpigcjho .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#mxnpigcjho .gt_heading {
  background-color: #FFFFFF;
  text-align: left;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#mxnpigcjho .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#mxnpigcjho .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#mxnpigcjho .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#mxnpigcjho .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#mxnpigcjho .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#mxnpigcjho .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#mxnpigcjho .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#mxnpigcjho .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#mxnpigcjho .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#mxnpigcjho .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#mxnpigcjho .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#mxnpigcjho .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#mxnpigcjho .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#mxnpigcjho .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mxnpigcjho .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#mxnpigcjho .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#mxnpigcjho .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#mxnpigcjho .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mxnpigcjho .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#mxnpigcjho .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#mxnpigcjho .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#mxnpigcjho .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mxnpigcjho .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#mxnpigcjho .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#mxnpigcjho .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#mxnpigcjho .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#mxnpigcjho .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#mxnpigcjho .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mxnpigcjho .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#mxnpigcjho .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mxnpigcjho .gt_left {
  text-align: left;
}
&#10;#mxnpigcjho .gt_center {
  text-align: center;
}
&#10;#mxnpigcjho .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#mxnpigcjho .gt_font_normal {
  font-weight: normal;
}
&#10;#mxnpigcjho .gt_font_bold {
  font-weight: bold;
}
&#10;#mxnpigcjho .gt_font_italic {
  font-style: italic;
}
&#10;#mxnpigcjho .gt_super {
  font-size: 65%;
}
&#10;#mxnpigcjho .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#mxnpigcjho .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#mxnpigcjho .gt_indent_1 {
  text-indent: 5px;
}
&#10;#mxnpigcjho .gt_indent_2 {
  text-indent: 10px;
}
&#10;#mxnpigcjho .gt_indent_3 {
  text-indent: 15px;
}
&#10;#mxnpigcjho .gt_indent_4 {
  text-indent: 20px;
}
&#10;#mxnpigcjho .gt_indent_5 {
  text-indent: 25px;
}
&#10;#mxnpigcjho .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#mxnpigcjho div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
<thead>
<tr class="gt_heading">
<td colspan="24" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>
Q2. How likely are you to choose to eat pescetarian within the coming 12
months?
</td>
</tr>
<tr class="gt_col_headings gt_spanner_row">
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10001">

<div class="gt_column_spanner">

A

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10002">

<div class="gt_column_spanner">

B

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10003">

<div class="gt_column_spanner">

C

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10004">

<div class="gt_column_spanner">

D

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10005">

<div class="gt_column_spanner">

E

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10006">

<div class="gt_column_spanner">

F

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10007">

<div class="gt_column_spanner">

G

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10008">

<div class="gt_column_spanner">

H

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10009">

<div class="gt_column_spanner">

I

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10010">

<div class="gt_column_spanner">

J

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10011">

<div class="gt_column_spanner">

K

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10012">

<div class="gt_column_spanner">

L

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10013">

<div class="gt_column_spanner">

M

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10014">

<div class="gt_column_spanner">

N

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10015">

<div class="gt_column_spanner">

O

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10016">

<div class="gt_column_spanner">

P

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10017">

<div class="gt_column_spanner">

Q

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10018">

<div class="gt_column_spanner">

R

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10019">

<div class="gt_column_spanner">

S

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10020">

<div class="gt_column_spanner">

T

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10021">

<div class="gt_column_spanner">

U

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10022">

<div class="gt_column_spanner">

V

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10023">

<div class="gt_column_spanner">

W

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="10024">

<div class="gt_column_spanner">

X

</div>

</th>
</tr>
<tr class="gt_col_headings gt_spanner_row">
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="30">

<div class="gt_column_spanner">

.

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="60">

<div class="gt_column_spanner">

…

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="81">

<div class="gt_column_spanner">

age

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="161">

<div class="gt_column_spanner">

income

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="241">

<div class="gt_column_spanner">

gender

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="321">

<div class="gt_column_spanner">

region

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="401">

<div class="gt_column_spanner">

party_lean

</div>

</th>
</tr>
<tr class="gt_col_headings gt_spanner_row">
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="29">

<div class="gt_column_spanner">

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1" scope="col" id="59">

<div class="gt_column_spanner">

..

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="80">

<div class="gt_column_spanner">

AGE. age groups (recode)

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="160">

<div class="gt_column_spanner">

INCOME. income (recode)

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="4" scope="colgroup" id="240">

<div class="gt_column_spanner">

S2. which of the following best describes you?

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="7" scope="colgroup" id="320">

<div class="gt_column_spanner">

S3. What region of the U.S. are you from?

</div>

</th>
<th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="400">

<div class="gt_column_spanner">

PARTY_LEAN. party affiliation (recode)

</div>

</th>
</tr>
<tr class="gt_col_headings">
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="levels">
levels
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Total">
Total
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="a18-35">
18-35
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="a36-49">
36-49
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="a50-64">
50-64
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="a65+">
65+
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Low-income">
Low income
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Middle-income">
Middle income
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="High-income">
High income
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="DK/Refused...10">
DK/Refused…10
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Woman">
Woman
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Man">
Man
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Other">
Other
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="DK/Refused...14">
DK/Refused…14
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="West-Coast">
West Coast
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="East-Coast">
East Coast
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Midwest">
Midwest
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="South">
South
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Mountain-West">
Mountain West
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Southwest">
Southwest
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="DK/Refused...21">
DK/Refused…21
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Dem/Lean-Dem">
Dem/Lean Dem
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="Rep/Lean-Rep">
Rep/Lean Rep
</th>
<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="text-align: center;" scope="col" id="DK/Refused...24">
DK/Refused…24
</th>
</tr>
</thead>
<tbody class="gt_table_body">
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
Very Low
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
7
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
6
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
6
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
8
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
8
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
7
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
7
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
6
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
7
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
6
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
7
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
8
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
10
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
7
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
8
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
6
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
6
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
7
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
7
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
6
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
I
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
I
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
P S T
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
P
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
P T
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
Low
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
12
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
14
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
12
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
12
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
9
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
13
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
9
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
12
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
10
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
13
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
10
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
16
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
12
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
9
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
10
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
15
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
11
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
10
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
13
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
13
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
12
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
11
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
15
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
F
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
H
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
H
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
L
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
O P S
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
Moderate
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
23
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
23
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
23
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
22
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
23
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
22
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
23
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
22
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
26
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
22
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
23
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
19
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
22
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
22
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
23
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
22
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
22
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
22
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
24
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
22
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
23
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
23
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
23
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
High
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
16
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
14
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
18
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
17
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
15
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
16
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
17
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
18
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
15
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
16
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
17
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
16
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
16
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
13
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
19
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
16
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
16
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
19
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
15
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
17
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
17
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
17
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
13
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
C
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
O
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
O
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
Very High
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
38
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
39
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
36
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
38
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
41
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
38
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
39
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
37
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
39
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
39
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
39
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
39
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
37
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
40
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
40
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
37
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
40
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
38
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
38
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
37
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
38
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
39
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
38
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
DK/Refused
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
4
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
4
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
3
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
6
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
3
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
4
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
6
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
..
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
<br />
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
n
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
1988
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
486
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
570
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
448
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
359
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
699
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
623
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
499
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right; color: #800000; background-color: #FADADD;">
99
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
910
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
817
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
106
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right; color: #800000; background-color: #FADADD;">
93
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
291
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
290
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
316
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
313
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
286
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
303
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
144
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
893
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
884
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
102
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
deff
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
1
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
1
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
1
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
1
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
1
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
1
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
1
</td>
</tr>
<tr>
<td headers="levels" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: left;">
moe
</td>
<td headers="Total" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
2.19795038967966
</td>
<td headers="18-35" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4.44537027393984
</td>
<td headers="36-49" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4.10476830125862
</td>
<td headers="50-64" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4.63006479436303
</td>
<td headers="65+" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
5.17224217689874
</td>
<td headers="Low income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
3.70670042491395
</td>
<td headers="Middle income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
3.92628709305352
</td>
<td headers="High income" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
4.38708251415128
</td>
<td headers="DK/Refused...10" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
9.84937058954028
</td>
<td headers="Woman" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
3.2486683662458
</td>
<td headers="Man" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
3.42858599985247
</td>
<td headers="Other" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
9.51860145110119
</td>
<td headers="DK/Refused...14" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
10.1621266083582
</td>
<td headers="West Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5.74486174125338
</td>
<td headers="East Coast" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5.75475815124409
</td>
<td headers="Midwest" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5.51293071453752
</td>
<td headers="South" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5.53928750565337
</td>
<td headers="Mountain West" class="gt_row gt_left" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5.79486148069301
</td>
<td headers="Southwest" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
5.62995289828998
</td>
<td headers="DK/Refused...21" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
8.16666666666667
</td>
<td headers="Dem/Lean Dem" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
3.27944495891025
</td>
<td headers="Rep/Lean Rep" class="gt_row gt_right" style="border-right-width: 0.5px; border-right-style: solid; border-right-color: lightgrey; text-align: right;">
3.29609669058193
</td>
<td headers="DK/Refused...24" class="gt_row gt_right" style="border-right-width: 1px; border-right-style: solid; border-right-color: #000000; text-align: right;">
9.70344592117141
</td>
</tr>
</tbody>
<tfoot class="gt_sourcenotes">
<tr>
<td class="gt_sourcenote" colspan="24">
Flagging groups with n-sizes less than 100
</td>
</tr>
<tr>
<td class="gt_sourcenote" colspan="24">
na.rm = TRUE. 12 respondents with missing values were removed from
`pescetarian`
</td>
</tr>
</tfoot>
</table>

</div>

`wink` provides functionality for generating these banners, specific to
each organization’s unique preferences, before exporting to a common
output format (Excel) for sharing across research teams.

## Installation

You can install the development version of wink from [the GitHub
rep](https://github.com/jjmoncus/wink/) with:

``` r
# library(devtools)
install_github("jjmoncus/wink", 
               build_vignettes = TRUE, # helpful to see vignettes, set to FALSE if needed
               force = TRUE  # helpful if you've installed previous versions, forces an override, set to FALSE if needed
                         )
```

## Usage

See `vignette("wink")` for an intro to the package, or visit the [Get
Started](https://jjmoncus.github.io/wink/articles/wink.html) link on the
[website](https://jjmoncus.github.io/wink/index.html).

For questions, reach out to J.J. Moncus at <jjmoncus706@gmail.com>, or
[raise an issue](https://github.com/jjmoncus/wink/issues).
