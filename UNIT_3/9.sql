SET SERVEROUTPUT ON;

DECLARE
    -- Change this variable to test different employee IDs (EIDs) from your table
    v_eid       EMP.EID%TYPE := &id; 
    v_ename     EMP.EName%TYPE;
    v_sal       EMP.BasicSal%TYPE;
    
    -- Declare the user-defined exception
    NULL_COMMISSION EXCEPTION;
BEGIN
    -- Using an implicit cursor (SELECT ... INTO) to fetch details for the given EID
    SELECT EName, BasicSal 
    INTO v_ename, v_sal 
    FROM EMP 
    WHERE EID = v_eid;

    -- Raise the user-defined exception if the salary/commission value is NULL
    IF v_sal IS NULL THEN
        RAISE NULL_COMMISSION;
    ELSE
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Employee ID   : ' || v_eid);
        DBMS_OUTPUT.PUT_LINE('Employee Name : ' || v_ename);
        DBMS_OUTPUT.PUT_LINE('Salary/Comm   : ' || v_sal);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    END IF;

EXCEPTION
    -- Handling the user-defined exception
    WHEN NULL_COMMISSION THEN
        DBMS_OUTPUT.PUT_LINE('Custom Error: Employee ' || v_eid || ' (' || v_ename || ') has a NULL value.');
        
    -- Handling case where the employee ID does not exist
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee with ID ' || v_eid || ' does not exist in the table.');
        
    -- Handling any other unpredicted errors
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/