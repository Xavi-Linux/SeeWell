/*Show the first name and the email address of customer with CompanyName 'Bike World'*/
USE AdventureWorks2014
SELECT t1.FirstName,
       ea.EmailAddress
FROM (
	SELECT p.BusinessEntityID, p.FirstName
	FROM Person.Person AS p
	WHERE p.BusinessEntityID IN (
		SELECT c.PersonID
		FROM Sales.Customer AS c
		WHERE c.StoreID IN (
			SELECT s.BusinessEntityID
			FROM Sales.Store AS s
			WHERE s.Name = 'Bike World'
		)
	and c.PersonID IS NOT NULL
	)
) AS t1,
  Person.EmailAddress AS ea
WHERE t1.BusinessEntityID = ea.BusinessEntityID;





