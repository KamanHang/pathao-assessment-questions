-- Service x Counter Summary
-- Write an SQL query to get a detailed summary of counters and services for 
-- any given date. 
-- Submission:  Provide the SQL query and the output as an image or screenshot. 


SELECT
service_id,
token_letter AS letter,
counter_id,
SUM(CASE WHEN queue_id IS NULL THEN 0 ELSE 1 END) AS visitor,
SUM(CASE WHEN ended_at IS NULL THEN 1 ELSE 0 END ) As queued,
SUM(CASE WHEN called_date IS NOT NULL THEN 1 ELSE 0 END) AS called,
SUM(CASE WHEN call_status_id IS NULL THEN 1 ELSE 0 END)  AS serving,
SUM(CASE WHEN call_status_id = 1 THEN 1 ELSE 0 END) AS served,
SUM(CASE WHEN call_status_id = 2 THEN 1 ELSE 0 END) AS no_show
FROM calls 
WHERE called_date = '2024-02-14'
GROUP BY service_id, token_letter, counter_id;
