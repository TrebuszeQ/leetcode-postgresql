
--- https://leetcode.com/problems/consecutive-numbers/
WITH Ranked AS (
    SELECT id,
        num,
        LAG(num, 1) OVER (ORDER BY id) as one_back_number,
        LAG(num, 2) OVER (ORDER BY id) as two_back_number
    FROM Logs
)

SELECT DISTINCT num as ConsecutiveNums
FROM Ranked
WHERE num = one_back_number
    AND num = two_back_number