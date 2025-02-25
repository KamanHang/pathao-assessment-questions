-- Counter Summary
-- Task:  Write an SQL query to get a summary of counters  for any given date, 
-- including the total queue called, serving, served, and no-show. 
-- Note:  Use data from "2024-02-14" for the output. 

SELECT
    counters.id AS counter_id,
    COUNT(calls.queue_id) AS total_queue_called,
    calls.called_date AS called_date,
    SUM(CASE WHEN calls.call_status_id = 1 THEN 1 ELSE 0 END) AS total_served,
    SUM(CASE WHEN calls.call_status_id = 2 THEN 1 ELSE 0 END) AS total_non_show,
    SUM(CASE WHEN calls.call_status_id IS NULL THEN 1 ELSE 0 END) AS total_serving
FROM counters
JOIN calls ON calls.counter_id = counters.id
LEFT JOIN call_statuses ON calls.call_status_id = call_statuses.id
WHERE calls.called_date = '2024-02-14'
GROUP BY counters.id;