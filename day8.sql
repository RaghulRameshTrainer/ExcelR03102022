use cust ;

-- NUMERIC FUNCTIONS
-- STRING FUNCTIONS
-- DATE FUNCTIONS

-- NUMERIC FUNCTIONS

SELECT * FROM transaction_tbl;

SELECT count(*) FROM transaction_tbl;
SELECT count(1) FROM transaction_tbl;

SELECT category, count(1) 
FROM transaction_tbl
GROUP BY category;


SELECT * FROM transaction_tbl WHERE amount=(SELECT max(amount) FROM transaction_tbl);

SELECT category, max(amount) 
FROM transaction_tbl
GROUP BY category;

SELECT min(amount) FROM transaction_tbl;

SELECT sum(amount) FROM transaction_tbl;

SELECT avg(amount) FROM transaction_tbl;

SELECT * FROM transaction_tbl;


SELECT * FROM transaction_tbl WHERE amount > (SELECT avg(amount) FROM transaction_tbl);
SELECT * FROM transaction_tbl WHERE amount < (SELECT avg(amount) FROM transaction_tbl);


-- STRING FUNCTIONS

SELECT product , LENGTH(product) as len FROM transaction_tbl;

SELECT transid, product, replace(category,'Food','snacks') , amount FROM transaction_tbl;

SELECT transid, UPPER(product), replace(category,'Food','snacks') , amount FROM transaction_tbl;

SELECT transid, LOWER(product), replace(category,'Food','snacks') , amount FROM transaction_tbl;

SELECT transid, product, substr(category,1,4) as cat , amount FROM transaction_tbl;

SELECT * FROM transaction_tbl;

SELECT * FROM transaction_tbl WHERE category LIKE 'E%';
SELECT * FROM transaction_tbl WHERE product LIKE '%s';

SELECT * FROM transaction_tbl WHERE category LIKE 'El%';

SELECT * FROM transaction_tbl WHERE product LIKE '%t_s';

SELECT * FROM transaction_tbl WHERE product LIKE '%p__p';

-- CTAS
CREATE TABLE newtrans_tbl AS
SELECT transid, UPPER(product) as product, replace(category,'Food','snacks') , amount FROM transaction_tbl;

SELECT * FROM newtrans_tbl;


-- DATE FUNCTION
CREATE TABLE users_tbl(
userid INT,
user_name varchar(100),
gender char(1),
city varchar(100),
registered_date datetime
);

SELECT current_date();
SELECT current_timestamp();
SELECT current_time();
INSERT INTO users_tbl VALUES(1,'Bala','M','Chennai',current_timestamp());

SELECT * FROM users_tbl;

INSERT INTO users_tbl VALUES(2,'Solomon','M','Bangalore','2022-10-12 10:00:00');
INSERT INTO users_tbl VALUES(3,'Sindhya','F','Hyderabad','2000-10-12 10:00:00');

SELECT * FROM users_tbl where year(registered_date) = 2022;
SELECT * FROM users_tbl where month(registered_date) = 10;
SELECT * FROM users_tbl where day(registered_date) = 13;

SELECT year(registered_date) as year , month(registered_date) as month, day(registered_date) as day , date(registered_date) as date from users_tbl;

SELECT year(registered_date) as year , month(registered_date) as month, day(registered_date) as day , 
date_format(date(registered_date) ,'%d-%m-%Y') as date from users_tbl;


SELECT * FROM users_tbl WHERE hour(registered_date)=10;
SELECT * FROM users_tbl WHERE minute(registered_date)!=0;

SELECT date_add('2022-10-13' , INTERVAL 100 DAY);
SELECT datediff('2022-10-13','2000-1-1');


%a-Abbreviated weekday name (Sun-Sat)
%b-Abbreviated month name (Jan-Dec)
%c-Month, numeric (0-12)
%D-Day of month with English suffix (0th, 1st, 2nd, 3rd)
%d-Day of month, numeric (00-31)
%e-Day of month, numeric (0-31)
%f-Microseconds (000000-999999)
%H-Hour (00-23)
%h-Hour (01-12)
%I-Hour (01-12)
%i-Minutes, numeric (00-59)
%j-Day of year (001-366)
%k-Hour (0-23)
%l-Hour (1-12)
%M-Month name (January-December)
%m-Month, numeric (00-12)
%p-AM or PM
%r-Time, 12-hour (hh:mm:ss followed by AM or PM)
%S-Seconds (00-59)
%s-Seconds (00-59)
%T-Time, 24-hour (hh:mm:ss)
%U-Week (00-53) where Sunday is the first day of week
%u-Week (00-53) where Monday is the first day of week
%V-Week (01-53) where Sunday is the first day of week, used with %X
%v-Week (01-53) where Monday is the first day of week, used with %x
%W-Weekday name (Sunday-Saturday)
%w-Day of the week (0=Sunday, 6=Saturday)
%X-Year for the week where Sunday is the first day of week, four digits, used with %V
%x-Year for the week where Monday is the first day of week, four digits, used with %v
%Y-Year, numeric, four digits
%y-Year, numeric, two digits



