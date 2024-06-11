library(tidyverse)
source('data-raw/utils.R')

download_extract(
  url = "https://phewascatalog.org/files/phecodeX/phecodeX_unrolled_ICD_CM.csv.zip",
  exdir = "data-raw",
  files = c("phecodeX_unrolled_ICD_CM.csv")
)

PhecodeX_map <- read_csv(
  "data-raw/phecodeX_unrolled_ICD_CM.csv",
  col_types = cols(.default = col_character()),
  locale = readr::locale(encoding = "UTF-8")
)

usethis::use_data(PhecodeX_map, overwrite = TRUE)