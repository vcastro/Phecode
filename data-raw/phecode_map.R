library(tidyverse)
library(fuzzyjoin)
source('data-raw/utils.R')

download_extract(url = "https://phewascatalog.org/files/phecode_icd9_map_unrolled.csv.zip",
                 exdir = "data-raw",
                 files = c("phecode_icd9_map_unrolled.csv"))



Phecode_icd9_map <- read_csv("data-raw/phecode_icd9_map_unrolled.csv", 
                                col_types = cols(.default = col_character())) %>% 
  mutate(vocabulary_id = 'ICD9CM') %>% 
  select(code = icd9, phecode, vocabulary_id)



download_extract(url = "https://phewascatalog.org/files/Phecode_map_v1_2_icd10cm_beta.csv.zip",
                 exdir = "data-raw",
                 files = c("Phecode_map_v1_2_icd10cm_beta.csv"))

Phecode_icd10_map <- read_csv("data-raw/Phecode_map_v1_2_icd10cm_beta.csv", 
                             col_types = cols(.default = col_character()), locale = readr::locale(encoding = "UTF-8")) %>% 
  mutate(vocabulary_id = 'ICD10CM')


phecode_list <- Phecode_icd10_map %>% select(parent_phecode = phecode) %>% unique()


Phecode_icd10_map_unrolled <- Phecode_icd10_map %>% 
  regex_right_join(phecode_list, by = c("phecode" = "parent_phecode")) %>% 
  select(code = icd10cm, phecode = parent_phecode, vocabulary_id) %>% 
  unique()

Phecode_map <- bind_rows(Phecode_icd9_map, Phecode_icd10_map_unrolled)

usethis::use_data(Phecode_map, overwrite = TRUE)