-- 1)
CREATE TABLE Pessoa(
    idPessoa number(4) not null,
    Nome varchar2(40) not null,
    Endereco varchar2(40),
    Constraint pk_pessoa primary key(idPessoa)
);

CREATE TABLE FonePessoa(
    idPessoa number(4) not null,
    DDD varchar2(2) not null,
    Prefixo varchar2(4) not null,
    Numero varchar2(4) not null,
    Constraint pk_fone primary key(idPessoa,ddd,prefixo,numero),
    Constraint fk_pessoa Foreign Key(idPessoa) References pessoa(idPessoa)
);

CREATE TABLE Republica(
    idRep number(4) not null,
    Nome varchar2(40) not null,
    Endereco varchar2(40),
    Constraint pk_republica primary key(idRep)
);

CREATE TABLE Estudante(
    idEstudante Number(4) not null,
    Email Varchar2(40),
    idPessoa Number(4) not null,
    idRep Number(4),
    Constraint pk_estudante primary key(idEstudante),
    Constraint fk_pessoa_estudante Foreign Key(idPessoa) References pessoa(idPessoa),
    Constraint fk_republica Foreign Key(idRep) References republica(idRep)
);

-- 2) Já fiz a inclusão das foreign key dentro da propria criação das tabelas


-- 3)
-- Republica
INSERT into republica(idrep,nome,endereco)
values(0001,'Computação','Avenida JK - 1158');
INSERT into republica(idrep,nome,endereco)
values(0002,'Engenharia','Avenida Castelo Branco - 445');
-- Pessoa
insert into pessoa(idpessoa,nome,endereco)
values(1000,'Joao Laranjas','Rua das Laranjeiras 55');
insert into pessoa(idpessoa,nome,endereco)
values(1001,'Jose Limão','Rua dos Limões 55');
insert into pessoa(idpessoa,nome,endereco)
values(1002,'Maria Uva','Rua das Uvas 55');
insert into pessoa(idpessoa,nome,endereco)
values(1003,'Luck','3rd Street Saints');
insert into pessoa(idpessoa,nome,endereco)
values(1004,'Adalberto','Rua Araucária 222');
-- Estudante
INSERT into estudante(idEstudante,Email,idPessoa,idRep)
values(1100,'joao_laranjas@hotmail.com',1000,0001);
INSERT into estudante(idEstudante,Email,idPessoa,idRep)
values(1101,'jose_limao@hotmail.com',1001,0002);
INSERT into estudante(idEstudante,Email,idPessoa,idRep)
values(1102,'maria_uva@hotmail.com',1002,0002);
INSERT into estudante(idEstudante,Email,idPessoa,idRep)
values(1105,'mr_black@hotmail.com',1003,null);
INSERT into estudante(idEstudante,Email,idPessoa,idRep)
values(1103,'adalberto@hotmail.com',1004,null);
-- FonePessoa
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1000,'43','9929','8485');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1000,'43','9828','8584');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1001,'43','9939','8384');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1002,'43','9727','8483');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1003,'43','9949','8283');
INSERT into fonepessoa(idpessoa,ddd,prefixo,numero)
values(1003,'43','9626','8382');

-- 4)
----- a)
Select r.nome as "REPÚBLICA", count(e.idRep) as "QTD"
FROM republica r, estudante e
WHERE r.idrep = e.idrep
GROUP BY r.nome;
----- b)
Select p.nome as "Nome", p.idPessoa as "ID", p.endereco as "Endereço"
FROM pessoa p
WHERE p.nome LIKE 'Luck';
Select p.nome as "Nome", p.idPessoa as "ID", p.endereco as "Endereço"
FROM pessoa p
WHERE p.nome LIKE 'Maria%';
----- c)
Select e.idEstudante as "ID Estudante", 
        e.email as "EMAIL", 
        p.nome as "Nome",
        p.endereco "Endereço"
FROM estudante e JOIN pessoa p
ON(e.idpessoa = p.idpessoa)
WHERE e.idrep is null;
----- d)
Select p.nome as "Nome", 
        fp.ddd ||' '|| fp.prefixo ||'-'|| fp.numero as "Telefone"
FROM pessoa p JOIN fonepessoa fp
ON(p.idpessoa = fp.idpessoa)
ORDER BY p.nome;

-- 5)
Select p.nome as "Nome"
FROM pessoa p JOIN fonepessoa fp
ON(p.idpessoa = fp.idpessoa(+))
WHERE p.idpessoa not in
        (Select idpessoa from fonepessoa);

-- 6)
Select p.nome as "Nome" , 
        e.idestudante as "ID Estudante"
FROM pessoa p JOIN estudante e
ON(p.idpessoa = e.idpessoa)
ORDER BY 1;

-- 7)
Select p.nome as "Nome" ,
        r.nome as "Republica"
FROM pessoa p JOIN estudante e
ON(p.idpessoa = e.idpessoa)
JOIN republica r
ON(e.idrep = r.idrep)
ORDER BY 1;