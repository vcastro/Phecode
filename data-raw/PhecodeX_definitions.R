library(tidyverse)
source('data-raw/utils.R')

download_extract(url = "https://phewascatalog.org/files/phecodeX/phecodeX_info.csv.zip",
                 exdir = "data-raw",
                 files = c("phecodeX_info.csv"))

PhecodeX_definitions <- read_csv("data-raw/phecodeX_info.csv", 
                                    col_types = cols(.default = col_character()),
                                 locale = readr::locale(encoding = "UTF-8"))

usethis::use_data(PhecodeX_definitions, overwrite = TRUE)
