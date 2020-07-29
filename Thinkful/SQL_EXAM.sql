--Write a query that allows you to inspect the schema of the naep table.
SELECT...

--Write a query that returns the first 50 records of the naep table.
SELECT *
FROM naep
LIMIT 50;

--Write a query that returns summary statistics for avg_math_4_score by state. Make sure to sort the results alphabetically by state name.

SELECT state, COUNT(avg_math_4_score) AS total_amount,
       AVG(avg_math_4_score) AS average_score,
       MIN(avg_math_4_score) AS min_score,
       MAX(avg_math_4_score) AS max_score
FROM naep
GROUP BY state
ORDER BY state ASC;

--Write a query that returns a field called bottom_10_states. This field should list the states in the bottom 10 for avg_math_4_score in the year 2000.


