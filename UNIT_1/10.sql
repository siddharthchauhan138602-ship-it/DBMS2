SET SERVEROUTPUT ON;

DECLARE
    var_eid EMP.EID%TYPE;
BEGIN
    -- Accept Employee ID
    var_eid := &EID;

    -- Try to delete the record
    DELETE FROM EMP
    WHERE EID = var_eid;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Employee record with ID ' || var_eid || ' deleted successfully.');
        COMMIT; -- Save changes permanently
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employee found with ID ' || var_eid || '.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while deleting employee record.');
END;
/
