SELECT
    FORMAT(ROUND(SUM(s.lat_n), 2), '#.00')  + ' ' + 
    FORMAT(ROUND(SUM(s.long_w), 2), '#.00')
FROM station AS s;