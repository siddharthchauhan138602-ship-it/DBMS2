-- USING FOR LOOP

  SET SERVEROUTPUT ON;
	
	DECLARE 
		n NUMBER;
		i NUMBER;

	BEGIN

		n:=&n;

		FOR i IN 1..n LOOP   
			dbms_output.put_line(i);
		END LOOP;
END;
/
