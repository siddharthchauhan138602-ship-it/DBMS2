DECLARE 
	v_rollno RESULT.ROLLNO%TYPE := 101;
    v_sub1   RESULT.SUB1%TYPE;
    v_sub2   RESULT.SUB2%TYPE;
    v_sub3   RESULT.SUB3%TYPE;
    v_sub4   RESULT.SUB4%TYPE;
    v_sub5   RESULT.SUB5%TYPE;
    
    v_total RESULT.TOTAL%TYPE;
    v_per   RESULT.PER%TYPE;
    v_grade RESULT.GRADE%TYPE;
    BEGIN
    
    SELECT SUB1,SUB2,SUB3,SUB4,SUB5
    INTO v_sub1, v_sub2, v_sub3, v_sub4, v_sub5
    FROM RESULT
    WHERE ROLLNO = v_rollno;
    
    v_total := v_sub1 + v_sub2 + v_sub3 + v_sub4 + v_sub5;
    v_per   := v_total / 5.0;
    
    IF v_per >= 90 THEN
   		 v_grade := 'A';
    ELSIF v_per >= 80 THEN
    	v_grade := 'B';
    ELSIF v_per >= 70 THEN
		v_grade := 'C';
	 ELSIF v_per >= 60 THEN
     	v_grade := 'D';
	ELSE
		v_grade := 'F';
	END IF;

	UPDATE RESULT
    SET TOTAL = v_total,
		PER   = v_per,
		GRADE = v_grade
	WHERE ROLLNO = v_rollno;

EXCEPTION
	WHEN NO_DATA_FOUND THEN

		NULL;
END;
/
