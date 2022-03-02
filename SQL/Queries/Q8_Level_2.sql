/*Show the product description for culture 'fr' for product with ProductID 736.*/
USE AdventureWorks2014
SELECT pd.Description
FROM Production.ProductDescription AS pd
WHERE pd.ProductDescriptionID =
				(SELECT pm.ProductDescriptionID
				 FROM Production.ProductModelProductDescriptionCulture AS pm
				 WHERE pm.ProductModelID =
							 (SELECT p.ProductModelID
							  FROM Production.Product AS p
							  WHERE p.ProductID = 736
							 )
				   and pm.CultureID = 'fr'
				);