-- Service Summary
-- Task:  Write an SQL query to get a summary of services  for any given date, 
-- including the total visitors, queued, called, serving, served, and no-show.

SELECT 
s.id AS service_id,
s.letter AS service_letter, 
SUM(CASE WHEN c.queue_id IS NULL THEN 0 ELSE 1 END) AS visitors,
SUM(CASE WHEN c.queue_id IS NULL THEN 1 ELSE 0 END) AS queued,
SUM(CASE WHEN c.called_date IS NOT NULL THEN 1 ELSE 0 END) AS called,
SUM(CASE WHEN call_status_id IS NULL THEN call_status_id ELSE 0 END) AS serving,
SUM(CASE WHEN c.call_status_id = 1 THEN 1 WHEN  c.call_status_id IS NULL THEN c.call_status_id ELSE 0 END) AS served,
SUM(CASE WHEN c.call_status_id = 2 THEN 1 WHEN  c.call_status_id IS NULL THEN c.call_status_id ELSE 0 END) AS no_show
FROM services AS s
LEFT JOIN (
    SELECT
    id,
    queue_id,
    service_id,
    called_date, 
    call_status_id
    FROM calls
    WHERE called_date = '2024-02-14'
) as c
ON  s.id = c.service_id
GROUP BY s.id; 
