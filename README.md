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
## 📊 Results

The analysis shows that a small number of publishers dominate the Steam platform in terms of game releases.

Among the top 10 publishers, companies like Valve appear frequently due to their large game portfolios.

For each publisher, the most popular game was identified using total recommendations as a popularity metric.

Notably:
- Popular games tend to have significantly higher recommendation counts compared to others
- Some publishers rely heavily on a few highly successful titles
- There is a clear imbalance between top publishers and smaller ones

The visualization below summarizes these findings:
<img width="1323" height="929" alt="cffd515e-121b-4514-9396-c7454d37a5da" src="https://github.com/user-attachments/assets/b8f76fb2-b43f-4fbe-9c7a-b47c373ea887" />

## Run
```r
install.packages(c("DBI","duckdb","tidyverse"))
source("steam_analysis.R")

