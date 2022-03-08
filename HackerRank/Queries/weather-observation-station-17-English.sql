SELECT
    FORMAT(ROUND(s.long_w, 4), '#.0000')
FROM station AS s
WHERE s.lat_n = (
                 SELECT MIN(s2.lat_n)
                 FROM station AS s2
                 WHERE s2.lat_n > 38.7780);