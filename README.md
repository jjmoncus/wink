
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wink

<!-- badges: start -->
<!-- badges: end -->

The goal of wink is to provide foundational functionality for generating
Wincross-like tables of survey estimates, including significance testing

## Installation

You can install the development version of wink from
[GitHub](https://github.com/) with:

    #> ℹ Loading metadata database
    #> ✔ Loading metadata database ... done
    #> 
    #> 
    #> → Will install 56 packages.
    #> → Will update 1 package.
    #> → Will download 28 CRAN packages (37.45 MB), cached: 27 (39.25 MB).
    #> → Will download 2 packages with unknown size.
    #> + backports               1.5.0       🔧 ⬇ (122.48 kB)
    #> + bit                     4.6.0       🔧 ⬇ (730.79 kB)
    #> + bit64                   4.6.0-1     🔧 ⬇ (581.86 kB)
    #> + broom                   1.0.10       ⬇ (1.92 MB)
    #> + cli                     3.6.5       🔧
    #> + clipr                   0.8.0        ⬇ (51.91 kB)
    #> + crayon                  1.5.3        ⬇ (164.91 kB)
    #> + DBI                     1.2.3       
    #> + dplyr                   1.1.4       🔧
    #> + forcats                 1.0.1        ⬇ (421.46 kB)
    #> + foreach                 1.5.2        ⬇ (141.00 kB)
    #> + generics                0.1.4       
    #> + glmnet                  4.1-10      🔧 ⬇ (5.90 MB)
    #> + glue                    1.8.0       🔧
    #> + haven                   2.5.5       🔧 ⬇ (1.13 MB)
    #> + hms                     1.1.3        ⬇ (100.51 kB)
    #> + iterators               1.0.14       ⬇ (346.35 kB)
    #> + jomo                    2.7-6       🔧 ⬇ (2.20 MB)
    #> + lifecycle               1.0.4       
    #> + lme4                    1.1-37      🔧 ⬇ (7.11 MB)
    #> + magrittr                2.0.4       🔧
    #> + mice                    3.18.0      🔧 ⬇ (1.82 MB)
    #> + minqa                   1.2.8       🔧
    #> + mitml                   0.4-5        ⬇ (532.84 kB)
    #> + mitools                 2.4         
    #> + nloptr                  2.2.1       🔧 ⬇ (546.46 kB)
    #> + numDeriv                2016.8-1.1  
    #> + openxlsx                4.2.8       🔧
    #> + ordinal                 2023.12-4.1 🔧 ⬇ (1.28 MB)
    #> + pan                     1.9         🔧 ⬇ (604.78 kB)
    #> + pewmethods              1.0         👷‍♀️🔧 ⬇ (GitHub: d7c0481)
    #> + pillar                  1.11.1      
    #> + pkgconfig               2.0.3       
    #> + purrr                   1.1.0       🔧
    #> + R6                      2.6.1       
    #> + ranger                  0.17.0      🔧 ⬇ (2.48 MB)
    #> + rbibutils               2.3         🔧 ⬇ (1.30 MB)
    #> + Rcpp                    1.1.0       🔧
    #> + Rdpack                  2.6.4        ⬇ (636.95 kB)
    #> + readr                   2.1.5       🔧 ⬇ (1.99 MB)
    #> + reformulas              0.4.1        ⬇ (135.02 kB)
    #> + rlang                   1.1.6       🔧
    #> + shape                   1.4.6.1      ⬇ (755.28 kB)
    #> + stringi                 1.8.7       🔧
    #> + stringr                 1.5.2       
    #> + survey                  4.4-8       🔧
    #> + tibble                  3.3.0       🔧
    #> + tidyr                   1.3.1       🔧
    #> + tidyselect              1.2.1       
    #> + tzdb                    0.5.0       🔧 ⬇ (1.28 MB)
    #> + ucminf                  1.2.2       🔧 ⬇ (50.15 kB)
    #> + utf8                    1.2.6       🔧
    #> + vctrs                   0.6.5       🔧
    #> + vroom                   1.6.6       🔧 ⬇ (3.12 MB)
    #> + wink       0.0.0.9000 → 0.0.0.9000  👷🏾‍♀️🔧 ⬇ (GitHub: 312910f)
    #> + withr                   3.0.2       
    #> + zip                     2.3.3       🔧
    #> ℹ Getting 28 pkgs (37.45 MB) and 2 pkgs with unknown sizes, 27 (39.25 MB) cached
    #> ✔ Got backports 1.5.0 (aarch64-apple-darwin20) (122.48 kB)
    #> ✔ Got Rdpack 2.6.4 (aarch64-apple-darwin20) (636.95 kB)
    #> ✔ Got bit 4.6.0 (aarch64-apple-darwin20) (730.79 kB)
    #> ✔ Got clipr 0.8.0 (aarch64-apple-darwin20) (51.91 kB)
    #> ✔ Got hms 1.1.3 (aarch64-apple-darwin20) (100.51 kB)
    #> ✔ Got broom 1.0.10 (aarch64-apple-darwin20) (1.92 MB)
    #> ✔ Got ucminf 1.2.2 (aarch64-apple-darwin20) (50.15 kB)
    #> ✔ Got wink 0.0.0.9000 (source) (52.80 kB)
    #> ✔ Got bit64 4.6.0-1 (aarch64-apple-darwin20) (581.86 kB)
    #> ✔ Got pewmethods 1.0 (source) (229.14 kB)
    #> ✔ Got mice 3.18.0 (aarch64-apple-darwin20) (1.82 MB)
    #> ✔ Got forcats 1.0.1 (aarch64-apple-darwin20) (421.46 kB)
    #> ✔ Got lme4 1.1-37 (aarch64-apple-darwin20) (7.11 MB)
    #> ✔ Got iterators 1.0.14 (aarch64-apple-darwin20) (346.35 kB)
    #> ✔ Got ordinal 2023.12-4.1 (aarch64-apple-darwin20) (1.28 MB)
    #> ✔ Got shape 1.4.6.1 (aarch64-apple-darwin20) (755.28 kB)
    #> ✔ Got tzdb 0.5.0 (aarch64-apple-darwin20) (1.28 MB)
    #> ✔ Got rbibutils 2.3 (aarch64-apple-darwin20) (1.30 MB)
    #> ✔ Got ranger 0.17.0 (aarch64-apple-darwin20) (2.48 MB)
    #> ✔ Got haven 2.5.5 (aarch64-apple-darwin20) (1.13 MB)
    #> ✔ Got nloptr 2.2.1 (aarch64-apple-darwin20) (546.46 kB)
    #> ✔ Got vroom 1.6.6 (aarch64-apple-darwin20) (3.12 MB)
    #> ✔ Got foreach 1.5.2 (aarch64-apple-darwin20) (141.00 kB)
    #> ✔ Got crayon 1.5.3 (aarch64-apple-darwin20) (164.91 kB)
    #> ✔ Got readr 2.1.5 (aarch64-apple-darwin20) (1.99 MB)
    #> ✔ Got jomo 2.7-6 (aarch64-apple-darwin20) (2.20 MB)
    #> ✔ Got mitml 0.4-5 (aarch64-apple-darwin20) (532.84 kB)
    #> ✔ Got pan 1.9 (aarch64-apple-darwin20) (604.78 kB)
    #> ✔ Got reformulas 0.4.1 (aarch64-apple-darwin20) (135.02 kB)
    #> ✔ Got glmnet 4.1-10 (aarch64-apple-darwin20) (5.90 MB)
    #> ✔ Installed DBI 1.2.3  (126ms)
    #> ✔ Installed R6 2.6.1  (131ms)
    #> ✔ Installed cli 3.6.5  (129ms)
    #> ✔ Installed dplyr 1.1.4  (132ms)
    #> ✔ Installed generics 0.1.4  (127ms)
    #> ✔ Installed glue 1.8.0  (127ms)
    #> ✔ Installed lifecycle 1.0.4  (128ms)
    #> ✔ Installed magrittr 2.0.4  (130ms)
    #> ✔ Installed Rcpp 1.1.0  (242ms)
    #> ✔ Installed minqa 1.2.8  (191ms)
    #> ✔ Installed mitools 2.4  (79ms)
    #> ✔ Installed numDeriv 2016.8-1.1  (37ms)
    #> ✔ Installed openxlsx 4.2.8  (42ms)
    #> ✔ Installed pillar 1.11.1  (43ms)
    #> ✔ Installed pkgconfig 2.0.3  (39ms)
    #> ✔ Installed purrr 1.1.0  (39ms)
    #> ✔ Installed rlang 1.1.6  (41ms)
    #> ✔ Installed stringr 1.5.2  (17ms)
    #> ✔ Installed stringi 1.8.7  (87ms)
    #> ✔ Installed survey 4.4-8  (46ms)
    #> ✔ Installed tibble 3.3.0  (70ms)
    #> ✔ Installed tidyr 1.3.1  (44ms)
    #> ✔ Installed tidyselect 1.2.1  (41ms)
    #> ✔ Installed utf8 1.2.6  (40ms)
    #> ✔ Installed vctrs 0.6.5  (40ms)
    #> ✔ Installed withr 3.0.2  (41ms)
    #> ✔ Installed zip 2.3.3  (40ms)
    #> ✔ Installed Rdpack 2.6.4  (39ms)
    #> ✔ Installed backports 1.5.0  (39ms)
    #> ✔ Installed bit64 4.6.0-1  (40ms)
    #> ✔ Installed bit 4.6.0  (79ms)
    #> ✔ Installed broom 1.0.10  (52ms)
    #> ✔ Installed clipr 0.8.0  (14ms)
    #> ✔ Installed crayon 1.5.3  (13ms)
    #> ✔ Installed forcats 1.0.1  (16ms)
    #> ✔ Installed foreach 1.5.2  (17ms)
    #> ✔ Installed glmnet 4.1-10  (73ms)
    #> ✔ Installed haven 2.5.5  (21ms)
    #> ✔ Installed hms 1.1.3  (13ms)
    #> ✔ Installed iterators 1.0.14  (14ms)
    #> ✔ Installed jomo 2.7-6  (17ms)
    #> ✔ Installed lme4 1.1-37  (59ms)
    #> ✔ Installed mice 3.18.0  (23ms)
    #> ✔ Installed mitml 0.4-5  (16ms)
    #> ✔ Installed nloptr 2.2.1  (21ms)
    #> ✔ Installed ordinal 2023.12-4.1  (17ms)
    #> ✔ Installed pan 1.9  (17ms)
    #> ✔ Installed ranger 0.17.0  (24ms)
    #> ✔ Installed rbibutils 2.3  (25ms)
    #> ✔ Installed readr 2.1.5  (30ms)
    #> ✔ Installed reformulas 0.4.1  (13ms)
    #> ✔ Installed shape 1.4.6.1  (15ms)
    #> ✔ Installed tzdb 0.5.0  (26ms)
    #> ✔ Installed ucminf 1.2.2  (13ms)
    #> ✔ Installed vroom 1.6.6  (44ms)
    #> ℹ Packaging pewmethods 1.0
    #> ✔ Packaged pewmethods 1.0 (425ms)
    #> ℹ Building pewmethods 1.0
    #> ✔ Built pewmethods 1.0 (7.2s)
    #> ✔ Installed pewmethods 1.0 (github::pewresearch/pewmethods@d7c0481) (14ms)
    #> ℹ Packaging wink 0.0.0.9000
    #> ✔ Packaged wink 0.0.0.9000 (376ms)
    #> ℹ Building wink 0.0.0.9000
    #> ✔ Built wink 0.0.0.9000 (2.3s)
    #> ✔ Installed wink 0.0.0.9000 (github::jjmoncus/wink@312910f) (15ms)
    #> ✔ 1 pkg + 65 deps: kept 6, upd 1, added 56, dld 30 (NA B) [21.2s]

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(wink)
#| echo: false 
## basic example code
```

For questions, reach out to J.J. Moncus at <jjmoncus706@gmail.com>, or
raise an issue on Github.
