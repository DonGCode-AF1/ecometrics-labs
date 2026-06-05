# 2026-05-29 Neyman Orthogonality DML Lab

## Task

Convert the local Neyman orthogonality and DML learning webpage into a cleaner econometrics lab and place it under `labs/neyman-orthogonality-dml/`.

## Implementation Notes

- Kept the project as a standalone HTML file so it can run directly through RawGithack without a build step.
- Added native canvas charts for the confounding picture, naive regression, and orthogonal residual regression.
- Added a first-stage noise control and re-simulation button to make the Neyman orthogonality intuition visible.
- Updated the root landing page and lab catalog so the project appears with the other econometrics labs.

## Validation

Served the repository locally and opened the lab page in the browser. The page loaded without console errors, rendered four canvases, and the re-simulation button updated the displayed estimates.
