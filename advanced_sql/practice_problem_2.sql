/*
Determine the size category ('Small, 'Medium", or 'Large") for each company
by first identifying the number of job postings they have.
Use a subquery to calculate the total job postings per company.
A company is considered 'Small if it has less than 10 job postings,
'Medium' if the number of job postings is between 10 and 50,
and 'Large' if it has more than 50 job postings.
Implement a subquery to aggregate job counts per company before classifying them based on size.
*/


SELECT
    company_id,
    CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END company_size
FROM(
    SELECT
        company_id,
        COUNT(job_id) AS job_count
    FROM
        job_postings_fact
    GROUP BY
        company_id
   )AS company_jobs
ORDER BY company_id