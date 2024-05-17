# Assignment #7 Repository

This repository includes the simulated data for Assignment #7. Fork this repository and add your analysis as described in the canvas assignment.

The csv file for `cohort` in the `raw-data` folder includes 5,000 observations with variables `smoke`, `female`, `age`, `cardiac`, and `cost`. Below, I detail the new additions to the repo, and briefly discuss analysis results. 

### `analysis`

In `analysis/code`, you'll find [`simulated_analysis.R`](https://github.com/NoahB-G/Assignment7/tree/main/analysis/code). This `.R` script satisfies the requirements of the assignment - generating `summary_stats_table.tex` and `coefficient_plot.pdf`. Both of these outputs are saved to `analysis/output`. 

### `paper_production` 

To combine the two exhibits into one PDF, you must compile [`main.tex`](https://github.com/NoahB-G/Assignment7/tree/main/paper_production/main.tex) which generates `main.pdf`. Copies of `summary_stats_table.tex` and `coefficient_plot.pdf` have been placed in `paper_production/` for compilation. 

 ### Brief summary of findings

Examining `main.pdf`, the table shows that roughly 10% of the sample smokes, 48% are female and 3.8% have had a cardiac-related diagnosis over the prior year (I made assumptions about what the variables measure). The average age in the sample is 41, and the average cost is $9,672. Running a simple multivariate regression, with `cost` on the LHS, and all other variables on the RHS, we find that all covariates are significantly associated with `cost`. If taken literally, one might conclude that for each additional year of life, medical costs increase by $18 (holding the other variables constant). We should, however, be cautious of this interpretation, as there are likely omitted variables that are correlated with both `cost` and the regressors (e.g., health insurance status, other diagnoses). 
