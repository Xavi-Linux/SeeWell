/*How many items with ListPrice more than $1000 have been sold?*/
USE AdventureWorks2014
SELECT saleshist.ProductID,
       SUM(saleshist.OrderQty) AS 'TotalQ'
FROM
	(SELECT DISTINCT
			plph.ProductID,
			(SELECT MIN(plph1.StartDate)
			FROM Production.ProductListPriceHistory AS plph1
			WHERE plph.ProductID = plph1.ProductID
				and plph1.ListPrice > 1000) AS 'MinDate',
			CASE
			WHEN
				(SELECT plph3.EndDate
					FROM Production.ProductListPriceHistory AS plph3
					WHERE plph.ProductID = plph3.ProductID
					and plph3.ListPrice > 1000
					and plph3.StartDate = (SELECT MAX(plph4.StartDate)
											FROM Production.ProductListPriceHistory AS plph4
											WHERE plph.ProductID = plph4.ProductID
												and plph4.ListPrice > 1000)			
				) IS NULL
			THEN '2999-12-31 23:59:59'
			ELSE
				(SELECT MAX(plph2.EndDate)
					FROM Production.ProductListPriceHistory AS plph2
					WHERE plph.ProductID = plph2.ProductID
					and plph2.ListPrice > 1000)
			END AS 'MaxDate'
	FROM Production.ProductListPriceHistory AS plph
	WHERE plph.ListPrice > 1000
	) AS prodhist,
		
	(SELECT sod.ProductID,
           sod.OrderQty,
	       soh.OrderDate
	FROM Sales.SalesOrderDetail AS sod,
		 Sales.SalesOrderHeader AS soh
	WHERE sod.SalesOrderID = soh.SalesOrderID
	) AS saleshist

WHERE prodhist.ProductID = saleshist.ProductID
  and saleshist.OrderDate BETWEEN prodhist.MinDate AND prodhist.MaxDate
GROUP BY saleshist.ProductID
ORDER BY 2 DESC

