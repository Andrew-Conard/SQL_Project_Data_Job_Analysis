/*
Question: What are the top-paying Data Analyst jobs?
-Identify the top 10 highest paying Data Aanalyst roles that are avialable remotely.
-Focuses on job posting with specific salaries (remove nulls).
-Why? Highlight the top paying opportunities for Data Analysis, Offering insight into employment potential.
*/

SELECT
    job_id,
    job_title,
    search_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
WHERE
    job_title_short='Data Analyst' AND
    search_location like '%United States%' AND
    salary_year_avg is NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;