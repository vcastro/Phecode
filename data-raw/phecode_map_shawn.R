library(Phecode)
library(tidyverse)

Phecode::Phecode_map %>% 
  mutate(vocabulary_id = str_replace(vocabulary_id, "ICD9CM", "ICD9")) %>% 
  transmute(Phecode = ifelse(!str_detect(phecode, fixed(".")), 
                             paste0(phecode, "_"),
                             str_replace_all(phecode, fixed("."), "_")),
         ICD = paste0(vocabulary_id, ":", code),
         ICD910 = vocabulary_id,
         code = str_remove_all(code, fixed("."))) %>% 
  write.csv("data-raw/phecode_map_shawn.csv", quote=TRUE)