select USERNAME, CREATED, DEFAULT_TABLESPACE as DEF, TEMPORARY_TABLESPACE as TEMP
from dba_users
order by USERNAME asc;
-- a)
create user aluno1 IDENTIFIED by aluno1
default tablespace users
temporary tablespace temp;

grant connect to aluno1;
grant resource to aluno1;

create user aluno5 IDENTIFIED by aluno5
default tablespace users
temporary tablespace temp;

grant connect to aluno5;