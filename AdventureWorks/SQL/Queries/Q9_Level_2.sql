/*Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest.
 For each order show the CompanyName and the SubTotal and the total weight of the order.*/
/*Assuming that we just want to show B2B sales; Thus, a customer needs to have a shop registered in the DB*/
USE AdventureWorks2014;
SELECT
	t1.SalesOrderID,
    t1.CompanyName,
	t1.SubTotal,
	t2.TotalWeight,
	t2.UnitMeasure
FROM
	(
	SELECT
		soh.SalesOrderID,
		s.Name AS 'CompanyName',
		soh.SubTotal
	FROM
		Sales.SalesOrderHeader AS soh,
		Sales.Customer AS c,
		Sales.Store AS S
	WHERE soh.CustomerID = c.CustomerID
	  and c.StoreID = s.BusinessEntityID
	) AS t1,
	(
	SELECT
		sod.SalesOrderID,
		um.Name AS 'UnitMeasure',
		SUM(sod.OrderQty * ISNULL(p.Weight,0)) AS 'TotalWeight'
	FROM
		Sales.SalesOrderDetail AS sod,
		Production.Product AS p,
		Production.UnitMeasure AS um
	WHERE sod.ProductID = p.ProductID
	  and p.WeightUnitMeasureCode = um.UnitMeasureCode
	GROUP BY sod.SalesOrderID,
			 um.Name
	) AS t2
WHERE t1.SalesOrderID = t2.SalesOrderID
ORDER BY t1.SubTotal ASC;
