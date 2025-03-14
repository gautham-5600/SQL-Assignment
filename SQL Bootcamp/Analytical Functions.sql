-- 6. Assign a rank to employees based on their salary within each department.
-- Uses RANK() to assign ranks based on salary in each department.
select department_id, employee_id, salary, rank() over (partition by department_id order by salary desc ) as salary_rank
from hr.employees;

-- 7. Find the top 3 highest-paid employees in each department.
-- Uses RANK() to rank employees based on salary and filters top 3.
select department_id, employee_id, salary, salary_rank
from (
    select department_id, employee_id, salary, 
    rank() over (partition by department_id order by salary desc) as salary_rank
    from hr.employees
    )
where salary_rank <= 3;

-- 8. Identify the second highest salary in each department using DENSE_RANK().
-- Uses DENSE_RANK() to identify employees with the second-highest salary per department.
select department_id, employee_id, salary 
from (
    select department_id, employee_id, salary, 
    dense_rank() over (partition by department_id order by salary desc) as salary_rank
    from hr.employees
)
where salary_rank=2;

-- 9. Compute the cumulative total salary of employees ordered by hire date.
-- Uses SUM() OVER() to create a running total of salaries.
select employee_id, hire_date, salary, 
sum(salary) over (order by hire_date asc) as cumulative_salary
from hr.employees;

-- 10. Assign a row number to each employee in each department.
-- Uses ROW_NUMBER() to assign a unique row number per department.
select department_id, employee_id,
row_number() over (partition by department_id order by employee_id) as row_num
from hr.employees

-- 11. Find the salary difference between each employee and the next highest-paid employee.
-- Uses LEAD() to compare an employee's salary with the next highest.
select employee_id, salary,
lead (salary) over (order by salary desc) as salary_difference
from hr.employees

-- 12. Calculate the previous month’s salary for each employee using LAG().
-- Uses LAG() to get the previous salary entry for each employee.
select employee_id, salary, hire_date, 
lag(salary) over (partition by employee_id order by hire_date) as prev_salary
from hr.employees;

-- 13. Identify employees whose salaries increased over time.
-- Uses LAG() to compare an employee's current and previous salaries.
select employee_id, hire_date, salary,
lag(salary) over (partition by employee_id order by hire_date) as prev_salary, 
case when salary > lag(salary) over (partition by employee_id order by hire_date)
then 'Increased' else 'Decreased' end as salary_trend 
from hr.employees;

-- 14. Find the average salary of employees who joined in each year.
-- Computes average salary grouped by year of hire.
select extract(year from hire_date) as hire_year, round(avg(salary), 2) as avg_sal
from hr.employees 
group by extract(year from hire_date)
order by hire_year;

-- 15. Count the number of employees in each job role.
-- Counts employees for each job role using GROUP BY.
select job_id, count(*) as total_employees from hr.employees group by job_id;
























