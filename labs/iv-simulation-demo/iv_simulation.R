#' @title Instrumental Variables (IV) Monte Carlo Simulation
#' @description This script compares OLS and IV (2SLS) estimators 
#' in the presence of endogeneity.

library(ggplot2)
library(AER) # For ivreg
library(dplyr)
library(tidyr)

# 1. Settings ----
set.seed(888)
true_beta <- 1
n_obs <- 500
n_sims <- 1000

# 2. Simulation Logic ----
run_iv_sim <- function(delta = 0.5, gamma = 0.5) {
  # delta: endogeneity strength (X corr with u)
  # gamma: instrument strength (Z corr with X)
  
  results <- replicate(n_sims, {
    u <- rnorm(n_obs)
    z <- rnorm(n_obs)
    e <- rnorm(n_obs, sd = 0.5)
    
    # Endogenous X
    x <- gamma * z + delta * u + e
    y <- true_beta * x + u
    
    # OLS estimation
    m_ols <- lm(y ~ x)
    b_ols <- coef(m_ols)["x"]
    
    # IV (2SLS) estimation
    m_iv <- ivreg(y ~ x | z)
    b_iv <- coef(m_iv)["x"]
    
    return(c(OLS = b_ols, IV = b_iv))
  })
  
  return(as.data.frame(t(results)))
}

# 3. Execution ----
cat("Running IV MC simulations...\n")
results_df <- run_iv_sim(delta = 0.6, gamma = 0.4)

# 4. Summary ----
summary_stats <- results_df %>%
  pivot_longer(cols = everything(), names_to = "Method", values_to = "beta_hat") %>%
  group_by(Method) %>%
  summarize(
    Mean = mean(beta_hat),
    Bias = Mean - true_beta,
    SD = sd(beta_hat)
  )

print(summary_stats)

# 5. Visualization ----
plot_data <- results_df %>%
  pivot_longer(cols = everything(), names_to = "Method", values_to = "beta_hat")

ggplot(plot_data, aes(x = beta_hat, fill = Method)) +
  geom_density(alpha = 0.5) +
  geom_vline(xintercept = true_beta, linetype = "dashed") +
  labs(
    title = "OLS vs IV under Endogeneity",
    subtitle = "OLS is biased; IV is unbiased but has higher variance.",
    x = "Estimated Beta",
    y = "Density"
  ) +
  theme_minimal() +
  scale_fill_manual(values = c("OLS" = "#60a5fa", "IV" = "#f472b6"))
