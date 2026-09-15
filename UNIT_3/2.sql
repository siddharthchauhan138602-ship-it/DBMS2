/** Write a PL/SQL block to accept a student name  
from a user if it exists, display his/her result from 
the  RESULT table otherwise display appropriate 
message  using exception handling. 
*/

DECLARE
    s_input VARCHAR2(50);
    s_rollno RESULT.ROLLNO%TYPE;
    s_name RESULT.SNAME%TYPE;
    s_marks RESULT.MARKS%TYPE;

    STUD_NOT_FOUND EXCEPTION;
BEGIN

    -- Accept student name from user
    s_input := '&Enter_Student_Name';

    -- Fetch result for the given student name
    SELECT ROLLNO, SNAME, MARKS INTO s_rollno, s_name, s_marks
    FROM RESULT
    WHERE SNAME = s_input;

    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Roll No: ' || s_rollno || ', Name: ' || s_name || ', Marks: ' || s_marks);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Student with name "' || s_input || '" not found in the RESULT table.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/
