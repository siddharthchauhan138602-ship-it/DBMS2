SET SERVEROUTPUT ON;

DECLARE
   total_rows NUMBER;
BEGIN
   -- Raise salary by 5% for employees in dept 20
   UPDATE EMP
   SET BasicSal = BasicSal * 1.05
   WHERE Deptno = 20;

   IF SQL%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('No employees found in department 20.');
   ELSE
      total_rows := SQL%ROWCOUNT;
      DBMS_OUTPUT.PUT_LINE(total_rows || ' employee(s) salary raised by 5% in department 20.');

      -- Insert update records into emp_update table using sequence
      INSERT INTO emp_update (update_id, emp_id, old_salary, new_salary, update_date)
      SELECT emp_update_seq.NEXTVAL, EID, BasicSal/1.05, BasicSal, SYSDATE
      FROM EMP
      WHERE Deptno = 20;
   END IF;
END;
/
