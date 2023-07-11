SELECT * FROM employees;
SELECT * FROM departments;

--1. Write a query to display the employee id, employee name (first name and last name) for all employees who earn more than the average salary. 
SELECT employee_id,first_name,last_name,salary FROM employees
WHERE(salary)>(SELECT AVG(salary)From employees);

--2. Write a query to display the employee name (first name and last name), employee id, and salary of all employees who report to Payam. 
SELECT first_name,last_name,employee_id,salary FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees WHERE first_name = 'Payam');

--3. Write a query to display the department number, name (first name and last name),job_id and department name for all employees in the Finance department.
SELECT e.department_id, e.first_name, e.last_name, e.job_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (SELECT department_id FROM departments WHERE department_name = 'Finance');

--4. Write a query to display all the information of the employees whose salary is within the range of the smallest salary and 2500.
SELECT * FROM employees
WHERE salary BETWEEN (SELECT MIN(salary) FROM employees) AND 2500;

--5. Write a SQL query to find the first name, last name, department, city, and state  province for each employee.
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Locations l ON d.location_id = l.location_id;

--6. Write a SQL query to find all those employees who work in department ID 80 or 40.Return first name, last name, department number, and department name.
SELECT e.first_name, e.last_name, d.department_id, d.department_name FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE e.department_id IN (40, 80);

--7.  Write a query to display the employee name (first name and last name) and hire date for all employees in the same department as Clara. Exclude Clara.
SELECT  first_name,last_name, hire_date FROM employees 
WHERE department_id = (SELECT department_id FROM Employees WHERE first_name = 'Clara')
AND first_name != 'Clara';

--8. Write a query to display the employee number, name (first name and last name), and salary for all employees who earn more than the average salary and 
--who work in a department with any employee with a J in their name.
SELECT employee_id, first_name, last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
AND employee_id IN (SELECT employee_id FROM employees
WHERE first_name LIKE '%J%');
 
--9. Write a SQL query to find those employees whose first name contains the letter ‘z’. Return first name, last name, department, city, and state province.
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.first_name LIKE '%z%';

--10. Write a SQL query to find all departments, including those without employees. Return first name, last name, department ID, department name.
SELECT  first_name,  last_name, d.department_id, d.department_name FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.department_id IS NULL;

--11. Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is smaller than any salary of 
--those employees whose job title is MK_MAN.
SELECT employee_id, first_name, last_name, job_id FROM employees
WHERE salary < (SELECT (salary) FROM employees
WHERE job_id = 'MK_MAN');

--12. Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is more than any salary of those
--employees whose job title is PU_MAN. Exclude job title PU_MAN.
SELECT employee_id, first_name, last_name, job_id FROM employees
WHERE salary > (SELECT (salary) FROM employees
WHERE job_id = 'PU_MAN');

--13. Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is more than any average salary
--of any department.
SELECT employee_id, first_name, last_name, job_id FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--14. Write a query to display the department id and the total salary for those  departments which contains at least one employee.
SELECT department_id, SUM(salary) AS total_salary FROM employees
GROUP BY department_id
HAVING COUNT(*) > 0;

--15. Write a SQL query to find the employees who earn less than the employee of ID 182. Return first name, last name and salary.
SELECT first_name, last_name, salary FROM employees
WHERE salary < (SELECT salary FROM employees WHERE employee_id = 182);

--16. Write a SQL query to find the employees and their managers. Return the first name of the employee and manager.
SELECT E.first_name AS employee_first_name, M.first_name AS manager_first_name FROM employees E
JOIN employees M ON E.manager_id = M.employee_id;
--17. Write a SQL query to display the department name, city, and state province for each department.
SELECT d.department_name, l.city, l.state_province FROM Departments D
JOIN Locations l ON D.location_id = l.location_id;

--18. Write a query to identify all the employees who earn more than the average  and who work in any of the IT departments
SELECT * FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees)
AND job_id IN (SELECT job_id  FROM employees WHERE job_id LIKE 'IT%');

--19. Write a SQL query to find out which employees have or do not have a department. Return first name, last name, department ID, department name.
SELECT e.first_name, e.last_name, e.department_id, d.department_name FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IS NOT NULL;

--20. Write a SQL query to find the employees and their managers. Those managers do not work under any manager also appear in the list. Return the first 
--name of the employee and manager.
SELECT e.first_name, m.first_name AS manager_first_name FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id
WHERE m.manager_id IS NULL;

--21.  Write a query to display the name (first name and last name) for those  employees who gets more salary than the employee whose ID is 163.
SELECT first_name, last_name FROM employees
WHERE salary > (SELECT salary FROM employees WHERE employee_id = 163);
--22.  Write a query to display the name (first name and last name), salary, department id, job id for those employees
--who works in the same designation as the employee works whose id is 169.
SELECT first_name, last_name,salary, department_id, job_id FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 169);

--23. Write a SQL query to find the employees who work in the same department as the employee with the last name Taylor.
--Return first name, last name and department 
SELECT first_name, last_name,department_id FROM employees 
WHERE department_id IN (SELECT department_id FROM employees WHERE last_name = 'Taylor');

--24. Write a SQL query to find the department name and the full name (first and last name) of the manager.
SELECT d.department_name, first_name,last_name FROM departments d
JOIN employees m ON d.manager_id = m.employee_id;

--25. Write a SQL query to find the employees who earn $12000 or more. Return  employee ID, starting date, end date, job ID and department ID.
SELECT e.employee_id, e.hire_date, jh.end_date, e.job_id, e.department_id FROM employees e
JOIN job_history jh ON e.employee_id = jh.employee_id
WHERE e.salary > 12000;

