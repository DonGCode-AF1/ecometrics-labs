#' @title Monte Carlo Simulation: Omitted Variable Bias (OVB)
#' @description This script demonstrates how omitting a relevant variable 
#' leads to bias in the estimated coefficients.

library(ggplot2)
library(dplyr)
library(tidyr)

# 1. Parameter Settings ----
set.seed(123)
n_obs <- 100        # Sample size
n_sims <- 1000      # Number of simulations
beta1 <- 1.0        # True coefficient of X1
beta2 <- 1.0        # True coefficient of X2
rho <- 0.5          # Correlation between X1 and X2

# 2. Simulation Function ----
run_single_sim <- function(n, rho, beta1, beta2) {
  # Generate X1 and X2 with correlation rho
  # X1 ~ N(0, 1)
  # X2 = rho*X1 + sqrt(1-rho^2)*Z, where Z ~ N(0, 1)
  x1 <- rnorm(n)
  z  <- rnorm(n)
  x2 <- rho * x1 + sqrt(1 - rho^2) * z
  
  # Error term
  eps <- rnorm(n, sd = 0.5)
  
  # Data Generating Process
  y <- beta1 * x1 + beta2 * x2 + eps
  
  # Estimation
  # Model 1: Correct (include both X1 and X2)
  m_correct <- lm(y ~ x1 + x2)
  b1_correct <- coef(m_correct)["x1"]
  
  # Model 2: Omitted (only X1)
  m_omitted <- lm(y ~ x1)
  b1_omitted <- coef(m_omitted)["x1"]
  
  return(data.frame(correct = b1_correct, omitted = b1_omitted))
}

# 3. Execution ----
cat("Starting simulations...\n")
results <- replicate(n_sims, run_single_sim(n_obs, rho, beta1, beta2), simplify = FALSE) %>%
  bind_rows()

# 4. Results Analysis ----
summary_stats <- results %>%
  pivot_longer(cols = everything(), names_to = "model", values_to = "beta1_hat") %>%
  group_by(model) %>%
  summarize(
    mean_estimate = mean(beta1_hat),
    bias = mean_estimate - beta1,
    sd = sd(beta1_hat)
  )

print(summary_stats)

# 5. Visualization ----
plot_data <- results %>%
  pivot_longer(cols = everything(), names_to = "model", values_to = "beta1_hat")

ggplot(plot_data, aes(x = beta1_hat, fill = model)) +
  geom_density(alpha = 0.5) +
  geom_vline(xintercept = beta1, linetype = "dashed", color = "black", size = 1) +
  labs(
    title = "Sampling Distribution of beta1",
    subtitle = paste0("True Beta1 = ", beta1, ", rho = ", rho),
    x = "Estimated Beta1",
    y = "Density"
  ) +
  theme_minimal() +
  scale_fill_manual(values = c("correct" = "#4ade80", "omitted" = "#fb7185"))

# Save plot (Optional)
# ggsave("ovb_simulation.png", width = 8, height = 5)
