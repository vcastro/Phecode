
#utils

download_extract <- function (url, exdir, files) {
  
  temp <- tempfile()
  download.file(url, temp)
  unzip(temp, exdir = exdir, junkpaths = TRUE, files = files)
  
}
