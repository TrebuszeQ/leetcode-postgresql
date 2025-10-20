--- https://leetcode.com/problems/department-highest-salary/submissions/1806563484/
WITH CTE AS (
    SELECT departmentId,
        MAX(salary) AS "salary"
    FROM Employee
    GROUP BY departmentId
)
SELECT a.name AS "Department",
    b.name AS "Employee",
    b.salary AS "Salary"
FROM Department a
JOIN Employee b
ON a.id = b.departmentId
JOIN CTE c
ON a.id = c.departmentId
WHERE b.salary = c.salary
