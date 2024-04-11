/*
Question: What are the top_paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remote nulls)
- Why? Highlight the top paying opportunities for data analyst, offering insights into empty
*/


SELECT
    job_postings_fact.job_id,
    company_dim.name AS company_name,
    job_postings_fact.job_title,
    job_postings_fact.job_location,
    job_postings_fact.job_schedule_type,
    job_postings_fact.salary_year_avg,
    job_postings_fact.job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    job_postings_fact.salary_year_avg IS NOT NULL AND job_postings_fact.job_title_short = 'Data Analyst' AND job_location = 'Anywhere'

ORDER BY
    job_postings_fact.salary_year_avg DESC
LIMIT 10