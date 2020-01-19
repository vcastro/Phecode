## code to prepare `DATASET` dataset goes here
library(tidyverse)
source('data-raw/utils.R')

download_extract(url = "https://phewascatalog.org/files/phecode_definitions1.2.csv.zip",
                 exdir = "data-raw",
                 files = c("phecode_definitions1.2.csv"))

Phecode_definitions <- read_csv("data-raw/phecode_definitions1.2.csv", 
                         col_types = cols(.default = col_character()))


Phecode_definitions <- Phecode_definitions %>% 
  #as_tibble() %>% 
  mutate(sex = ifelse(is.na(sex), 'Both', sex)) %>% 
  select(phecode, phecode_desc = phenotype, phecode_class = category, phecode_class_number = category_number, sex, phecode_exclude_range) %>% 
  arrange(phecode)



# fix spelling errors in description
spelling_fixes <- c(`Althete\'s foot` = "Athlete's foot",
                    `Cancer of of nasal cavities` = "Cancer of nasal cavities",
                    `Manlignant and unknown neoplasms of brain and nervous system` = "Malignant and unknown neoplasms of brain and nervous system",
                    `Agorophobia, social phobia, and panic disorder` = "Agoraphobia, social phobia, and panic disorder",
                    `Mental disorders durring/after pregnancy` = "Mental disorders during/after pregnancy",
                    `Develomental delays and disorders` = "Developmental delays and disorders",
                    `Central/nonobstroctive sleep apnea` = "Central/nonobstructive sleep apnea",
                    `Migrain with aura` = "Migraine with aura",
                    `Retinal vascular changes and abnomalities` = "Retinal vascular changes and abnormalities",
                    `Hypersensitivity angiitis` = "Hypersensitivity angitis",
                    `Varicose veins of lower extremity, symptomtic` = "Varicose veins of lower extremity, symptomatic",
                    `Other pulmonary inflamation or edema` = "Other pulmonary inflammation or edema",
                    `Anatomical abnormatilies of kidney and ureters` = "Anatomical abnormalities of kidney and ureters",
                    `Kidney replaced by transpant` = "Kidney replaced by transplant",
                    `Urethral stricture due to infecton` = "Urethral stricture due to infection",
                    `Congenital anomalies of abdominal wall; diaphram` = "Congenital anomalies of abdominal wall; diaphragm")

Phecode_definitions <- Phecode_definitions %>% 
  mutate(phecode_desc = recode(phecode_desc, !!!spelling_fixes))


usethis::use_data(Phecode_definitions, overwrite = TRUE)
