SELECT DISTINCT
    s.city
FROM
    station AS s
WHERE s.city LIKE '[a,e,i,o,u]%[a,e,i,o,u]';