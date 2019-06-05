#' Regions
#' 
#' Get the list of regions available.
#' 
#' @import rvest
#' @import polite
#' 
#' @examples regions <- get_regions()
#' 
#' @export
get_regions <- function() {
  session <- bow(BASE_URL, force = TRUE, user_agent = get_user_agent())
  result <- scrape(session) %>%
    html_node(".cList") %>% 
    html_nodes("li") 

  region <- html_text(result)
  link <- result %>% 
    html_nodes("a") %>%
    html_attr("href") %>%
    paste0(BASE_URL, .)
  
  df <- tibble::tibble(
    region = region,
    link = link
  )

  cat(crayon::blue(cli::symbol$info), nrow(df), "Countries\n")
  regions <- .construct_countries(df)
  invisible(regions)
}

#' @export
print.regions <- function(x, ...){
  print(x[["region"]])
}

#' User Agent
#' 
#' Get and set \code{user-agent} for subsequent calls.
#' 
#' @param agent Agent name.
#' 
#' @name user-agent
#' @export
get_user_agent <- function(){
  ua <- Sys.getenv("PAPERS_USER_AGENT")
  if(nchar(ua) <= 0)
    ua <- "papers-r-package"
  return(ua)
}

#' @rdname user-agent
#' @export
set_user_agent <- function(agent){
  if(missing(agent))
    stop("Missing agent", call. = FALSE)
  Sys.setenv("PAPERS_USER_AGENT" = agent)
}

#' Papers
#' 
#' Get papers from a certain region.
#' 
#' @param data Dataset as returned by \code{\link{get_regions}}.
#' @param region Name of the region.
#' 
#' @examples
#' regions <- get_regions()
#' get_papers(regions, "Belgium")
#' 
#' @name get_papers
#' @export
get_papers <- function(data, region) UseMethod("get_papers")

#' @rdname get_papers
#' @method get_papers regions
#' @export
get_papers.regions <- function(data, region){
  if(missing(region))
    stop("Missing region", call. = FALSE)

  subset <- data[data[["region"]] == region,]
  url <- subset[["link"]]
  region <- subset[["region"]]

  session <- bow(url, force = TRUE, user_agent = get_user_agent())
  result <- scrape(session) %>%
    html_node(".cList") %>% 
    html_nodes("li") 

  region <- html_text(result) %>% 
    gsub("\\(.+\\)", "", .) %>% 
    trimws()
  link <- result %>% 
    html_nodes("a") %>%
    html_attr("href")
  
  df <- tibble::tibble(
    region = region,
    link = link
  ) 
  df[["region"]] <- region 
  return(df)
}