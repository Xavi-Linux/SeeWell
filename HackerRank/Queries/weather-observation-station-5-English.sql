SELECT * FROM
(SELECT TOP 1
    s.city,
    len(s.city) AS 'len'
FROM station AS s
ORDER BY
    2 DESC,
    1 ASC) AS t1
UNION
SELECT * FROM
(SELECT TOP 1
    s2.city,
    len(s2.city) As 'len'
FROM station AS s2
ORDER BY
    2 ASC,
    1 ASC) As t2;