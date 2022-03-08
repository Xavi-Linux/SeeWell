SELECT DISTINCT
    s.city
FROM Station AS s
WHERE s.id % 2 = 0;