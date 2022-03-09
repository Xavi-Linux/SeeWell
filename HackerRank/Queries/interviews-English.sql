SELECT
    con.contest_id,
    con.hacker_id,
    con.name,
    SUM(t1.total_submissions),
    SUM(t1.total_accepted_submissions),
    SUM(t1.total_views),
    SUM(t1.total_unique_views)
FROM
    contests AS con,
    colleges AS col,
    challenges AS cha,
    (
     SELECT
        COALESCE(submissions.challenge_id, vie.challenge_id) AS 'challenge_id',
        ISNULL(submissions.total_submissions, 0) AS 'total_submissions',
        ISNULL(submissions.total_accepted_submissions, 0) AS 'total_accepted_submissions',
        ISNULL(vie.total_views, 0) AS 'total_views',
        ISNULL(vie.total_unique_views, 0) AS 'total_unique_views' 
    FROM
        (SELECT
            ss.challenge_id AS 'challenge_id',
            SUM(ss.total_submissions) AS 'total_submissions',
            SUM(ss.total_accepted_submissions) AS 'total_accepted_submissions'
        FROM
            submission_stats AS ss 
        GROUP BY
            ss.challenge_id
        ) AS submissions
        FULL JOIN
        (SELECT
            vs.challenge_id AS 'challenge_id',
            SUM(vs.total_views) AS 'total_views',
            SUM(vs.total_unique_views) AS 'total_unique_views'     
        FROM
            view_stats AS vs
        GROUP BY
            vs.challenge_id
        ) AS vie
        ON submissions.challenge_id = vie.challenge_id
    ) As t1
WHERE con.contest_id = col.contest_id
  AND col.college_id = cha.college_id
  AND cha.challenge_id = t1.challenge_id
GROUP BY
    con.contest_id,
    con.hacker_id,
    con.name
HAVING
    (SUM(t1.total_submissions) > 0 AND
    SUM(t1.total_accepted_submissions) > 0 AND
    SUM(t1.total_views) > 0 AND
    SUM(t1.total_unique_views) > 0)
ORDER BY con.contest_id ASC;