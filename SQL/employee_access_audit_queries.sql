-- Employee Access and Data Quality Audit
-- Five final audit checks using the synthetic sample SQLite database.

-- QUERY 1: Find access grants with missing approval information.
SELECT *
FROM access_grants
WHERE approved_by IS NULL;

-- QUERY 2: Count administrator access-grant records.
SELECT COUNT(*) AS admin_grant_count
FROM access_grants
WHERE role = 'Admin';

-- QUERY 3: Find terminated users with access-grant records.
SELECT
    users.user_id,
    users.first_name,
    users.last_name,
    users.status,
    access_grants.role
FROM users
INNER JOIN access_grants
    ON users.user_id = access_grants.user_id
WHERE users.status = 'Terminated';

-- QUERY 4: Find users with more than one access-grant record.
SELECT
    user_id,
    COUNT(*) AS grant_count
FROM access_grants
GROUP BY user_id
HAVING COUNT(*) > 1;

-- QUERY 5: Find users without matching access-grant records.
SELECT
    users.user_id,
    users.first_name,
    users.last_name
FROM users
LEFT JOIN access_grants
    ON users.user_id = access_grants.user_id
WHERE access_grants.grant_id IS NULL;
