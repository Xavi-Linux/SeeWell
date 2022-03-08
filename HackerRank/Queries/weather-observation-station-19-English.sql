SELECT
    FORMAT(
    SQRT(POWER(MAX(s.lat_n) - MIN(s.lat_n), 2) + POWER(MIN(s.long_w) - MAX(s.long_w), 2)), '#.0000')
FROM station AS s;