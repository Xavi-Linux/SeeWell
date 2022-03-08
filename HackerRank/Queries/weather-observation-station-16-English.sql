SELECT
    FORMAT(ROUND(MIN(s.lat_n), 4),'#.0000')
FROM station AS s
WHERE s.lat_n > 38.7780;