
# Assocs: Rules Mining Tool

## Overview
**Assocs** is a rules mining tool designed to mine associations from transaction data. It runs on the R interface and provides a Rules Mining window and a Graphing window. The rules mining and graphing functionality is based on the methodologies outlined in Hahsler et al. (2006) and Hahsler et al. (2016).

## Installation Methods

### Standard Shiny Installation
To run the application using Shiny, execute the following code in your R environment:

    if (!require("pacman")) install.packages("pacman")
    pacman::p_load("Rgraphviz", "shiny", "tidyverse", "arules", "arulesViz", "colorspace", "visNetwork", "plotly", "igraph", "shinythemes", "readxl", "DT")
    runGitHub(
      'Assocs',
      username = 'statisticsguru1',
      ref = "main"
    )

### Cloud based usage
The cloud version of the app is also accessible [here](https://01943274-57a5-38db-16c2-41fce63bf8cd.share.connect.posit.cloud/)

### Local Installation via RInno (Deprecated version)
A local installation package is available through RInno. Follow these steps for the local installation:
s
1. **Download the installer:**
   - Download the `app.rar` file from [this link](https://1drv.ms/u/s!AmI4LHMH_KkPjRfdkkz4W3-fq-76?e=80IqtT) and save it to a specific location.
   - Extract the folder to your preferred location.

2. **Launch the installer:**
   - Navigate to the folder `RInno_installer` and launch the installer.
   - Continue the installation with default settings.
   - Specify the location where you want to install the app.
   - Ignore any errors that appear by clicking "OK."

3. **Finish the installation:**
   - The app will install and launch its first session.

## Using Assocs

### Launching the Application
After installation, you can launch the app by clicking the app icon found among your Windows applications.

### Application Tabs
The application consists of two main tabs:
- **Tab A: Rules**
  - This tab is for loading data, mining rules, and downloading the mined rules.
- **Tab B: Graphing**
  - This tab is for graphing the mined rules and downloading the graphs.

### Mining Rules
To mine rules, follow these steps:
1. **Data Upload:**
   - Click "Browse" to select a data file (CSV or Excel). The default file type is CSV.
   - Specify if the first row contains variable names (default is TRUE).
   - Specify the file type (default is CSV).

2. **Rules Input:**
   - Set the minimum support value (default is 0).
   - Set the minimum confidence value (default is 0).
   - Set the minimum length of item sets (default is 2).
   - Set the maximum length of item sets (default is 2).
   - Optionally exclude zero counts (default is selected).
   - Click "Mine rules" to start mining the rules.

3. **Download Rules:**
   - The mined rules will be displayed, and you can download them by clicking the "Download" button.

### Graphing Rules
After extracting the rules, you can graph them using the Graphing window:

1. **Static Graphs:**
   - Select the graph type from the dropdown.
   - Specify the measure of interestingness (default is lift).
   - Specify the shading measure (default is support).
   - Click "Go" to generate the graph.
   - Download the graph by clicking the "Download graph" button.

2. **Interactive Graphs:**
   - The inputs for interactive graphs are similar to static graphs.
   - The graph can be downloaded directly from the graph interface.

## References
- Hahsler M. & Karpienko R. (2016). Visualizing association rules in hierarchical groups. Journal of Business Economics 87(3) 317–335. doi: 10.1007/s11573-016-0822-8
- Hahsler M. (2017). arulesViz: Interactive Visualization of Association Rules with R. The R Journal 9(2) 163. doi: 10.32614/rj-2017-047

## Appendix
### How to Save CSV from Excel
1. Click "Save As".
2. Select "CSV (Comma delimited)" as the file type.
3. Click "Save".
