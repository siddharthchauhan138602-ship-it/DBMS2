Declare 
    v_num NUMBER;

Begin 

    v_num := TO_NUMBER('&input_value');  -- Prompt user for input value

    DBMS_OUTPUT.PUT_LINE('Number = ' || v_num);

    EXCEPTION
        WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('Error: Invalid number format.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
End;
/