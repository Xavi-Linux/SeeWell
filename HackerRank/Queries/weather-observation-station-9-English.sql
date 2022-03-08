SELECT DISTINCT
    s.city
FROM station As s
WHERE s.city LIKE '[^ a,e,i,o,u]%';