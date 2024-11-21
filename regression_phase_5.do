// Define a variable ${root} which points to the root folder of the repository
setroot

// Erase the existing YAML results file (if it exists)
capture erase "${root}/results/phase2.yaml"

// Load the dataset from the root directory
use "${root}/data/raw/complete_regression_dataset.dta", clear

// Drop the first row which contains the variable names
drop in 1

// renaming the varibles to run regressions
rename B Crypt
rename C Edu_score
rename D OECD_dum

destring Crypt Edu_score OECD_dum, replace

// Save a scatterplot of Y on X
scatter Crypt Edu_score, ytitle("Cryptocurrency Index") xtitle("Education Index")
graph export "${root}/results/scatter.pdf"

// Run an OLS regression of Y on X (replace 'testser' and 'str' with your actual variables)
reg Crypt Edu_score, robust
reg Crypt Edu_score, robust coeflegend

// Display the number of observations
display _N

// Display the slope coefficient for Edu_score
display _b[Edu_score]

// Display the standard error of the slope coefficient for Edu_score
display _se[Edu_score]

// Output the regression results to a YAML file, more explicitly
yamlout using "${root}/results/phase2.yaml", key(ols_num_obs) value('=N') replace
yamlout using "${root}/results/phase2.yaml", key(ols_slope) value('=b[Edu_score]')
yamlout using "${root}/results/phase2.yaml", key(ols_slope_se) value('=se[Edu_score]')
