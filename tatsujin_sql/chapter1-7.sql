SELECT year, sale
FROM sales S1
WHERE sale = (SELECT sale
            FROM Sales S2
            WHERE S2.year = S1.year - 1)
ORDER BY year;

SELECT year, current_sale
FROM (
    SELECT
    year, sale AS current_sale,
    SUM(sale) OVER (ORDER BY year RANGE BETWEEN 1 PRECEDING AND 1 PRECEDING) AS pre_sale FROM Sales
    ) TMP
    WHERE current_sale = pre_sale
    ORDER BY year;

SELECT year, current_sale AS sale,
        CASE WHEN current_sale = pre_sale
            THEN '→'
            WHEN current_sale > pre_sale
            THEN '↑'
            WHEN current_sale < pre_sale
            THEN '↓'
        ELSE '-' END AS var
    FROM (
        SELECT year,
            sale AS current_sale,
            (SELECT sale
            FROM Sales S2
            WHERE S2.year = S1.year - 1) AS pre_sale
        FROM Sales S1) TMP
    ORDER BY year;

SELECT year, sale
FROM Sales2 S1
WHERE sale = 
(
    SELECT sale
    FROM Sales2 S2
    WHERE S2.year = 
        (SELECT MAX(year)
        FROM Sales2 S3
        WHERE S1.year > S3.year)
)
ORDER BY year;

SELECT reserver, start_date, end_date
FROM Reservations R1
WHERE EXISTS
    (SELECT *
    FROM Reservations R2
    WHERE R1.reserver <> R2.reserver
    AND ( R1.start_date BETWEEN R2.start_date AND R2.end_date 
    OR R1.end_date BETWEEN R2.start_date AND R2.end_date ));

SELECT reserver, next_reserver
FROM (SELECT reserver,
            start_date,
            end_date,
            MAX(start_date) OVER (ORDER BY start_date ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING) AS next_start_date,
            MAX(reserver) OVER (ORDER BY start_date ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING) AS next_reserver
        FROM Reservations) TMP
WHERE next_start_date BETWEEN start_date AND end_date;

SELECT pcr_date, pcr_amt,
FROM Accounts A1
WHERE pcr_date BETWEEN 
GROUP BY prc_date 

SELECT year, sale
FROM Sales2 S1
WHERE sale = 
(
    SELECT sale
    FROM Sales2 S2
    WHERE S2.year = 
        (SELECT MAX(year)
        FROM Sales2 S3
        WHERE S1.year > S3.year)
)
ORDER BY year;

