USE sample;
CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
AS
    SELECT shohin_bunrui, COUNT(*)
    FROM Shohin
    GROUP BY shohin_bunrui;

SELECT shohin_bunrui, cnt_shohin
FROM  ShohinSum;

/* なぜバックォーテーションの方はworkするのか？ */
DROP VIEW SohinSum;
DROP VIEW `sample`.`shohinsum`; 

-- 5.1
USE sample;
CREATE VIEW ViewRenshu5_1 (shohin_mei, hanbai_tanka, torokubi)
AS
    SELECT shohin_mei, hanbai_tanka, torokubi
    FROM Shohin
    WHERE hanbai_tanka >= 1000 
    AND torokubi = '2009-09-20';
SELECT * FROM ViewRenshu5_1;

-- 5.2
INSERT INTO ViewRenshu5_1 VALUES ('ナイフ', 300, '2009-11-02');

-- 5.3
SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, (SELECT AVG(hanbai_tanka) FROM Shohin) AS hanbai_tanka_all
FROM Shohin;

-- 5.4
CREATE VIEW AvgTankaByBunrui (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, avg_hanbai_tanka)
AS
    SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,
        (SELECT AVG(hanbai_tanka) AS avg_hanbai_tanka
        FROM Shohin S2
        WHERE S1.shohin_bunrui = S2.shohin_bunrui) AS avg_hanbai_tanka
    FROM Shohin S1;


