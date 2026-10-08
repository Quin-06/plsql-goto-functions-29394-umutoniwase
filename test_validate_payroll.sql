SET SERVEROUTPUT ON
BEGIN
  FOR r IN (SELECT emp_id, emp_name FROM employees ORDER BY emp_id) LOOP
    DBMS_OUTPUT.PUT_LINE(r.emp_id || ' ' || RPAD(r.emp_name,16) || ' -> ' || fn_validate_payroll(r.emp_id));
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('999 -> ' || fn_validate_payroll(999));
END;
/