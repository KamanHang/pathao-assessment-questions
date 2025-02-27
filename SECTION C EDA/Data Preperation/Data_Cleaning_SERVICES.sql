-- Data Cleaning Task I performed
-- 1) I renamed the columns into user friendly names
-- 2) Seperated date and time from the whole datetime value

SELECT
id AS service_id,
name AS service_name,
letter,
start_number,
status,
sms_enabled,
optin_message_enabled,
call_message_enabled, 
noshow_message_enabled,
completed_message_enabled,
status_message_enabled,
optin_message_format,
call_message_format,
noshow_message_format,
completed_message_format,
status_message_format,
status_message_positions,
ask_name,
name_required,
ask_email,
email_required,
ask_phone,
phone_required,
DATE(created_at) AS created_date,
TIME(created_at) AS created_time,
DATE(updated_at) AS updated_date,
TIME(updated_at) AS updated_time
FROM services;