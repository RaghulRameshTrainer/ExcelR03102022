CREATE OR REPLACE PROCEDURE welcome AS
BEGIN
     dbms_output.put_line('Hello, Welcome to PLSQL world!');
END;
/

-- EXECUTE THE PRROCEDURE
-- EXECUTE
-- CALL THE PROCEDURE FROM PLSQL BLOCK

EXECUTE welcome;

BEGIN
    welcome;
END;
/

-- DROP THE PROCEDURE
DROP PROCEDURE welcome;

-- PARAMETER IN PROCEDURE
-- IN, OUT, IN OUT


DECLARE
    x INTEGER;
    y INTEGER;
    z INTEGER;
PROCEDURE findMax(a IN integer, b IN integer, c OUT integer) AS
BEGIN
    IF a > b THEN
        c := a;
    ELSE
        c := b;
    END IF;
END;
BEGIN
  x := 50;
  y := 100;
  findMax(x,y,z);
  dbms_output.put_line('Maximum of 50, 100 is : '|| z);
END;
/


-- IN OUT

DECLARE
    a number;
PROCEDURE squareNum(x IN OUT number) AS
BEGIN
    x := x * x;
END;
BEGIN
     a := 50;
     dbms_output.put_line('Value that is going to be passed is :');
     squareNum(a);
     dbms_output.put_line('Square of 50 is :' || a);
END;
/

CREATE OR REPLACE PROCEDURE findMaxNum(a IN integer, b IN integer) AS
BEGIN
    IF a > b THEN
         dbms_output.put_line('Big value is :' || a);
    ELSE
        dbms_output.put_line('Big value is :' || b);
    END IF;
END;

EXECUTE findMaxNum(10,20);

-- FUNCTION
-- A function is same as a procedure except that it retuns a value

CREATE TABLE customer(
custid INTEGER,
custname VARCHAR2(100),
age INTEGER,
city VARCHAR2(100)
);

INSERT INTO customer VALUES(1,'Raja',30,'Bangalore');
INSERT INTO customer VALUES(2,'Ranjitha',25,'Chennai');
INSERT INTO customer VALUES(3,'Vel',27,'Hyderabad');
INSERT INTO customer VALUES(4,'Divya',24,'Pune');
INSERT INTO customer VALUES(5,'Kavin',23,'Bangalore');

SELECT * FROM customer;

CREATE OR REPLACE FUNCTION totalcustomers
RETURN INTEGER AS
    tot_cust INTEGER;
BEGIN
    SELECT COUNT(*) INTO tot_cust FROM CUSTOMER;
    
    RETURN tot_cust;
END;
/

DECLARE
    c INTEGER;
BEGIN
    c := totalcustomers();
    dbms_output.put_line('Total number of customers :' || c);
END ;
/


DECLARE
    x number;
    y number;
    z number;
FUNCTION findMax(a IN number, b IN number)
RETURN number AS
    c number;
BEGIN
    IF a > b THEN
        c := a;
    ELSE
        c := b;
    END IF;
    
    RETURN c;
END;
BEGIn
    x := 70;
    y := 80;
    z := findMax(x,y);
    dbms_output.put_line('Max of (70,80) is : '|| z);
END;
/


CREATE OR REPLACE FUNCTION ageByNextYear(a IN INTEGER)
RETURN INTEGER AS
    age INTEGER;
BEGIN
    age := a + 1;
    RETURN age;
END;
/


SELECT custid, custname, age, ageByNextYear(age) as nextage , city FROM customer;



-- CURSOR ( Pointer to a memory area)

DECLARE
    c_id customer.custid%type;
    c_name customer.custname%type;
    c_age customer.age%type;
    c_city customer.city%type;
    
    CURSOR cust_cursor IS
        SELECT custid, custname,age,city FROM customer;
BEGIN
    OPEN cust_cursor;
    LOOP
        FETCH cust_cursor INTO c_id, c_name,c_age, c_city ;
        EXIT WHEN cust_cursor%notfound;
        dbms_output.put_line(c_id || ' - ' || c_name || ' - ' || c_age || ' - ' || c_city );
    END LOOP;
    CLOSE cust_cursor;
END;
/


-- TRIGGER



CREATE TABLE alumni(
custid INTEGER,
custname VARCHAR2(100),
age INTEGER,
city VARCHAR2(100)
);


CREATE OR REPLACE TRIGGER customer_trigger
BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO alumni VALUES(:OLD.custid, :OLD.custname, :OLD.age,:OLD.city);
    dbms_output.put_line('Records got loaded into the alumni table');
END;
/


DELETE FROM CUSTOMER WHERE custid < 4;


SELECT * FROM CUSTOMER;
SELECT * FROM ALUMNI;


CREATE OR REPLACE TRIGGER update_customer_trigger
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
    dbms_output.put_line('Old City :' || :OLD.city);
    dbms_output.put_line('Old City :' || :NEW.city);
END;
/

UPDATE CUSTOMER SET CITY='CHENNAI' WHERE custid=5;