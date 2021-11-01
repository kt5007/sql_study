SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
    RANK () OVER (
        PARTITION BY shohin_bunrui
        ORDER BY hanbai_tanka
        ) AS ranking
FROM Shohin;

-- 順位付け
SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
    RANK () OVER ( ORDER BY hanbai_tanka ) AS ranking,
    DENSE_RANK () OVER ( ORDER BY hanbai_tanka ) AS dense_ranking,
    ROW_NUMBER () OVER ( ORDER BY hanbai_tanka ) AS row_num
FROM Shohin;

-- 累計
SELECT shohin_id, shohin_mei, hanbai_tanka,
    SUM(hanbai_tanka) OVER (ORDER BY shohin_id) AS current_sum
FROM Shohin;

-- 移動平均
SELECT shohin_id, shohin_mei, hanbai_tanka,
    AVG(hanbai_tanka) OVER (ORDER BY shohin_id
        ROWS 2 PRECEDING) AS moving_sum
FROM Shohin;


SELECT shohin_id, shohin_mei, hanbai_tanka,
    AVG(hanbai_tanka) OVER (ORDER BY shohin_id
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_avg
FROM Shohin;

-- rollup 
SELECT shohin_bunrui, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY shohin_bunrui WITH ROLLUP;

SELECT shohin_bunrui, torokubi, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY shohin_bunrui, torokubi WITH ROLLUP;

SELECT 
    CASE WHEN GROUPING(shohin_bunrui) = 1
    THEN '商品分類　合計'
    ELSE shohin_bunrui END AS shohin_bunrui,
    CASE WHEN GROUPING(torokubi) = 1
    THEN '登録日　合計'
    ELSE CAST(torokubi AS VARCHAR(16)) END AS torokubi,
    SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY shohin_bunrui, torokubi WITH ROLLUP ;

/*
1000
1000
4000
4000
6800
以降6800
*/
SELECT shohin_id, shohin_mei, hanbai_tanka, MAX(hanbai_tanka) OVER(ORDER BY shohin_id) AS current_max_tanka
FROM Shohin;
-- 8.2
SELECT torokubi
FROM Shohin
GROUP BY GROUPING SETS (torokubi, shohin_mei);