# Assocs: A Rules Mining Tool

## Overview

**Assocs** is a rules mining tool developed using the R programming language. It is designed to mine associations from transaction data, providing both a rules mining window and a graphing window. The methodologies for rules mining and graphing are based on the works by Hahsler et al. (2006) and Hahsler et al. (2016).

## Table of Contents

- [Installation](#installation)
- [Launching the App](#launching-the-app)
- [Using Assocs](#using-assocs)
  - [Mining Rules](#mining-rules)
  - [Graphing Rules](#graphing-rules)
- [Appendix](#appendix)
- [References](#references)

## Installation

1. **Download app.rar**
   - Download the `app.rar` file from the provided link and save it to a specific location.
   - Extract the folder to your preferred location.

2. **Launch the Installer**
   - The installer file is located in the `RInno_installer` folder.
   - Launch the installer and continue installing with the default settings.
   - Specify the location where you want to install the app when prompted.
   - Ignore any errors that appear (click OK).

3. **Finish Installation**
   - Once the installation is complete, the app will launch for the first time.

## Launching the App

After installation, the icon for the app will appear among the Windows applications.

1. **Launch the App**
   - Click the app icon to launch it. The app opens with two tabs: Rules and Graphing.

## Using Assocs

### Mining Rules

1. **Data Upload**
   - **Browse:** Click “Browse” to select a file with data (either CSV or Excel). CSV is recommended for faster processing.
   - **Header:** Specify whether the first row contains variable names (default is TRUE).
   - **File Type:** Specify the file format (default is CSV).

2. **Rules Input**
   - **Min Support:** Set the minimum support value (default is 0).
   - **Min Confidence:** Set the minimum confidence value (default is 0).
   - **Min Length:** Specify the minimum length of item sets (default is 2).
   - **Max Length:** Specify the maximum length of item sets (default is 2).
   - **Exclude Zero Counts:** Check this to exclude rules with zero counts (default is checked).
   - **Mine Rules:** Click to mine the rules.

3. **Download Rules**
   - Click the download button to save the mined rules as a CSV file.

### Graphing Rules

1. **Graph Type**
   - Choose the type of graph you want to produce.

2. **Measures**
   - Specify the measure of interestingness to be graphed (default is lift).

3. **Shading**
   - Specify the interest measure represented by the color intensity (default is support).

4. **Generate Graph**
   - Click the "Go" button to generate the graph.

5. **Download Graph**
   - Click to download the graph as a PNG file.

## Appendix

### How to Save CSV from Excel

1. Click `Save As`.
2. Select the file type as CSV (comma delimited).
3. Save the file.

## References

- Hahsler M. & Karpienko R. (2016). Visualizing association rules in hierarchical groups. *Journal of Business Economics*, 87(3), 317–335. doi: 10.1007/s11573-016-0822-8
- Hahsler M. (2017). arulesViz: Interactive Visualization of Association Rules with R. *The R Journal*, 9(2), 163. doi: 10.32614/rj-2017-047
