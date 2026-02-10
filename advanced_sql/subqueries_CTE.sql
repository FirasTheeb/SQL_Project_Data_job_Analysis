/* SubQuery is a query inside a larger query
    * It can be used in SELECT, FROM, WHERE, or HAVING caluses
    */

SELECT *
FROM ( -- SubQuery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1
    ) AS january_jobs; -- SubQuery ends here

/* CTE: Common Table Expressions:
        define a temporary result set that you can reference
        * Defined with "WITH"
        */

WITH january_jobs AS ( -- CTE starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ) -- CTE ends here

SELECT *
FROM january_jobs;