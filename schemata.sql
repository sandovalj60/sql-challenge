-- create tables

CREATE TABLE departments(
  dept_no varchar PRIMARY KEY,
  dept_name varchar NOT NULL
);


CREATE TABLE dept_emp(
  emp_no integer NOT NULL,
  dept_no varchar NOT NULL,
);

CREATE TABLE dept_manager(
  dept_no varchar NOT NULL,
  emp_no integer NOT NULL
);


CREATE TABLE employees(
  emp_no integer PRIMARY KEY,
  emp_title_id VARCHAR NOT NULL,
  birth_date VARCHAR NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  sex VARCHAR NOT NULL,
  hire_date VARCHAR NOT NULL
);

create TABLE salaries (
	emp_no integer not  null,
	salary integer not null
);

-- FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
--  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)