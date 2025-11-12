-- https://leetcode.com/problems/delete-duplicate-emails/

WITH CTE as (
    SELECT MIN(id) AS "id",
    email, 
    COUNT(email) AS "count"
    FROM Person
    GROUP BY email
)

DELETE FROM Person 
WHERE email IN (SELECT email from CTE)
AND id NOT IN (SELECT id FROM CTE);