# Neyman Orthogonality and Double Machine Learning

This lab is a standalone HTML teaching project for understanding Neyman orthogonality and Double Machine Learning in an econometrics workflow.

Open the dashboard directly:

- Local file: `neyman_dml_dashboard.html`
- Web preview: https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/labs/neyman-orthogonality-dml/neyman_dml_dashboard.html

## Learning Goal

The page uses a simple "training affects wages" example to show why naive regression can be biased when treatment assignment is correlated with background variables, and why DML first removes the predictable parts of both treatment and outcome before estimating the target causal effect.

## Interactions

- Adjust first-stage prediction noise.
- Re-run the simulated sample.
- Compare naive OLS with orthogonalized residual regression.
- Inspect the minimal Python implementation behind the idea.
