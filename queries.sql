-- Data Analysis --

-- 1.List the employee number, last name, first name, sex, and salary of each employee.

select employees.emp_no,
 employees.last_name,
 employees.first_name, 
 employees.sex,
 salaries.salary
FROM employees
inner join salaries on 
employees.emp_no = salaries.emp_no;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

select employees.emp_no,
 employees.first_name, 
 employees.last_name,
 employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' and '1986-12-31';


-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

select dm.dept_no,
 d.dept_name,
 dm.emp_no,
 e.last_name,
 e.first_name 
FROM dept_manager as dm
INNER JOIN departments as d on 
d.dept_no = dm.dept_no
INNER JOIN employees as e on 
e.emp_no = dm.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select de.dept_no,
 de.emp_no,
 e.last_name,
 e.first_name,
 d.dept_name 
FROM dept_emp as de
INNER JOIN departments as d on 
d.dept_no = de.dept_no
INNER JOIN employees as e on 
e.emp_no = de.emp_no;
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select e.first_name,
e.last_name,
e.sex
FROM employees as e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no,
e.last_name,
e.first_name
FROM employees as e
INNER join	dept_emp as de on 
de.emp_no = e.emp_no
INNER join departments as d on 
d.dept_no = de.dept_no
where d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees as e
INNER join	dept_emp as de on 
de.emp_no = e.emp_no
INNER join departments as d on 
d.dept_no = de.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select e.last_name,
count(e.last_name)
FROM employees as e
GROUP by last_name
ORDER by count DESC;