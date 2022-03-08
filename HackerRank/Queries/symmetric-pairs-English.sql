SELECT DISTINCT
    t.x,
    t.y
FROM
(
SELECT
    f.x,
    f.y,
    (SELECT COUNT(*) FROM functions AS f2 WHERE f.x = f2.y AND f.y = f2.x) AS 'pairs'
FROM functions AS f
) AS t
WHERE ((t.x != t.y AND t.pairs > 0)
   OR (t.x = t.y AND t.pairs = 2)
      )
  AND t.x <= t.y
ORDER BY 1 ASC;