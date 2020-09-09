SELECT *
FROM winequality_red;

--Adds together fixed_acidity, volatile_acidity, and citric_acid
SELECT (fixed_acidity + volatile_acidity + citric_acid) AS acidity
FROM winequality_red;

--Subtract free_sulfur_dioxide from total_sulfur_dioxide and then divide the result by total_sulfur_dioxide.
SELECT ((total_sulfur_dioxide - free_sulfur_dioxide) / total_sulfur_dioxide) AS tot_minus_free_divided_tot_sulfur
FROM winequality_red;

--Multiply residual_sugar by alcohol, raise the result to the 4th power, and then take the log (base 10) of that.
SELECT (log((residual_sugar * alcohol)^4))
FROM winequality_red;

--Round chlorides to two decimal places, multiply by total_sulfur_dioxide, and then obtain the cube root of that.
SELECT (((ROUND(chlorides::DECIMAL,2)) * total_sulfur_dioxide)^1/3)
FROM winequality_red;

--All added together into one table 
SELECT (fixed_acidity + volatile_acidity + citric_acid) AS acidity, 
       ((total_sulfur_dioxide - free_sulfur_dioxide) / total_sulfur_dioxide) AS tot_minus_free_divided_tot_sulfur,
	   (log((residual_sugar * alcohol)^4)),
	   (((ROUND(chlorides::DECIMAL,2)) * total_sulfur_dioxide)^1/3)
FROM winequality_red;

SELECT "pH"
FROM winequality_red;
--Using what you have learned about mathematical operations in SQL, come up with your own quality score (a number between 1 and 10) for each wine in the table.
