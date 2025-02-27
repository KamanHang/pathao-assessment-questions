-- Data Cleaning Task I performed
-- 1) I renamed the columns into user friendly names
-- 2) Seperated date and time from the whole datetime value

SELECT
id AS counter_id,
name AS counter_name,
status AS counter_status,
DATE(created_at) AS created_date,
TIME(created_at) AS created_time,
DATE(updated_at) AS updated_date,
TIME(updated_at) AS updated_time
FROM counters;