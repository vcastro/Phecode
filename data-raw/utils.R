
#utils

download_extract <- function (url, exdir, files) {
  
  temp <- tempfile()
  download.file(url, temp)
  unzip(temp, exdir = exdir, junkpaths = TRUE, files = files)
  
}


like_match <- function (x1, x2) {
  str_detect(x1, paste0("^", x2))
}
