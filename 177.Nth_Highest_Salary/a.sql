# https://leetcode.com/problems/nth-highest-salary/description/
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  IF ($1 > 0) 
  THEN RETURN QUERY (
    -- Write your PostgreSQL query statement below.
        SELECT DISTINCT a.SALARY
        FROM EMPLOYEE a
        ORDER BY a.SALARY DESC
        OFFSET $1 - 1
        LIMIT 1
  );
  END IF;
END;
$$ LANGUAGE plpgsql;