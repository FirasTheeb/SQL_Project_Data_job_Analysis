/*
Answer: What are the top skills based on salary?
*   Look at the average salary associated with each skill for Data Analyst positions
*   Focuses on roles with specified salaries, regardless of location
*   Why? It reveals how different skills impact salary levels for Data Analysts and
        helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
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
    skills.skills
ORDER BY
    skill_avg_salary DESC
LIMIT 30;

/*
Here's the breakdown of the result for the top paying skills for Data Analyst:
• Big Data & AI Powerhouses: The biggest paychecks come from handling massive datasets and AI.
Mastering PySpark ($208k) or DataRobot ($155k) proves you can manage complex information and build predictive models.
• Software & Teamwork Tools: Companies pay extra for analysts who work like developers.
Using tools like Bitbucket ($189k) and GitLab ($154k) shows you can organize code and collaborate efficiently within a professional tech team.
• Core Python & Cloud Skills: Standard tools like Pandas ($151k) and cloud platforms like Databricks ($141k) remain high-paying essentials.
These skills allow you to clean data and run analyses in modern, cloud-based environments.
[
  {
    "skills": "pyspark",
    "skill_avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "skill_avg_salary": "189155"
  },
  {
    "skills": "watson",
    "skill_avg_salary": "160515"
  },
  {
    "skills": "couchbase",
    "skill_avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "skill_avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "skill_avg_salary": "154500"
  },
  {
    "skills": "swift",
    "skill_avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "skill_avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "skill_avg_salary": "151821"
  },
  {
    "skills": "golang",
    "skill_avg_salary": "145000"
  },
  {
    "skills": "elasticsearch",
    "skill_avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "skill_avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "skill_avg_salary": "141907"
  },
  {
    "skills": "linux",
    "skill_avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "skill_avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "skill_avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "skill_avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "skill_avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "skill_avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "skill_avg_salary": "125436"
  },
  {
    "skills": "notion",
    "skill_avg_salary": "125000"
  },
  {
    "skills": "scala",
    "skill_avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "skill_avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "skill_avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "skill_avg_salary": "121619"
  },
  {
    "skills": "crystal",
    "skill_avg_salary": "120100"
  },
  {
    "skills": "go",
    "skill_avg_salary": "115320"
  },
  {
    "skills": "confluence",
    "skill_avg_salary": "114210"
  },
  {
    "skills": "db2",
    "skill_avg_salary": "114072"
  },
  {
    "skills": "hadoop",
    "skill_avg_salary": "113193"
  }
]
*/
