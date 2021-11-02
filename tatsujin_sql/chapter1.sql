/* テーブルの作成 */
CREATE TABLE PopTbl
(pref_name VARCHAR(32) PRIMARY KEY,
    population INTEGER NOT NULL);

INSERT INTO PopTbl VALUES('徳島', 100);
INSERT INTO PopTbl VALUES('香川', 200);
INSERT INTO PopTbl VALUES('愛媛', 150);
INSERT INTO PopTbl VALUES('高知', 200);
INSERT INTO PopTbl VALUES('福岡', 300);
INSERT INTO PopTbl VALUES('佐賀', 100);
INSERT INTO PopTbl VALUES('長崎', 200);
INSERT INTO PopTbl VALUES('東京', 400);
INSERT INTO PopTbl VALUES('群馬', 50);

-- mysql,pstgresでのみ有効
SELECT CASE pref_name
    WHEN '徳島' THEN '四国'
    WHEN '香川' THEN '四国'
    WHEN '愛媛' THEN '四国'
    WHEN '高知' THEN '四国'
    WHEN '福岡' THEN '九州'
    WHEN '佐賀' THEN '九州'
    WHEN '長崎' THEN '九州'
    ELSE 'その他' END AS prefectures,
    SUM(population)
    FROM PopTbl
    GROUP BY prefectures;

/* 演習問題1-1：複数列の最大値（1-3とも兼用） */
CREATE TABLE Greatests
(key CHAR(1) PRIMARY KEY,
 x   INTEGER NOT NULL,
 y   INTEGER NOT NULL,
 z   INTEGER NOT NULL);

INSERT INTO Greatests VALUES('A', 1, 2, 3);
INSERT INTO Greatests VALUES('B', 5, 5, 2);
INSERT INTO Greatests VALUES('C', 4, 7, 1);
INSERT INTO Greatests VALUES('D', 3, 3, 8);

-- 演習1-1 ☓
SELECT CASE
    WHEN x > y THEN x ELSE y END AS greatest
FROM Greatests;

SELECT CASE
    CASE WHEN WHEN x > y THEN x ELSE y END < z
    THEN z
    ELSE WHEN x > y THEN x ELSE y END
    AS greatest
FROM Greatests;

-- 1-2
/* 異なる条件の集計を1つのSQLで行う */
CREATE TABLE PopTbl2
(pref_name VARCHAR(32),
 sex CHAR(1) NOT NULL,
 population INTEGER NOT NULL,
    PRIMARY KEY(pref_name, sex));

INSERT INTO PopTbl2 VALUES('徳島', '1',	60 );
INSERT INTO PopTbl2 VALUES('徳島', '2',	40 );
INSERT INTO PopTbl2 VALUES('香川', '1',	100);
INSERT INTO PopTbl2 VALUES('香川', '2',	100);
INSERT INTO PopTbl2 VALUES('愛媛', '1',	100);
INSERT INTO PopTbl2 VALUES('愛媛', '2',	50 );
INSERT INTO PopTbl2 VALUES('高知', '1',	100);
INSERT INTO PopTbl2 VALUES('高知', '2',	100);
INSERT INTO PopTbl2 VALUES('福岡', '1',	100);
INSERT INTO PopTbl2 VALUES('福岡', '2',	200);
INSERT INTO PopTbl2 VALUES('佐賀', '1',	20 );
INSERT INTO PopTbl2 VALUES('佐賀', '2',	80 );
INSERT INTO PopTbl2 VALUES('長崎', '1',	125);
INSERT INTO PopTbl2 VALUES('長崎', '2',	125);
INSERT INTO PopTbl2 VALUES('東京', '1',	250);
INSERT INTO PopTbl2 VALUES('東京', '2',	150);

SELECT
    CASE sex
    WHEN '1' THEN '男'
    ELSE '女' END AS sexs,
    SUM(population) AS '全国',
    SUM(CASE WHEN pref_name = '徳島' THEN population ELSE 0 END) AS '徳島',
    SUM(CASE WHEN pref_name = '香川' THEN population ELSE 0 END) AS '香川',
    SUM(CASE WHEN pref_name = '愛媛' THEN population ELSE 0 END) AS '愛媛',
    SUM(CASE WHEN pref_name = '高知' THEN population ELSE 0 END) AS '高知',
    SUM(CASE WHEN pref_name = '徳島' OR pref_name = '香川' OR pref_name = '愛媛' OR pref_name = '高知' THEN population ELSE 0 END) AS 四国
FROM PopTbl2
GROUP BY sexs;


-- ランダムに並び替え
select [列名] from [テーブル名] order by NEWID()