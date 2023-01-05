/* SALES INSIGHTS DATA ANALYSIS USING SQL */

/*SHOWS ALL RECORDS IN THE SALES */

SELECT * FROM dbo.customers;
SELECT * FROM dbo.products;
SELECT * FROM dbo.date;
SELECT * FROM dbo.markets;
SELECT * FROM dbo.transactions;

/* ALL RECORDS IN TRANSACTION TABLE */

SELECT COUNT (*) FROM transactions;

/* ALL CUSTOMERS */

SELECT COUNT(*) FROM customers;

/* TOP 5 TRANSACTIONS FROM THE CHENNAI */

SELECT TOP(5) * FROM transactions
WHERE market_code='Mark001';

/* TOTAL TRANSACTIONS FROM THE CHENNAI */

SELECT COUNT (*) FROM transactions 
WHERE market_code='Mark001';

/* TRANSACTIONS WHERE CURRENCY IS USD */

SELECT * FROM transactions 
WHERE currency= 'USD';

/* TRANSACTIONS IN YEAR 2020 BY JOINING TWO TABLES */

SELECT * FROM transactions T
JOIN date D ON
T.order_date =D.date
WHERE year='2020';

/* TOTAL REVENUE IN 2020 */

SELECT SUM(sales_amount) AS REVENUE2020 FROM transactions T
JOIN date D ON
T.order_date =D.date
WHERE year='2020';

/* TOTAL REVENUE IN 2019 */

SELECT SUM(sales_amount) AS REVENUE2019 FROM transactions T
JOIN date D ON
T.order_date =D.date
WHERE year='2019';

/* DIFFERENT PRODUCTS IN MARKET */

SELECT DISTINCT(product_code)
FROM products;

/* CUSTOMERs NAME WITH SALES AMOUNT LESS THAN 500 */

SELECT custmer_name,MAX(sales_amount) AS sales_amt FROM customers C
JOIN transactions T
ON C.customer_code=T.customer_code
WHERE sales_amount<500
GROUP BY custmer_name
ORDER BY sales_amt asc;

/* SELECT MARKET NAME WHOSE ZONE IS IN CENTRAL */

SELECT * FROM markets
WHERE zone  like 'C%'

SELECT * FROM markets
WHERE zone = 'Central'

/* CUSTOMERS WHO PURCHASE LESS THAN 5 IN QUANTITY */

SELECT c.customer_code,custmer_name,sales_qty FROM customers c
JOIN transactions t 
ON c.customer_code=t.customer_code
WHERE sales_qty IN
(SELECT sales_qty FROM transactions
WHERE sales_qty<5) 






