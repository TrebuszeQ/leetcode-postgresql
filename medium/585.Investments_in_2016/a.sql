-- https://leetcode.com/problems/investments-in-2016/
SELECT SUM(tiv_2016) AS tiv_2016
FROM Insurance
WHERE pid NOT IN (
    SELECT DISTINCT a.pid
    FROM Insurance a
    JOIN Insurance b
        ON a.tiv_2015 <> b.tiv_2015
    WHERE a.lat = b.lat
        AND a.lon = b.lon
)
AND (
    SELECT COUNT(tiv_2015)
    FROM Insurance
    GROUP BY tiv_2015
    WHERE 
) > 1
GROUP BY tiv_2015



SELECT SUM(a.tiv_2016)
FROM Insurance a
WHERE a.pid IN (
    SELECT 
    FROM Insurance b
    WHERE (
        a.lat <> b.lat
        AND a.lon <> b.lon
    )
)
GROUP BY a.tiv_2015
HAVING COUNT(a.tiv_2015) > 1