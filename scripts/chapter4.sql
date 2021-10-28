CREATE TABLE sample.ShohinCopy
(shohin_id      CHAR(4)         NOT NULL,
shohin_mei      VARCHAR(100)    NOT NULL,
shohin_bunrui   VARCHAR(32)     NOT NULL,
hanbai_tanka    INTEGER         ,
shiire_tanka    INTEGER         ,
torokubi        DATE            ,
PRIMARY KEY (shohin_id));

INSERT INTO sample.ShohinCopy (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi FROM sample.Shohin;

-- 4.1
/*
受け取る結果は空のDBになる
*/

-- 4.2
/*
商品IDが重複してエラー発生
*/

-- 4.3
CREATE TABLE sample.Shohinsaeki
(shohin_id      CHAR(4)         NOT NULL,
shohin_mei      VARCHAR(100)    NOT NULL,
hanbai_tanka    INTEGER         ,
shiire_tanka    INTEGER         ,
saeki           INTEGER         ,
PRIMARY KEY(shohin_id));

INSERT INTO sample.Shohinsaeki (shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, saeki)
SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka AS saeki
FROM sample.Shohin;

-- 4.4
START TRANSACTION;

UPDATE sample.Shohinsaeki
SET hanbai_tanka = 3000, saeki = hanbai_tanka - shiire_tanka
WHERE shohin_id = '0003';

COMMIT;