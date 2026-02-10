/*
Find the count of the number of remote job postings per skill
- Display the top 5 skills by their demand in remote jobs
- Include skill ID, name, and count of postings requiring the skill
- looking for only 'Data Analyst' skills requiring.
*/

WITH remote_job_skill AS(
SELECT
    skill_id,
    COUNT(*) AS num_of_jobs
FROM
    skills_job_dim
INNER JOIN job_postings_fact AS job_postings ON
        skills_job_dim.job_id = job_postings.job_id
WHERE
    job_postings.job_work_from_home = True AND
    job_postings.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)
SELECT
    remote_job_skill.skill_id,
    skills_dim.skills,
    remote_job_skill.num_of_jobs
FROM
    skills_dim
INNER JOIN remote_job_skill ON
        skills_dim.skill_id = remote_job_skill.skill_id
ORDER BY
    num_of_jobs DESC
LIMIT 5;
