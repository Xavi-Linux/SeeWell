SELECT 
    (SELECT COUNT(*) AS 'tcount' FROM station AS s) - COUNT(t2.dcities)
FROM
(SELECT DISTINCT s2.city AS 'dcities'  FROM station AS s2) AS t2;