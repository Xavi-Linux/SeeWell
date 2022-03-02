/*Show the CompanyName for all customers with an address in City 'Dallas'.*/
USE AdventureWorks2014;
SELECT s.Name
FROM Sales.Store AS s
WHERE s.BusinessEntityID IN (
	SELECT bea.BusinessEntityID
	FROM Person.BusinessEntityAddress AS bea
	WHERE bea.AddressID IN (
		SELECT a.AddressID
		FROM Person.Address AS a
		WHERE a.City = 'Dallas'
	)
);
