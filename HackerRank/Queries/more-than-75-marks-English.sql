SELECT
    t1.name
FROM
(SELECT
    s.name,
    RIGHT(s.name, 3) AS 'r',
    s.id
FROM students AS s
WHERE s.marks > 75
) AS t1
ORDER BY
    t1.r ASC,
    t1.id ASC;