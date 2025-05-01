--1.
SELECT COUNT(*) 
FROM data_analyst_jobs;

--2.
SELECT *
FROM data_analyst_jobs
limit 10;
-- ExxonMobil

--3.
SELECT COUNT(*) as TN_count
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT COUNT(*) as TN_KY_count
FROM data_analyst_jobs
WHERE location = 'TN' or location = 'KY';

--4.
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

--5.
SELECT count(*)
FROM data_analyst_jobs
WHERE review_count between 500 AND 1000;

--6.
SELECT location AS state, ROUND(avg(star_rating), 2) AS avg_rating
FROM data_analyst_jobs
WHERE LOCATION IS NOT NULL AND star_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC;

--7.
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

--8.
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--9.
SELECT company, ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company;

--10.
SELECT company, AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company
ORDER BY avg_star_rating DESC;

--11.
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
where title ILIKE '%Analyst%';

--12.
SELECT *
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%' AND title NOT ILIKE '%analytics%';

--BONUS
SELECT domain, COUNT(*) AS job_count
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' AND days_since_posting > 21 AND domain IS NOT NULL
GROUP BY domain
ORDER BY job_count DESC