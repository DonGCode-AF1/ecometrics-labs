#' @title OLS Properties Monte Carlo Validation
#' @description This script validates the Unbiasedness and Consistency 
#' of the Ordinary Least Squares (OLS) estimator.

library(ggplot2)
library(dplyr)
library(tidyr)

# 1. Settings ----
set.seed(42)
true_beta0 <- 1
true_beta1 <- 2
sigma <- 1.5
n_sims <- 1000

# 2. Simulation Function ----
# We vary N to demonstrate consistency
simulate_ols <- function(N) {
  results <- replicate(n_sims, {
    x <- runif(N, 0, 10)
    eps <- rnorm(N, mean = 0, sd = sigma)
    y <- true_beta0 + true_beta1 * x + eps
    
    model <- lm(y ~ x)
    return(coef(model)["x"])
  })
  return(data.frame(beta1_hat = results, N = factor(N)))
}

# 3. Running Simulations for different N ----
cat("Running simulations for N = 30, 100, 500...\n")
df_small  <- simulate_ols(30)
df_medium <- simulate_ols(100)
df_large  <- simulate_ols(500)

all_results <- rbind(df_small, df_medium, df_large)

# 4. Statistical Summary ----
summary_stats <- all_results %>%
  group_by(N) %>%
  summarize(
    mean_estimate = mean(beta1_hat),
    bias = mean_estimate - true_beta1,
    variance = var(beta1_hat)
  )

print("--- OLS Properties Summary ---")
print(summary_stats)

# 5. Visualization: Consistency ----
# As N increases, the distribution centers on 2.0 and gets narrower.
ggplot(all_results, aes(x = beta1_hat, fill = N)) +
  geom_density(alpha = 0.4) +
  geom_vline(xintercept = true_beta1, linetype = "dashed", color = "red", size = 1) +
  labs(
    title = "OLS Consistency: Variance Shrinks as N Increases",
    subtitle = paste0("True Beta1 = ", true_beta1, ". Distribution gets sharper around the true value."),
    x = "Estimated Beta1",
    y = "Density"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1")

# Theoretical Insight:
# 1. Unbiasedness: Look at 'bias' in summary_stats. It should be very close to 0 for all N.
# 2. Consistency: Look at 'variance'. It should decrease as N increases.
