
DECLARE
    CURSOR emp_cur IS
        SELECT EID, ENAME, DEPTNO, DEPTNAME, GENDER, AGE, BASICSAL
        FROM EMP
        WHERE DEPTNO = &DEPT_NO;

    NO_DEPT_FOUND EXCEPTION;
    v_count NUMBER := 0;

BEGIN
    FOR emp_rec IN emp_cur LOOP

        INSERT INTO EMP_BACKUP
        (EID, ENAME, DEPTNO, DEPTNAME, GENDER, AGE, BASICSAL)
        VALUES
        (emp_rec.EID, emp_rec.ENAME, emp_rec.DEPTNO,
         emp_rec.DEPTNAME, emp_rec.GENDER,
         emp_rec.AGE, emp_rec.BASICSAL);

        v_count := v_count + 1;

    END LOOP;

    IF v_count = 0 THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    DBMS_OUTPUT.PUT_LINE(v_count || ' record(s) inserted successfully.');

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO_DEPT_FOUND: No employees found for the entered DEPT_NO.');

END;
/