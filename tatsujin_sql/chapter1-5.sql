-- 全員が出社する場合の集合
SELECT DISTINCT M1.meeting, M2.person
FROM meetings M1 CROSS JOIN Meetings M2;

SELECT DISTINCT M1.meeting, M2.person
FROM Meetings M1 CROSS JOIN Meetings M2
-- 出社している人の集合を引く
WHERE NOT EXISTS
    (SELECT *
    FROM Meetings M3
    WHERE M1.meeting = M3.meeting
    AND M2.person = M3.person);

SELECT DISTINCT student_id
FROM TestScores TS1
WHERE NOT EXISTS
    (SELECT *
    FROM TestScores TS@
    WHERE TS2.student_id = TS1.student_id
    AND TS2.score < 50);

SELECT shohin_bunrui, shohin_mei, hanbai_tanka
FROM Shohin S1
WHERE hanbai_tanka > 
    (SELECT AVG(hanbai_tanka)
    FROM Shohin S2
    WHERE S1.shohin_bunrui = S2.shohin_bunrui
    GROUP BY shohin_bunrui);

SELECT shohin_mei, shohin_bunrui, hanbai_tanka
FROM (SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
        AVG(hanbai_tanka) OVER(PARTITION BY shohin_bunrui) AS avg_tanka
        FROM Shohin) TMP
WHERE hanbai_tanka > avg_tanka;