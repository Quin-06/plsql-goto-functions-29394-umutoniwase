SET SERVEROUTPUT ON

-- A1 without GOTO
DECLARE
  v_num NUMBER := 7;
BEGIN
  IF v_num > 0 THEN DBMS_OUTPUT.PUT_LINE(v_num || ' is POSITIVE');
  ELSIF v_num < 0 THEN DBMS_OUTPUT.PUT_LINE(v_num || ' is NEGATIVE');
  ELSE DBMS_OUTPUT.PUT_LINE(v_num || ' is ZERO');
  END IF;

  IF v_num != 0 THEN
    IF MOD(v_num, 2) = 0 THEN DBMS_OUTPUT.PUT_LINE(v_num || ' is EVEN');
    ELSE DBMS_OUTPUT.PUT_LINE(v_num || ' is ODD');
    END IF;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
/

-- A2 without GOTO
DECLARE
  v_emp_id employees.emp_id%TYPE := 101;
  v_name   employees.emp_name%TYPE;
  v_salary employees.monthly_salary%TYPE;
BEGIN
  SELECT emp_name, monthly_salary INTO v_name, v_salary
    FROM employees WHERE emp_id = v_emp_id;
  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_name || ' | Monthly salary: ' || v_salary);

  CASE
    WHEN v_salary < 100000 THEN DBMS_OUTPUT.PUT_LINE('LOW band - eligible for increase.');
    WHEN v_salary < 400000 THEN DBMS_OUTPUT.PUT_LINE('MEDIUM band - standard review.');
    ELSE DBMS_OUTPUT.PUT_LINE('HIGH band - no adjustment.');
  END CASE;
  DBMS_OUTPUT.PUT_LINE('Salary review finished.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/