/*Show how many orders are in the following ranges (in $):

    RANGE      Num Orders      Total Value
    0-  99
  100- 999
 1000-9999
10000-
Assuming all totals are in dollars
*/
USE AdventureWorks2014;
SELECT
	t.Range,
	FORMAT(
	   (SELECT
			COUNT(*)
		FROM
			Sales.SalesOrderHeader AS soh
	    WHERE soh.TotalDue between t.LB and t.UB
	    )
	, 'N0') AS 'Num_Orders',
	 FORMAT(
		(SELECT
			SUM(soh.TotalDue)
	     FROM
			Sales.SalesOrderHeader AS soh
		 WHERE soh.TotalDue between t.LB and t.UB
	    )
	, 'C') AS 'Total_Value'
FROM
	(VALUES ('0-99', 0, 99),
            ('100-999', 100, 999),
	        ('1000-9999', 1000, 9999),
			('10000-', 10000, 99999999)
	) AS t(Range, LB, UB)
