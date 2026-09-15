-- USING FOR LOOP

  SET SERVEROUTPUT ON;
	
	DECLARE 
		n NUMBER;
		i NUMBER;

	BEGIN

		n:=&n;
		i:=1;
		
		WHILE i<=n LOOP		
			dbms_output.put_line(i);
			i:=i+1;
		END LOOP;

END;
/
