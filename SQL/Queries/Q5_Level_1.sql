/*Find the number of left racing socks ('Racing Socks, L') ordered by CompanyName 'Riding Cycles'*/
USE AdventureWorks2014;
SELECT
	SUM(sod.OrderQty) AS 'TotalAmount'
FROM Sales.SalesOrderDetail AS sod
WHERE sod.SalesOrderID IN
				(SELECT soh.SalesOrderID
				 FROM
					Sales.SalesOrderHeader AS soh,
					Sales.Customer AS c,
					sales.Store AS s
				 WHERE soh.CustomerID = c.CustomerID
	  			   and c.StoreID = s.BusinessEntityID
	  			   and s.Name = 'Riding Cycles'
				)
  and sod.ProductID IN
    			(SELECT p.ProductID
	  			 FROM Production.Product AS p
	  			 WHERE p.Name = 'Racing Socks, L'
				);