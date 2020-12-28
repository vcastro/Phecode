## code to prepare `DATASET` dataset goes here
library(tidyverse)
source('data-raw/utils.R')

download_extract(url = "https://phewascatalog.org/files/phecode_definitions1.2.csv.zip",
                 exdir = "data-raw",
                 files = c("phecode_definitions1.2.csv"))

Phecode_definitions_src <- read_csv("data-raw/phecode_definitions1.2.csv", 
                         col_types = cols(.default = col_character()))


Phecode_definitions_src <- Phecode_definitions_src %>% 
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

# add definitions that are in mapping but missing from file
# these are pulled from the online listing at https://phewascatalog.org/phecodes_icd10cm

missing_definitions <- tribble(
  ~phecode, ~phecode_desc,
  "1010.1", "Screening for infectious and parasitic diseases",
  "1010.2",	"Screening for malignant neoplasms",
  "1010.3", "Screening for other diseases and disorders",
  "1010.4", "Genetic Test",
  "1010.5", "Potential health hazards related to communicable diseases potential health hazards related to communicable diseases",
  "1010.6", "Persons encountering health services in circumstances related to reproduction",
  "1010.7", "Persons with potential health hazards related to socioeconomic, psychosocial, and other circumstances",
  "1089", "Acquired absence of limb",
  "1090", "Acquired absence of organs"
) %>% mutate(
  phecode_class = "Other", phecode_class_number = "0", sex = "Both", phecode_exclude_range = NA
)


Phecode_definitions <- Phecode_definitions_src %>% 
  mutate(phecode_desc = recode(phecode_desc, !!!spelling_fixes),
         phecode_class = ifelse(is.na(phecode_class) | is.null(phecode_class) | phecode_class == "NULL", "Other", phecode_class)) %>% 
  bind_rows(missing_definitions)


# MOVE TO TEST: check all phecodes in map have a definition
# Phecode_map %>% 
#  anti_join(Phecode_definitions, by = "phecode") %>% 
#  group_by(phecode) %>% 
#  count()

usethis::use_data(Phecode_definitions, overwrite = TRUE)
