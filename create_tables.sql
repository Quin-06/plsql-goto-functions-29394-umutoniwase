SET SERVEROUTPUT ON

BEGIN EXECUTE IMMEDIATE 'DROP TABLE employees PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departments PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE departments (
  dept_id   NUMBER(4) PRIMARY KEY,
  dept_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
  emp_id         NUMBER(6) PRIMARY KEY,
  emp_name       VARCHAR2(60) NOT NULL,
  dept_id        NUMBER(4) REFERENCES departments(dept_id),
  hire_date      DATE NOT NULL,
  monthly_salary NUMBER(10,2)
);

INSERT INTO departments VALUES (10, 'Finance');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'Human Resources');

INSERT INTO employees VALUES (101,'Alice Uwase',10,DATE '2018-03-15',450000);
INSERT INTO employees VALUES (102,'Bob Nkurunziza',20,DATE '2020-07-01',250000);
INSERT INTO employees VALUES (103,'Carine Mutoni',20,DATE '2022-01-10',80000);
INSERT INTO employees VALUES (104,'David Habimana',30,DATE '2015-11-20',600000);
INSERT INTO employees VALUES (105,'Eric No-Dept',NULL,DATE '2023-05-05',150000);
INSERT INTO employees VALUES (106,'Faith Zero-Pay',10,DATE '2021-09-09',0);
INSERT INTO employees VALUES (107,'Grace Future',30,DATE '2030-01-01',120000);
COMMIT;

SELECT * FROM departments;
SELECT * FROM employees;