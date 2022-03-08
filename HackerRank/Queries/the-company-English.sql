SELECT
    c.company_code,
    c.founder,
    (SELECT COUNT (DISTINCT lm.lead_manager_code) FROM lead_manager AS lm WHERE lm.company_code=c.company_code) AS 'lead_managers',
    (SELECT COUNT (DISTINCT sm.senior_manager_code) FROM senior_manager AS sm WHERE sm.company_code=c.company_code) AS 'senior_managers',
    (SELECT COUNT (DISTINCT m.manager_code) FROM manager AS m WHERE m.company_code=c.company_code) AS 'managers',
    (SELECT COUNT (DISTINCT e.employee_code) FROM employee AS e WHERE e.company_code=c.company_code) AS 'employees'
FROM
    company AS c;