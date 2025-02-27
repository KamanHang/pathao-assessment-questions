-- Data Cleaning Task I performed
-- 1) I renamed the columns into user friendly names
-- 2) Seperated date and time from the whole datetime value
-- 3) Checked if the waiting time and the served time is accurate,
-- 4) Checking any whitespaces in token_letter
-- 5) Checking outliers (max and minimum) Date
-- 6) Checked any invalid length data

SELECT
id AS calls_id,
queue_id,
service_id,
counter_id,
user_id,
token_letter,
token_number,
called_date,
DATE(started_at) AS started_date,
DATE(ended_at) AS ended_date,
TIME(started_at) AS started_time,
TIME(ended_at) AS ended_time,
served_time,
waiting_time,
turn_around_time,
DATE(created_at) AS created_date,
DATE(updated_at) AS updated_date,
TIME(created_at) AS created_time,
TIME(updated_at) AS updated_time,
call_status_id
FROM CALLS;

-- Data Cleaning task performed

-- served time = ended_time - started_time
-- turn around time = waiting_time + served_time

-- SELECT
-- TIME(started_at) AS started_time,
-- TIME(ended_at) AS ended_time,
-- served_time,
-- waiting_time,
-- turn_around_time,
-- TIME(created_at) AS created_time,
-- TIME(updated_at) AS updated_time
-- FROM calls;

-- Checking inconsistent time 
-- served time = ended_time - started_time

-- SELECT
--     TIME(started_at) AS start_time,
--     TIME(ended_at) AS end_time,
--     TIME(
--         strftime('%s', '00:00:00') + (strftime('%s', ended_at) - strftime('%s', started_at)),
--         'unixepoch'
--     ) AS timedifference_hhmmss,
--     served_time
-- FROM calls WHERE  TIME(
--         strftime('%s', '00:00:00') + (strftime('%s', ended_at) - strftime('%s', started_at)),
--         'unixepoch'
--     ) != served_time;

-- output was none

-- Checking Inconsisten time between 
-- turn around time = waiting_time + served_time

-- SELECT
--     waiting_time,
--     served_time,
--     TIME(
--         strftime('%s', '00:00:00') + (strftime('%s', waiting_time) + strftime('%s', served_time)),
--         'unixepoch'
--     ) AS time_sum,
--     turn_around_time
-- FROM calls WHERE  TIME(
--         strftime('%s', '00:00:00') + (strftime('%s', waiting_time) + strftime('%s', served_time)),
--         'unixepoch'
--     ) != turn_around_time;

-- Output was None


-- Checking whitespaces
-- SELECT 
-- *
-- FROM CALLS WHERE token_letter != TRIM(token_letter);

-- Checking called_date Outliers
-- Checking max and minimum dates
-- SELECT 
-- max(called_date), -- 2024-02-16
-- min(called_date) -- 2024-01-25
-- FROM CALLS;

-- Checking invalid values in called_date
-- SELECT 
-- *
-- FROM CALLS WHERE length(called_date) > 10;
