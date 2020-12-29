
# Phecode

<!-- badges: start -->
[![R-CMD-check](https://github.com/vcastro/Phecode/workflows/R-CMD-check/badge.svg)](https://github.com/vcastro/Phecode/actions)
<!-- badges: end -->

The goal of Phecode is to group ICD-9 and ICD-10 diagnoses codes from EHR data
to PheCodes for PheWAS or other analyses

## Installation

You can install the development version of Phecode with:

``` r
remotes::install_github("vcastro/Phecode")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
# table of phecode descriptions, categories and exclusion codes
Phecode::phecode_definitions

# mapping table of Phecode to ICD codes
Phecode::phecode_map
```

