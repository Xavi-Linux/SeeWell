SELECT
    t2.start_date,
    t2.min_date
FROM
(SELECT
    t.start_date,
    CASE WHEN t.[type] = 'START' THEN
    (SELECT
        MIN(t1.end_date)
     FROM
        (SELECT
            p.start_date,
            p.end_date,
            CASE
                WHEN NOT EXISTS (SELECT * FROM projects AS p2 WHERE p.start_date =                         p2.end_date) THEN 'START'
                WHEN EXISTS (SELECT * FROM projects AS p3 WHERE p.end_date=p3.start_date) THEN 'MID'
                ELSE 'END'
            END AS 'type',
            ROW_NUMBER() OVER(ORDER BY p.start_date) AS 'RowNum'
        FROM projects AS p
        ) AS t1
     WHERE t1.[type] = 'END'
       and t1.end_date > t.start_date
    )
    ELSE t.end_date
    END AS 'min_date'
FROM
(SELECT
    p.start_date,
    p.end_date,
    CASE
        WHEN NOT EXISTS (SELECT * FROM projects AS p2 WHERE p.start_date = p2.end_date) AND NOT EXISTS (SELECT * FROM projects AS p4 WHERE p.end_date =        p4.start_date) THEN 'START-END'
        WHEN NOT EXISTS (SELECT * FROM projects AS p2 WHERE p.start_date = p2.end_date) THEN 'START'
        WHEN EXISTS (SELECT * FROM projects AS p3 WHERE p.end_date=p3.start_date)                  THEN 'MID'
        ELSE 'END'
    END AS 'type',
    ROW_NUMBER() OVER(ORDER BY p.start_date) AS 'RowNum'
FROM projects AS p
) AS t
WHERE t.[type] = 'START'
   OR t.[type] = 'START-END'
) AS t2
ORDER BY
    DATEDIFF(d,t2.start_date, t2.min_date) ASC,
    t2.start_date ASC;