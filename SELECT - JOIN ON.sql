-- 1) 
    SELECT e.first_name ||' '|| e.last_name as "Nome",
    e.hire_date, j.job_title 
    FROM employees e JOIN jobs j 
        on (e.job_id = j.job_id)
    ORDER BY e.salary DESC;
           
-- 2) 
    SELECT 
    d.department_name, e.first_name as "Gerente",
    e.email, l.city 
    FROM departments d JOIN employees e
        on (d.manager_id = e.manager_id)
    JOIN locations l 
        on (l.location_id = d.location_id)
    JOIN countries c
        on (c.country_id = l.country_id)
    WHERE c.country_name LIKE 'United States of America' 
        OR c.country_name LIKE 'Canada'
    ORDER BY l.city , d.department_name;
    
-- 3)
    SELECT e.first_name ||' '|| e.last_name as "Nome",
    e.salary as "Salario", e.salary * commission_pct as "Comissao"
    FROM employees e JOIN departments d
        on(e.department_id = d.department_id)
    WHERE d.department_name LIKE 'Sales'
    ORDER BY e.first_name , e.last_name , e.salary;
    
-- 4)
    SELECT e.first_name ||' '|| e.last_name as "Nome",
    jh.start_date, jh.end_date, j.job_title, l.city, c.country_name
    FROM employees e JOIN job_history jh
        on (e.employee_id =jh.employee_id)
    JOIN jobs j
        on (j.job_id = jh.job_id)
    JOIN departments d
        on (d.department_id = jh.department_id)
    JOIN locations l 
        on (l.location_id = d.location_id)
    JOIN countries c
        on (c.country_id = l.country_id);
        
-- 5)
    SELECT e.first_name ||' '|| e.last_name as "Nome",
    e.salary, d.department_name, j.job_title, 
    g.first_name ||' '|| g.last_name as "Gerente"
    FROM employees e JOIN departments d
        on (e.department_id = d.department_id)
    JOIN employees g
        on (g.employee_id = d.manager_id)
    JOIN jobs j
        on (j.job_id = e.job_id);
    