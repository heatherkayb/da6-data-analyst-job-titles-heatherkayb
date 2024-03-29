-- 1. How many rows are in the data_analyst_jobs table? = 1793
SELECT COUNT(*) FROM data_analyst_jobs;

-- 2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row? = ExxonMobil
SELECT * 
FROM data_analyst_jobs
LIMIT 10;

-- 3. How many postings are in Tennessee? =21 
SELECT COUNT(*) 
FROM data_analyst_jobs
WHERE location = 'TN';
-- How many are there in either Tennessee or Kentucky? =27
SELECT COUNT(*) 
FROM data_analyst_jobs
WHERE (location = 'TN' OR location= 'KY');

-- 4. How many postings in Tennessee have a star rating above 4? =4
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating >= 4; 

-- 5. How many postings in the dataset have a review count between 500 and 1000? = 151
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count 
BETWEEN 500 AND 1000

-- 6. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating? = NE with 4.199
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY state
ORDER BY avg_rating DESC;

-- 7. Select unique job titles from the data_analyst_jobs table. How many are there? =881
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

-- 8. How many unique job titles are there for California companies? = 230
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

-- 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company; 
-- How many companies are there with more that 5000 reviews across all locations? = 40
SELECT COUNT(DISTINCT company)
FROM data_analyst_jobs
WHERE review_count > 5000; 

-- 10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? = General Motors 
-- What is that rating? = 4.1999
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_rating DESC;

-- 11. Find all the job titles that contain the word ‘Analyst’. 
SELECT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%'
OR title LIKE '%analyst%'
OR title LIKE '%ANALYST%';
-- How many different job titles are there? = 1669
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%'
OR title LIKE '%analyst%'
OR title LIKE '%ANALYST%';

-- 12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? = 4
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analy%';
-- What word do these positions have in common? = Tableau
SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analy%';

-- BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
SELECT COUNT(title), domain AS industry
FROM data_analyst_jobs
WHERE title LIKE '%SQL%'
AND days_since_posting > 21
GROUP BY industry; 