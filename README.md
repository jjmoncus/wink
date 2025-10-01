
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wink

<!-- badges: start -->
<!-- badges: end -->

The goal of wink is to provide foundational functionality for generating
Wincross-like tables of survey estimates, including significance testing

## Installation

You can install the development version of wink from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("jjmoncus/wink")
#> 
#> ✔ Updated metadata database: 7.64 MB in 15 files.
#> 
#> ℹ Updating metadata database
#> ✔ Updating metadata database ... done
#> 
#> 
#> → Will install 27 packages.
#> → Will update 1 package.
#> → Will download 27 CRAN packages (39.25 MB).
#> → Will download 1 package with unknown size.
#> + cli                     3.6.5      🔧 ⬇ (1.47 MB)
#> + DBI                     1.2.3       ⬇ (927.19 kB)
#> + dplyr                   1.1.4      🔧 ⬇ (1.61 MB)
#> + generics                0.1.4       ⬇ (82.60 kB)
#> + glue                    1.8.0      🔧 ⬇ (175.14 kB)
#> + lifecycle               1.0.4       ⬇ (125.64 kB)
#> + magrittr                2.0.4      🔧 ⬇ (231.97 kB)
#> + minqa                   1.2.8      🔧 ⬇ (354.09 kB)
#> + mitools                 2.4         ⬇ (271.62 kB)
#> + numDeriv                2016.8-1.1  ⬇ (115.06 kB)
#> + openxlsx                4.2.8      🔧 ⬇ (3.41 MB)
#> + pillar                  1.11.1      ⬇ (660.11 kB)
#> + pkgconfig               2.0.3       ⬇ (18.47 kB)
#> + purrr                   1.1.0      🔧 ⬇ (585.88 kB)
#> + R6                      2.6.1       ⬇ (87.28 kB)
#> + Rcpp                    1.1.0      🔧 ⬇ (3.37 MB)
#> + rlang                   1.1.6      🔧 ⬇ (1.91 MB)
#> + stringi                 1.8.7      🔧 ⬇ (14.79 MB)
#> + stringr                 1.5.2       ⬇ (313.18 kB)
#> + survey                  4.4-8      🔧 ⬇ (3.95 MB)
#> + tibble                  3.3.0      🔧 ⬇ (692.99 kB)
#> + tidyr                   1.3.1      🔧 ⬇ (1.32 MB)
#> + tidyselect              1.2.1       ⬇ (226.89 kB)
#> + utf8                    1.2.6      🔧 ⬇ (209.74 kB)
#> + vctrs                   0.6.5      🔧 ⬇ (1.89 MB)
#> + wink       0.0.0.9000 → 0.0.0.9000 👷🏻‍♀️🔧 ⬇ (GitHub: 05c05e2)
#> + withr                   3.0.2       ⬇ (224.91 kB)
#> + zip                     2.3.3      🔧 ⬇ (225.84 kB)
#> ℹ Getting 27 pkgs (39.25 MB) and 1 pkg with unknown size
#> ✔ Got generics 0.1.4 (aarch64-apple-darwin20) (82.60 kB)
#> ✔ Got R6 2.6.1 (aarch64-apple-darwin20) (87.28 kB)
#> ✔ Got pillar 1.11.1 (aarch64-apple-darwin20) (660.11 kB)
#> ✔ Got dplyr 1.1.4 (aarch64-apple-darwin20) (1.61 MB)
#> ✔ Got Rcpp 1.1.0 (aarch64-apple-darwin20) (3.37 MB)
#> ✔ Got wink 0.0.0.9000 (source) (33.57 kB)
#> ✔ Got mitools 2.4 (aarch64-apple-darwin20) (271.62 kB)
#> ✔ Got tibble 3.3.0 (aarch64-apple-darwin20) (692.99 kB)
#> ✔ Got tidyr 1.3.1 (aarch64-apple-darwin20) (1.32 MB)
#> ✔ Got glue 1.8.0 (aarch64-apple-darwin20) (175.14 kB)
#> ✔ Got numDeriv 2016.8-1.1 (aarch64-apple-darwin20) (115.06 kB)
#> ✔ Got magrittr 2.0.4 (aarch64-apple-darwin20) (231.97 kB)
#> ✔ Got pkgconfig 2.0.3 (aarch64-apple-darwin20) (18.47 kB)
#> ✔ Got stringr 1.5.2 (aarch64-apple-darwin20) (313.18 kB)
#> ✔ Got lifecycle 1.0.4 (aarch64-apple-darwin20) (125.64 kB)
#> ✔ Got zip 2.3.3 (aarch64-apple-darwin20) (225.84 kB)
#> ✔ Got utf8 1.2.6 (aarch64-apple-darwin20) (209.74 kB)
#> ✔ Got tidyselect 1.2.1 (aarch64-apple-darwin20) (226.89 kB)
#> ✔ Got cli 3.6.5 (aarch64-apple-darwin20) (1.47 MB)
#> ✔ Got minqa 1.2.8 (aarch64-apple-darwin20) (354.09 kB)
#> ✔ Got purrr 1.1.0 (aarch64-apple-darwin20) (585.88 kB)
#> ✔ Got rlang 1.1.6 (aarch64-apple-darwin20) (1.91 MB)
#> ✔ Got survey 4.4-8 (aarch64-apple-darwin20) (3.95 MB)
#> ✔ Got withr 3.0.2 (aarch64-apple-darwin20) (224.91 kB)
#> ✔ Got DBI 1.2.3 (aarch64-apple-darwin20) (927.19 kB)
#> ✔ Got vctrs 0.6.5 (aarch64-apple-darwin20) (1.89 MB)
#> ✔ Got openxlsx 4.2.8 (aarch64-apple-darwin20) (3.41 MB)
#> ✔ Got stringi 1.8.7 (aarch64-apple-darwin20) (14.79 MB)
#> ✔ Installed DBI 1.2.3  (127ms)
#> ✔ Installed R6 2.6.1  (130ms)
#> ✔ Installed cli 3.6.5  (126ms)
#> ✔ Installed dplyr 1.1.4  (130ms)
#> ✔ Installed generics 0.1.4  (132ms)
#> ✔ Installed glue 1.8.0  (135ms)
#> ✔ Installed lifecycle 1.0.4  (141ms)
#> ✔ Installed magrittr 2.0.4  (169ms)
#> ✔ Installed Rcpp 1.1.0  (285ms)
#> ✔ Installed minqa 1.2.8  (209ms)
#> ✔ Installed mitools 2.4  (56ms)
#> ✔ Installed numDeriv 2016.8-1.1  (39ms)
#> ✔ Installed openxlsx 4.2.8  (44ms)
#> ✔ Installed pillar 1.11.1  (46ms)
#> ✔ Installed pkgconfig 2.0.3  (43ms)
#> ✔ Installed purrr 1.1.0  (73ms)
#> ✔ Installed rlang 1.1.6  (45ms)
#> ✔ Installed stringr 1.5.2  (22ms)
#> ✔ Installed stringi 1.8.7  (87ms)
#> ✔ Installed survey 4.4-8  (43ms)
#> ✔ Installed tibble 3.3.0  (41ms)
#> ✔ Installed tidyr 1.3.1  (44ms)
#> ✔ Installed tidyselect 1.2.1  (71ms)
#> ✔ Installed utf8 1.2.6  (79ms)
#> ✔ Installed vctrs 0.6.5  (52ms)
#> ✔ Installed withr 3.0.2  (45ms)
#> ✔ Installed zip 2.3.3  (27ms)
#> ℹ Packaging wink 0.0.0.9000
#> ✔ Packaged wink 0.0.0.9000 (434ms)
#> ℹ Building wink 0.0.0.9000
#> ✔ Built wink 0.0.0.9000 (4.5s)
#> ✔ Installed wink 0.0.0.9000 (github::jjmoncus/wink@05c05e2) (17ms)
#> ✔ 1 pkg + 30 deps: kept 1, upd 1, added 27, dld 28 (NA B) [27.4s]
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(wink)
## basic example code
```

For questions, reach out to J.J. Moncus at <jjmoncus706@gmail.com>, or
raise an issue on Github.
