SET SERVEROUTPUT ON;

BEGIN
   FOR rec IN (
      SELECT EID, EName, Deptno, Deptname, Gender, Age, BasicSal
      FROM EMP
      WHERE Gender = 'M'
        AND Deptname = 'HR'
   )
   LOOP
      DBMS_OUTPUT.PUT_LINE('Employee ID   : ' || rec.EID);
      DBMS_OUTPUT.PUT_LINE('Employee Name : ' || rec.EName);
      DBMS_OUTPUT.PUT_LINE('Dept No       : ' || rec.Deptno);
      DBMS_OUTPUT.PUT_LINE('Dept Name     : ' || rec.Deptname);
      DBMS_OUTPUT.PUT_LINE('Gender        : ' || rec.Gender);
      DBMS_OUTPUT.PUT_LINE('Age           : ' || rec.Age);
      DBMS_OUTPUT.PUT_LINE('Basic Salary  : ' || rec.BasicSal);
      DBMS_OUTPUT.PUT_LINE('-----------------------------');
   END LOOP;
END;
/
