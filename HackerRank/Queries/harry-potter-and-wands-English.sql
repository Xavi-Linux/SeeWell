SELECT
    t2.id,
    t2.age,
    t2.coins_needed,
    t2.[power]
FROM
(SELECT
    w2.id,
    wp2.age,
    w2.[power],
    w2.coins_needed
FROM
    wands AS w2,
    wands_property AS wp2
WHERE w2.code = wp2.code
  and wp2.is_evil = 0) As t2,
(SELECT
    wp.age,
    w.[power],
    MIN(w.coins_needed) AS 'coins_needed'
FROM
    wands AS w,
    wands_property AS wp
WHERE w.code = wp.code
  and wp.is_evil = 0
GROUP BY wp.age, w.[power]) AS t1
WHERE t1.age = t2.age
  and t1.[power] = t2.[power]
  and t1.coins_needed = t2.coins_needed
ORDER BY 4 DESC, 2 DESC;
