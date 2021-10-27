SELECT shohin_bunrui, COUNT(*)
FROM sample.shohin_bunrui
GROUP BY shohin_bunrui
HAVING COUNT(*) = 2;

-- 3.1
/*
- group byで使われていない列名がselectに存在
- whereがgroup byの後に存在する
*/

-- 3.2
SELECT shohin_bunrui, SUM(hanbai_tanka), SUM(shiire_tanka)
FROM sample.shohin
GROUP BY shohin_bunrui
HAVING SUM(hanbai_tanka) > SUM(shiire_tanka) * 1.5;

-- 3.3
/*
torokubi を DESC
日付で並んでいるものがまた並び替えられていた
*/