--1. Write a query that allows you to inspect the schema of the naep table.
SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'naep';

--2. Write a query that returns the first 50 records of the naep table.
SELECT *
FROM naep
LIMIT 50;

--3. Write a query that returns summary statistics for avg_math_4_score by state. 
--Make sure to sort the results alphabetically by state name.
SELECT state, COUNT(avg_math_4_score) AS total_amount,
       AVG(avg_math_4_score) AS average_score,
       MIN(avg_math_4_score) AS min_score,
       MAX(avg_math_4_score) AS max_score
FROM naep
GROUP BY state
ORDER BY state ASC;

--4. Write a query that alters the previous query so that it returns only the summary statistics for avg_math_4_score by state 
--with differences in max and min values that are greater than 30.
SELECT state,
       MAX(avg_math_4_score) AS max_score,
       MIN(avg_math_4_score) AS min_score,
	   (MAX(avg_math_4_score) - MIN(avg_math_4_score)) AS math_score_diff
FROM naep
GROUP BY state
HAVING (MAX(avg_math_4_score) - MIN(avg_math_4_score)) > 30
ORDER BY math_score_diff DESC;

--5. Write a query that returns a field called bottom_10_states. This field should list the states in the bottom 10 for 
--avg_math_4_score in the year 2000.
SELECT state AS bottom_10_states,
       avg_math_4_score AS avg_math_4_score_yr_2000
FROM naep
WHERE year = 2000 AND avg_math_4_score IS NOT NULL
ORDER BY avg_math_4_score ASC
LIMIT 10;

--6. Write a query that calculates the average avg_math_4_score, rounded to the nearest two decimal places, over all states 
--in the year 2000.
SELECT ROUND(AVG(avg_math_4_score),2) AS rounded_average_math_score
FROM naep
WHERE year = 2000;

--7. Write a query that returns a field called below_average_states_y2000. This field should list all states with an 
--avg_math_4_score less than the average over all states in the year 2000.
SELECT avg_math_4_score,
	CASE
		WHEN avg_math_4_score <
			(SELECT AVG(avg_math_4_score)
			 FROM naep
			 WHERE year = 2000)
		THEN 'below_avg'
		ELSE 'above_avg'
	END state_below_avg
FROM naep
WHERE year = 2000 AND 
	  avg_math_4_score <
			(SELECT AVG(avg_math_4_score)
			 FROM naep
			 WHERE year = 2000)
ORDER BY avg_math_4_score;

--8. Write a query that returns a field called scores_missing_y2000 that lists any states with missing values in the 
--avg_math_4_score column of the naep table for the year 2000.
SELECT state,
	CASE
		WHEN avg_math_4_score IS NULL
		THEN 'Is_Null'
		ELSE 'Is_Not_Null'
	END scores_missing_y2000
FROM naep
WHERE year = 2000
ORDER BY scores_missing_y2000;

--9. Write a query that returns, for the year 2000, the state, avg_math_4_score, and total_expenditure from the naep table, 
--joined using the LEFT OUTER JOIN clause with the finance table. Use id as the key and order the output by total_expenditure 
--from greatest to least. Make sure to round avg_math_4_score to the nearest two decimal places, and then filter out NULL values 
--in avg_math_4_scores in order to see any correlation more clearly.
SELECT naep.state, ROUND(avg_math_4_score,2), total_expenditure
FROM naep
LEFT OUTER JOIN finance
ON naep.id = finance.id
WHERE naep.year = 2000 AND avg_math_4_score IS NOT NULL
ORDER BY total_expenditure DESC;
