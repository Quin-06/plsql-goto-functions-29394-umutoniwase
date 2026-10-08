CREATE OR REPLACE FUNCTION fn_validate_payroll (p_emp_id IN NUMBER)
RETURN VARCHAR2
IS
    v_emp     employees%ROWTYPE;
    e_invalid EXCEPTION;
    v_msg     VARCHAR2(200);
BEGIN
    SELECT * INTO v_emp
      FROM employees
     WHERE emp_id = p_emp_id;

    IF v_emp.monthly_salary IS NULL OR v_emp.monthly_salary <= 0 THEN
        v_msg := 'Salary must be greater than zero';
        RAISE e_invalid;
    END IF;

    IF v_emp.dept_id IS NULL THEN
        v_msg := 'Employee has no department';
        RAISE e_invalid;
    END IF;

    IF fn_dept_name(v_emp.dept_id) = 'Unknown' THEN
        v_msg := 'Department does not exist';
        RAISE e_invalid;
    END IF;

    IF v_emp.hire_date > SYSDATE THEN
        v_msg := 'Hire date is in the future';
        RAISE e_invalid;
    END IF;

    RETURN 'VALID';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee not found';
    WHEN e_invalid THEN
        RETURN 'INVALID: ' || v_msg;
END fn_validate_payroll;
/
SHOW ERRORS