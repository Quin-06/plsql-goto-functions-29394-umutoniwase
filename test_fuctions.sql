SET SERVEROUTPUT ON
BEGIN
  DBMS_OUTPUT.PUT_LINE('101 annual: ' || fn_annual_salary(101));
  DBMS_OUTPUT.PUT_LINE('999 annual: ' || NVL(TO_CHAR(fn_annual_salary(999)),'NULL'));
  DBMS_OUTPUT.PUT_LINE('101 years: ' || fn_years_of_service(101));
  DBMS_OUTPUT.PUT_LINE('tax 50000:  ' || fn_calculate_tax(50000));
  DBMS_OUTPUT.PUT_LINE('tax 80000:  ' || fn_calculate_tax(80000));
  DBMS_OUTPUT.PUT_LINE('tax 150000: ' || fn_calculate_tax(150000));
  DBMS_OUTPUT.PUT_LINE('tax 300000: ' || fn_calculate_tax(300000));
  DBMS_OUTPUT.PUT_LINE('dept 10: ' || fn_dept_name(10));
  DBMS_OUTPUT.PUT_LINE('dept 99: ' || fn_dept_name(99));
END;
/