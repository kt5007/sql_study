-- set constant
SELECT '商品' AS mojiretsu, 38 AS kazu, '2009-02-24' AS hizuke, shohin_id, shohin_mei
FROM sample.Shohin;

-- 2.1
SELECT shohin_mei, torokubi FROM sample.Shohin WHERE torokubi >= '2009-04-28';

/* 2.2
nothing will be response
*/
SELECT *
FROM sample.Shohin
WHERE shiire_tanka > NULL;

-- 2.3
SELECT shohin_mei, hanbai_tanka, shiire_tanka
FROM sample.Shohin
WHERE hanbai_tanka >= shiire_tanka + 500;

SELECT shohin_mei, hanbai_tanka, shiire_tanka
FROM sample.Shohin
WHERE hanbai_tanka - 500 >= shiire_tanka;

SELECT shohin_mei, hanbai_tanka, shiire_tanka
FROM sample.Shohin
WHERE NOT hanbai_tanka < shiire_tanka + 500;

-- 2.4
SELECT shohin_mei, shohin_bunrui, hanbai_tanka * 0.9 - shiire_tanka AS rieki
FROM sample.Shohin
WHERE hanbai_tanka * 0.9 - shiire_tanka > 100
AND (shohin_bunrui = '事務用品' OR shohin_bunrui = 'キッチン用品');