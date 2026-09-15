set serveroutput on;
DECLARE

  res NUMBER(3);
  n NUMBER(3);

  BEGIN
  
    n:=&n;
    IF n=0 THEN

    RAISE_APPLICATION_ERROR(-20230, 'YOU CANNOT DIVIDE ANY NUMBER BY ZERO');
    ELSE
      SELECT 100/n INTO res FROM dual;
      dbms_output.put_line(n);
    END IF;
END;
/