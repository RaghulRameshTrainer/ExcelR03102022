use cust;

-- VIEW
-- View is a Virtual Table

-- CREATE OR REPLACE VIEW cust_info AS
-- SELECT fname, lname, age, gender, city FROM CUSTOMER;

CREATE VIEW prod_sales_info AS
SELECT productname, amount FROM TRANSACTION_TABLE;

SELECT * FROM prod_sales_info WHERE amount<50000;

INSERT INTO transaction_table VALUES(11,1000,'AAAAAAAAAAAA',1111111);

SELECT * FROM transaction_table;

DESC employee;

-- INDEX

CREATE INDEX emp_idx ON employee(empid);

SHOW INDEX FROM employee;

CREATE INDEX emp_cntry ON employee(country);

CREATE INDEX emp_cntry_city ON employee(country,location);

SELECT * FROM employee WHERE empid=1005;
SELECT * FROM employee WHERE country='India';
SELECT * FROM employee WHERE country='India' and location='Chennai';

-- ------------------------------------------------------
-- DDL (Data Definition Language)
-- 	-- CREATE, ALTER, DROP
-- DML (Data Manuplulation Language)
-- 	-- INSERT, UPDATE, DELETE
-- DCL (Data Control Language)
-- 	-- Grant , Revoke
-- TCL (Transaction Control language)
-- 	-- COMMIT, ROLLBACK
-- TQL (Data Query Langauge)
-- 	-- SELECT
-- -- -----------------------------------------------------------

-- Transaction Control languags
SELECT * FROM EMPLOYEE;

START TRANSACTION;
UPDATE EMPLOYEE SET location='Chennai' WHERE empid=1000;
SELECT * FROM EMPLOYEE;
COMMIT;

SET sql_safe_updates=0;
START TRANSACTION;
UPDATE EMPLOYEE SET location='Bangalore';
SELECT * FROM EMPLOYEE;
ROLLBACK;


START TRANSACTION;
UPDATE EMPLOYEE SET location='Bangalore' WHERE empid=1003;
SELECT * FROM EMPLOYEE;
COMMIT;


-- DELETE TRUNCATE DROP

DELETE FROM EMPLOYEE WHERE empid=1004;

SELECT * FROM EMPLOYEE;

START TRANSACTION;
DELETE FROM EMPLOYEE;
ROLLBACK;

-- TRUNCATE

START TRANSACTION;
TRUNCATE TABLE EMPLOYEE ;
ROLLBACK;


SELECT * FROM CUSTOMER;
-- DROP
START TRANSACTION;
DROP TABLE CUSTOMER;
ROLLBACK;

-- DELETE                                  	        TRUNCATE                                          		   DROP
-- Used to delete particular record/records       Entire table data will get deleted.							Entire table and date gets deleted
-- 											   Cannot be used for deleting a particular record/records
--                                                
-- Can be rolled back							    Can't be rolled back                                        Can't be rolled back



CREATE TABLE PRI_A(
id INT PRIMARY KEY,
name varchar(100)
);

INSERT INTO PRI_A VALUES(1,'Durga'),(2,'Sathya');

CREATE TABLE FOREIGN_B(
id INT ,
city varchar(20),
foreign key (id) references PRI_A(id) ON DELETE CASCADE
);

INSERT INTO FOREIGN_B VALUES(1,'Bangalore'),(2,'Hyderabad');

SELECT * FROM PRI_A;
SELECT * FROM FOREIGN_B;

DELETE FROM PRI_A WHERE id=2;
DROP TABLE PRI_A;

SHOW CREATE TABLE FOREIGN_B;
ALTER TABLE FOREIGN_B DROP CONSTRAINT foreign_b_ibfk_1;
