# Steam Data Analysis with R & DuckDB

This project analyzes Steam game data to identify the top 10 publishers and their most popular games.

## Objective
- Find top 10 publishers by number of games
- Select the most popular game for each publisher
- Visualize results

## Tech Stack
R, DuckDB, tidyverse (dplyr, ggplot2)

## Dataset
Download:
https://nextcloud.th-deg.de/s/9GMti9tBYGEBEBp/download

## Run
```r
install.packages(c("DBI","duckdb","tidyverse"))
source("steam_analysis.R")
