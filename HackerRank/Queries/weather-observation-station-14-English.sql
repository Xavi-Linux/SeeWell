SELECT
    FORMAT(ROUND(MAX(s.lat_n),4,1),'#.0000')
FROM station AS s
WHERE s.lat_n < 137.2345;