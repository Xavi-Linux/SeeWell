SELECT
    co.continent,
    CAST(FLOOR(AVG(c.population)) AS INT)
FROM
    city AS c,
    country AS co
WHERE c.countrycode = co.code
GROUP BY
    co.continent;