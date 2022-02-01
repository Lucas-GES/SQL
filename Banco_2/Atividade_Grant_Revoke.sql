-- A)
create table professor(
    id_professor  number(5)   not null,
    nom_professor varchar2(30) not null
);

-- B)
grant select on professor to aluno5;
grant insert on professor to aluno5;

-- C)
select * from user_tab_privs;
-- Deu mesmo resultado em ambos

-- D)
select * from aluno1.professor;
insert into aluno1.professor values(0001, 'Edson Kaneshima');

-- E)
insert into professor values(0002, 'Ricardo Inácio');
select * from professor;

-- F)
-- Não mostra as duas inserções , apenas o inserido pelo usuário

-- G)
-- Aluno5 não pode fazer DELETE pois não teve esse direito dado pelo usuário Aluno1

-- I)
insert into aluno1.professor values(0003, 'Tânia Camila');

--H)
revoke insert on professor from aluno5;