SET SERVEROUTPUT ON;

DECLARE
   CURSOR c1 IS
      SELECT EID, BasicSal
      FROM EMP
      WHERE Deptno = 20;

   v_eid EMP.EID%TYPE;
   v_sal EMP.BasicSal%TYPE;
   v_newsal EMP.BasicSal%TYPE;
BEGIN
   OPEN c1;

   IF c1%ISOPEN THEN
      FETCH c1 INTO v_eid, v_sal;

      IF c1%NOTFOUND THEN
         DBMS_OUTPUT.PUT_LINE('No employees found in department 20.');
      ELSE
         WHILE c1%FOUND LOOP
            v_newsal := v_sal * 1.05;

            -- Update salary
            UPDATE EMP SET BasicSal = v_newsal WHERE EID = v_eid;

            -- Maintain record in emp_update using sequence
            INSERT INTO emp_update (update_id, emp_id, old_salary, new_salary, update_date)
            VALUES (emp_update_seq.NEXTVAL, v_eid, v_sal, v_newsal, SYSDATE);

            DBMS_OUTPUT.PUT_LINE('Salary updated for employee ' || v_eid);

            FETCH c1 INTO v_eid, v_sal;
         END LOOP;
      END IF;
   END IF;

   CLOSE c1;
END;
/

