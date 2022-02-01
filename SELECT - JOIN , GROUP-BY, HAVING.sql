-- 1)
    SELECT regions.region_name , COUNT(countries.country_name)
    FROM regions , countries
    WHERE regions.region_id = countries.region_id
    GROUP BY regions.region_name
    ORDER BY regions.region_name;
       
-- 2) 
    SELECT COUNT(employees.employee_id) 
    FROM locations , departments, employees    
    WHERE departments.location_id = locations.location_id
    and employees.department_id = departments.department_id
    and locations.city LIKE 'Oxford' OR locations.city LIKE 'Seattle';
    
-- 3) 
    SELECT departments.department_id , departments.department_name ,
    MAX(employees.hire_date) , MIN(job_history.start_date) 
    FROM departments , job_history , employees
    WHERE employees.department_id = departments.department_id
    and departments.department_id = job_history.department_id
    GROUP BY departments.department_id , departments.department_name ,
    employees.hire_date , job_history.start_date
    ORDER BY departments.department_name;
    
-- 4) 
    SELECT j.job_title , j.max_salary
    FROM jobs j
    HAVING avg(j.max_salary) > 5000 
    GROUP BY j.job_title , j.max_salary
    ORDER BY j.max_salary;
    
-- 5)
    SELECT e.employee_id , e.first_name||' '||e.last_name as "Nome"
    FROM employees e JOIN job_history jh 
        on(e.employee_id = jh.employee_id)
    HAVING jh.;
    
-- 6)
    SELECT e.employee_id , e.first_name||' '||e.last_name as "Nome"
    FROM employees e join departments d
        on(e.employee_id = d.manager_id)
    having e.manager_id 
    GROUP BY e.employee_id ;    
    
-- 7)
    SELECT j.job_id , j.job_title , e.salary * commission_pct , 
    MAX(e.commission_pct)
    FROM jobs j join employees e 
        on(j.job_id = e.job_id)
    where e.commission_pct > 0;
   
    
    