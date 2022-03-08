SELECT
    (SELECT MAX(c.population) FROM city AS c) -
    (SELECT MIN(c.population) FROM city AS c);