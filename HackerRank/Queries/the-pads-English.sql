SELECT * FROM
(
    SELECT TOP 1000
        o.Name + '('+ LEFT(o.Occupation, 1) + ')' AS 'strin'
    FROM occupations AS o
    ORDER BY strin ASC
) AS t1
UNION
SELECT * FROM
(
SELECT TOP 1000
    'There are a total of ' + CAST(t2.total AS VARCHAR(5)) + ' ' + LOWER(t2.Occupation) + 's.' AS 'strin'
FROM
(
    SELECT
        o2.Occupation,
        COUNT(*) AS 'total'
    FROM occupations AS o2
    GROUP BY o2.Occupation
) AS t2
ORDER BY t2.total DESC, t2.Occupation ASC
) AS t3;