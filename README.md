<!-- README.md is generated from README.Rmd. Please edit that file -->



<!-- badges: start -->
[![Travis build status](https://travis-ci.org/news-r/papers.svg?branch=master)](https://travis-ci.org/news-r/papers)
<!-- badges: end -->

# papers

The goal of papers is to ...

## Installation

You can install the released version of papers from [CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("remotes")
remotes::install_github("news-r/papers")
```

## Example


```r
library(papers)

# get the list of regions available
regions <- get_regions()
#> No encoding supplied: defaulting to UTF-8.
#> ℹ 214 Countries

# get papers from a specific region
(papers <- get_papers(regions, "Belgium"))
#> No encoding supplied: defaulting to UTF-8.
#> # A tibble: 13 x 2
#>    region                 link                                    
#>    <chr>                  <chr>                                   
#>  1 De Standaard           http://www.standaard.be/                
#>  2 De Tijd                http://www.tijd.be/politiek_en_economie/
#>  3 DeMorgen               http://www.demorgen.be/                 
#>  4 Gazet van Antwerpen    http://www.gva.be/                      
#>  5 Het Belang van Limburg http://www.hbvl.be/                     
#>  6 Het Laatste Nieuws     http://www.hln.be                       
#>  7 Het Nieuwsblad         http://www.nieuwsblad.be/               
#>  8 Het Volk               http://www.nieuwsblad.be/?ref=hv&       
#>  9 L'Echo                 http://www.lecho.be/home                
#> 10 La Dernière Heure      http://www.dhnet.be/                    
#> 11 La Libre Belgique      http://www.lalibre.be/                  
#> 12 Le Soir                http://www.lesoir.be/                   
#> 13 The Brussels Times     http://www.thebrusselstimes.com/
```
