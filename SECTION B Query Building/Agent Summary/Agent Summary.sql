-- Agent Summary (15 Marks) 
-- Task:  Write an SQL query to get a summary of agents  for any given date, 
-- including the total visitors, queued, called, serving, served, and no-show. 
-- Submission:  Provide the SQL query and the output as  an image or screenshot.



SELECT 
u.name,
c.token_letter AS letter,
COUNT(c.queue_id) AS visitor,
SUM(CASE WHEN c.ended_at IS NULL THEN 1 ELSE 0 END) AS queued,
SUM(CASE WHEN c.called_date IS NOT NULL THEN 1 ELSE 0 END) AS called,
SUM(CASE WHEN c.call_status_id IS NULL THEN 1 ELSE 0 END) AS serving,
SUM(CASE WHEN c.call_status_id = 1 THEN 1 ELSE 0 END) AS served
FROM users AS u
JOIN calls AS c 
ON c.user_id = u.id AND c.called_date = '2024-02-14'
GROUP BY u.id, c.token_letter
ORDER BY u.name;

