/*Where did the racing socks go? List the product name and the CompanyName
 for all Customers who ordered ProductModel 'Racing Socks'*/
 USE AdventureWorks2014; 
SELECT DISTINCT
    t1.Name AS 'Product',
	s.Name AS 'CompanyName'
FROM
	Sales.SalesOrderDetail AS sod,
	(
	  SELECT p.ProductID, p.Name
	  FROM Production.Product AS p
	  WHERE p.Name LIKE 'Racing Socks%'
	) AS t1,
	Sales.SalesOrderHeader AS soh,
	Sales.Customer AS c,
	Sales.Store AS s
WHERE sod.ProductID = t1.ProductID
  and soh.SalesOrderID = sod.SalesOrderID
  and soh.CustomerID = c.CustomerID
  and c.StoreID = s.BusinessEntityID
ORDER BY 2;




