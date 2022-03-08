SELECT DISTINCT
    s.city
FROM station As s
WHERE s.city LIKE '%[^ a,e,i,o,u]'
   OR s.city LIKE '[^a,e,i,o,u]%';