-- 1. Count the number of employees in each department
-- This query groups employees by department_id and counts how many employees exist in each.
select department_id, count(*) as total_employees from hr.employees 
group by department_id;

-- 2. Find the average salary in each department
-- This query calculates the average salary for employees in each department.
select department_id, avg(salary) as average_salary from hr.employees 
group by department_id;

-- 3. Find the maximum and minimum salary in each department
-- This query finds the highest and lowest salaries for each department.
select department_id, min(salary) as minimum_salary, max(salary) as maximum_salary from hr.employees
group by department_id;

-- 4. Find the total salary paid in each department
-- This query sums up all employee salaries in each department.
select department_id, sum(salary) as total_salary from hr.employees
group by department_id;

-- 5. Count the number of employees in each job role
-- This query counts the number of employees who have the same job role.
select job_id, count(*) as total_employees from hr.employees
group by job_id;

-- 6. Find the average salary for each job role
-- This query calculates the average salary for employees in each job role.
select job_id, avg(salary) as average_salary from hr.employees
group by job_id;

-- 7. Find the maximum salary for each job role
-- This query finds the highest salary assigned to employees for each job role.
select job_id, max(salary) as maximum_salary from hr.employees 
group by job_id;

-- 8. Find the minimum salary for each job role
-- This query finds the lowest salary assigned to employees for each job role.
select job_id, min(salary) as miinum_salary from hr.employees 
group by job_id;

-- 9. Find the total salary paid for each job role
-- This query calculates the total salary payout for employees in each job role.
select job_id, sum(salary) as total_salary from hr.employees
group by job_id;

-- 10. Count the number of employees hired in each year
-- This query extracts the year from the hire_date and counts employees hired in each year.
select extract(year from hire_date) as hire_year, count(*) as total_employees from hr.employees
group by extract(year from hire_date) order by hire_year;

-- 11. Find the total salary paid in each location
-- This query sums up the total salary per location by joining employees with department locations.
select d.location_id, sum(e.salary) as total_salary 
from hr.employees e 
join hr.departments d on e.department_id=d.department_id
group by d.location_id;

-- 12. Find the number of employees in each manager's team
-- This query counts the employees who report to each manager.
select e.department_id, d.manager_id, count(*) as team_size 
from hr.employees e
join hr.departments d on e.department_id=d.department_id
where d.manager_id is not null
group by e.department_id, d.manager_id;

-- 13. Find the highest salary for each manager
-- This query finds the highest salary among employees reporting to each manager.
select d.manager_id, e.department_id, max(salary) as maximum_salary
from hr.employees e
join hr.departments d on e.department_id=d.department_id
where d.manager_id is not null
group by d.manager_id, e.department_id;

-- 14. Find the average salary for each manager's team
-- This query calculates the average salary of employees reporting to each manager.
select d.manager_id, e.department_id, avg(salary) as average_salary
from hr.employees e
join hr.departments d on e.department_id=d.department_id
where d.manager_id is not null
group by d.manager_id, e.department_id;

-- 15. Count the number of employees hired in each month of the year
-- This query extracts the month from hire_date and counts how many employees were hired in each month.
select extract(month from hire_date) as hire_month, count(*) as total_employees from hr.employees
group by extract(month from hire_date) order by hire_month;

-- 16. Find the department with the highest total salary
-- This query finds the department that pays the highest total salary by sorting in descending order.
select department_id, sum(salary) as total_salary from hr.employees
group by department_id
order by total_salary desc 
fetch first 1 row only;

-- 17. Find the job role with the highest average salary
-- This query finds the job role with the highest average salary by sorting in descending order.
select job_id, avg(salary) as average_salary from hr.employees
group by job_id
order by average_salary desc 
fetch first 1 row only;

-- 18. Find the number of employees in each city
-- This query counts the number of employees per city, assuming departments are linked to locations.
select l.city, count(*) as total_employees 
from hr.employees e
join hr.departments d on e.department_id=d.department_id
join hr.locations l on d.location_id=l.location_id
group by l.city;

-- 19. Find the number of employees who have a commission, grouped by department
-- This query counts employees who receive a commission, grouped by department.
select department_id, count(*) as employees_commission
from hr.employees
where commission_pct is not null
group by department_id;

-- 20. Find the sum of salaries for employees who have a commission, grouped by department
-- This query sums up the salaries of employees who receive a commission, grouped by department.
select department_id, sum(salary) as total_salary from hr.employees
where commission_pct is not null
group by department_id;

-- ******************************************************************************************************

-- # Oracle SQL Aggregation Questions for Sales History Table

-- 1. Count the number of sales transactions for each product. 
-- This query counts the number of sales transactions for each product
select prod_id, count(*) as total_transactions from sh.sales 
group by prod_id

-- 2. Find the average sale amount for each product.  
-- This query finds the average sales amount for each product
select prod_id, avg(quantity_sold) as average_sales from sh.sales
group by prod_id

-- 3. Find the maximum and minimum sale amount for each product.
-- This query finds the maximum and minimum sale amount for each product
select prod_id, min(amount_sold) as minimum_amount, max(amount_sold) as maximum_amount from sh.sales
group by prod_id;

-- 4. Find the total revenue generated by each product.  
-- This query will find the total revenue which is generated by each product
select prod_id, sum(amount_sold) as total_revenue from sh.sales
group by prod_id;

-- 5. Count the number of sales transactions for each customer.  
-- This query counts the total number of sales transactions for each customer
select cust_id, count(*) as total_sales from sh.sales
group by cust_id;

-- 6. Find the average sale amount per customer.  
-- This query will find the average sa;es amount for each customer
select cust_id, avg(amount_sold) as average_sales from sh.sales
group by cust_id

-- 7. Find the highest purchase amount for each customer. 
-- This query finds the highest purchase amount for each customer
select cust_id, max(amount_sold) as highest_sales from sh.sales
group by cust_id

-- 8. Find the lowest purchase amount for each customer.  
-- This query will find the lowest purchase amount for each customer
select cust_id, min(amount_sold) as lowest_sales from sh.sales
group by cust_id
