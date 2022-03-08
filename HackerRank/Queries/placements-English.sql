SELECT
    t.name
FROM
(
SELECT
    s.id,
    s.name,
    p.salary,
    (
        SELECT p2.salary
        FROM packages AS p2
        WHERE p2.id = f.friend_id    
    ) As 'Friends'
FROM
    students AS s,
    friends AS f,
    Packages AS p
WHERE s.id = f.id
  AND s.id = p.id
) AS t
WHERE t.salary < t.Friends
ORDER BY t.Friends ASC;
