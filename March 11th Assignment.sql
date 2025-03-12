-- 1. Count employees per department
select department_id, count(*) as total_employees from hr.employees group by department_id 

-- 2. Total salary per department
select department_id, sum(salary) from hr.employees group by department_id

-- 3. Average salary per department
select department_id, avg(salary) from hr.employees group by department_id

-- 4. Minimum salary per department
select department_id, min(salary) from hr.employees group by department_id

-- 5. Maximum salary per department
select department_id, max(salary) from hr.employees group by department_id

-- 6. Count employees per job role
select job_id, count(*) from hr.employees group by job_id

-- 7. Total salary per job role
select job_id, sum(salary) from hr.employees group by job_id

-- 8. Average salary per job role
select job_id, avg(salary) from hr.employees group by job_id

-- 9. Departments with more than 5 employees
select department_id, count(*) as total_employees from hr.employees group by department_id having count(*) > 5

-- 10. Departments where total salary > 100,000
select department_id, sum(salary) as total_sal from hr.employees group by department_id having total_sal >100000

-- 11. Departments where average salary > 50,000
select department_id, avg(salary) as avg_sal from hr.employees group by department_id having avg_sal > 50000

-- 12. Departments where max salary > 80,000
select department_id, max(salary) as max_sal from hr.employees group by department_id having max_sal > 80000

-- 13. Departments where min salary < 30,000
select department_id, min(salary) as min_sal from hr.employees group by department_id having min_sal < 30000

-- 14. Departments where number of employees is between 5 and 10
select department_id, count(*) as total_employee from hr.employees group by department_id having total_employee between 5 and 10

-- 15. Departments where salary variance > 500,000
select department_id, variance(salary)as var_sal from hr.employees group by department_id having var_sal > 500000

-- 16. Departments where salary standard deviation > 5,000
select department_id, stddev(salary) as stddev_sal from hr.employees group by department_id having stddev_sal > 5000

-- 17. Employees sorted by salary in descending order
select employee_id, first_name, salary from hr.employees order by salary desc

-- 18. Employees sorted by department and salary
select employee_id, first_name, salary from hr.employees order by department_id asc, salary desc

-- 19. Employees sorted by last name alphabetically
select employee_id, first_name, last_name from hr.employees order by last_name asc

-- 20. Employees sorted by hire date
select employee_id, first_name, hire_date from hr.employees order by hire_date asc

-- 21. Employees sorted by commission, placing NULLs last
select employee_id, first_name, commission_pct from hr.employees order by commission_pct NULLS last

-- 22. Employees sorted by commission, placing NULLs first
select employee_id, first_name, commission_pct from hr.employees order by commission_pct NULLS first

-- 23. Employees sorted by length of first name
select employee_id, first_name from hr.employees order by length(first_name) asc

-- 24. Employees sorted by last two characters of last name
select employee_id, first_name, last_name from hr.employees order by substr(last_name, -2) asc

-- 25. Employees sorted by uppercase first name
select employee_id, upper(first_name) as upper_name from hr.employees order by upper_name asc

-- 26. Employees sorted by salary after adding a bonus
select employee_id, first_name, salary from hr.employees order by (salary + 500) desc

-- 27. Employees sorted by job ID and last name
select employee_id, job_id, last_name from hr.employees order by job_id asc, last_name asc

-- 28. Employees sorted by department, then by first name
select employee_id, first_name, department_id from hr.employees order by department_id asc, first_name asc 

-- 29. Employees with IT_PROG job role first
select employee_id, first_name, job_id
from hr.employees order by case when job_id = 'IT_PROG' then 1 else 2 end

-- 30. Employees with priority to salaries above 5000
select employee_id, first_name, salary
from hr.employees order by case when salary > 5000 then 1 else 2 end, salary desc

-- 31. Departments where total salary between 50,000 and 200,000
select department_id, sum(salary)as total_sal from hr.employees group by department_id 
having total_sal between 50000 and 200000

-- 32. Departments where max salary is at least double the min salary
select department_id, max(salary) as max_sal, min(salary) as min_sal
from hr.employees group by department_id having max(salary)>= 2 *min(salary)

-- 33. Employees in department 50 at the top
select employee_id, first_name, department_id
from hr.employees order by case when department_id=50 then 1 else 2 end asc

-- 34. Employees sorted by highest salary ratio
select department_id, max(salary)/avg(salary) as salary_ratio
from hr.employees group by department_id having salary_ratio > 1.5 order by salary_ratio desc

-- 35. Employees sorted by job ID then salary
select employee_id, first_name, job_id, salary from hr.employees order by job_id asc, salary asc

-- 36. Employees sorted by highest commission first
select employee_id, first_name, commission_pct from hr.employees order by commission_pct desc NULLS last

-- 37. Employees sorted by salary, keeping those with no commission at the bottom
select employee_id, first_name, commission_pct from hr.employees 
order by case when commission_pct is NULL then 2 else 1 end, salary desc

-- 38. Employees sorted by department and descending salary
select employee_id, first_name, department_id, salary from hr.employees order by department_id asc, salary desc

-- 39. Employees where more than 50% earn above 60,000
select job_id, count(case when salary > 60000 then 1 end) * 1.0 / count(*) as high_earner_ratio
from hr.employees group by job_id having count(case when salary > 60000 then 1 end) > count(*) / 2

-- 40. Departments where IT and HR salaries sum to 80,000 or more
select department_id, sum(case when job_id in('IT_PROG', 'HR_REP') then salary else 0 end) as it_hr_salary from hr.employees 
group by department_id having sum(case when job_id in('IT_PROG', 'HR_REP') then salary else 0 end) >=80000

