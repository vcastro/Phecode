#' PhecodeX definitions
#'
#' A dataset containing PhecodeX diagnosis categories and their descriptions 
#' 
#'
#' @format A data frame with 3612 obs. and 7 variables:
#' \describe{
#'   \item{phecode}{Phecode code}
#'   \item{phecode_string}{Description of phecode}
#'   \item{category_num}{Number index of phecode category}
#'   \item{category}{Category of phecode based on ICD body systems}
#'   \item{sex}{gender constraint for each phecode (Male, Female, or Both)}
#'   \item{icd10_only}{Does the phecode only consist of ICD10 codes 1=Y, 0=N}
#'   \item{phecode_num}{Phecode code numeric version}
#' }
#' @source \url{https://phewascatalog.org/files/phecodeX/phecodeX_info.csv.zip}
#' 
#' @seealso \code{\link{PhecodeX_map}} for ICD code mapping for each Phecode.
#'
"PhecodeX_definitions"