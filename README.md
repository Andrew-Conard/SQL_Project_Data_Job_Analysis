# Introduction
This project explores the landscape of top-paying jobs and the skills required to secure these positions. Through a series of SQL queries, we analyze various datasets to uncover trends in job compensation, demand for specific technical skills, and the optimal skill sets that correlate with higher salaries in the tech industry.

Check out the SQL queries here: [poject_sql](/project_sql/)

# Background
Given the rapid evolution of the tech industry, understanding the dynamics of job market demands and compensation is crucial for professionals aiming to advance their careers. This project was initiated to provide insights into which skills and job roles offer the most lucrative opportunities, using data-driven analysis.

# Tools I Used
- **SQL:** For querying and manipulating the dataset.
- Database Management System: **PostgreSQL**
- **Visual Studio Code:** database management and executing queries.
- **Git & GitHub:** version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
The project is structured into five main analyses, each focusing on a different aspect of the job market and skill sets:

### Top Paying Jobs: Identifying the highest-paying jobs in the tech industry.
```sql
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
```
This SQL query meticulously crafted to identify the top 10 highest-paying remote Data Analyst positions within the United States reveals key insights into the job market. By excluding listings without specified salaries and focusing on those available remotely, the query ensures relevance and actionability for job seekers prioritizing compensation and flexibility. The inclusion of job details like title, location, schedule type, and company name, ordered by descending salary, serves as a strategic tool for Data Analysts. It highlights the most lucrative opportunities, showcasing the demand for analytical skills in the job market and guiding professionals towards informed career decisions.

### Top Paying Job Skills: Examining which specific skills are associated with the highest salaries.

```sql
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
```
The analysis of the skills column from the dataset reveals the frequency of each skill required across the top data analyst roles:

- Python is the most in-demand skill with 6 mentions.
- SQL follows closely with 5 mentions, indicating its importance in data-related roles.
- Tableau and R are also highly sought after, each with 4 mentions.
- Excel and Power BI are next, with 3 mentions each, underscoring the value of spreadsheet and business intelligence tools.
- SAS, Pandas, and several others are mentioned as well, but with lower frequencies.

This distribution highlights the diversity of skills that are valued in the data analysis field, ranging from programming 
languages (Python, R) to data visualization tools (Tableau, Power BI), and specific technologies or platforms 
(SQL for databases, Excel for spreadsheet analysis). It's clear that a combination of coding skills, familiarity with 
data manipulation and analysis libraries, and proficiency in data visualization tools are key for securing top data analyst roles in the United States.


### Top Demanded Skills: Analyzing the most sought-after skills in the job market.

```sql
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
```
The top five findings regarding the most in-demand skills for Data Analyst roles in the United States are as follows:

1. SQL: Stands out as the most demanded skill, with 29,542 job postings mentioning it. This underscores SQL's fundamental role in data analysis for querying and managing databases.

2. Excel: Comes in second, with 23,918 job postings highlighting the need for proficiency in Excel. This indicates the widespread reliance on Excel for data manipulation, analysis, and visualization tasks.

3. Tableau: Is the third most sought-after skill, with 16,860 job postings. This reflects Tableau's importance in data visualization and business intelligence, allowing analysts to create interactive and shareable dashboards.

4. Python: Ranks fourth, with 16,221 job postings. Python's popularity is due to its versatility, powerful libraries for data analysis (like pandas and NumPy), and its role in scripting and automation.

5. SAS: Is fifth, with 11,240 job postings. SAS (Statistical Analysis System) is valued for its capabilities in statistical analysis, making it crucial for more statistically oriented data analysis roles.

These findings highlight a diverse set of technical skills—from database management and statistical analysis to data visualization and automation—emphasizing the broad skill set required for Data Analysts to thrive in today's data-driven job market.


### Top Paying Skills: Delineating the skills that lead to top compensation.

```sql
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
```

***analysis of top-paying skills for data analysts highlights three key insights:***

- **Machine Learning Mastery is Highly Valued:** Skills in machine learning and deep
 learning frameworks (like MXNet, Keras, Hugging Face, PyTorch, TensorFlow) 
 dominate the top of the salary spectrum, indicating a strong demand for data
 analysts who can build and implement advanced predictive models.

- **Blockchain Expertise is Emerging:** The inclusion of Solidity suggests 
that expertise in blockchain technology is not only sought after in the 
tech industry but also carries significant financial rewards, pointing 
to its expanding relevance beyond cryptocurrencies into various sectors.

- **Cross-Functional Skills are Essential:** The high value placed on skills
 across big data technologies, development and operations (DevOps) 
 tools, and data processing frameworks reflects a trend towards roles 
 that blend data analytics with data engineering, software development,
  and IT operations, emphasizing the importance of versatile skill sets 
  in today’s job market.

### Optimal Skills Combination: Investigating combinations of skills that are most likely to maximize job compensation.

```sql
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
```

![Top Paying Skills](/project_sql/assets/top_demanded_skills_and_their_avg_salary.png)
*bar graph visualizing the top in demand skills and their average salaries for 
Data Analyst. This is a ChatGPT generated graph from my SQL query results.*

# What I Learned

Throughout this project, I gained significant insights and enhanced my technical skills in several key areas:

- **Complex Query Crafting:** I developed proficiency in crafting intricate SQL queries that allowed me to efficiently extract and manipulate data. This included learning how to use advanced SQL functions for data aggregation, filtering, and joining multiple tables, which was essential for analyzing the datasets comprehensively.

- **Data Aggregation:** My ability to aggregate data effectively was crucial for summarizing large datasets into meaningful insights. I learned various aggregation techniques to compute statistics such as average salaries and demand counts, which enabled me to identify trends and patterns in the job market for data analysts.

- **Real-World Problem Solving through Exploratory Data Analysis:** The project was an exercise in solving real-world problems by exploring and analyzing data. I tackled questions related to job market trends, such as identifying in-demand skills and high-paying jobs, which required a deep dive into the datasets and iterative analysis to uncover actionable insights.

- **Insights on Job Market Trends:** My analysis revealed surprising trends in the demand for specific technical skills and the compensation associated with them. For instance, the high value placed on blockchain technology expertise and machine learning skills underscored the evolving needs of employers in the tech industry.

- **Overcoming Challenges:** One of the main challenges I faced was dealing with incomplete or inconsistent data, which required creative problem-solving to clean and preprocess the data effectively. Additionally, optimizing SQL queries for performance was another hurdle, as I worked with large volumes of data. These challenges were overcome through persistence, experimentation with different approaches, and leveraging online resources for troubleshooting and optimization techniques.

This project was a valuable learning experience, enhancing my SQL skills and providing me with insights into the data analysis process and the tech job market. It has equipped me with a solid foundation for tackling data-driven questions and making informed decisions based on data analysis.
