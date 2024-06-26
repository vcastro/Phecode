#' PhecodeX map
#'
#' A dataset containing PhecodeX diagnosis categories mappings to ICD-9 
#' and ICD-10 codes
#' 
#'
#' @format A data frame with 152961 obs. and 3 variables:
#' \describe{
#'   \item{phecode}{Phecode}
#'   \item{ICD}{ICD-9 or ICD-10 codes}
#'   \item{vocabulary_id}{ICD code version, either ICD9CM or ICD10CM}
#' }
#' @source \url{https://phewascatalog.org/files/phecodeX/phecodeX_unrolled_ICD_CM.csv.zip}
#' 
#' 
#' @seealso \code{\link{PhecodeX_definitions}} for ICD code definitions for each Phecode.
#'
"PhecodeX_map"