-- ******************************************************************************************************************************

-- ===========================
-- 1. Basic Aggregate Functions
-- ===========================

-- 1. Count total employees
select count(*) as total_employees from hr.employees

-- 2. Count distinct job roles
select count(distinct job_id) as unique_jobs from hr.employees

-- 3. Sum of salaries of all employees
select sum(salary) as total_salary from hr.employees

-- 4. Average salary of all employees
select avg(salary) as avg_salary from hr.employees

-- 5. Minimum salary in the company
select min(salary) as min_salary from hr.employees

-- 6. Maximum salary in the company
select max(salary) as max_salary from hr.employees

-- 7. Median salary of all employees
select median(salary) as median_salary from hr.employees

-- 8. Mode of salaries
select mode() within group (order by salary) as most_common_salary from hr.employees

-- 9. Variance of salaries
select variance(salary) as salary_variance from hr.employees

-- 10. Standard deviation of salaries
select stddev(salary) as salary_stddev from hr.employees

-- ******************************************************************************************************************************

-- ==============================
-- 2. Aggregate Functions with GROUP BY
-- ==============================

-- 11. Total employees per department
select department_id, count(*) as total_emp from hr.employees group by department_id

-- 12. Total salary per department
select department_id, sum(salary) as total_sal from hr.employees group by department_id

-- 13. Average salary per department
select department_id, avg(salary) as avg_sal from hr.employees group by department_id

-- 14. Minimum salary per department
select department_id, min(salary) as min_sal from hr.employees group by department_id

-- 15. Maximum salary per department
select department_id, max(salary) as max_sal from hr.employees group by department_id

-- 16. Count employees per job role
select job_id, count(*) as total_emp from hr.employees group by job_id

-- 17. Departments where total salary > 100,000
select department_id, sum(salary) as total_sal from hr.employees group by department_id having sum(salary) > 100000

-- 18. Departments where average salary > 50,000
select department_id, avg(salary) as avg_sal from hr.employees group by department_id having avg(salary) > 50000

-- 19. Departments with more than 5 employees
select department_id, count(*) as total_emp from hr.employees group by department_id having count(*) > 5

-- 20. Job roles with more than 10 employees
select job_id, count(*) as total_employees from hr.employees group by job_id having count(*) > 10

-- ***********************************************************************************************************

-- ==================================
-- 3. Analytical Functions
-- ==================================

-- 21. Assign row numbers to employees ordered by salary
select employee_id, salary, row_number() over (order by salary desc) from hr.employees

-- 22. Rank employees by salary
select employee_id, salary, rank() over(order by salary desc) from hr.employees

-- 23. Dense rank employees by salary
select employee_id, salary, dense_rank() over(order by salary desc) from hr.employees

-- 24. Divide employees into 4 salary quartiles
select employee_id, salary, ntile(4) over (order by salary) from hr.employees

-- 25. Get previous salary for each employee
select employee_id, salary, lag(salary) over (order by salary) as prev_sal from hr.employees

-- 26. Get next salary for each employee
select employee_id, salary, lead(salary) over (order by salary) as next_sal from hr.employees

-- 27. First salary in the ordered set
select employee_id, salary, first_value(salary) over (order by salary) as lowest_sal from hr.employees

-- 28. Last salary in the ordered set
select employee_id, salary, last_value(salary) over (order by salary rows between unbounded preceding and unbounded following) as highest_sal from hr.employees

-- 29. Calculate cumulative distribution of salaries
select employee_id, salary, cume_dist() over (order by salary) as cumulative_dist from hr.employees

-- 30. Calculate percentage rank of salaries
select employee_id, salary, percent_rank() over (order by salary) as rank_percent from hr.employees

-- ************************************************************************************************************

-- =========================================
-- 4. ORDER BY with Aggregate and Analytical Functions
-- =========================================

-- 31. Employees sorted by salary in descending order
select employee_id, first_name, salary from hr.employees order by salary desc

-- 32. Employees sorted by department and salary
select employee_id, first_name, department_id, salary from hr.employees
order by department_id, salary desc

-- 33. Employees sorted by last name alphabetically
select employee_id, first_name, last_name from hr.employees order by last_name asc

-- 34. Employees sorted by hire date
select employee_id, first_name, hire_date from hr.employees order by hire_date asc

-- 35. Employees sorted by length of first name
select employee_id, first_name from hr.employees order by length(first_name) desc

-- 36. Employees sorted by last two characters of last name
select employee_id, first_name, last_name from hr.employees order by substr(last_name, -2) asc

-- 37. Employees with IT_PROG job role first
select employee_id, first_name, job_id from hr.employees order by case when job_id='IT_PROG' then 1 else 2 end

-- 38. Employees sorted by highest salary ratio
select department_id, max(salary) / avg(salary) as salary_ratio from hr.employees group by department_id having max(salary) / avg(salary) > 1.5 order by salary_ratio desc

-- 39. Employees sorted by highest commission first
select employee_id, first_name, commission_pct from hr.employees order by commission_pct desc NULLS last

-- 40. Employees sorted by salary, keeping those with no commission at the bottom
select employee_id, first_name, salary, commission_pct from hr.employees 
order by case when commission_pct is NULL then 2 else 1 end, salary desc

-- ********************************************************************************************************************************************************

-- ===================================
-- More Analytical Functions
-- ===================================

-- 41. Show running total of salaries
select employee_id, salary, sum(salary) over (order by employee_id) as running_total from hr.employees

-- 42. Calculate moving average salary for 3 employees
select employee_id, salary, avg(salary) over (order by employee_id) as running_avg from hr.employees