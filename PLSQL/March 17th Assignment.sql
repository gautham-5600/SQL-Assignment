--------------------------------------------------
-- 1. Simple SELECT INTO Statement
--------------------------------------------------

DECLARE
    EMP_NAME VARCHAR2(50);
BEGIN
    SELECT FIRST_NAME INTO EMP_NAME FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 101;
END;
/

--------------------------------------------------
-- 2. SELECT Multiple Columns INTO Variables
--------------------------------------------------

DECLARE 
    EMP_NAME VARCHAR2(50);
    EMP_SALARY NUMBER;
BEGIN
    SELECT FIRST_NAME, SALARY INTO EMP_NAME, EMP_SALARY FROM HR.EMPLOYEES WHERE EMPLOYEE_ID=102;
    DBMS_OUTPUT.PUT_LINE('Employee: ' || EMP_NAME || ' Salary: ' || EMP_SALARY);
END;
/

--------------------------------------------------
-- 3. Handling No Data Found Exception
--------------------------------------------------

DECLARE 
    EMP_SALARY NUMBER;
BEGIN
    BEGIN
        SELECT SALARY INTO EMP_SALARY FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 999;
        DBMS_OUTPUT.PUT_LINE('Salary: ' || EMP_SALARY);
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
          DBMS_OUTPUT.PUT_LINE('No employees found under this ID.');
    END;
END;
/

--------------------------------------------------
-- 4. Using SELECT with CASE Statement
--------------------------------------------------

DECLARE
    EMP_STATUS VARCHAR2(20);
BEGIN
    SELECT
        CASE
            WHEN SALARY > 50000 THEN 'High Salary'
            ELSE 'Low Salary'
        END
    INTO EMP_STATUS FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 103;
    DBMS_OUTPUT.PUT_LINE('Employee Status: ' || EMP_STATUS);
END;
/

--------------------------------------------------
-- 5. Using COUNT() with SELECT INTO
--------------------------------------------------

DECLARE
    TOTAL_EMPLOYEES NUMBER;
BEGIN
    SELECT COUNT(*) INTO TOTAL_EMPLOYEES FROM HR.EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE('Total Employees: ' || TOTAL_EMPLOYEES);
END;
/

--------------------------------------------------
-- 6. Fetching MAX Salary
--------------------------------------------------

DECLARE
    MAX_SALARY NUMBER;
BEGIN
    SELECT MAX(SALARY) INTO MAX_SALARY FROM HR.EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE('Highest Salary: ' || MAX_SALARY);
END;
/

--------------------------------------------------
-- 7. Fetching MIN Salary
--------------------------------------------------


DECLARE
    MIN_SALARY NUMBER;
BEGIN
    SELECT MIN(SALARY) INTO MIN_SALARY FROM HR.EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE('Lowest Salary: ' || MIN_SALARY);
END;
/

--------------------------------------------------
-- 8. Fetching AVG Salary
--------------------------------------------------

DECLARE
    AVG_SALARY NUMBER;
BEGIN
    SELECT ROUND(AVG(SALARY), 2) INTO AVG_SALARY FROM HR.EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE('Average Salary: ' || AVG_SALARY);
END;
/

--------------------------------------------------
-- 9. Fetching Employee Name Using Subquery
--------------------------------------------------
DECLARE
    EMP_NAME VARCHAR2(50);
BEGIN
    SELECT FIRST_NAME INTO EMP_NAME FROM HR.EMPLOYEES 
    WHERE EMPLOYEE_ID = (SELECT MIN(EMPLOYEE_ID) FROM HR.EMPLOYEES);
    DBMS_OUTPUT.PUT_LINE('First Employee: ' || EMP_NAME);
END;
/

--------------------------------------------------
-- 10. Fetching Data Using EXISTS
--------------------------------------------------

DECLARE
    EMP_EXISTS VARCHAR2(10);
BEGIN
    SELECT 
        CASE 
            WHEN EXISTS (SELECT 1 FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 105) THEN 'Yes'
            ELSE 'No'
        END 
    INTO EMP_EXISTS 
    FROM DUAL;
    
    DBMS_OUTPUT.PUT_LINE('Employee Exists: ' || EMP_EXISTS);
END;
/

--------------------------------------------------
-- 11. Selecting Employee with Highest Salary
--------------------------------------------------

DECLARE
    EMP_NAME VARCHAR2(50);
BEGIN
    SELECT FIRST_NAME INTO EMP_NAME FROM HR.EMPLOYEES 
    WHERE SALARY = (SELECT MAX(SALARY) FROM HR.EMPLOYEES);
    DBMS_OUTPUT.PUT_LINE('Highest Paid Employee: ' || EMP_NAME);
