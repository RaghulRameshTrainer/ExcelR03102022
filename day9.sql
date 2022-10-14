use cust;

-- IN , NOT IN, BETWEEN

SELECT * FROM transaction_tbl;

SELECT * FROM transaction_tbl WHERE product='TV';
SELECT * FROM transaction_tbl WHERE product='Laptop';
SELECT * FROM transaction_tbl WHERE product IN ('TV','Laptop');
SELECT * FROM transaction_tbl WHERE product NOT IN ('TV','Laptop');

SELECT * FROM transaction_tbl WHERE amount>=50000;
SELECT * FROM transaction_tbl WHERE amount<50000;
SELECT * FROM transaction_tbl WHERE amount>=200 and amount<=50000;

SELECT * FROM transaction_tbl WHERE amount BETWEEN 200 AND 50000;

-- WINDOWING FUNCTION(row_number, rank, dense_rank, lead, lag)

SELECT * FROM transaction_tbl;


SELECT transid,product,category,amount FROM 
(
SELECT transid,product,category,amount , row_number() OVER(ORDER BY amount DESC) rk FROM transaction_tbl
) tbl
WHERE tbl.rk<=2;


SELECT transid,product,category,amount FROM 
(
SELECT transid,product,category,amount , row_number() OVER(ORDER BY amount) rk FROM transaction_tbl
) tbl
WHERE tbl.rk<=2;

SELECT transid,product,category,amount FROM 
(
SELECT transid,product,category,amount , row_number() OVER(PARTITION BY category ORDER BY amount DESC) rk FROM transaction_tbl
) tbl
WHERE tbl.rk<=1;


-- RANK FUNCTION

SELECT transid,product,category,amount , rank() OVER(ORDER BY amount ) rnk FROM transaction_tbl;


SELECT transid,product,category,amount FROM (
SELECT transid,product,category,amount , rank() OVER(PARTITION BY category ORDER BY amount DESC) rnk FROM transaction_tbl) trans_rnk
WHERE trans_rnk.rnk=1;


-- DESNSE_RANK

SELECT transid,product,category,amount FROM (
SELECT transid,product,category,amount , dense_rank() OVER(ORDER BY amount DESC) rnk FROM transaction_tbl) trans_rnk
WHERE trans_rnk.rnk=1;


-- LEAD

SELECT * FROM transaction_tbl;

SELECT transid,product,category,amount,lead(amount) OVER(order by amount) next_amt FROM transaction_tbl;

SELECT transid,product,category,amount,lead(amount) OVER(order by amount DESC) next_amt FROM transaction_tbl;

SELECT transid,product,category,amount,lead(amount,2) OVER(order by amount DESC) next_amt FROM transaction_tbl;


-- LAG
SELECT transid,product,category,amount,lag(amount) OVER(order by amount) next_amt FROM transaction_tbl;
SELECT transid,product,category,amount,lag(amount,2) OVER(order by amount) next_amt FROM transaction_tbl;


-- CASE STATEMENT

-- CASE 
-- 	WHEN cond THEN what
--     WHEN cond2 THEN ...
--     ELSE ...
--     END AS column_nam


SELECT * FROM transaction_tbl;
SELECT transid, product, category, amount , CASE
											WHEN amount>=10000 THEN 'HIGH TRANSACTION'
                                            ELSE 'Less Transaction'
                                            END AS trans_level
                                            FROM transaction_tbl;
SELECT * FROM customer_table;
INSERT INTO customer_table VALUES(1001,'Malini','F',31,'Chennai'),(1002,'Arun','M',30,'Bangalore'),(1003,'Tharani','F',30,'Pune');
INSERT INTO customer_table VALUES(1004,'Saranya','F',35,'Chennai');
SELECT custid,empname,gender,age,city,CASE WHEN city='Hyderabad' THEN 'Telugu'
											WHEN city='Chennai' THEN 'tamil'
											WHEN city='Bangalore' THEN 'kannadam'
                                            WHEN city='Pune' THEN 'Hindi'
                                            END AS Speaking_Language
                                            FROM customer_table;