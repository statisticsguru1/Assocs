source("marketbasketModule.R")
pkgss = c("Rgraphviz","shiny","tidyverse","arules","arulesViz","colorspace","visNetwork","plotly","igraph","shinythemes","readxl", "DT",'knitr','bslib')
lapply(pkgss,require,character.only=TRUE)
options(knitr.kable.NA = '')
ui<- page_fluid(
  marketbasketUI("marketbasket")
)