END;
/

--------------------------------------------------
-- 12. Fetching Department Name
--------------------------------------------------

DECLARE
    DEPT_NAME VARCHAR2(50);
BEGIN
    SELECT DEPARTMENT_NAME INTO DEPT_NAME FROM HR.DEPARTMENTS WHERE DEPARTMENT_ID=10;
    DBMS_OUTPUT.PUT_LINE('Department: ' || DEPT_NAME);
END;
/

--------------------------------------------------
-- 13. Fetching Employee Count in a Department
--------------------------------------------------

DECLARE 
    EMP_COUNT NUMBER;
BEGIN
    SELECT COUNT(*) INTO EMP_COUNT FROM HR.DEPARTMENTS WHERE DEPARTMENT_ID=20;
    DBMS_OUTPUT.PUT_LINE('No of Employees: ' || EMP_COUNT);
END;
/

--------------------------------------------------
-- 14. Fetching Sum of All Salaries
--------------------------------------------------

DECLARE 
    TOTAL_SALARY NUMBER;
BEGIN
    SELECT SUM(SALARY) INTO TOTAL_SALARY FROM HR.EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE('Total Salaries: ' || TOTAL_SALARY);
END;
/

--------------------------------------------------
-- 15. Fetching Employee Joining Date
--------------------------------------------------

DECLARE
    HIRE_DAT DATE;
BEGIN
    SELECT HIRE_DATE INTO HIRE_DAT FROM HR.EMPLOYEES WHERE EMPLOYEE_ID=107;
    DBMS_OUTPUT.PUT_LINE('Employee hire date: ' || HIRE_DAT);
END;
/

--------------------------------------------------
-- 16. Selecting Second Highest Salary
--------------------------------------------------

DECLARE
    SECOND_HIGH_SAL NUMBER;
BEGIN
    SELECT DISTINCT SALARY INTO SECOND_HIGH_SAL FROM HR.EMPLOYEES
    WHERE SALARY < (SELECT MAX(SALARY) FROM HR.EMPLOYEES)
    ORDER BY SALARY DESC FETCH FIRST 1 ROW ONLY;
    DBMS_OUTPUT.PUT_LINE('Second Highest Salary: ' || SECOND_HIGH_SAL);
END;
/

--------------------------------------------------
-- 17. Selecting Employees with Same Salary as John
--------------------------------------------------

DECLARE
    EMP_COUNT NUMBER;
BEGIN
    SELECT COUNT(*) INTO EMP_COUNT FROM HR.EMPLOYEES 
    WHERE SALARY = (SELECT SALARY FROM HR.EMPLOYEES WHERE FIRST_NAME = 'John');
    
    DBMS_OUTPUT.PUT_LINE('Employees with John''s Salary: ' || EMP_COUNT);
END;
/

--------------------------------------------------
-- 18. Fetching Manager Name of an Employee
--------------------------------------------------

DECLARE
    MANAGER_NAME VARCHAR2(50);
BEGIN
    SELECT FIRST_NAME INTO MANAGER_NAME FROM HR.EMPLOYEES 
  WHERE EMPLOYEE_ID = (SELECT MANAGER_ID FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 110);
    
    DBMS_OUTPUT.PUT_LINE('Manager: ' || MANAGER_NAME);
END;
/

--------------------------------------------------
-- 19. Fetching Number of Employees Who Earn Above Average Salary
--------------------------------------------------

DECLARE
    COUNT_ABOVE_AVG NUMBER;
BEGIN
    SELECT COUNT(*) INTO COUNT_ABOVE_AVG FROM HR.EMPLOYEES
    WHERE SALARY > (SELECT AVG(SALARY)FROM HR.EMPLOYEES);
    DBMS_OUTPUT.PUT_LINE('Employee Earning above average: '|| COUNT_ABOVE_AVG);
END;
/

--------------------------------------------------
-- 20. Fetching Employee Name and Role
--------------------------------------------------

DECLARE
    EMP_NAME VARCHAR2(50);
    EMP_ROLE VARCHAR2(50);
BEGIN
    SELECT FIRST_NAME, JOB_ID INTO EMP_NAME, EMP_ROLE FROM HR.EMPLOYEES
    WHERE EMPLOYEE_ID=112;

    DBMS_OUTPUT.PUT_LINE('Employee:' || EMP_NAME || ', Role: ' || EMP_ROLE);
END;
/

































































































































































