SET SERVEROUTPUT ON

DECLARE
  v_emp_id employees.emp_id%TYPE := 101;   -- try 103, 102, 104
  v_name   employees.emp_name%TYPE;
  v_salary employees.monthly_salary%TYPE;
BEGIN
  SELECT emp_name, monthly_salary
    INTO v_name, v_salary
    FROM employees
   WHERE emp_id = v_emp_id;

  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_name || ' | Monthly salary: ' || v_salary);

  IF v_salary < 100000 THEN
    GOTO low_salary;
  ELSIF v_salary < 400000 THEN
    GOTO medium_salary;
  ELSE
    GOTO high_salary;
  END IF;

  <<low_salary>>
  DBMS_OUTPUT.PUT_LINE('Review result: LOW band - eligible for a salary increase.');
  GOTO end_review;

  <<medium_salary>>
  DBMS_OUTPUT.PUT_LINE('Review result: MEDIUM band - standard annual review.');
  GOTO end_review;

  <<high_salary>>
  DBMS_OUTPUT.PUT_LINE('Review result: HIGH band - no adjustment needed.');

  <<end_review>>
  DBMS_OUTPUT.PUT_LINE('Salary review finished.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' not found.');
END;
/