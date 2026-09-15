CREATE TABLE emp_update (
    update_id NUMBER PRIMARY KEY,
    emp_id NUMBER,
    old_salary NUMBER(10,2),
    new_salary NUMBER(10,2),
    update_date DATE
);

-- Create sequence for auto-increment
CREATE SEQUENCE emp_update_seq START WITH 1 INCREMENT BY 1;
