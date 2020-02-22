library(papers)

regions <- get_regions()

papers <- tibble::tibble()
for(r in 1:nrow(regions)){
  cat("country", r, "\n")
  reg <- get_papers(regions, r)
  papers <- dplyr::bind_rows(papers, reg)
}

usethis::use_data(papers, overwrite = TRUE)
