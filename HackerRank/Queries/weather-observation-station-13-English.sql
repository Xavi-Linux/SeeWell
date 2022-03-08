SELECT
    FORMAT(ROUND(SUM(s.lat_n), 4, 1), '#.0000')
FROM station AS s
WHERE s.lat_n > 38.7880
  and s.lat_n < 137.2345;