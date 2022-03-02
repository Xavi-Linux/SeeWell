/*Identify the three most important cities. Show the break down of top
 level product category against city.
 Assuming all totals are in dollars
 */
USE AdventureWorks2014;
SELECT 
	a.City,
	pc.Name,
	FORMAT(SUM(sod.LineTotal), 'C') AS 'LineTotal'
FROM
	Sales.SalesOrderHeader AS soh,
	Person.Address AS a,
	Sales.SalesOrderDetail AS sod,
	Production.Product AS p,
	Production.ProductSubcategory AS ps,
	Production.ProductCategory AS pc
WHERE soh.BillToAddressID = a.AddressID
	and soh.SalesOrderID = sod.SalesOrderID
	and sod.ProductID = p.ProductID
	and p.ProductSubcategoryID = ps.ProductSubcategoryID
	and ps.ProductCategoryID = pc.ProductCategoryID
	and a.City IN
		(SELECT t.City
		 FROM 
			(SELECT TOP 3
				a.City,
				SUM(soh.SubTotal) As 'Total'
			 FROM
				sales.SalesOrderHeader AS soh,
				Person.Address AS a
				WHERE soh.BillToAddressID = a.AddressID
				GROUP BY
				a.City
				ORDER BY
					'Total' DESC
			 ) AS t
		) 
GROUP BY
	a.City,
	pc.Name;



