SET SERVEROUTPUT ON;

DECLARE
    CURSOR top_emp_cur IS
        SELECT EName, BasicSal
        FROM (
            SELECT EName, BasicSal
            FROM EMP
            ORDER BY BasicSal DESC
        )
        WHERE ROWNUM <= 3;
BEGIN
    FOR rec IN top_emp_cur LOOP
        DBMS_OUTPUT.PUT_LINE('Name: ' || rec.EName || ' | Salary: ' || rec.BasicSal);
    END LOOP;
END;
/
