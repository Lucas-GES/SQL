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
insert into professor values(0002, 'Ricardo In�cio');
select * from professor;

-- F)
-- N�o mostra as duas inser��es , apenas o inserido pelo usu�rio

-- G)
-- Aluno5 n�o pode fazer DELETE pois n�o teve esse direito dado pelo usu�rio Aluno1

-- I)
insert into aluno1.professor values(0003, 'T�nia Camila');

--H)
revoke insert on professor from aluno5;