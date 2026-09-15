DECLARE
 no1 number:=10;
 no2 number:=0;
 result number;

BEGIN
   result := no1 / no2; 
   DBMS_OUTPUT.PUT_LINE('Result: ' || result);       
EXCEPTION
   WHEN ZERO_DIVIDE THEN
      DBMS_OUTPUT.PUT_LINE('Error: Division by zero is not allowed.');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/