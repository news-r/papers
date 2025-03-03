
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->
[![Travis build status](https://travis-ci.org/news-r/papers.svg?branch=master)](https://travis-ci.org/news-r/papers) <!-- badges: end -->

papers
======

Access online newspapers information.

Installation
------------

You can install the released version of papers Github with:

``` r
# install.packages("remotes")
remotes::install_github("news-r/papers")
```

Usage
-----

You can either use `get_regions` and `get_papers` to get the latest data or you can use the `papers` dataset which should include all newspapers worldwide (at least the major ones).

Data
----

``` r
data("papers", package = "papers")
head(papers)
#>                           newspaper
#> 1                      Afghan Daily
#> 2                 Afghanistan Times
#> 3                  Afghanistan.ru -
#> 4                        Benawa.com
#> 5 Inter Press Service - Afghanistan
#> 6                  IRIN Afghanistan
#>                                       link      region
#> 1              https://wn.com/Afghan_daily Afghanistan
#> 2              http://afghanistantimes.af/ Afghanistan
#> 3                     http://www.farsi.ru/ Afghanistan
#> 4                   http://www.benawa.com/ Afghanistan
#> 5                  http://www.ipsnews.net/ Afghanistan
#> 6 http://www.irinnews.org/asia/afghanistan Afghanistan
```

Example
-------

``` r
library(papers)

# get the list of regions available
regions <- get_regions()
#> No encoding supplied: defaulting to UTF-8.
#> ℹ 214 Countries

# get papers from a specific region
(papers <- get_papers(regions, "Belgium"))
#> No encoding supplied: defaulting to UTF-8.
#> # A tibble: 13 x 3
#>    newspaper              link                                     region 
#>    <chr>                  <chr>                                    <chr>  
#>  1 De Standaard           http://www.standaard.be/                 Belgium
#>  2 De Tijd                http://www.tijd.be/politiek_en_economie/ Belgium
#>  3 DeMorgen               http://www.demorgen.be/                  Belgium
#>  4 Gazet van Antwerpen    http://www.gva.be/                       Belgium
#>  5 Het Belang van Limburg http://www.hbvl.be/                      Belgium
#>  6 Het Laatste Nieuws     http://www.hln.be                        Belgium
#>  7 Het Nieuwsblad         http://www.nieuwsblad.be/                Belgium
#>  8 Het Volk               http://www.nieuwsblad.be/?ref=hv&        Belgium
#>  9 L'Echo                 http://www.lecho.be/home                 Belgium
#> 10 La Dernière Heure      http://www.dhnet.be/                     Belgium
#> 11 La Libre Belgique      http://www.lalibre.be/                   Belgium
#> 12 Le Soir                http://www.lesoir.be/                    Belgium
#> 13 The Brussels Times     http://www.thebrusselstimes.com/         Belgium
```
