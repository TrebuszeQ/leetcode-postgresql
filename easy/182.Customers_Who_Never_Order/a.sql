SELECT a.name AS "Customers"
FROM Customers a
LEFT JOIN Orders b
ON a.id = b.customerId
WHERE customerId IS NULL;