SELECT
CAST(CEILING(
    AVG(CAST(e.Salary AS FLOAT)) - 
    AVG(CAST(REPLACE(e.Salary,
                '0',
                '') AS FLOAT)
        )
) AS INT)
FROM employees AS e;