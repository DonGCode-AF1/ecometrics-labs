# DML Cross-Fitting

This lab explains cross-fitting in Double Machine Learning with a 12-observation, 3-fold teaching sample.

Open the dashboard directly:

- Local file: `dml_cross_fitting_dashboard.html`
- Web preview: https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/labs/dml-cross-fitting/dml_cross_fitting_dashboard.html

## Learning Goal

The page shows why each observation should be predicted by a first-stage model that did not train on that same observation. It connects fold assignment, out-of-fold prediction, residual construction, and the final residual-on-residual estimate of the causal parameter.

## Relation to the Neyman Orthogonality Lab

The Neyman orthogonality lab explains why the residualized moment is robust to first-stage noise. This lab explains how DML obtains those residuals in practice through cross-fitting.
