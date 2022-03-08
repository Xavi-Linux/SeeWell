SELECT
    CASE
        WHEN t.A + t.B <= t.C OR t.A + t.C <= t.B OR t.B + t.C <= T.A THEN
            'Not A Triangle'
        WHEN t.A != t.B AND t.A != T.C  AND t.B != t.C THEN
            'Scalene'
        WHEN t.A = t.B AND t.A = t.C THEN
            'Equilateral'
        ELSE
            'Isosceles'
    END
FROM triangles AS t;