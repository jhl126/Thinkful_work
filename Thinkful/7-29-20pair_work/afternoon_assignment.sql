--Count the number of records in the vehicles table.
SELECT COUNT(*)
FROM vehicles;
SELECT *
FROM vehicles;
--Count the number of distinct values there are in the make field.
SELECT COUNT(DISTINCT(make))
FROM vehicles;
--Obtain the averages of the hwy and cty fields.
SELECT ROUND(AVG(hwy),2) AS hwy_avg,
       ROUND(AVG(cty),2) AS cty_avg
FROM vehicles;
--Group by make and model, obtain the averages of the hwy and cty fields.
SELECT make,
       model,
       ROUND(AVG(hwy),2) AS hwy_avg,
       ROUND(AVG(cty),2) AS cty_avg
FROM vehicles
GROUP BY make, model;
--Group the data by make, average the hwy and cty columns into a combined_mpg field, calculate the average of that field, and then sort descending by the combined_mpg field.
SELECT COUNT(*),
       make,
	   ROUND(AVG((hwy + cty)/2),2) AS combined_mpg
FROM vehicles
GROUP BY make
ORDER BY combined_mpg DESC;
--Count the number of records and the average of the cty field, grouping by trans and drive. Filter out records that have cyl > 4 and displ > 2.5 from going into the aggregation and then filter the results to show only where the average cty value is > 18.
SELECT COUNT(cty),
       ROUND(AVG(cty),2) AS cty_avg,
	   trans,
	   drive
FROM vehicles
WHERE cyl > 4 AND displ > 2.5
GROUP BY trans, drive
HAVING AVG(cty) > 18;