// Define a variable ${root} which points to the root folder of the repository
setroot

// Erase the existing YAML results file (if it exists)
capture erase "${root}/results/phase2.yaml"

// Load the dataset from the root directory
use "${root}/data/raw/complete_regression_dataset.dta", clear

// destringing varibales to run a proper regression
destring GDPCAP, replace force
destring lnGDPCAP, replace force

// Run an OLS regression of Y on X (replace 'testser' and 'str' with your actual variables)
reg C GOVEFF lnEdu_score lnGDPCAP corruption rq PVestimate, robust
