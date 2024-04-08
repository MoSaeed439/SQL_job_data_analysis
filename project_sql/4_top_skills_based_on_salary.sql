/*
Answer: What are the top skills based on salary
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries , regardless of location
- Why ? It reveals how different skills impact salary levels for Data Analyst and helps 
identify the most financially rewarding skills to acquire or improve
*/



SELECT 
    skills,
    ROUND(AVG(job_postings_fact.salary_year_avg),2) AS average_salary
FROM job_postings_fact
INNER JOIN
    skills_job_dim ON 
   job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25


/*
Focusing on the areas of machine learning, software development, and cloud computing within the context of top-paying skills for data analysts:

- **Machine Learning Proficiency**: Skills in advanced machine learning frameworks and libraries such as `tensorflow`, `keras`, `pytorch`, and 
platforms like `datarobot` are among the highest valued. This trend underscores the growing importance of deep learning and AI capabilities in 
analyzing complex datasets and developing predictive models.

- **Software Development Expertise**: The demand for software development skills, evidenced by high salaries for knowledge in programming languages (`golang`, `scala`, `perl`), version control (`svn`), and development platforms (`gitlab`, `bitbucket`), highlights the need for data analysts to contribute to and manage codebases, ensuring efficient development workflows.

- **Cloud Computing Skills**: Proficiency in cloud infrastructure and deployment technologies (`terraform`, `vmware`, `ansible`) reflects the shift towards cloud-based data solutions. Understanding how to leverage cloud environments for scalable, efficient data processing and model deployment is becoming increasingly essential.

These insights reveal a competitive job market where data analysts with a blend of machine learning expertise, software development skills, and cloud computing knowledge are highly sought after, indicating the value of these competencies in driving data-driven insights and innovations.


[
  {
    "skills": "svn",
    "average_salary": "400000.00"
  },
  {
    "skills": "solidity",
    "average_salary": "179000.00"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "average_salary": "155485.50"
  },
  {
    "skills": "golang",
    "average_salary": "155000.00"
  },
  {
    "skills": "mxnet",
    "average_salary": "149000.00"
  },
  {
    "skills": "dplyr",
    "average_salary": "147633.33"
  },
  {
    "skills": "vmware",
    "average_salary": "147500.00"
  },
  {
    "skills": "terraform",
    "average_salary": "146733.83"
  },
  {
    "skills": "twilio",
    "average_salary": "138500.00"
  },
  {
    "skills": "gitlab",
    "average_salary": "134126.00"
  },
  {
    "skills": "kafka",
    "average_salary": "129999.16"
  },
  {
    "skills": "puppet",
    "average_salary": "129820.00"
  },
  {
    "skills": "keras",
    "average_salary": "127013.33"
  },
  {
    "skills": "pytorch",
    "average_salary": "125226.20"
  },
  {
    "skills": "perl",
    "average_salary": "124685.75"
  },
  {
    "skills": "ansible",
    "average_salary": "124370.00"
  },
  {
    "skills": "hugging face",
    "average_salary": "123950.00"
  },
  {
    "skills": "tensorflow",
    "average_salary": "120646.83"
  },
  {
    "skills": "cassandra",
    "average_salary": "118406.68"
  },
  {
    "skills": "notion",
    "average_salary": "118091.67"
  },
  {
    "skills": "atlassian",
    "average_salary": "117965.60"
  },
  {
    "skills": "bitbucket",
    "average_salary": "116711.75"
  },
  {
    "skills": "airflow",
    "average_salary": "116387.26"
  },
  {
    "skills": "scala",
    "average_salary": "115479.53"
  }
]






*/