SELECT
    FORMAT(ROUND(t.lat_n, 4), '#0.0000')
FROM
(
SELECT
    s.lat_n,
    RANK() OVER(ORDER BY s.lat_n ASC) AS 'rank',
    (SELECT COUNT(*) FROM station AS s2) AS 'total'
FROM station AS s
) AS t
WHERE t.rank = CASE WHEN t.total % 2 != 0 THEN CAST((t.total/2)+1 AS INT)
                    WHEN t.total % 2 = 0 THEN CAST(t.total/2 AS INT)
               END;