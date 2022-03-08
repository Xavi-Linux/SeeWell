SELECT
    h2.hacker_id,
    h2.name,
    ttotals.TotalScore
FROM
(
SELECT
    h.hacker_id,
    SUM(tscores.MaxScore) As 'TotalScore'
FROM
(
    SELECT
        s.hacker_id,
        s.challenge_id,
        MAX(s.score) AS 'MaxScore'
    FROM
        submissions AS s
    GROUP BY
        s.hacker_id,
        s.challenge_id
) AS tscores,
hackers AS h
WHERE h.hacker_id = tscores.hacker_id
GROUP BY
    h.hacker_id
HAVING SUM(tscores.MaxScore) > 0
) AS ttotals,
hackers AS h2
WHERE h2.hacker_id = ttotals.hacker_id
ORDER BY
    ttotals.TotalScore DESC,
    h2.hacker_id ASC;