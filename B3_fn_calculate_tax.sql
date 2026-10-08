CREATE OR REPLACE FUNCTION fn_calculate_tax (p_salary IN NUMBER)
RETURN NUMBER IS
  v_tax NUMBER := 0;
BEGIN
  IF p_salary IS NULL OR p_salary < 0 THEN RETURN NULL; END IF;

  IF p_salary <= 60000 THEN v_tax := 0;
  ELSIF p_salary <= 100000 THEN v_tax := (p_salary - 60000) * 0.10;
  ELSIF p_salary <= 200000 THEN v_tax := 4000 + (p_salary - 100000) * 0.20;
  ELSE v_tax := 4000 + 20000 + (p_salary - 200000) * 0.30;
  END IF;
  RETURN ROUND(v_tax, 2);
END fn_calculate_tax;
/