library(dplyr)

test_that("each phecode in phecode_map exists in phecode_definitions", {
  expect_equal(
    Phecode_map %>% 
      anti_join(Phecode_definitions, by = "phecode") %>%
      nrow(),
    0
  )
})

test_that("each phecode_definitions has a mapping to ICD-9 or ICD-10", {
  expect_equal(
    Phecode_definitions %>% 
      anti_join(Phecode_map, by = "phecode") %>% 
      nrow(),
    0
  )
})