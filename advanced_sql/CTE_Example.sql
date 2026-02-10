-- "WITH" used to define CTE at the beginning of a query.
-- it is a defined query that can be referenced in the main query or other CTEs.
/*
Find the companies that have the most job openings.
- Get the total number of job postings per company_id
- Return the total number of jobs with the company name.
*/
WITH company_job_count AS (
SELECT
        company_id,
        COUNT(*) AS num_of_jobs
FROM
        job_postings_fact
GROUP BY
        company_id
)

SELECT
        company_dim.name,
        company_job_count.num_of_jobs
FROM
        company_dim
LEFT JOIN company_job_count ON
        company_job_count.company_id = company_dim.company_id
ORDER BY
        num_of_jobs DESC;
