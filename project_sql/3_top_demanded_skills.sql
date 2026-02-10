/*
Question: What are the most in-demand skills for data analysts?
-   Join job postings to inner join table similar to query 2
-   Identify the top 5 in-demand skills for a data analyst.
-   Focus on all job postings.
-   Why? Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills.skills,
    COUNT (skill_to_job.*) AS demand_count
FROM
    skills_job_dim AS skill_to_job
INNER JOIN job_postings_fact AS job_postings ON skill_to_job.job_id = job_postings.job_id
INNER JOIN skills_dim AS skills ON skill_to_job.skill_id = skills.skill_id
WHERE
    job_postings.job_title_short = 'Data Analyst' 
    --AND job_postings.job_work_from_home = TRUE
GROUP BY
    skills.skills
ORDER BY
    demand_count DESC
LIMIT 5;