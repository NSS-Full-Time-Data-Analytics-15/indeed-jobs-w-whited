--1.

SELECT COUNT(*)
FROM data_analyst_jobs;

--2.

SELECT *
FROM data_analyst_jobs
LIMIT 10;
--ExxonMobil

--3.

SELECT COUNT(*) 
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT COUNT(*) 
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';

--4.

SELECT count(*)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

--5.

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--6.

SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL AND star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating desc
LIMIT 1;

--7.

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

--8.

SELECT count(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--9.

SELECT COUNT(DISTINCT company)
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL;

--10.

SELECT company, ROUND(AVG(star_rating),2) avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating DESC
LIMIT 1;

--11.

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';

--12.

SELECT *
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%' AND title NOT ILIKE '%analytics%';

--BONUS.

SELECT domain, COUNT(*) AS num_hard_to_fill
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' AND days_since_posting > 21 AND domain IS NOT NULL
GROUP BY domain
ORDER BY num_hard_to_fill DESC
LIMIT 4;




