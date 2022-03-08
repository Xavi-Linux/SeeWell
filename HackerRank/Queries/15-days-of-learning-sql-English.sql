SELECT
    t3.submission_date,
    t3.tunique,
    t4.hid,
    t4.hname
FROM
(
SELECT
    t2.submission_date,
    COUNT(*) AS 'tunique'
FROM
(
SELECT
    t1.submission_date,
    t1.hacker_id,
    t1.Total,
    DAY(t1.submission_date) AS 'day'
FROM
(SELECT
    s.submission_date,
    s.hacker_id,
    (SELECT COUNT(DISTINCT s2.submission_date)
     FROM submissions AS s2
     WHERE s2.hacker_id = s.hacker_id
       and s2.submission_date <= s.submission_date
    ) As 'Total'
FROM submissions AS s
GROUP BY
    s.submission_date,
    s.hacker_id
) AS t1
WHERE t1.Total = DAY(t1.submission_date)
) AS t2
GROUP BY
    t2.submission_date
) AS t3,

(
SELECT DISTINCT
    s3.submission_date,
    (SELECT hacker.hacker_id
     FROM
        (SELECT TOP 1
            s4.hacker_id,
            COUNT(s4.submission_id) AS 'tcount'
         FROM submissions AS s4
         WHERE s4.submission_date = s3.submission_date
         GROUP BY s4.hacker_id
         ORDER BY COUNT(s4.submission_id) DESC, s4.hacker_id ASC
        ) AS hacker
    ) AS 'hid',
    (SELECT h.name
     FROM
        (SELECT TOP 1
            s4.hacker_id,
            COUNT(s4.submission_id) AS 'tcount'
         FROM submissions AS s4
         WHERE s4.submission_date = s3.submission_date
         GROUP BY s4.hacker_id
         ORDER BY COUNT(s4.submission_id) DESC, s4.hacker_id ASC
        ) AS hacker,
         hackers AS h
         WHERE hacker.hacker_id = h.hacker_id
    ) AS 'hname'
FROM
    submissions AS s3
) AS t4
WHERE t3.submission_date = t4.submission_date
ORDER BY 1 ASC;