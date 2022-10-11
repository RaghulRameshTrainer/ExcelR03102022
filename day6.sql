use cust;
SELECT * FROM CUSTOMER ;

SELECT * FROM  TRANSACTION_TABLE;

-- LEFT JOIN
SELECT * FROM customer c LEFT  JOIN transaction_table t ON c.custid=t.custid;

-- RIGHT JOIN
SELECT * FROM customer c RIGHT  JOIN transaction_table t ON c.custid=t.custid;

-- CROSS JOIN
SELECT * FROM customer c CROSS JOIN transaction_table t ;

-- SELF JOIN

CREATE TABLE salary(
emp_id INT PRIMARY KEY,
salary INT NOT NULL CHECK(salary>0),
manager_id INT,
FOREIGN KEY (manager_id) references salary(emp_id)
); 

INSERT INTO salary VALUES(1005,100000,1005),(1000,50000,1005),(1001,60000,1000),(1002,70000,1005),(1003,80000,1001),(1004,90000,1005);

SELECT * FROM salary;

SELECT s1.emp_id, s1.salary 
FROM salary s1, salary s2
WHERE s1.manager_id = s2.emp_id
AND s1.salary > s2.salary;


-- SUB QUERY / INNER QUERY
SELECT * FROM CUSTOMER ;

SELECT * FROM  TRANSACTION_TABLE;

SELECT * FROM CUSTOMER WHERE custid IN (
SELECT custid FROM TRANSACTION_TABLE WHERE amount = (
SELECT max(amount) FROM TRANSACTION_TABLE)
);

SELECT * FROM CUSTOMER c INNER JOIN 
(SELECT * FROM TRANSACTION_TABLE WHERE amount > ( 
SELECT avg(amount) FROM  TRANSACTION_TABLE) )  t1
ON c.custid=t1.custid;

-- WITH CLAUSE 
WITH t1 AS (SELECT c.custid, c.custname,c.city, t.transid, t.productname, t.amount 
FROM CUSTOMER c LEFT JOIN TRANSACTION_TABLE t ON c.custid=t.custid),
t2 AS (SELECT  c.custid, c.custname,c.city, t.transid, t.productname, t.amount 
FROM CUSTOMER c RIGHT JOIN TRANSACTION_TABLE t ON c.custid=t.custid)
SELECT * FROM t1 WHERE t1.transid IS NULL
UNION
SELECT * FROM t2 WHERE t2.city IS NULL;



WITH t1 AS (SELECT c.custid, c.custname,c.city, t.transid, t.custid as customer_id, t.productname, t.amount 
FROM CUSTOMER c LEFT JOIN TRANSACTION_TABLE t ON c.custid=t.custid),
t2 AS (SELECT  c.custid, c.custname,c.city, t.transid, t.custid as customer_id, t.productname, t.amount 
FROM CUSTOMER c RIGHT JOIN TRANSACTION_TABLE t ON c.custid=t.custid)
SELECT t1.custid,t1.custname,t1.city,t2.transid,t2.customer_id,t2.productname,t2.amount
 FROM t1 INNER JOIN t2 ON t1.custid=t2.customer_id;













