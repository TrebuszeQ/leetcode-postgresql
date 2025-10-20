--- https://leetcode.com/problems/duplicate-emails/
SELECT name AS Customers
FROM Customers
EXCEPT
SELECT b.name AS Customers
FROM Orders a
LEFT JOIN Customers b
ON a.customerId = b.Id
