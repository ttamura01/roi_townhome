library(tidyverse)
library(scales)
library(patchwork)

home_df <- read_csv("home_data.csv")

a <- home_df %>% 
  ggplot(aes(x = yield)) +
  geom_histogram(bins = 7) +
  labs(x = "NOI Yield(%)",
       y = "count by NOI Yield") +
  scale_x_continuous(breaks = seq(3, 7.5, 1),
                     labels = label_comma(accuracy = 0.01) ) +
  theme_classic()
  

b <- home_df %>% 
  ggplot(aes(x = yield)) +
  geom_density() +
  labs(x = "NOI Yield(%)",
       y = "Percentage by NOI Yield") +
  scale_x_continuous(breaks = seq(3, 7.5, 1),
                     labels = label_comma(accuracy = 0.01) ) +
  scale_y_continuous(labels = scales::percent_format(accuracy = 1))

a + b
