-- 1)
    SELECT employees.first_name ||' '||employees.last_name "Nome", employees.hire_date "data de admissão",
    jobs.job_title "cargo" 
    FROM employees,jobs 
    WHERE employees.salary > 0
    ORDER BY employees.salary desc; 
    
-- 2)
    SELECT department_id, department_name, manager_id 
    FROM departments
    WHERE departments.manager_id is NULL
    ORDER BY department_name;   
    
-- 3)
    SELECT departments.department_name , 
    employees.first_name "Gerente",
    employees.email "e-mail", locations.city "Cidade" 
    FROM departments, employees, locations
    WHERE departments.manager_id = employees.employee_id 
    and departments.location_id = locations.location_id
    and locations.country_id LIKE 'US' OR locations.country_id LIKE 'CA'
    ORDER BY locations.city, departments.department_name;
    
-- 4) 
    SELECT employees.first_name ||' '|| employees.last_name "Nome",
    employees.salary "salario", employees.commission_pct "comissão"
    FROM employees,departments 
    WHERE departments.department_name LIKE 'Sales'
    ORDER BY employees.first_name, employees.salary desc;
    
-- 5)
    SELECT employees.first_name, employees.last_name,
    job_history.start_date, job_history.end_date,
    jobs.job_title, locations.city, locations.country_id
    FROM employees, job_history, jobs, locations, departments
    WHERE employees.employee_id = job_history.employee_id
    and jobs.job_id = job_history.job_id
    and departments.location_id = locations.location_id;

-- 6)
    SELECT employees.first_name ||' '|| employees.last_name "Nome",
    employees.salary, departments.department_name, 
    jobs.job_title, g.first_name ||' '|| g.last_name "Gerente"
    FROM employees, employees g, departments, jobs
    WHERE jobs.job_id = employees.job_id    
    and g.employee_id = employees.manager_id;
    