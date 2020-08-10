-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select 
e.emp_no, 
e.last_name, 
e.first_name,
e.sex,
s.salary
from employees e join salaries  s on (e.emp_no=s.emp_no)
order by emp_no

-- List first name, last name, and hire date for employees who were hired in 1986.
select 
first_name,
last_name,
hire_date 
from employees 
where (extract(year from hire_date)::integer)=1986

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select
d.dept_no,
d.dept_name,
m.emp_no as "managers employee number",
e.last_name,
e.first_name
from dept_manager m 
join departments d on (d.dept_no=m.dept_no)
join employees e on (m.emp_no=e.emp_no)

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

select 
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from dept_emp de 
join employees e on (de.emp_no=e.emp_no)
join departments d on (de.dept_no=d.dept_no)

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select 
first_name,
last_name,
sex
from employees 
where first_name = 'Hercules'
and 
last_name like 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select 
e.emp_no,
e.last_name,
e.first_name,
d.dept_name 
from dept_emp de
join employees e on (de.emp_no=e.emp_no)
join departments d on (de.dept_no=d.dept_no)
where dept_name like 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 
e.emp_no,
e.last_name,
e.first_name,
d.dept_name 
from dept_emp de
join employees e on (de.emp_no=e.emp_no)
join departments d on (de.dept_no=d.dept_no)
where dept_name like 'Sales' or dept_name like 'Development'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name,count(last_name) as name_count from employees
group by last_name
order by name_count desc