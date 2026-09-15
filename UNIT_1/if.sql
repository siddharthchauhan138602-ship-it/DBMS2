DECLARE
	marks NUMBER;
BEGIN 
	marks:=&marks;
	IF marks>=90 THEN 
		dbms_output.put_line('Grade A');
	END if;
END;
/
	-- this was only if 

	