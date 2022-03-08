SELECT pt.Doctor, pt.Professor, Pt.Singer, pt.Actor
FROM(
SELECT
    RANK() OVER(PARTITION BY o.Occupation ORDER BY o.Name ASC) AS 'rank',
    o.Occupation,
    o.Name
FROM occupations AS o) As t
PIVOT
(   MAX([Name])
    FOR  [Occupation] in ( [Doctor], [Professor], [Singer], [Actor])
) AS pt;