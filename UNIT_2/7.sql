SET SERVEROUTPUT ON;

DECLARE
   -- Variables to hold fetched values
   v_id    CUSTOMER.ID%TYPE;
   v_name  CUSTOMER.Name%TYPE;
   v_addr  CUSTOMER.Address%TYPE;

   -- Explicit cursor
   CURSOR c_customers IS
      SELECT ID, Name, Address
      FROM CUSTOMER;

BEGIN
   OPEN c_customers;
   LOOP
      FETCH c_customers INTO v_id, v_name, v_addr;
      EXIT WHEN c_customers%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name || ', Address: ' || v_addr);
   END LOOP;
   CLOSE c_customers;
END;
/
