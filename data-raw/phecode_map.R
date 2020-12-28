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


#### ICD-10-CM

download_extract(url = "https://phewascatalog.org/files/Phecode_map_v1_2_icd10cm_beta.csv.zip",
                 exdir = "data-raw",
                 files = c("Phecode_map_v1_2_icd10cm_beta.csv"))

Phecode_icd10cm_map <- read_csv("data-raw/Phecode_map_v1_2_icd10cm_beta.csv", 
                             col_types = cols(.default = col_character()), locale = readr::locale(encoding = "UTF-8")) %>% 
  mutate(vocabulary_id = 'ICD10CM')


phecode_list <- Phecode_icd10cm_map %>% select(parent_phecode = phecode) %>% unique()


Phecode_icd10cm_map_unrolled <- Phecode_icd10cm_map %>% 
  fuzzy_right_join(phecode_list, by = c("phecode" = "parent_phecode"), match_fun = like_match) %>% 
  select(code = icd10cm, phecode = parent_phecode, vocabulary_id) %>% 
  unique()


### ICD-10


download_extract(url = "https://phewascatalog.org/files/Phecode_map_v1_2_icd10_beta.csv.zip",
                 exdir = "data-raw",
                 files = c("Phecode_map_v1_2_icd10_beta.csv"))

Phecode_icd10_map <- read_csv("data-raw/Phecode_map_v1_2_icd10_beta.csv", 
                              col_types = cols(.default = col_character()), locale = readr::locale(encoding = "UTF-8")) %>% 
  mutate(vocabulary_id = 'ICD10')


phecode_list <- Phecode_icd10_map %>% select(parent_phecode = PHECODE) %>% unique()


Phecode_icd10_map_unrolled <- Phecode_icd10_map %>% 
  fuzzy_right_join(phecode_list, by = c("PHECODE" = "parent_phecode"), match_fun = like_match) %>% 
  select(code = ICD10, phecode = parent_phecode, vocabulary_id) %>% 
  unique()



Phecode_map <- bind_rows(Phecode_icd9_map, 
                         Phecode_icd10_map_unrolled,
                         Phecode_icd10cm_map_unrolled) %>% 
  filter(!is.na(vocabulary_id))

usethis::use_data(Phecode_map, overwrite = TRUE)