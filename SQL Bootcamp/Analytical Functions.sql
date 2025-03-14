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

-- 16. Find the total salary expenditure for each manager's team.
-- Sums salaries of employees under each manager.
select d.manager_id, sum(e.salary) as total_team_salary 
from hr.employees e
join hr.departments d on e.department_id=d.department_id
group by d.manager_id, e.department_id

-- 17. Find the highest-paid employee in each department.
-- Uses RANK() to find the highest-paid employee in each department.
select department_id, employee_id, salary 
from (
    select department_id, employee_id, salary,
    rank() over (partition by department_id order by salary desc) as salary_rank 
    from hr.employees
)
where salary_rank=1;

-- 18. Calculate the running total of salaries for employees hired in each department.
-- Uses SUM() OVER() to compute cumulative salary totals.
select department_id, employee_id, salary, 
sum(salary) over (partition by department_id order by hire_date) as total_sal
from hr.employees

-- 19. Find the employees who earn above the average salary of their department.
-- Uses a subquery to filter employees earning above department average.
select department_id, employee_id, salary 
from hr.employees 
where salary > (
    select avg(salary) from hr.employees
)

-- 20. Rank employees within their department based on experience.
-- Uses RANK() to order employees by hire date per department.
select employee_id, department_id, hire_date, 
rank() over (partition by department_id order by hire_date asc) as hire_rank
from hr.employees

-- 21. Find the difference between each employee’s salary and the department average.
-- Uses AVG() OVER() to compute salary difference from department average.
select employee_id, department_id, salary, 
avg(salary) over (partition by department_id) as sal_diff
from hr.employees

-- 22. Find the department where the most employees have been hired.
-- Counts employees in each department and selects the highest.
select department_id, count(*) as total_hired
from hr.employees 
group by department_id
order by total_hired desc
fetch first 1 row only

-- 23. Identify employees who were hired in the same month and year as someone else.
-- Uses COUNT() OVER() to count employees hired in the same month-year.
select employee_id, hire_date, 
       count(*) over (partition by extract(month from hire_date), extract(year from hire_date)) as same_month_hires
from hr.employees;

-- 24. Calculate the moving average salary over the last 3 employees ordered by hire date.
-- Uses AVG() OVER() with ROWS BETWEEN for moving average calculation.
select employee_id, hire_date, salary, 
       avg(salary) over (order by hire_date rows between 2 preceding and current row) as moving_avg_salary
from hr.employees;

-- 25. Find employees whose salary is greater than that of the average of their manager’s team.
-- Uses a subquery to compare employee salary with manager's team average.
select e.employee_id, e.manager_id, e.salary
from hr.employees e
where e.salary > (select avg(salary) from hr.employees where manager_id = e.manager_id );























