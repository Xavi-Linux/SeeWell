/*How many products in ProductCategory 'Cranksets' have been sold to an address in 'London'?*/
USE AdventureWorks2014
SELECT
	SUM(sod.OrderQty) AS 'TotalSales'
FROM 
	Sales.SalesOrderDetail AS sod,
	Production.Product AS p,
	Production.ProductSubcategory AS psc
WHERE psc.ProductSubcategoryID = p.ProductSubcategoryID
  and p.ProductID = sod.ProductID
  and psc.Name = 'Cranksets'
  and sod.SalesOrderID IN
			 (SELECT soh.SalesOrderID
			  FROM Person.Address AS a,
				   Sales.SalesOrderHeader AS soh
			  WHERE a.AddressID = soh.ShipToAddressID
				and a.City = 'London'
			 )

