/*
• UNION - combines results from two or more SELECT statments
• They need to have the same amount of columns, and the data type must match.
• All rows are unique
    Get rid of dupéicate rows (unlike UNION ALL)
*/

SELECT *
FROM january_jobs

UNION

SELECT *
FROM february_jobs

UNION

SELECT *
FROM march_jobs;