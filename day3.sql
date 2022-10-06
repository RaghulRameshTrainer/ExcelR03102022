use cust;

SELECT * FROM EMPLOYEE;

-- DELETE QUERY

SELECT * FROM EMPLOYEE WHERE AGE IS NULL ;

SET SQL_SAFE_UPDATES = 0;
 

DELETE FROM EMPLOYEE WHERE AGE IS NULL ;

SELECT * FROM EMPLOYEE;

DELETE FROM EMPLOYEE WHERE city='Delhi';

DELETE FROM EMPLOYEE WHERE age < 40;

-- UPDATE QUERY

INSERT INTO employee VALUES(1000,'Raghul Ramesh','M',38,'Chennai');
INSERT INTO employee VALUES(1001,'Tharani Priya','F',33,'Bangalore');
INSERT INTO employee VALUES(1003,'Aveek','M',45,'Delhi'),(1004,'Sakshi','F',35,'Pune');

INSERT INTO employee(empid,empname,gender,city) VALUES(1005,'Durga Devi','F','Chennai');
SELECT * FROM EMPLOYEE;

UPDATE EMPLOYEE SET age=25 WHERE age IS NULL ;

UPDATE EMPLOYEE SET city='Kolkatta' WHERE empid=1000;

SELECT * FROM EMPLOYEE;

UPDATE EMPLOYEE SET age=46 WHERE empid=1003;

UPDATE EMPLOYEE SET age=36 , city='Mumbai' WHERE empid=1004;

-- CONSTRAINTS
-- ==============
-- UNIQUE
-- NOT NULL
-- PRIMARY KEY
-- FOREIGN KEY
-- CHECK
-- DEFAULT

-- INSERT INTO EMPLOYEE(empid) VALUES(1111);
-- INSERT INTO EMPLOYEE(empname) VALUES('Kavin');


-- UNIQUE KEY CONTRSAINT
CREATE TABLE unique_table(
empid INT UNIQUE,
empname VARCHAR(100),
gender CHAR(1),
age INT,
city VARCHAR(100)
);

INSERT INTO unique_table VALUES(1000,'Raghul Ramesh','M',38,'Chennai');
INSERT INTO unique_table VALUES(1001,'Tharani Priya','F',33,'Bangalore');
SELECT * FROM unique_table;
INSERT INTO unique_table VALUES(1000,'Arun kumar','M',35,'Hyderabad');  -- ERROR
INSERT INTO unique_table VALUES(1002,'Arun kumar','M',35,'Hyderabad');  

INSERT INTO unique_table(empname,gender,age,city) VALUES('Madhan','M',38,'Chennai');
INSERT INTO unique_table(empname,gender,age,city) VALUES('Reena','F',30,'Bangalore');

-- NOT NULL CONSTRAINTS

CREATE TABLE notnull_table(
empid INT NOT NULL,
empname VARCHAR(100),
gender CHAR(1),
age INT,
city VARCHAR(100)
);

INSERT INTO notnull_table VALUES(1000,'Raghul Ramesh','M',38,'Chennai');
INSERT INTO notnull_table VALUES(1001,'Tharani Priya','F',33,'Bangalore');
SELECT * FROM notnull_table;
INSERT INTO notnull_table VALUES(1000,'Arun kumar','M',35,'Hyderabad'); 

INSERT INTO notnull_table(empname,gender,age,city) VALUES('Madhan','M',38,'Chennai');  -- ERROR
INSERT INTO notnull_table(empname,gender,age,city) VALUES('Reena','F',30,'Bangalore'); -- ERROR


-- UNIQUE , NOT NULL CONSTRAINTS

CREATE TABLE unique_notnull_table(
empid INT UNIQUE NOT NULL,
empname VARCHAR(100),
gender CHAR(1),
age INT,
city VARCHAR(100)
);

INSERT INTO unique_notnull_table VALUES(1000,'Raghul Ramesh','M',38,'Chennai');
INSERT INTO unique_notnull_table VALUES(1001,'Tharani Priya','F',33,'Bangalore');
SELECT * FROM unique_notnull_table;
INSERT INTO unique_notnull_table VALUES(1000,'Arun kumar','M',35,'Hyderabad');  -- ERROR

