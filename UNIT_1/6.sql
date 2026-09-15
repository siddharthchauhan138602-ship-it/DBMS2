//using loop

  SET SERVEROUTPUT ON;
	
	DECLARE 
		n NUMBER;
		i NUMBER;

	BEGIN

		n:=&n;

		i:=1;
		LOOP
			EXIT WHEN i>n;
			dbms_output.put_line(i);
			i:=i+1;
		END LOOP;

END;
/