--26. Write a query to display the name (first name and last name), salary, department id for those employees who earn such amount of salary 
--which is the smallest salary of any of the departments. 

SELECT first_name, last_name, salary, department_id FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

--27. Write a query to display all the information of an employee whose salary and reporting person id is 3000 and 121, respectively.
SELECT * FROM employees
WHERE salary = 3000 AND manager_id = 121;

--28. Display the employee name (first name and last name), employee id, and job title for all employees whose department location is Toronto.
SELECT e.first_name, e.last_name, e.employee_id, j.job_title FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN jobs j ON e.job_id = j.job_id
WHERE l.city = 'Toronto';

--29. Write a query to display the employee name( first name and last name ) and department 
--for all employees for any existence of those employees whose salary is more than 3700.
SELECT e.first_name, e.last_name, d.department_name FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE  (SELECT 1 FROM employees WHERE salary > 3700);

--30.  Write a query to determine who earns more than employee with the last  name 'Russell'.
SELECT e.first_name, e.last_name FROM employees e
JOIN employees r ON e.salary > r.salary
WHERE r.last_name = 'Russell';

--31.	Write a query to display the names of employees who don't have a manager.
SELECT first_name, last_name from employees
WHERE manager_id is null;
--32.	Write a query to display the names of the departments and the number of employees in each department.
SELECT d.department_name, COUNT(e.employee_id) 
FROM DEPARTMENTS D
JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;
--33.	Write a query to display the last name of employees and the city where they are located.
SELECT E.LAST_NAME, L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;
--34.	Write a query to display the job titles and the average salary of employees for each job title.
SELECT j.job_title, AVG(e.salary) AS average_salary
FROM employees e
JOIN jobs j ON j.job_id = e.job_id
GROUP BY j.job_title;
--35.	Write a query to display the employee's name, department name, and the city of the department.
SELECT CONCAT(CONCAT(E.FIRST_NAME, ' '), E.LAST_NAME) AS EMPLOYEE_NAME, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;
--36.	Write a query to display the names of employees who do not have a department assigned to them.
SELECT CONCAT(concat(first_name, ' '), last_name) AS "Employee Name" from employees
where department_id is null;
--37.	Write a query to display the names of all departments and the number of employees in them, even if there are no employees in the department.
SELECT D.DEPARTMENT_NAME, COUNT(E.EMPLOYEE_ID) AS NUM_EMPLOYEES
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;
--38.	Write a query to display the names of employees and the department names, but only include employees whose salary is above 10,000.
SELECT CONCAT(CONCAT(E.FIRST_NAME, ' '), E.LAST_NAME) AS EMPLOYEE_NAME, D.DEPARTMENT_NAME, E.SALARY
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.SALARY > 10000;
--39.	Write a query to display department names and the average salary within each department, but only for departments with an average salary above 7000.
SELECT D.DEPARTMENT_NAME, AVG(E.SALARY) AS AVERAGE_SALARY
FROM DEPARTMENTS D
JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING AVG(E.SALARY) > 7000;
--40.	Write a query to display the names of employees who work in the 'IT' department.
SELECT CONCAT(CONCAT(E.FIRST_NAME, ' '), E.LAST_NAME) AS "Employee Name"
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_NAME = 'IT';
--41.	Write a query which is looking for the names of all employees whose salary is greater than 50% of their department’s total salary bill.
SELECT e.first_name FROM employees e
JOIN (SELECT department_id, SUM(salary)FROM employees
GROUP BY department_id) dept ON e.department_id = dept.department_id
WHERE e.salary > 0.5 * salary;

--42.	Write a query to get the details of employees who are managers.
SELECT* FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT DISTINCT MANAGER_ID FROM EMPLOYEES);
--43.	 Write a query in SQL to display the department code and name for all departments which located in the city London.

--44.	Write a query in SQL to display the first and last name, salary, and department ID for all those employees who earn more than the average salary and arrange the list in descending order on salary.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEES)
ORDER BY SALARY DESC;
--45.	Write a query in SQL to display the first and last name, salary, and department ID for those employees who earn more than the maximum salary of a department which ID is 40.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY>(SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID=40);
--46.	Write a query in SQL to display the department name and Id for all departments where they located, that Id is equal to the Id for the location where department number 30 is located.
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID
FROM DEPARTMENTS D
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.LOCATION_ID = (SELECT LOCATION_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID = 30);

--47.	Write a query in SQL to display the details of departments managed by Susan.
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.MANAGER_ID, d.LOCATION_ID
FROM DEPARTMENTS d
JOIN EMPLOYEES e ON d.MANAGER_ID = e.EMPLOYEE_ID
WHERE e.FIRST_NAME = 'Susan';

--48.	Write a query to display the department names and the location cities. Only include departments that are located in a country with the country_id 'US'.
SELECT D.DEPARTMENT_NAME, L.CITY AS "LOCATION CITIES"
FROM DEPARTMENTS D
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
WHERE C.COUNTRY_ID = 'US';

--49.	Write a query to display the first name and last name of employees along with the name of the department they work in. Only include employees whose last name starts with the letter 'S'.
SELECT E.FIRST_NAME,E.LAST_NAME, D.DEPARTMENT_NAME FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
WHERE E. LAST_NAME LIKE '%S%';
--50.	Write a query to display the department names and the number of employees in each department. Only include departments with more than 2 employees, and order the result by the number of employees in descending order.
SELECT D.DEPARTMENT_NAME, COUNT(E.EMPLOYEE_ID) AS NUM_EMPLOYEES
FROM DEPARTMENTS D
JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING COUNT(E.EMPLOYEE_ID) > 2
ORDER BY COUNT(E.EMPLOYEE_ID) DESC;