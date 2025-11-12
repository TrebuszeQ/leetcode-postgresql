-- https://leetcode.com/problems/delete-duplicate-emails/

DELETE FROM Person a
USING (
    SELECT MIN(id) AS "min_id",
    email
    FROM Person
    GROUP BY email
    HAVING COUNT(email) > 1
) b
WHERE a.email = b.email
AND a.id <> b.min_id;