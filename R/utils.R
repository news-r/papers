BASE_URL <- "https://www.newspaperindex.com"

.construct_countries <- function(df) {
  structure(df, class = c("regions", class(df)))
}