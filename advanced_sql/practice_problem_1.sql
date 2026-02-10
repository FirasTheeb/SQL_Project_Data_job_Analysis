/*
Practice Problem 1

I want to categorize the salaries from each job posting. To see if it fits in my desired salary range.
- Put salary into different buckets
- Define what's a high, standard, or low salary with our own conditions
- Why? It is easy to determine which job postings are worth looking at based on salary.
Bucketing is a common practice in data analysis when viewing categories.
- I only want to look at data analyst roles
- Order from highest to lowest
*/

SELECT
    COUNT (job_id) AS num_of_jobs,
    CASE
        WHEN salary_year_avg < 70000 THEN 'Low'
        WHEN salary_year_avg >= 70000 AND salary_year_avg <= 120000 THEN 'Standard'
        ELSE 'High'
    END salary_bucket
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    salary_bucket
ORDER BY
    num_of_jobs DESC;
