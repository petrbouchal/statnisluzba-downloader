library(targets)
library(tools)

download_ss_file <- function(url, dest_dir, filename) {

  destfile <- file.path(dest_dir, paste0(tools::file_path_sans_ext(filename), "_",
                                         format(Sys.time(), "%Y%m%dT%H%M%S"), ".xml"))

  download.file(url, destfile)
  return(destfile)
}

writeLines(format(Sys.time(), "%Y%m%dT%H%M%S"), "lastrun.txt")

list(
  tar_target(url_mista, "https://portal.isoss.cz/opendata/ISoSS_Opendata_EOSM.xml", format = "url"),
  tar_target(soubor_mista, download_ss_file(url = url_mista, filename = "ISoSS_Opendata_EOSM.xml",
                                            dest_dir = "soubory-mista")),
  tar_target(url_struktura, "https://portal.isoss.cz/opendata/ISoSS_Opendata_OSYS_OSSS.xml", format = "url"),
  tar_target(soubor_struktura, download_ss_file(url = url_struktura, filename = "ISoSS_Opendata_OSYS_OSSS.xml",
                                                dest_dir = "soubory-struktura"))
)
