-- 1)
    INSERT INTO jobs(job_title,job_id) 
    VALUES('Administrador de Banco de Dados','ADM_BD');
    
    INSERT INTO locations(location_id,street_address,city,postal_code)
    VALUES(55,'Av.Juscelino Kubitscheck','Londrina',1626);
    
    INSERT INTO departments(department_id,department_name,location_id)
    VALUES(1,'Tecnologia da Informação',55);
    
    INSERT INTO employees(employee_id,first_name,last_name,email,job_id,department_id,hire_date) 
    values(66,'Lucas Gabriel','do Espirito Santo','lucas_asm@hotmail.com.br','ADM_BD',1,sysdate);
    
-- 2)
    -- A)        
    INSERT INTO employees(employee_id,first_name,last_name,email,hire_date,job_id)
    VALUES(1000,'Roberto','Carlos','rcarlos@gmail.com','29/09/2019','IT_PROG');    
    -- B)
    INSERT INTO employees(employee_id,first_name,last_name,email,hire_date,job_id)
    VALUES(1001,'Angela','Oliveira','maria@gmail.com','21/09/2019','FI_MGR');

-- 3)
    UPDATE employees set commission_pct = 0.5
        WHERE (department_id) LIKE 50;  
        
-- 4)
    UPDATE employees set job_id = 'AD_PRES'
        WHERE (employee_id) LIKE 66;
        
-- 5)
    -- primeiro retirar as dependencias
    DELETE FROM job_history 
        WHERE department_id = 1;    
    
    DELETE FROM job_history 
        where employee_id = 66;
            
    UPDATE employees set department_id = NULL
        WHERE employee_id = 66;        
    
    --depois a exclusão    
    DELETE FROM departments 
        WHERE department_name = 'Tecnologia da Informação';
        
¨-- 6)
    -- retirar dependencias
    DELETE FROM job_history 
        WHERE job_id = 'AD_PRES';   
    -- depois exclusão    
    DELETE FROM employees
        WHERE employee_id = 66;