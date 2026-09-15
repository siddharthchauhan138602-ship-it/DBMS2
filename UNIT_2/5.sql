SET SERVEROUTPUT ON;

DECLARE
    -- Parameterized cursor to fetch employees of a given department
    CURSOR emp_cur(p_deptno EMP.Deptno%TYPE) IS
        SELECT EName, BasicSal, Deptname
        FROM EMP
        WHERE Deptno = p_deptno;

    -- Cursor to get distinct departments
    CURSOR dept_cur IS
        SELECT DISTINCT Deptno, Deptname
        FROM EMP;

    v_total_gross NUMBER(12,2); -- Variable to hold department total
BEGIN
    -- Loop through each department
    FOR d_rec IN dept_cur LOOP
        v_total_gross := 0;
        DBMS_OUTPUT.PUT_LINE('Department: ' || d_rec.Deptname);

        -- Loop through employees of that department
        FOR e_rec IN emp_cur(d_rec.Deptno) LOOP
            DBMS_OUTPUT.PUT_LINE('   Employee: ' || e_rec.EName || 
                                 ' | Basic Salary: ' || e_rec.BasicSal);
            v_total_gross := v_total_gross + e_rec.BasicSal;
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('   --> Total Gross Salary for ' || d_rec.Deptname || 
                             ' Dept: ' || v_total_gross);
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
    END LOOP;
END;
/
