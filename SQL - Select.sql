-- 1)
    SELECT employee_id, first_name, last_name, job_id 
    FROM employees WHERE salary > 500 
    ORDER BY employee_id;
    
-- 2)
    SELECT employee_id, first_name, last_name 
    FROM employees WHERE last_name NOT LIKE '%e%'
    AND last_name NOT LIKE '%E%'; 
    
-- 3)
    SELECT job_id, job_title FROM jobs 
    WHERE job_title LIKE '%Sales%' 
    AND min_salary > 6000;
    
-- 4)
    SELECT first_name FROM employees, departments
    WHERE department_name LIKE 'Marketing';

-- 5)
    SELECT location_id, department_name FROM departments
    WHERE manager_id is null
    ORDER BY location_id, department_name;
    
-- 6)
    SELECT DISTINCT location_id FROM departments
    ORDER BY location_id;
    
-- 7)
    SELECT first_name, last_name, salary, commission_pct*salary 
    FROM employees, departments 
    WHERE department_name LIKE 'Sales' 
    ORDER BY first_name, salary;
    
-- 8)
    SELECT first_name, last_name FROM employees
    WHERE first_name LIKE '%Alex%'
    OR last_name LIKE '%Alex%';
    
-- 9)
    SELECT first_name, last_name, salary, manager_id
    FROM employees;
    
