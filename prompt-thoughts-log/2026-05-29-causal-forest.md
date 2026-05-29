# 2026-05-29 Causal Forest Lab

## Task

Create a visual teaching webpage for causal forests with intuition, supporting charts, a simulated dataset case, and practical code.

## Implementation Notes

- Added `labs/causal-forest/causal_forest_dashboard.html` as a standalone HTML lab.
- Used a job-training example to explain heterogeneous treatment effects and CATE.
- Added native canvas charts for a causal tree, individual-level heterogeneity, and grouped CATE comparisons.
- Included simulated data rows and Python code using `econml.dml.CausalForestDML`.
- Updated the root landing page and README catalog.

## Validation

The page is designed to run without external dependencies or a build step. Browser validation should check that the three canvases render, the table fills, the noise slider updates, and no console errors are emitted.
