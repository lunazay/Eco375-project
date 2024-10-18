// Calculate the average test score in this sample of districts (⁠🔢⁠→⁠avg_test_score⁠). Calculate the average students per teacher in this sample (⁠🔢⁠→⁠avg_student_teacher_ratio⁠).

// How many points higher is the test score in the 90th percentile relative to districts in the 10th percentile (⁠🔢⁠→⁠gap_test_score⁠)? What about the student teacher ratio 90th percentile, relative to districts in the 10th percentile? (⁠🔢⁠→⁠gap_student_teacher_ratio⁠)?

// Using an OLS linear regression, estimate the increase in test score associated with one more student-per-teacher (⁠🔢⁠→⁠ols_slope⁠). What is the estimated constant in the model? (⁠🔢⁠→⁠ols_constant⁠).

use data/raw/caschool.dta, clear

summarize testscr, meanonly

scalar avg_test_scr = r(mean)

gen avg_test_score = avg_test_scr


summarize str, meanonly

scalar avg_str = r(mean)

gen avg_student_teacher_ratio = avg_str


centile testscr, centile(90)

scalar test_score_1 = r(c_1)

gen test_score_1_var = test_score_1

centile testscr, centile(10)

scalar test_score_2 = r(c_1)

gen test_score_2_var = test_score_2

scalar gap_test_scr = test_score_1_var - test_score_2_var

gen gap_test_score = gap_test_scr


////////

centile str, centile(90)

scalar student_ratio_1 = r(c_1)

gen student_ratio_1_var = student_ratio_1

centile str, centile(10)

scalar student_ratio_2 = r(c_1)

gen student_ratio_2_var = student_ratio_2

scalar gap_student_teacher_rat = student_ratio_1_var - student_ratio_2_var


gen gap_student_teacher_ratio = gap_student_teacher_rat

regress testscr str

scalar ols_slope = _b[str]

scalar ols_constant = _b[_cons]


setroot

yamlout using "${root}/results/module2.yaml", key(avg_test_score) value(`=avg_test_score') replace
yamlout using "${root}/results/module2.yaml", key(avg_student_teacher_ratio) value(`=avg_student_teacher_ratio') 
yamlout using "${root}/results/module2.yaml", key(gap_test_score) value(`=gap_test_score') 
yamlout using "${root}/results/module2.yaml", key(gap_student_teacher_ratio) value(`=gap_student_teacher_ratio') 
yamlout using "${root}/results/module2.yaml", key(ols_slope) value(`=ols_slope') 
yamlout using "${root}/results/module2.yaml", key(ols_constant) value(`=ols_constant') 

// The expected outcome
// avg_test_score: 123
// avg_student_teacher_ratio: 456
// gap_test_score: 7.89
// gap_student_teacher_ratio: 5.67
// ols_slope: 0.123
// ols_constant: 0.456
