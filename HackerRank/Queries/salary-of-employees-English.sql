SELECT
    e.name
FROM employee AS e
WHERE e.salary > 2000
 and e.months < 10
ORDER BY e.employee_id ASC;