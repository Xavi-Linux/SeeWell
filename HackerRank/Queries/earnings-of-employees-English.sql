SELECT
    CAST(SUM((e2.months * e2.salary))/COUNT(*) AS VARCHAR(7)) + ' ' + CAST(COUNT(*) AS VARCHAR(5))
FROM employee AS e2
WHERE (e2.months * e2.salary) = (
SELECT TOP 1
    MAX(e.months * e.salary) AS 'Total'
FROM employee AS e);