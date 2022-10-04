CREATE DATABASE IF NOT EXISTS cust;

use cust;

CREATE TABLE IF NOT EXISTS employee(
empid INT,
empname VARCHAR(100),
gender CHAR(1),
age INT,
city VARCHAR(100)
);

-- DATA TYPES:
-- 	INT (NUMBERS)
--     CHAR (CHRACTERS)  CHAR(10)
--     VARCHAR(Variable Character)  VARCHAR(100)
--     DECIMAL (Flot values . i.e : 70.65)
--     DATE

-- INSERT DATA
SELECT * FROM employee;

INSERT INTO employee VALUES(1000,'Raghul Ramesh','M',38,'Chennai');
INSERT INTO employee VALUES(1001,'Tharani Priya','F',33,'Bangalore');
INSERT INTO employee VALUES(1002,'Bala','M',40,'Hyderabad'),(1003,'Aveek','M',45,'Delhi'),(1004,'Sakshi','F',35,'Pune');

INSERT INTO employee(empid,empname,gender,city) VALUES(1005,'Durga Devi','F','Chennai');

-- SELECT THE DATA

SELECT empid, empname,gender,age,city FROM employee;

SELECT * FROM employee;

SELECT empname, gender, city FROM employee;

SELECT city, empname, gender FROM employee;

SELECT * FROM employee WHERE city='Chennai';

SELECT * FROM employee WHERE city != 'Chennai';

SELECT * FROM employee WHERE age>=40;
SELECT * FROM employee WHERE age<=40;

SELECT * FROM employee WHERE gender='M';
SELECT * FROM employee WHERE gender='F';

SELECT * FROM Employee ;

SELECT * FROM employee WHERE gender='M' AND city='Chennai';
SELECT * FROM employee WHERE gender='F' OR age >=40;
SELECT * FROM employee WHERE gender='F' OR (age >=40 AND city!='Delhi');
