SET SERVEROUTPUT ON;

CREATE TABLE EMP (
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(50),
    Deptno NUMBER(3),
    Deptname VARCHAR2(30),
    Gender CHAR(1),
    Age NUMBER(3),
    BasicSal NUMBER(10,2)
);

-- Sample Insertions
INSERT INTO EMP (EID, EName, Deptno, Deptname, Gender, Age, BasicSal)
VALUES (201, 'ELLIJAH', 10, 'HR', 'M', 30, 30000);

INSERT INTO EMP (EID, EName, Deptno, Deptname, Gender, Age, BasicSal)
VALUES (202, 'KOL', 20, 'Finance', 'F', 28, 40000);

INSERT INTO EMP (EID, EName, Deptno, Deptname, Gender, Age, BasicSal)
VALUES (203, 'FREYA', 30, 'IT', 'M', 35, 50000);

INSERT INTO EMP (EID, EName, Deptno, Deptname, Gender, Age, BasicSal)
VALUES (204, 'REBEKAH', 40, 'Marketing', 'F', 32, 45000);

COMMIT;

SELECT * FROM EMP;
