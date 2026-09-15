DECLARE
	marks NUMBER;
BEGIN 
	marks:=&marks;
	IF marks>=90 THEN 
		dbms_output.put_line('Grade A');
	ELSIF marks>=75 THEN
		dbms_output.put_line('Grade B');
	ELSIF marks>=60 THEN
		dbms_output.put_line('Grade C');
	ELSIF marks>=40 THEN
		dbms_output.put_line('Grade D');
	ELSE 
		dbms_output.put_line('FAILED ! Better Luck Next Time BRO !');
	END if;
END;
/
	

	