INSERT INTO unique_notnull_table(empname,gender,age,city) VALUES('Madhan','M',38,'Chennai');  -- ERROR
INSERT INTO unique_notnull_table(empname,gender,age,city) VALUES('Reena','F',30,'Bangalore'); -- ERROR


-- TCL Transaction control Language : COMMIT, ROLLBACK

-- CHECK CONSTRAINT

CREATE TABLE check_table(
empid INT ,
empname VARCHAR(100),
gender CHAR(1),
age INT CHECK (age>0 and age<=100),
city VARCHAR(100) CHECK (city IN ('Chennai','Bangalore','Hyderabad','Pune','Delhi'))
);

INSERT INTO check_table VALUES(1000,'Raghul Ramesh','M',38,'Chennai');
INSERT INTO check_table VALUES(1001,'Tharani Priya','F',33,'Bangalore');
SELECT * FROM check_table;
INSERT INTO check_table VALUES(1002,'Arun kumar','M',135,'Hyderabad');  -- ERROR
INSERT INTO check_table VALUES(1002,'Arun kumar','M',-1,'Hyderabad');  -- ERROR
INSERT INTO check_table VALUES(1002,'Arun kumar','M',35,'Kolkatta');  -- ERROR
INSERT INTO check_table VALUES(1002,'Arun kumar','M',35,'Hyderabad');  
SELECT * FROM check_table;

-- DEFAULT CONSTRAINT

CREATE TABLE default_table(
empid INT ,
empname VARCHAR(100),
gender CHAR(1),
age INT ,
city VARCHAR(100) DEFAULT 'PUNE'
);

INSERT INTO default_table VALUES(1000,'Raghul Ramesh','M',38,'Chennai');
INSERT INTO default_table VALUES(1001,'Tharani Priya','F',33,'Bangalore');
SELECT * FROM default_table;
INSERT INTO default_table(empid,empname,gender,age) VALUES(1002,'Satya','F',30);
SELECT * FROM default_table;

-- UNIQUE NOT NULL CHECK DEFAULT

CREATE TABLE all_constraints_table(
empid INT UNIQUE NOT NULL,
empname VARCHAR(100) NOT NULL,
gender CHAR(1) CHECK(gender IN ('M','F')),
age INT CHECK (age>0 and age<=100),
city VARCHAR(100) DEFAULT 'PUNE'
);

INSERT INTO all_constraints_table VALUES(1000,'Raghul Ramesh','M',38,'Chennai');
INSERT INTO all_constraints_table VALUES(1001,'Tharani Priya','F',33,'Bangalore');
SELECT * FROM all_constraints_table;
INSERT INTO all_constraints_table(empid,empname,gender,age) VALUES(1002,'Satya','F',30);
SELECT * FROM all_constraints_table;
INSERT INTO all_constraints_table(empname,gender,age,city) VALUES('Anand','M',30,'Pune');  -- ERROR
INSERT INTO all_constraints_table(empid,empname,gender,age,city) VALUES(1000,'Anand','M',30,'Pune');  -- ERROR
INSERT INTO all_constraints_table(empid,gender,age,city) VALUES(1003,'M',30,'Pune');  -- ERROR
INSERT INTO all_constraints_table(empid,empname,gender,age,city) VALUES(1000,'Anand','A',30,'Pune');  -- ERROR
INSERT INTO all_constraints_table(empid,empname,gender,age,city) VALUES(1000,'Anand','M',0,'Pune');  -- ERROR
INSERT INTO all_constraints_table(empid,empname,gender,age) VALUES(1003,'Anand','M',30); 

SELECT * FROM all_constraints_table;

CREATE TABLE all_constraints_table1(
empid DECIMAL(10,2) UNIQUE NOT NULL,
empname VARCHAR(100) NOT NULL,
gender CHAR(1) CHECK(gender IN ('M','F')),
age INT CHECK (age>0 and age<=100),
city VARCHAR(100) DEFAULT 'PUNE'
);


INSERT INTO all_constraints_table1 VALUES(1000.5,'Raghul Ramesh','M',38,'Chennai');

SELECT * FROM all_constraints_table1;



