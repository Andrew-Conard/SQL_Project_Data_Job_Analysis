/*
Answer: what are the top skills based on salary?
-looking at the avg salary associated with each skill for a Data Analyst in the U.S.
-Focusing on roles with specified salaries
-Why? this reveals hw differents skills impact salary levels for Data Analyst and helps identify the most finacially rewarding skills to learn or improve.
*/

select 
    skills,
    round(avg(salary_year_avg),0) as avg_salary
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
WHERE  
    job_title_short ='Data Analyst' AND
    search_location like '%United States%'
    and salary_year_avg is not NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
limit 25;

/*
analysis of top-paying skills for data analysts highlights three key insights:

Machine Learning Mastery is Highly Valued: Skills in machine learning and deep
 learning frameworks (like MXNet, Keras, Hugging Face, PyTorch, TensorFlow) 
 dominate the top of the salary spectrum, indicating a strong demand for data
 analysts who can build and implement advanced predictive models.

Blockchain Expertise is Emerging: The inclusion of Solidity suggests 
that expertise in blockchain technology is not only sought after in the 
tech industry but also carries significant financial rewards, pointing 
to its expanding relevance beyond cryptocurrencies into various sectors.

Cross-Functional Skills are Essential: The high value placed on skills
 across big data technologies, development and operations (DevOps) 
 tools, and data processing frameworks reflects a trend towards roles 
 that blend data analytics with data engineering, software development,
  and IT operations, emphasizing the importance of versatile skill sets 
  in today’s job market.
  */ 