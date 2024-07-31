packages = c("BiocManager","shiny","tidyverse","arules","arulesViz","colorspace","visNetwork","plotly","igraph","shinythemes","readxl", "DT")
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)
BiocManager::install("Rgraphviz")

