SELECT
    b.N,
    CASE
        WHEN (SELECT b2.P FROM bst AS b2 WHERE b.N=b2.N) IS NULL THEN 'Root'
        WHEN EXISTS (SELECT * FROM bst AS b3 Where b.N=b3.P) THEN 'Inner'
        ELSE 'Leaf'
    END
FROM bst AS b
ORDER BY 1 ASC;