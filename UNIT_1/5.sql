-- Celsius-to-Fahrenheit conversion 
DECLARE
   celsius    NUMBER;
   fahrenheit NUMBER;
BEGIN
   -- Accept input from user
   celsius := &celsius;

   -- Conversion calculation
   fahrenheit := (celsius * 9/5) + 32;

   -- Display results
   DBMS_OUTPUT.PUT_LINE('Temperature in Celsius    : ' || celsius);
   DBMS_OUTPUT.PUT_LINE('Temperature in Fahrenheit : ' || fahrenheit);
END;
/
