// Define a variable ${root} which points to the root folder of the repository
local root "/workspaces/Eco375-project"

// Erase the existing YAML results file (if it exists)
capture erase "${root}/results/phase2.yaml"

// Load the dataset from the root directory
use "${root}/complete_regression_dataset.dta", clear

// Drop the first row which contains the variable names
drop in 1

// renaming the varibles to run regressions
rename B Crypt
rename C Edu_score
rename D OECD_dum

destring Crypt Edu_score OECD_dum, replace

// Save a scatterplot of Y on X
twoway scatter C Edu_score, title("Scatterplot of Cryptocurrency Adoption on Education Score")

// Run an OLS regression of Y on X (replace 'testser' and 'str' with your actual variables)
reg C Edu_score, robust

// Display the number of observations
display _N

// Display the slope coefficient for Edu_score
display _b[Edu_score]

// Display the standard error of the slope coefficient for Edu_score
display _se[Edu_score]

// Output the regression results to a YAML file
yamlout using "${root}/results/phase2.yaml"

// Ensuring the paths are correctly used for keys
key(ols num obs) value('= N')
key(ols slope) value('= b[Edu_score]')
key(ols slope se) value('= se[Edu_score]')