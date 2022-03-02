/*Show the best selling item by value.
Assuming all totals are in dollars*/
USE AdventureWorks2014;
SELECT TOP 1
	sod.ProductID,
	p.Name,
	SUM(sod.LineTotal) AS 'TotalValue'
FROM
	sales.SalesOrderDetail AS sod,
	Production.Product AS p
WHERE sod.ProductID = p.ProductID
GROUP BY sod.ProductID,
		 p.Name
ORDER BY 3 DESC;