DECLARE
    l_code NUMBER;
    r_customer customer%ROWTYPE;
BEGIN
    select * into r_customer from customer;

EXCEPTION
    WHEN OTHERS THEN 
        l_code := SQLCODE;
        dbms_output.put_line('Error code: ' || l_code);

END;
/