#' @title Coin Tossing Simulation: LLN & CLT
#' @description This script demonstrates the Law of Large Numbers (LLN)
#' and the Central Limit Theorem (CLT) using coin tosses.

library(ggplot2)
library(dplyr)

# 1. Law of Large Numbers (LLN) ----
set.seed(123)
n_flips <- 5000
flips <- sample(c(0, 1), n_flips, replace = TRUE) # 1 = Heads
cumulative_heads <- cumsum(flips)
proportions <- cumulative_heads / (1:n_flips)

lln_df <- data.frame(
  trial = 1:n_flips,
  proportion = proportions
)

ggplot(lln_df, aes(x = trial, y = proportion)) +
  geom_line(color = "#fbbf24") +
  geom_hline(yintercept = 0.5, linetype = "dashed", color = "white") +
  scale_x_log10() +
  labs(
    title = "Law of Large Numbers (LLN)",
    subtitle = "Proportion of Heads converges to 0.5",
    x = "Number of trials (log scale)",
    y = "Proportion of Heads"
  ) +
  theme_dark()

# 2. Central Limit Theorem (CLT) ----
# We conduct 1000 sessions, each with 100 tosses
n_sessions <- 1000
n_per_session <- 100

session_heads <- replicate(n_sessions, {
  sum(sample(c(0, 1), n_per_session, replace = TRUE))
})

clt_df <- data.frame(heads = session_heads)

ggplot(clt_df, aes(x = heads)) +
  geom_histogram(bins = 20, fill = "#38bdf8", color = "white", alpha = 0.7) +
  geom_vline(xintercept = 50, linetype = "dashed", color = "red") +
  labs(
    title = "Central Limit Theorem (CLT)",
    subtitle = "Distribution of heads in 1000 sessions (100 tosses each)",
    x = "Number of Heads",
    y = "Frequency"
  ) +
  theme_minimal()
