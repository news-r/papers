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
get_regions <- function(user_agent = get_user_agent()) {
  session <- bow(BASE_URL, force = TRUE)
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
