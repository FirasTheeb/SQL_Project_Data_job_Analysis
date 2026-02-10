/*
lable new column as follows:
- 'Anywhere' jobs as 'Remote'
- '%Germany' as local
- Otherwise 'Onsite'
- Then looking for only 'Data Analyst' jobs and 
how many jobs I can apply to? Using COUNT.

*/

SELECT
    COUNT(job_title_short) AS num_of_jobs,
CASE
    WHEN job_location ='Anywhere' THEN 'Remote'
    WHEN job_location LIKE '%Germany' THEN 'Local'
    ELSE 'Onsite'
END AS location_category
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY 
    location_category;
