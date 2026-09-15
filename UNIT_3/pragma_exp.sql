SET serveroutput on;
DECLARE
  a NUMBER:=&a;
  b NUMBER:=&b;
  c NUMBER;
  my_exp1 EXCEPTION;
  
    Pragma EXCEPTION_INIT(my_exp1, -2000);

BEGIN
    IF b=0 THEN
        RAISE my_exp1;
    ELSE
        c:=a/b;
        dbms_output.put_line('Result: ' || c);
    END IF;

EXCEPTION
    WHEN my_exp1 THEN
        dbms_output.put_line('Error: Division by zero is not allowed.');

END;
/