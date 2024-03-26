/*
Question: what are the most in demand skills for data analysis?
-Join job postings to inner join table simular to query 2
-ID the top 5 in demand skills for a data analyst.
-Focus on all job postings in the U.S.
_why? Shows the top 5 skill with the highest demand in the Data Analyst job market.
*/

select 
    skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
WHERE  
    job_title_short ='Data Analyst' AND
    search_location like '%United States%'
GROUP BY
    skills
ORDER BY
    demand_count DESC
limit 5