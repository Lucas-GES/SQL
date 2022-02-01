-- 1)
Select jobs.job_id Cargo, job_title Descricao 
from jobs
MINUS
Select job_history.job_id, jobs.job_title
from job_history, jobs
WHERE job_history.job_id = jobs.job_id
ORDER BY 1;

-- 2)
Select r.region_name DESCRICAO, 'Continente' TIPO
from regions r
UNION 
SELECT c.country_name DESCRICAO, 'País' TIPO
from countries c
UNION 
SELECT  l.city DESCRICAO, 'Cidade' TIPO
from locations l
ORDER BY DESCRICAO;