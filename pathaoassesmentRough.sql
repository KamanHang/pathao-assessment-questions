-- SELECT * FROM counters;


-- SELECT * FROM queues LIMIT 10;

-- -- SELECT * FROM call_statuses;

-- SELECT counter_id, call_status_id FROM calls WHERE call_status_id = 2 AND called_date = "2024-02-14" GROUP BY counter_id;
-- SELECT * FROM calls;

-- -- SELECT COUNT(call_status_id) FROM calls WHERE call_status_id IS NULL GROUP BY counter_id ;




SELECT * FROM calls;
