SELECT
    CAST(t2.hacker_id AS VARCHAR(7)) + ' ' + h2.name
FROM
(SELECT
    t1.hacker_id,
    SUM(t1.FullScore) AS 'Total'
FROM
(SELECT
    s.submission_id,
    s.hacker_id,
    s.challenge_id,
    s.score,
    CASE
        WHEN s.score = d.score THEN 1
        ELSE 0
    END AS 'FullScore',
    c.difficulty_level
FROM
    difficulty AS d,
    challenges AS c,
    submissions AS s
WHERE d.difficulty_level = c.difficulty_level
  and c.challenge_id = s.challenge_id
) AS t1
GROUP BY
    t1.hacker_id
HAVING SUM(t1.FullScore) > 1
) AS t2,
hackers AS h2
WHERE h2.hacker_id = t2.hacker_id
ORDER BY
    t2.Total DESC,
    t2.hacker_id ASC;