WITH CTE (salary) AS (
    SELECT DISTINCT TOP 2 salary
    FROM Employee
    ORDER BY salary DESC
)

SELECT TOP 1 CASE
    WHEN (
        SELECT COUNT(*)
        From Employee
    ) = 1 THEN NULL
    WHEN (
        SELECT MAX(salary)
        FROM Employee
    ) = (
        SELECT MIN(salary)
        FROM CTE
    ) THEN NULL
    ELSE (
        SELECT MIN(salary)
        FROM CTE
    )
    END AS SecondHighestSalary
FROM Employee;