library(DBI)
library(duckdb)
library(tidyverse)

# connect
con <- dbConnect(duckdb(), dbdir = "steam_data.duckdb")

# read table
steam_data <- dbReadTable(con, "STEAM_APPDETAILS")

# ---- TOP 10 PUBLISHERS ----
top_publishers <- steam_data %>%
  filter(!is.na(publishers)) %>%
  count(publishers, sort = TRUE) %>%
  slice_head(n = 10)

# ---- MOST POPULAR GAME ----
top_games <- steam_data %>%
  filter(!is.na(publishers)) %>%
  group_by(publishers) %>%
  slice_max(total_recommendations, n = 1, with_ties = FALSE) %>%
  ungroup()

# ---- MERGE ----
final_data <- top_games %>%
  filter(publishers %in% top_publishers$publishers)

# ---- PLOT ----
ggplot(final_data, aes(
  x = reorder(publishers, total_recommendations),
  y = total_recommendations
)) +
  geom_col(fill = "#4C78A8") +
  
  # Add game name labels
  geom_text(
    aes(label = name),   # <-- game title column
    hjust = -0.1,
    size = 3.5
  ) +
  
  coord_flip() +
  
  labs(
    title = "Top 10 Publishers & Their Most Popular Game",
    subtitle = "Game shown is the highest recommended per publisher",
    x = "Publisher",
    y = "Total Recommendations",
    caption = "Source: Steam dataset"
  ) +
  
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "gray40"),
    axis.text.y = element_text(size = 10)
  ) +
  
  # Add some space so text isn't cut
  expand_limits(y = max(final_data$total_recommendations) * 1.15)
# disconnect
dbDisconnect(con, shutdown = TRUE)
