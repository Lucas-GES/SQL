-- 1)
create user aula IDENTIFIED by aula
default tablespace users
temporary tablespace temp;

create user aluno1 IDENTIFIED by aluno1
default tablespace users
temporary tablespace temp;

grant connect to aula;
grant resource to aula;

grant connect to aluno1;
grant resource to aluno1;

-- 2)
Create table numerador(
    Ano number(4) not null,
    Numero number(6) not null,
    constraint pknum
    primary key(Ano, Numero)
);

-- 3)
Insert into numerador(Ano, Numero)
Values(2021, 0);

Commit;

-- 4)
grant select on AULA.numerador to aluno1;
grant update on AULA.numerador to aluno1;

-- 5)
Create Or Replace Public Synonym numerador
for AULA.numerador;

-- 6)
Select Numero + 1 
from numerador
where ano = 2021
for update;

-- 7)
Update numerador 
set numero = 1
where ano = 2021;

Commit;

-- 8)
Select Numero + 1 
from numerador
where ano = 2021
for update;

Update numerador 
set numero = 2
where ano = 2021;

Commit;

-- 9)
-- Sim , porque o usuario aluno1 ficou em espera 
-- ate que a sessão do usuário aula commitasse as alterações
-- assim o valor ja estaria atualizado na execução do seu Select.