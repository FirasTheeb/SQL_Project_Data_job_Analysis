/*
Question: What are the top-paying
data analyst jobs?
- Identify the top highest-paying Data Analyst roles that are available in my region.
- Focuses on job postings with specified salaries (remove nulls).
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date::DATE,
    salary_year_avg,
    company_dim.name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    (job_location LIKE '%Hungary%' OR job_location LIKE '%Germany') AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;