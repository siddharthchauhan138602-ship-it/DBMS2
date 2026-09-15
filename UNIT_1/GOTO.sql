BEGIN 

	GOTO second_message; <<first_message>>
	dbms_output.put_line('Hello');

	GOTO the_end; <<second_message>>

	dbms_output.put_line('PL/SQL GOTO DEMO');

	GOTO first_message; <<the_end>>

	dbms_output.put_line('and good bye....');

END;
/