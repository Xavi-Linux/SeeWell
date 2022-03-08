DECLARE @rows AS INT;
SELECT @rows=COUNT(*)
FROM students;

SELECT * FROM
(SELECT TOP(@rows)
    s.Name,
    (SELECT g.grade FROM grades AS g WHERE s.marks BETWEEN g.min_mark AND g.max_mark) AS 'Grade',
    s.Marks
FROM
    students AS s
WHERE (SELECT g.grade FROM grades AS g WHERE s.marks BETWEEN g.min_mark AND g.max_mark)  > 7
) AS t1
UNION
SELECT * FROM
(SELECT TOP(@rows)
    NULL AS 'Name',
    (SELECT g.grade FROM grades AS g WHERE s.marks BETWEEN g.min_mark AND g.max_mark) AS 'Grade',
    s.Marks
FROM
    students AS s
WHERE (SELECT g.grade FROM grades AS g WHERE s.marks BETWEEN g.min_mark AND g.max_mark) < 8
) AS t2
ORDER BY 2 DESC;
