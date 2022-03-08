SELECT
    SUM(c.population)
FROM city AS c
WHERE c.countrycode = 'JPN';