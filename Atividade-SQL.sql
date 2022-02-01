-- 1)

create table pessoa(idpessoa number(4) not null,
nome varchar2(40) not null, endereco varchar(40));

alter table pessoa 
add constraint pk_pes 
primary key(idpessoa);

create table Fonepessoa
(idpessoa number(4) not null,
ddd varchar2(2) not null,
prefixo varchar2(4) not null,
numero varchar2(4) not null);

alter table fonepessoa 
add constraint pkfon 
primary key(idpessoa,ddd,prefixo,numero);

create table Estudante
(idEstudante Number(4) not null,
Email Varchar2(40),
idPessoa Number(4) not null,
idRep Number(4));

alter table estudante 
add constraint pk_est 
primary key(idEstudante);

create table republica
(idrep number(4) not null,
nome varchar2(40) not null,
endereco varchar2(40));

alter table republica 
add constraint pk_rep 
primary key(idrep);

alter table fonepessoa add constraint fk_pes
foreign key(idpessoa)
REFERENCES pessoa(idpessoa);

alter table estudante add constraint fk_pes2
foreign key(idpessoa)
REFERENCES pessoa(idpessoa);

alter table estudante add constraint fk_rep
foreign key(idrep)
REFERENCES republica(idrep);
----------------------------------------------

-- 2) 
INSERT into republica(idrep,nome,endereco)
values(0001,'Computação','Avenida JK - 1158');
INSERT into republica(idrep,nome,endereco)
values(0002,'Engenharia','Avenida Castelo Branco - 445');

insert into pessoa(idpessoa,nome,endereco)
values(1000,'Joao Laranjas','Rua das Laranjeiras 55');
insert into pessoa(idpessoa,nome,endereco)
values(1001,'Jose Limão','Rua dos Limões 55');
insert into pessoa(idpessoa,nome,endereco)
values(1002,'Maria Uva','Rua das Uvas 55');
insert into pessoa(idpessoa,nome,endereco)
values(1003,'Luana Maçã','Rua da Macieira 55');
insert into pessoa(idpessoa,nome,endereco)
values(1004,'Pedro Saraiva','Rua das Frutas 55');
insert into pessoa(idpessoa,nome,endereco)
values(1005,'Luck','3rd Street Saints');

INSERT into estudante(idEstudante,Email,idPessoa,idRep)
values(1100,'joao_laranjas@hotmail.com',1000,0001);
INSERT into estudante(idEstudante,Email,idPessoa,idRep)
values(1101,'jose_limao@hotmail.com',1001,0001);
INSERT into estudante(idEstudante,Email,idPessoa,idRep)
values(1102,'maria_uva@hotmail.com',1002,0001);
INSERT into estudante(idEstudante,Email,idPessoa,idRep)
values(1103,'luana_maca@hotmail.com',1003,0002);
INSERT into estudante(idEstudante,Email,idPessoa,idRep)
values(1104,'pedro_saraiva@hotmail.com',1004,0002);
INSERT into estudante(idEstudante,Email,idPessoa,idRep)
values(1105,'mr_black@hotmail.com',1005,null);

INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1000,'43','9929','8485');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1000,'43','9828','8584');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1001,'43','9939','8384');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1001,'43','9727','8483');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1002,'43','9949','8283');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1002,'43','9626','8382');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1003,'43','9959','8182');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1004,'43','9969','8081');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1005,'43','9979','7080');
---------------------------------------------------

-- 3)

SELECT p.nome,p.endereco,e.Email,f.ddd,f.prefixo,f.numero
FROM pessoa p JOIN estudante e
ON(p.idpessoa = e.idpessoa)
JOIN fonepessoa f
ON(f.idpessoa = e.idpessoa);
---------------------------------------------------------

-- 4)

SELECT p.nome,e.Email,r.nome
FROM pessoa p JOIN estudante e
ON(p.idpessoa = e.idpessoa)
JOIN republica r
ON(e.idRep = r.idrep)
ORDER BY r.nome DESC, p.nome DESC;
---------------------------------------------------------

-- 5)

SELECT r.nome ,COUNT(e.idEstudante) 
from republica r 
JOIN estudante e
ON(r.idRep = e.idRep)
GROUP BY r.nome;