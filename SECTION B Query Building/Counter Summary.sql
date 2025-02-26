-- Counter Summary
-- Task:  Write an SQL query to get a summary of counters  for any given date, 
-- including the total queue called, serving, served, and no-show. 
-- Note:  Use data from "2024-02-14" for the output. 

-- Correct Output:
SELECT 
counters.id AS counter_id,
CASE WHEN calls.queue_id IS NULL THEN calls.queue_id ELSE COUNT(queue_id) END AS total_queued,
SUM(CASE WHEN calls.call_status_id = 1 THEN 1 WHEN  calls.call_status_id IS NULL THEN calls.call_status_id ELSE 0 END) AS total_served,
SUM(CASE WHEN calls.call_status_id = 2 THEN 1 WHEN  calls.call_status_id IS NULL THEN calls.call_status_id ELSE 0 END) AS total_no_show
FROM counters
LEFT JOIN calls 
ON counters.id = calls.counter_id AND calls.called_date = '2024-02-14'
GROUP BY counters.id;
