use cust;

-- PRIMARY KEY  ( UNIQUE + NOT NULL)

CREATE TABLE primarykey_table(
empid INT PRIMARY KEY,            -- Simple Primary key 
empname VARCHAR(100) NOT NULL,
gender CHAR(1) CHECK (gender IN ('M','F')),
age INT CHECK(age>0 and age<=100),
city VARCHAR(30) DEFAULT 'Pune'
);

INSERT INTO primarykey_table VALUES(1000,'Ashwin','M',25,'Hyderabad');
INSERT INTO primarykey_table VALUES(1000,'Tharani','F',31,'Bangalore');  -- ERROR since it is deplicate empid
INSERT INTO primarykey_table(empname,gender,age,city) VALUES('Malini','F',32,'Chennai');  -- ERROR since it load NULL on empid
INSERT INTO primarykey_table(empid, empname,gender,age) VALUES(1001,'Tharani','F',100);

SELECT * FROM primarykey_table;

-- Simple Primary key and composite primary key

CREATE TABLE composite_primarykey_table(
empid INT ,
empname VARCHAR(100) NOT NULL,
gender CHAR(1) CHECK (gender IN ('M','F')),
age INT CHECK(age>0 and age<=100),
city VARCHAR(30) DEFAULT 'Pune',
constraint pk PRIMARY KEY(empid,empname)
);

INSERT INTO composite_primarykey_table VALUES(1000,'Ashwin','M',25,'Hyderabad');
INSERT INTO composite_primarykey_table VALUES(1000,'Tharani','F',31,'Bangalore');  
INSERT INTO composite_primarykey_table VALUES(1000,'Ashwin','M',25,'Hyderabad');   -- ERROR since it is duplicate (1000-Ashwin)
INSERT INTO composite_primarykey_table VALUES(1001,'Ashwin','M',25,'Hyderabad');  
INSERT INTO composite_primarykey_table(empname,gender,age,city) VALUES('Malini','F',32,'Chennai');  -- ERROR since it load NULL on empid
INSERT INTO composite_primarykey_table(empid, empname,gender,age) VALUES(1001,'Tharani','F',100);
SELECT * FROM composite_primarykey_table;


-- FOREIGN KEY


CREATE TABLE customer_table(
custid INT PRIMARY KEY,            -- Simple Primary key 
empname VARCHAR(100) NOT NULL,
gender CHAR(1) CHECK (gender IN ('M','F')),
age INT CHECK(age>0 and age<=100),
city VARCHAR(30) DEFAULT 'Pune'
);

INSERT INTO customer_table VALUES(1000,'Ashwin','M',25,'Hyderabad');
INSERT INTO customer_table VALUES(1000,'Tharani','F',31,'Bangalore');  -- ERROR since it is deplicate empid
INSERT INTO customer_table(empname,gender,age,city) VALUES('Malini','F',32,'Chennai');  -- ERROR since it load NULL on empid
INSERT INTO customer_table(custid, empname,gender,age) VALUES(1001,'Tharani','F',100);

SELECT * FROM customer_table;

CREATE TABLE order_table(
orderid INT,
custid INT ,
productname VARCHAR(100) NOT NULL,
amount DECIMAL(10,2),
FOREIGN KEY (custid) REFERENCES customer_table(custid) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO order_table VALUES(1,1000,'Tv',50000.99);
SELECT * FROM order_table;
INSERT INTO order_table VALUES(2,2000,'Mobile',30000);  -- Error since 2000 is not present in customer_table
INSERT INTO order_table VALUES(2,1111,'Mobile',30000); 

DELETE FROM customer_table WHERE custid=1001;   -- Not allowed since child table referes it
UPDATE customer_table SET custid=1001 WHERE custid=1111; -- Not allowed since child table referes it


-- ALTER STATEMENTS

DESC employee;
-- DESC customer_table;
-- RENAME THE COLUMN
ALTER TABLE employee RENAME COLUMN city TO location;
DESC employee;

SELECT * FROM employee;

-- REMOVE/DROP A COLUMN

ALTER TABLE employee DROP COLUMN age;
SELECT * FROM employee;

-- ADD A COLUMN
ALTER TABLE employee ADD COLUMN country VARCHAR(100) DEFAULT 'India';
SELECT * FROM employee;

ALTER TABLE employee ADD COLUMN email VARCHAR(100) ;
SELECT * FROM employee;

-- MODIFY COLUMN
ALTER TABLE employee MODIFY COLUMN location varchar(25);
DESC employee;

ALTER TABLE employee MODIFY COLUMN location varchar(25) NOT NULL;
DESC employee;

-- RENAME TABLE
ALTER TABLE employee RENAME TO mytable;

SELECT empname FROM employee;

-- AUTO INCREMENT 
CREATE TABLE autoincrement_table(
custid INT UNIQUE auto_increment,            
empname VARCHAR(100) NOT NULL,
gender CHAR(1) CHECK (gender IN ('M','F')),
age INT CHECK(age>0 and age<=100),
city VARCHAR(30) DEFAULT 'Pune'
);

INSERT INTO autoincrement_table(empname, gender,age,city) VALUES('Ganga','F',30,'Kolkatta');
SELECT * FROM autoincrement_table;
INSERT INTO autoincrement_table(empname, gender,age,city) VALUES('Rajesh','M',30,'Kolkatta');
INSERT INTO autoincrement_table(empname, gender,age,city) VALUES('Arun','M',30,'Chennai');

INSERT INTO autoincrement_table(custid,empname, gender,age,city) VALUES(100,'Vicky','M',30,'Chennai');
INSERT INTO autoincrement_table(empname, gender,age,city) VALUES('Divya','F',30,'Bangalore');


-- AGGREGATE FUNCTION, JOINS

-- WINDOW FUNCTION ( row_number, rank, dense_rank, lead, lag)
