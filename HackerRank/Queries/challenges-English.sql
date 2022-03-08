SELECT
    t5.hacker_id,
    h3.name,
    t5.cts
FROM
(
SELECT
    c2.hacker_id,
    COUNT(*) AS 'cts'
FROM
    challenges AS c2
GROUP BY
    c2.hacker_id
HAVING COUNT(*) =
        (SELECT
            MAX(t3.cts)
         FROM
            (
             SELECT
                t1.cts,
                COUNT(*) AS 'times'
             FROM
                (
                 SELECT
                    c.hacker_id,
                    COUNT(*) AS 'cts'
                 FROM
                    challenges AS c
                GROUP BY
                    c.hacker_id
                ) AS t1
             GROUP BY
                t1.cts ) AS t3)
     OR COUNT(*) IN
        (SELECT
             t4.cts
         FROM
            (
             SELECT
                t1.cts,
                COUNT(*) AS 'times'
             FROM
                (
                 SELECT
                    c.hacker_id,
                    COUNT(*) AS 'cts'
                 FROM
                    challenges AS c
                GROUP BY
                    c.hacker_id
                ) AS t1
            GROUP BY
                t1.cts
            HAVING COUNT(*) = 1
        ) AS t4)
    ) AS t5,
hackers AS h3
WHERE t5.hacker_id = h3.hacker_id
ORDER BY
    t5.cts DESC,
    t5.hacker_id ASC;