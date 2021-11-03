-- 重複あり
SELECT P1.name AS name_1, P2.name AS name_2
FROM Products P1 CROSS JOIN Products P2;

-- 順序対
SELECT P1.name AS name_1, P2.name AS name_2
FROM Products P1 INNER JOIN Products P2
ON P1.name <> P2.name;

-- 非順序対
SELECT P1.name AS name_1, P2.name AS name_2
FROM Products P1 INNER JOIN Products P2
ON P1.name > P2.name;

SELECT DISTINCT P1.name, P1.price
FROM Products P1 INNER JOIN Products P2
ON P1.price = P2.price
AND P1.name <> P2.name
ORDER BY P1.price;

-- 3-1
SELECT DISTINCT P1.name AS name_1, P2.name AS name_2
FROM Products P1 INNER JOIN Products P2
ON P1.name >= P2.name;

-- 3-2
DELETE FROM Products P1
MIN(name) OVER (PARTITION BY name, price ROWS CURRENT ROW) AS uni_id