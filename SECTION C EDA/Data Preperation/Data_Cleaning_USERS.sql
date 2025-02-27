-- Data Cleaning Tasks
-- 1) Selecting only required columns
-- 2) Giving Friendly alias
-- 3) Seperated date and time from the whole datetime value
-- 4) Checking Whitespaces in name and email of user


SELECT
id AS user_id,
name AS user_name,
email,
DATE(created_at) AS created_date,
TIME(created_at) AS created_time,
DATE(updated_at) AS updated_date,
TIME(updated_at) AS updated_time
FROM users;



-- Checking Whitespaces in name and email of user
-- SELECT
-- id AS user_id,
-- name AS user_name,
-- email,
-- DATE(created_at) AS created_date,
-- TIME(created_at) AS created_time,
-- DATE(updated_at) AS updated_date,
-- TIME(updated_at) AS updated_time
-- FROM users
-- WHERE name != TRIM(name) OR email != TRIM(email);



-- Not Necessary if anyone wants  to replace @gmail.com with @pathao.com
-- SELECT
-- id AS user_id,
-- name AS user_name,
-- REPLACE(email,'@gmail.com','@pathao.com') AS email
-- FROM users;

