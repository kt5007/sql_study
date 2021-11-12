-- 連続性の確認
SELECT '歯抜けあり' AS gap
FROM SeqTbl
HAVING MAX(seq) - MIN(seq) + 1 <> COUNT(*);

SELECT CASE WHEN COUNT(*) = 0 THEN 'テーブルが空'
    WHEN  COUNT(*) <> MAX(seq) - MIN(seq) + 1 THEN '歯抜けあり'
    ELSE '連続' END AS gap
    FROM SeqTbl;

-- 歯抜けしている部分の確認
SELECT CASE WHEN COUNT(*) = 0 OR MIN(seq) > 1
    THEN 1
    ELSE (SELECT MIN(seq + 1)
        FROM SeqTbl S1
        WHERE NOT EXISTS
            (SELECT *
            FROM SeqTbl S2
            WHERE S2.seq = S1.seq + 1)) END
    FROM SeqTbl;

SELECT income, COUNT(*) AS cnt
FROM Graduates
GROUP BY income
HAVING COUNT(*) >= ALL(SELECT COUNT(*)
    FROM Graduates
    GROUP BY income);

-- 問題1
SELECT class
FROM TestResults
GROUP BY class
HAVING COUNT(*) * 0.75 <= SUM(
    CASE WHEN score >= 80 
        THEN 1
        ELSE 0
        END
);

SELECT class
FROM TestResults
GROUP BY class
HAVING 
    SUM(CASE 
        WHEN score >= 50 AND sex = '男' THEN 1
        ELSE 0
    END) >
    SUM(CASE 
        WHEN score >= 50 AND sex = '女' THEN 1
        ELSE 0
    END);

-- 演習1
SELECT CASE WHEN HAVING COUNT(*) <> MAX(seq) THEN '歯抜けあり'
    
FROM SeqTbl