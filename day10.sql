-- Declaration Section
-- Executable section/command
-- Exception handling section

DECLARE
    <declaration section>
BEGIN
    <executable queries>
EXCEPTION
    <excption handling>
END;

-- MySQL                 Oracle
-- INT                     INTEGER/NUMBER
-- varchar                 VARCHAR2

DECLARE
    message VARCHAR2(100) := 'Hello Everyone!';
BEGIN
    dbms_output.put_line(message);
END;
/



DECLARE
    x integer;
BEGIN
    x := 10+20;
    dbms_output.put_line(x);
END;
/



DECLARE
    x integer := 10;
    y integer := 20;
    z integer;
BEGIN
    z := x+y;
    dbms_output.put_line('sum of 10 and 20 is : ' || z || ' completed');
END;
/

-- IF ELSE statement

DECLARE
    x integer := 20;
    y integer := 50;
    z integer;
BEGIN
    z := x+y;
    IF(z > 0 and z < 100) THEN
        dbms_output.put_line('Less than 100');
    ELSIF(z=100) THEN
        dbms_output.put_line('Equal to 100');
    ELSIF(z<0) THEN
        dbms_output.put_line('Holds negative value');
    ELSE
        dbms_output.put_line('Greater than 100');
    END IF;
END;
/


-- LOOP

DECLARE
    x number := 0;
BEGIN
    LOOP
        dbms_output.put_line('x is :' || x);
        x := x + 1;
        IF x > 10 THEN
            exit;
        END IF;
    END LOOP;
    dbms_output.put_line('Value of x is: '|| x);
END;
/


-- WHILE LOOP

DECLARE
    x number := 0;
BEGIN
    WHILE x < 21 LOOP
        dbms_output.put_line('x is :' || x);
        x := x + 1;
    END LOOP;
    dbms_output.put_line('Value of x is: '|| x);
END;
/


-- FOR LOOP

DECLARE 
    x number;
BEGIN
    FOR x in 1 .. 10 LOOP
         dbms_output.put_line('x : ' || x);
    END LOOP;
END;
/

DECLARE 
    x number:=1;
BEGIN
    while x <= 10 LOOP
         dbms_output.put_line('x : ' || x);
         x := x+2;
        END LOOP;
END;
/


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

DECLARE
    c_id customer.custid%type := 3;
    c_name customer.custname%type;
    c_age customer.age%type;
    c_city VARCHAR2(100);
BEGIN
    SELECT custname, age, city INTO c_name, c_age, c_city FROM customer WHERE custid=c_id;
    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || c_name || ' Customer Age : '|| c_age || ' Customer City : ' || c_city);
    
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No such customer with id : ' || c_id);
    WHEN others THEN
        dbms_output.put_line('Got new exception');
        
dbms_output.put_line('LAST LINE IN THE PLSQL PROGRAM');
END;
/





















