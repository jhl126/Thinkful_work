SELECT *
FROM ksprojects;

--How many distinct values are there in the "country" field?
SELECT COUNT(DISTINCT country)
FROM ksprojects;

--Write a query that returns the average number of backers per main_category, rounded to the nearest whole number and sorted from high to low. What is the numerical value of the first row in the returned dataset?
SELECT main_category, ROUND(AVG(backers),0) AS average_backers_per_cat
FROM ksprojects
GROUP BY main_category
ORDER BY average_backers_per_cat DESC
LIMIT 1;

--Write a query that shows, for each category, how many campaigns were successful and the average difference per project between dollars pledged and the goal for successful campaigns in that category. Which category raised the most (pledged) above and beyond its goal amount?
SELECT category, COUNT (*), AVG(usd_pledged - goal) AS rate_of_success
FROM ksprojects
WHERE state = 'successful'
GROUP BY category
ORDER BY rate_of_success DESC
LIMIT 3;

--Write a query that shows, for each main_category, how many successful projects had between 5 and 10 backers. How many "Publishing" projects meet this criteria? 
SELECT COUNT(*) AS total
FROM ksprojects 
WHERE state = 'successful' AND backers BETWEEN 5 AND 10 AND main_category = 'Publishing';

-- Excluding Games and Technology records in the main_category field, return the total of all backers for successful projects by main_category where the total number of backers was over 100,000.  Sort by main_category from A-Z. How many backers does the first record have?
SELECT main_category, SUM(backers) AS total_backers
FROM ksprojects
WHERE main_category NOT IN ('Games','Technology') AND state = 'successful'
GROUP BY main_category
HAVING SUM(backers) > 100000
ORDER BY main_category ASC;
