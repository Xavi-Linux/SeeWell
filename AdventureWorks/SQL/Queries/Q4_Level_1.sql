/*Give the CompanyName of those customers with orders over $100000.*/
USE AdventureWorks2014;
SELECT
	totals.CustomerID,
	customers.Name,
	totals.Total
FROM
	(SELECT soh.CustomerID,
	        SUM(soh.TotalDue) AS 'Total'
	 FROM Sales.SalesOrderHeader AS soh
	 GROUP BY soh.CustomerID
	 HAVING SUM(soh.TotalDue) > 100000
	) AS totals
INNER JOIN
    (SELECT
		c.CustomerID,
        s.Name
	 FROM
		Sales.Customer AS c,
        Sales.Store AS s
	 WHERE c.StoreID = s.BusinessEntityID
	) AS customers
ON totals.CustomerID = customers.CustomerID;
