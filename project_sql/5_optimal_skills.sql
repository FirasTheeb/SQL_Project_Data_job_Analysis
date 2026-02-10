
/*
Answer: What are the most optimal skills to learn (it's in high demand and a high-paying skill)?
-   Identify skills in high demand and associated with high average salaries for Data Analyst roles
-   Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
offering strategic insights, for career development in data analysis.
*/

WITH skills_demand AS (
    SELECT
        skills.skill_id,
        skills.skills,
        COUNT (skill_to_job.*) AS demand_count
    FROM
        skills_job_dim AS skill_to_job
    INNER JOIN job_postings_fact AS job_postings ON skill_to_job.job_id = job_postings.job_id
    INNER JOIN skills_dim AS skills ON skill_to_job.skill_id = skills.skill_id
    WHERE
        job_postings.job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_postings.job_work_from_home = TRUE
    GROUP BY
        skills.skill_id
), 
average_salary AS (
    SELECT
        skills.skill_id,
        skills.skills,
        ROUND (AVG(job_postings.salary_year_avg), 0) AS skill_avg_salary
    FROM
        skills_job_dim AS skill_to_job
    INNER JOIN job_postings_fact AS job_postings ON skill_to_job.job_id = job_postings.job_id
    INNER JOIN skills_dim AS skills ON skill_to_job.skill_id = skills.skill_id
    WHERE
        job_postings.job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_postings.job_work_from_home = TRUE
    GROUP BY
        skills.skill_id
)
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_salary.skill_avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    skill_avg_salary DESC,
    demand_count DESC
   
-- rewriting this same query more concisely.

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
