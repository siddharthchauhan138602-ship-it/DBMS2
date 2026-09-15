SET SERVEROUTPUT ON;
DECLARE
       total_rows NUMBER;
BEGIN
    -- Update empolyees in department 10
    UPDATE EMP
    SET BasicSal = BasicSal * 1.10
    WHERE Deptno = 10;

    
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in department 10 .');
      ELSE 
                DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || 'EMPLOYEES SALARAY RAISED BY 10% IN DEPARTMENT 10');
             END IF;
        END;
        /