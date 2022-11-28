-- create tables

CREATE TABLE 'departments'(
  dept_no  varchar(6) PRIMARY KEY,
  dept_name varchar(35) NOT NULL,
  CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);


CREATE TABLE 'dept_emp'(
  emp_no integer NOT NULL ,
  dept_no(6) varchar NOT NULL,
);

CREATE TABLE 'dept_manager'(
  dept_no(6) varchar NOT NULL,
  emp_no integer NOT NULL ,
  
);


CREATE TABLE 'employees'(
  emp_no integer ,
  emp_title_id VARCHAR(25) NOT NULL,
  birth_date VARCHAR(15) NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date VARCHAR(15) NOT NULL,
  CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

create TABLE 'salaries'(
	emp_no integer not  null,
	salary integer not null,
  CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE 'titles'(
  title_id VARCHAR NOT NULL ,
  title VARCHAR NOT NULL,
  CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");



-----------------------------------------------------

-- Change dates (varchar) type to (date) type

ALTER TABLE employees 
ALTER COLUMN hire_date TYPE date 
USING to_date(hire_date, 'mm/dd/yyyy');

ALTER TABLE employees 
ALTER COLUMN birth_date TYPE date 
USING to_date(birth_date, 'mm/dd/yyyy');