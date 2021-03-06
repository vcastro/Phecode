% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Phecode_definitions.R
\docType{data}
\name{Phecode_definitions}
\alias{Phecode_definitions}
\title{Phecode definitions}
\format{
A data frame with 1866 obs. and 6 variables:
\describe{
  \item{phecode}{Phecode code}
  \item{phecode_desc}{Description of phecode}
  \item{phecode_class}{Class of phecode based on ICD body systems}
  \item{phecode_class_number}{Number index of phecode_class}
  \item{sex}{gender constraint for each phecode (Male, Female, or Both)}
  \item{phecode_exclude_range}{Phecode range to be excluded for case-control analysis}
}
}
\source{
\url{https://phewascatalog.org/files/phecode_definitions1.2.csv.zip}
}
\usage{
Phecode_definitions
}
\description{
A dataset containing Phecode diagnosis categories and their descriptions
}
\seealso{
\code{\link{Phecode_map}} for ICD code mapping for each Phecode.
}
\keyword{datasets}
