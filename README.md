# Assignment #7 Repository

This repository includes the simulated data for Assignment #7. Fork this repository and add your analysis as described in the canvas assignment.

The csv file for `cohort` in the `raw-data` folder includes 5,000 observations with variables `smoke`, `female`, `age`, `cardiac`, and `cost`.

# Summary of Results
We can see from the table that approximately 10% of the study individuals smoke, 49% are female, and 4% had some sort of cardiac event previously (based on our assumption about the variable meanings). The average age of individuals is 41.5 with a standard deviation of 13.5 (and very little skewness) and we have coverage of all ages from 18 to 65. The average cost among included individuals is \$9,672 with a standard deviation of \$403. The cost variable also has suprisingly little skewness (likely because we are dealing with a group of individuals who all have at least one visit and so no problem of many people having a cost of \$0). The regression results indicate that cardiac, smoke, age, and female are all significant predictors of cost with the following interpretations:
- Having a previous cardiac complaint is related to an increase in costs of \$289.
- Smokes is related to an increase in costs of \$593.
- Being female is related to an increase in costs of  \$294.
- An increase in a person's age of 1 year is related to an increase of \$18 in costs.

The coefficients for these variables are shown in the figure. The confidence intervals are not visible because the standard error is very small compared to the point estimate.
