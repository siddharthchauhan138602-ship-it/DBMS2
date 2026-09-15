/* Write a PL/SQL block which accepts measurement in feet and displays it in
   cm,inches and meter. 
*/

DECLARE
   feet NUMBER;
   inches NUMBER;
   cm NUMBER;
   meter NUMBER;
BEGIN
   -- Accept input from user
   feet := &feet;

   -- Conversion Formulas
   inches:= feet * 12;
   cm:= feet * 30.48;
   meter:= feet * 0.3048;

   -- Display results
   DBMS_OUTPUT.PUT_LINE('Measurement in Feet   : ' || feet);
   DBMS_OUTPUT.PUT_LINE('Measurement in Inches : ' || inches);
   DBMS_OUTPUT.PUT_LINE('Measurement in Cm     : ' || cm);
   DBMS_OUTPUT.PUT_LINE('Measurement in Meter  : ' || meter);
END;
/
