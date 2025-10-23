library(magick)

logo <- image_read("man/figures/logo.png")

trimmed_logo <- image_trim(logo)

image_write(trimmed_logo, "man/figures/logo.png")
