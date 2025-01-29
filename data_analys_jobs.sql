--Q1
--How many rows are in the data_analyst_jobs table?

SELECT COUNT(*)
FROM data_analyst_jobs;
--1973

--Q2
--Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row? ExxonMobil

SELECT *
FROM data_analyst_jobs
LIMIT 10;
--ExxonMobil

--Q3
--How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT(*) AS count_tn
FROM data_analyst_jobs
WHERE location = 'TN';
--21 

SELECT COUNT(*) AS count_tn_or_ky
FROM data_analyst_jobs
WHERE location = 'TN'or location = 'KY';
--27

--Q4
--How many postings in Tennessee have a star rating above 4?
SELECT COUNT(*)AS count_tn_rating_above_4
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;
--3

--Q5
--How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(*) AS review_count_between_500_and_1000
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--151

--Q6
--Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT 
location AS state,
ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT null AND star_rating IS NOT null
GROUP BY data_analyst_jobs.location
ORDER BY avg_rating DESC;
--Nebraska

--Q7
--Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT DISTINCT title
FROM data_analyst_jobs;

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;
--881

--Q8
--How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';
--230

--Q9
--Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT DISTINCT company, star_rating
FROM data_analyst_jobs
WHERE review_count >5000 AND company IS NOT null;
--40

--Q10
--Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT DISTINCT company, star_rating
FROM data_analyst_jobs
WHERE review_count >5000 AND company IS NOT null
ORDER BY star_rating DESC;
--American Express, 4.2

--Q11
--Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT DISTINCT *
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--1600

--Q12
SELECT DISTINCT *
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';
--4, data

--Bonus
--You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
SELECT domain AS industry,
COUNT(title) AS count_jobs
FROM data_analyst_jobs
WHERE skill = 'SQL'
AND domain IS NOT null
AND days_since_posting >21
GROUP BY data_analyst_jobs.domain
ORDER BY count_jobs desc;
--