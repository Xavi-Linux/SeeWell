SELECT
    FORMAT(ROUND(s.long_w, 4, 0), '#.0000')
FROM station AS s
WHERE s.lat_n = (SELECT MAX(s2.lat_n) FROM station AS s2 WHERE s2.lat_n < 137.235);