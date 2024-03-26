/*
Question: what skills are required for the top-paying Data Analyst jobs?
-using data from my first query.
-add the specific skills required for the roles.
Why? looking into the skills needed for each of the top paying Data Analyst jobs.
This will help jobs seekers see what skills are needed for these top paying jobs.
*/


with top_paying_jobs as (
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
    LIMIT 10
)

select 
        top_paying_jobs.*,
        skills
from top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY 
        salary_year_avg DESC

/*
The analysis of the skills column from the dataset reveals the frequency of each skill required across the top data analyst roles:

Python is the most in-demand skill with 6 mentions.
SQL follows closely with 5 mentions, indicating its importance in data-related roles.
Tableau and R are also highly sought after, each with 4 mentions.
Excel and Power BI are next, with 3 mentions each, underscoring the value of spreadsheet and business intelligence tools.
SAS, Pandas, and several others are mentioned as well, but with lower frequencies.
This distribution highlights the diversity of skills that are valued in the data analysis field, ranging from programming 
languages (Python, R) to data visualization tools (Tableau, Power BI), and specific technologies or platforms 
(SQL for databases, Excel for spreadsheet analysis). It's clear that a combination of coding skills, familiarity with 
data manipulation and analysis libraries, and proficiency in data visualization tools are key for securing top data analyst roles in the United States.


[
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "search_location": "New York, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-18 07:00:22",
    "company_name": "Illuminate Mission Solutions",
    "skills": "python"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "search_location": "New York, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-18 07:00:22",
    "company_name": "Illuminate Mission Solutions",
    "skills": "r"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "search_location": "New York, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-18 07:00:22",
    "company_name": "Illuminate Mission Solutions",
    "skills": "vba"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "search_location": "New York, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-18 07:00:22",
    "company_name": "Illuminate Mission Solutions",
    "skills": "excel"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "search_location": "New York, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-18 07:00:22",
    "company_name": "Illuminate Mission Solutions",
    "skills": "tableau"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics",
    "skills": "sql"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics",
    "skills": "python"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics",
    "skills": "r"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics",
    "skills": "sas"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics",
    "skills": "matlab"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics",
    "skills": "spark"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics",
    "skills": "airflow"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics",
    "skills": "excel"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics",
    "skills": "tableau"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics",
    "skills": "power bi"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-04-21 08:01:55",
    "company_name": "Torc Robotics",
    "skills": "sas"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-10-23 05:01:05",
    "company_name": "Care.com",
    "skills": "sql"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-10-23 05:01:05",
    "company_name": "Care.com",
    "skills": "python"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-10-23 05:01:05",
    "company_name": "Care.com",
    "skills": "r"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-10-23 05:01:05",
    "company_name": "Care.com",
    "skills": "bigquery"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-10-23 05:01:05",
    "company_name": "Care.com",
    "skills": "snowflake"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-10-23 05:01:05",
    "company_name": "Care.com",
    "skills": "tableau"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-10-23 05:01:05",
    "company_name": "Care.com",
    "skills": "power bi"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-10-23 05:01:05",
    "company_name": "Care.com",
    "skills": "looker"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "search_location": "California, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-06-22 07:00:59",
    "company_name": "Anthropic",
    "skills": "sql"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "search_location": "California, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-06-22 07:00:59",
    "company_name": "Anthropic",
    "skills": "python"
  },
  {
    "job_id": 894135,
    "job_title": "Research Scientist",
    "search_location": "California, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "285000.0",
    "job_posted_date": "2023-04-19 18:04:21",
    "company_name": "OpenAI",
    "skills": "github"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 285766,
    "job_title": "Partner Technology Manager, Data Analytics and AI",
    "search_location": "Texas, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "254000.0",
    "job_posted_date": "2023-07-28 13:01:20",
    "company_name": "Google",
    "skills": "gcp"
  },
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "search_location": "New York, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "240000.0",
    "job_posted_date": "2023-08-17 13:00:09",
    "company_name": "Coda Search│Staffing",
    "skills": "sql"
  },
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "search_location": "New York, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "240000.0",
    "job_posted_date": "2023-08-17 13:00:09",
    "company_name": "Coda Search│Staffing",
    "skills": "python"
  },
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "search_location": "New York, United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "240000.0",
    "job_posted_date": "2023-08-17 13:00:09",
    "company_name": "Coda Search│Staffing",
    "skills": "pandas"
  }
]
*/