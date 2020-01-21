#' Phecode map
#'
#' A dataset containing Phecode diagnosis categories mappings to ICD-9 
#' and ICD-10 codes
#' 
#'
#' @format A data frame with 152961 obs. and 3 variables:
#' \describe{
#'   \item{code}{ICD-9 or ICD-10 codes}
#'   \item{phecode}{Phecode}
#'   \item{vocabulary_id}{ICD code version, either ICD9CM or ICD10CM}
#' }
#' @source \url{https://phewascatalog.org/files/phecode_icd9_map_unrolled.csv.zip}
#' @source \url{https://phewascatalog.org/files/Phecode_map_v1_2_icd10cm_beta.csv.zip}
#' 
#' 
#' @seealso \code{\link{Phecode_definitions}} for ICD code definitions for each Phecode.
#'
"Phecode_map"