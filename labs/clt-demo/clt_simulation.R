#' @title Central Limit Theorem (CLT) Simulator
#' @description This script demonstrates that the sum (or mean) of 
#' independent and identically distributed (i.i.d.) random variables 
#' tends toward a normal distribution, regardless of the shape of the 
#' original distribution.

library(ggplot2)
library(patchwork) # For combining plots

# 1. Define Parent Distribution (Exponential - highly skewed)
n_sims <- 2000

run_clt_sim <- function(n_sample) {
  # We take 'n_sample' from exponential distribution and calculate the mean
  # We repeat this 'n_sims' times
  means <- replicate(n_sims, mean(rexp(n_sample, rate = 2)))
  return(data.frame(mean_val = means, n = factor(n_sample)))
}

# 2. Simulate for different n
cat("Simulating CLT convergence...\n")
df1 <- run_clt_sim(1)
df2 <- run_clt_sim(5)
df5 <- run_clt_sim(30)
df10 <- run_clt_sim(100)

combined_df <- rbind(df1, df2, df5, df10)

# 3. Visualization
ggplot(combined_df, aes(x = mean_val, fill = n)) +
  geom_histogram(bins = 40, color = "white", alpha = 0.6) +
  facet_wrap(~n, scales = "free", labeller = label_both) +
  labs(
    title = "Central Limit Theorem in Action",
    subtitle = "Source: Exponential Distribution. As n increases, distribution becomes Normal.",
    x = "Sample Mean",
    y = "Count"
  ) +
  theme_minimal() +
  scale_fill_viridis_d()

# Notice how for n=1, it looks like an exponential curve.
# For n=100, it's a perfect bell curve.
