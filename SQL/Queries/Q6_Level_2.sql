/*A "Single Item Order" is a customer order where only one item is ordered.
 Show the SalesOrderID and the UnitPrice for every Single Item Order.*/
 USE AdventureWorks2014
 SELECT sod2.SalesOrderID,
        sod2.UnitPrice
 FROM Sales.SalesOrderDetail AS sod2
 WHERE sod2.SalesOrderID IN
					(SELECT sod.SalesOrderID 
					 FROM Sales.SalesOrderDetail AS sod
				     GROUP BY Sod.SalesOrderID
                     HAVING SUM(sod.OrderQty) = 1)
 
