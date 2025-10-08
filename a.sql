--- https://leetcode.com/problems/consecutive-numbers/
SELECT DISTINCT b.num as ConsecutiveNums
FROM Logs a
JOIN Logs b ON a.num = b.num
    AND b.id = a.id - 1
JOIN Logs c ON a.num = c.num
    AND c.id = a.id + 1