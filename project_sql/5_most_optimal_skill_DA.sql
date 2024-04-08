
/*
Answer: What are the most optimal skills to learn (aka is in high demand and a high-paying skills)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles 
-  Concentrates on remote positions with specified salaries
- Why Targets skills that offer job security (high demand) and financial benefits
 (high salaries ), offering strategic insights for career development in 
 data analysis
*/

WITH in_demand_skills AS
     (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(*) AS skill_count
    FROM 
    job_postings_fact
    INNER JOIN
        skills_job_dim ON 
    job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN
        skills_dim ON
        skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND job_work_from_home = TRUE 
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
     
    ), average_salary_per_skill AS 
    (
        SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg),0) AS average_salary
    FROM 
        job_postings_fact
    INNER JOIN
        skills_job_dim ON 
    job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN
        skills_dim ON
        skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Scientist' AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_job_dim.skill_id
    
    )

-- rewriting the query more consisely 
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.job_id) > 10 
ORDER BY 
    
  
    COUNT(skills_job_dim.job_id) DESC  ,avg_salary DESC
LIMIT 25