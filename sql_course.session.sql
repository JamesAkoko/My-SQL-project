CREATE TABLE job_applied(
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
)

INSERT INTO job_applied
   (job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status)
VALUES (1,
   '2020-02-01',
   true,
   'resume_01.pdf',
   true,
   'cover_letter_01.pdf',
   'submitted'),
       (2,
    '2024-02-02',
    false,
    'resume_o2.pdf',
    false,
    NULL,
    'interview scheduled'
    ),
      (3,
      '2024-02-03',
      true,
      'resume_03.pdf',
      true,
      'cover_letter_03.pdf',
      'ghosted'),
        (4,
        '2024-02-04',
        true,
        'resume_04.pdf',
        false,
        NULL,
        'submitted'),
        (5,
        '2024-02-05',
        false,
        'resume_05.pdf',
        true,
        'cover_letter_05.pdf',
        'rejected');

    ALTER TABLE job_applied
     ADD contact VARCHAR(50) 

     UPDATE job_applied
     SET contact = 'James Akoko'
     WHERE job_id = 1;
     UPDATE job_applied
     SET contact = 'Alex Smith'
     WHERE job_id = 2;
     UPDATE job_applied
     SET contact = 'Jason Mount'
     WHERE job_id = 3;
     UPDATE job_applied
     SET contact = 'Mike Tyson'
     WHERE job_id = 4;
     UPDATE job_applied
     SET contact = 'Tony Adams'
     WHERE job_id = 5;

     SELECT*
     FROM job_applied

     ALTER TABLE job_applied
     RENAME COLUMN name_info TO applicant

     SELECT*
     FROM job_applied

     SELECT 
       job_id,
       job_title,
       job_location,
       salary_year_avg
    FROM 
      job_postings_fact
    WHERE 
       salary_year_avg > 70000
    GROUP BY
       job_id
   ORDER BY 
       salary_year_avg DESC   


       SELECT*
       FROM job_postings_fact
       WHERE EXTRACT (MONTH FROM job_posted_date) = 1
       LIMIT 10

     CREATE TABLE january_jobs AS 
            SELECT*
       FROM job_postings_fact
       WHERE EXTRACT (MONTH FROM job_posted_date) = 1
      

     SELECT *
     FROM job_postings_fact
     LIMIT 100 


 

CREATE TABLE february_jobs AS 
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS 
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT*
FROM
   march_jobs  

WITH january_jobs AS(
  SELECT* 
   FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1
)
   SELECT*
   FROM january_jobs

SELECT 
company_id,
name AS company_name
FROM company_dim
WHERE company_id IN 
(
SELECT
   company_id
   FROM
    job_postings_fact
WHERE 
    job_no_degree_mention = true
    ORDER BY 
  company_id 
)