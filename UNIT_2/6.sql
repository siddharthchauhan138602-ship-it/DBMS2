SET SERVEROUTPUT ON;

-- Backup table (create once)
CREATE TABLE EMP_BACKUP AS SELECT * FROM EMP WHERE 1=0;

DECLARE
   -- Cursor to fetch employees for a given department
   CURSOR emp_cur(p_dept_no NUMBER) IS
      SELECT EID, EName, Deptno, Deptname, Gender, Age, BasicSal
      FROM EMP
      WHERE Deptno = p_dept_no;

   -- Variables to hold fetched values
   v_eid      EMP.EID%TYPE;
   v_ename    EMP.EName%TYPE;
   v_deptno   EMP.Deptno%TYPE;
   v_deptname EMP.Deptname%TYPE;
   v_gender   EMP.Gender%TYPE;
   v_age      EMP.Age%TYPE;
   v_salary   EMP.BasicSal%TYPE;

   -- User-defined exception
   NO_DEPT_FOUND EXCEPTION;

   -- Input department number
   v_dept_input NUMBER := &DEPT_NO;

BEGIN
   -- Open cursor
   OPEN emp_cur(v_dept_input);
   FETCH emp_cur INTO v_eid, v_ename, v_deptno, v_deptname, v_gender, v_age, v_salary;

   -- If no rows found, raise exception
   IF emp_cur%NOTFOUND THEN
      RAISE NO_DEPT_FOUND;
   ELSE
      -- Process all rows
      LOOP
         EXIT WHEN emp_cur%NOTFOUND;

         INSERT INTO EMP_BACKUP(EID, EName, Deptno, Deptname, Gender, Age, BasicSal)
         VALUES (v_eid, v_ename, v_deptno, v_deptname, v_gender, v_age, v_salary);

         FETCH emp_cur INTO v_eid, v_ename, v_deptno, v_deptname, v_gender, v_age, v_salary;
      END LOOP;
   END IF;

   CLOSE emp_cur;

   DBMS_OUTPUT.PUT_LINE('Records inserted into EMP_BACKUP successfully.');

EXCEPTION
   WHEN NO_DEPT_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No employees found for department ' || v_dept_input);
END;
/
