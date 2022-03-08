SELECT
    c.name
FROM
    city AS c,
    country AS co
WHERE c.countrycode = co.code
  and co.continent = 'Africa';