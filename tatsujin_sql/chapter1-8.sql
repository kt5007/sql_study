SELECT C0.name,
    CASE WHEN C1.name IS NOT NULL THEN '○' ELSE NULL END AS "SQL入門",
    CASE WHEN C2.name IS NOT NULL THEN '○' ELSE NULL END AS "UNIX基礎",
    CASE WHEN C3.name IS NOT NULL THEN '○' ELSE NULL END AS "Java中級"
    FROM (SELECT DISTINCT name FROM Courses) C0
    LEFT OUTER JOIN
        (SELECT name FROM Courses WHERE course = 'SQL入門') C1
        ON C0.name = C1.name
        LEFT OUTER JOIN
            (SELECT name FROM Courses WHERE course = 'UNIX基礎') C2
            ON C0.name = C2.name
            LEFT OUTER JOIN
                (SELECT name FROM Courses WHERE course = 'UNIX基礎') C3
                ON C0.name = C3.name;

SELECT C0.name,
    (SELECT '○'
    FROM Courses C1
    WHERE course = 'SQL入門'
    AND C1.name = C0.name) AS "SQL入門",
    (SELECT '○'
    FROM Courses C2
    WHERE course = 'UNIX基礎'
    AND C2.name = C0.name) AS "UNIX基礎",
    (SELECT '○'
    FROM Courses C3
    WHERE course = 'Java中級'
    AND C3.name = C0.name) AS "Java中級"
FROM (SELECT DISTINCT name FROM Courses) C0;