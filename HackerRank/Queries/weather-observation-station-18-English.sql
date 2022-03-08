SELECT
    FORMAT(ROUND(
        ABS(MAX(s.lat_n) - MIN(s.lat_n)) + ABS(MAX(s.long_w) - MIN(s.long_w)),
        4), '#.0000')
FROM station AS s;