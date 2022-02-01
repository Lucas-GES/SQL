-- 1)
SELECT count(*) FROM employees;

-- 2) 
SELECT e.employee_id as "ID" , 
        e.first_name ||' '|| e.last_name as "Nome", 
        d.department_name as "Departamento"
from employees e 
JOIN departments d
ON(e.department_id = d.department_id(+))
order by d.department_name;

-- 3)
SELECT d.department_name as "Departamento", 
        e.employee_id as "Matricula G" , 
        e.first_name ||' '|| e.last_name as "Gerente", 
        j.job_title as "Cargo",
        ge.employee_id as "Matricula" , 
        ge.first_name ||' '||  ge.last_name as "Empregado"
FROM employees e JOIN departments d
ON(e.department_id = d.department_id)
JOIN jobs j
ON(j.job_id = e.job_id)
left outer JOIN employees ge
ON(ge.manager_id = e.manager_id)
ORDER BY d.department_name;

-- 4)
SELECT d.department_name as "Departamento" ,         
        e.first_name ||' '|| e.last_name as "Empregado"
FROM departments d , employees e
WHERE d.department_id = e.department_id(+);

-- 5)
SELECT e.first_name ||' '|| e.last_name as "Funcionário",
        j.job_title as "Cargo",
        e.salary as "Sálario"
FROM employees e , jobs j
WHERE e.job_id = j.job_id 
and j.min_salary in
        (SELECT min(min_salary) from jobs);
        
-- 6)
SElECT e.first_name ||' '|| e.last_name as "Funcionário",
        e.hire_date as "Data de Contrato"
FROM employees e
WHERE e.hire_date in
        (SELECT min(hire_date) from employees);

-- 7)
SELECT e.first_name ||' '|| e.last_name as "Funcionário"
FROM employees e JOIN job_history jh
ON(e.employee_id = jh.employee_id)
HAVING count(jh.employee_id) = 2
GROUP BY e.first_name, e.last_name;

-- 8)
SELECT  e.employee_id, 
        e.first_name ||' '|| e.last_name as "Gerente"        
FROM employees ge JOIN employees e
ON(ge.employee_id = e.manager_id)
WHERE e.manager_id in (SELECT e.manager_id
                        FROM employees e
                        GROUP BY e.manager_id
                        HAVING count(*) > 5);
                        
-- 9)
SELECT distinct e.employee_id, 
        e.first_name ||' '|| e.last_name as "Gerente",        
FROM employees ge JOIN employees e 
ON(ge.employee_id = e.manager_id)
WHERE e.manager_id in (SELECT e.manager_id
                        FROM employees e
                        GROUP BY e.manager_id
                        HAVING count(*) > 5)
and e.hire_date in
        (SELECT max(hire_date) from employees);
             
-- 10)
UPDATE employees e set salary = e.salary + (e.salary * 0.02)
WHERE e.manager_id in (SELECT e.manager_id
                        FROM employees e
                        GROUP BY e.manager_id
                        HAVING count(*) > 5)
and e.hire_date in
        (SELECT min(hire_date) from employees);       
        