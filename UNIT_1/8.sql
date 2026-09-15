SET SERVEROUTPUT ON;

DECLARE
    var_eid EMP.EID%TYPE;
    var_name EMP.EName%TYPE;
    var_basic EMP.BasicSal%TYPE;
    var_hra NUMBER(10,2);
    var_da NUMBER(10,2);
    var_med NUMBER(10,2) := 500;
    var_pf NUMBER(10,2);
    var_gross NUMBER(10,2);
BEGIN
    -- Accept Employee ID
    var_eid := &EID;

    -- Fetch Employee Details
    SELECT EName, BasicSal
    INTO var_name, var_basic
    FROM EMP
    WHERE EID = var_eid;

    -- Salary Components
    var_hra := var_basic * 0.15;
    var_da  := var_basic * 0.50;
    var_pf  := var_basic * 0.10;

    -- Gross Salary Calculation
    var_gross := var_basic + (var_hra + var_da + var_med) - var_pf;

    -- Display Result
    DBMS_OUTPUT.PUT_LINE('Employee ID   : ' || var_eid);
    DBMS_OUTPUT.PUT_LINE('Employee Name : ' || var_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary  : ' || var_basic);
    DBMS_OUTPUT.PUT_LINE('HRA           : ' || var_hra);
    DBMS_OUTPUT.PUT_LINE('DA            : ' || var_da);
    DBMS_OUTPUT.PUT_LINE('Medical       : ' || var_med);
    DBMS_OUTPUT.PUT_LINE('PF Deduction  : ' || var_pf);
    DBMS_OUTPUT.PUT_LINE('Gross Salary  : ' || var_gross);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ID not found.');
END;
/
