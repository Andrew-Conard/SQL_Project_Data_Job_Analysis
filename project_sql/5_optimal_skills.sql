/*
Answer: what are the most optimal skills to learn. (high demand and high paying skills)
-Id the skills in high demand and show their avg salary for Data Analyst roles.
-Concentrates on remote positions with specified salaries.
-Why? Targets skills the offer job security (high demand) and can benefit a Data Analyst finacially (highest paying),
offering insight on career development for Data Analsyt.
*/

with skills_demand as (
    select 
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
    WHERE  
        job_title_short ='Data Analyst' AND
         salary_year_avg is not NULL AND
        search_location like '%United States%'
    GROUP BY
        skills_dim.skill_id
),

average_salary as (
    select 
        skills_job_dim.skill_id, 
        round(avg(salary_year_avg),0) as avg_salary
    from job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
    WHERE  
        job_title_short ='Data Analyst' AND
        search_location like '%United States%' and
        salary_year_avg is not NULL
    GROUP BY
        skills_job_dim.skill_id
)

select
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
from    
    skills_demand
inner JOIN average_salary on skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
limit 25;

