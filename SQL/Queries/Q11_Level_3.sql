/*For every customer with a 'Main Office' in Dallas show AddressLine1 of the 'Main Office'
 and AddressLine1 of the 'Shipping' address - if there is no shipping address leave it blank.
  Use one row per customer.*/
USE AdventureWorks2014
SELECT
	tmain.CustomerID,
	tmain.AddressLine1 AS 'Main Office',
	ISNULL(tship.AddressLine1,'') AS 'Shipping'
FROM
	(SELECT
		c.CustomerID,
		a.AddressLine1,
		bea.AddressID,
		adt.Name,
		a.City
	FROM
		Sales.Customer AS c,
		Person.BusinessEntityAddress AS bea,
		person.AddressType AS adt,
		Person.Address AS a
	WHERE c.StoreID = bea.BusinessEntityID
	  and bea.AddressTypeID = adt.AddressTypeID
	  and a.AddressID = bea.AddressID
	  and adt.Name = 'Main Office'
	  and a.City = 'Dallas'
	) AS tmain
LEFT JOIN
	(SELECT
		c.CustomerID,
		a.AddressLine1,
		bea.AddressID,
		adt.Name,
		a.City
	FROM
		Sales.Customer AS c,
		Person.BusinessEntityAddress AS bea,
		person.AddressType AS adt,
		Person.Address AS a
	WHERE c.StoreID = bea.BusinessEntityID
	  and bea.AddressTypeID = adt.AddressTypeID
	  and a.AddressID = bea.AddressID
	  and adt.Name = 'Shipping'
	) AS tship
ON tmain.CustomerID = tship.CustomerID