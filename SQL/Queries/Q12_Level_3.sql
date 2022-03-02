/*For each order show the SalesOrderID and SubTotal calculated three ways:
A) From the SalesOrderHeader
B) Sum of OrderQty*UnitPrice*/
USE AdventureWorks2014
SELECT
	soh.SalesOrderID,
	soh.SubTotal,
	(SELECT SUM(sod.OrderQty * sod.UnitPrice * (1 - sod.UnitPriceDiscount)) 
	 FROM
		Sales.SalesOrderDetail AS sod
	 WHERE sod.SalesOrderID = soh.SalesOrderID
	 GROUP BY sod.SalesOrderID) AS 'Q_x_UnitPrice'	  
FROM 
	sales.SalesOrderHeader AS soh;