SET SERVEROUTPUT ON;

DECLARE
    v_input     VARCHAR2(50);
    v_eid       EMP.EID%TYPE;
    v_ename     EMP.EName%TYPE;
    v_basicsal  EMP.BasicSal%TYPE;

BEGIN
    -- Accept employee name from user
    v_input := '&Enter_Employee_Name';

    -- Fetch employee details for the given name
    SELECT EID, EName, BasicSal
    INTO v_eid, v_ename, v_basicsal
    FROM EMP
    WHERE EName = v_input;

    -- Display the basic salary
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_eid ||
                         ', Name: ' || v_ename ||
                         ', Basic Salary: ' || v_basicsal);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee with name "' || v_input || '" not found in the EMP table.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/
