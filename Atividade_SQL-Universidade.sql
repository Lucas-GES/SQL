CREATE TABLE Disciplina (
    CodigoDisciplina varchar2(80) not null PRIMARY KEY,
    nome varchar2(80) not null,
    cargaHoraria number(4),
    codigoDepartamento number(4) not null
);

CREATE TABLE Departamento (
    codigoDepartamento number(4) PRIMARY KEY,
    nome varchar2(80) not null,
    localizacao varchar2(40),
    coordenador varchar2(80),
    area varchar2(50)
);

CREATE TABLE Curso (
    codigoCurso varchar2(10) not null PRIMARY KEY,
    quantidadeDeAnos number(1),
    nome varchar2(80) not null,
    codigoDepartamento number(4) not null
);

CREATE TABLE Aluno (
    matricula number(10) not null PRIMARY KEY,
    nome varchar2(80),
    pagaMensalidade varchar2(1),
    codigoCurso varchar2(10) not null
);

CREATE TABLE notas (
    idnota number(6) NOT NULL PRIMARY KEY,
    notas number(5,2),
    matricula number(10) not null
);

CREATE TABLE Curso_Disciplina (
    codigoCurso varchar2(10),
    CodigoDisciplina varchar2(80)
);
 
ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_1
    FOREIGN KEY (codigoDepartamento)
    REFERENCES Departamento (codigoDepartamento);
 
ALTER TABLE Curso ADD CONSTRAINT FK_Curso_1
    FOREIGN KEY (codigoDepartamento)
    REFERENCES Departamento (codigoDepartamento);

ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_2
    FOREIGN KEY (codigoCurso)
    REFERENCES Curso (codigoCurso);
 
ALTER TABLE notas ADD CONSTRAINT FK_notas_1
    FOREIGN KEY (matricula)
    REFERENCES Aluno (matricula);
 
ALTER TABLE Curso_Disciplina ADD CONSTRAINT FK_Curso_Disciplina_0
    FOREIGN KEY (codigoCurso)
    REFERENCES Curso (codigoCurso);
 
ALTER TABLE Curso_Disciplina ADD CONSTRAINT FK_Curso_Disciplina_1
    FOREIGN KEY (CodigoDisciplina)
    REFERENCES Disciplina (CodigoDisciplina);
    
------------------------------------------------------------------

-- <--- Comandos INSERT e SELECT --->



INSERT into departamento(codigoDepartamento,nome,localizacao,coordenador,area)
values(2000,'Tecnologia Geral','Av.Faria Lima - 666','Dr.Frederic Rossean','Tecnologia');

INSERT into curso(codigoCurso,quantidadeDeAnos,nome,codigoDepartamento)
values('Engenharia',4,'Engenharia de Software',2000);
INSERT into curso(codigoCurso,quantidadeDeAnos,nome,codigoDepartamento)
values('Ciencia',5,'Ciencia da Computacao',2000);

INSERT into disciplina(CodigoDisciplina,nome,cargaHoraria,codigoDepartamento)
values('Calculo','Calculo Diferencial e Integral',1500,2000);
INSERT into disciplina(CodigoDisciplina,nome,cargaHoraria,codigoDepartamento)
values('Linguagem','Linguagem de Programacao',2500,2000);
INSERT into disciplina(CodigoDisciplina,nome,cargaHoraria,codigoDepartamento)
values('Dados','Banco de Dados 1',3000,2000);
INSERT into disciplina(CodigoDisciplina,nome,cargaHoraria,codigoDepartamento)
values('Gerencia','Gerencia de Configuracao',3500,2000);
INSERT into disciplina(CodigoDisciplina,nome,cargaHoraria,codigoDepartamento)
values('Sistemas','Sistemas Operacionais',3700,2000);
INSERT into disciplina(CodigoDisciplina,nome,cargaHoraria,codigoDepartamento)
values('Gestao','Gestao de Pessoas',300,2000);

INSERT into curso_disciplina(codigoCurso,CodigoDisciplina)
values('Engenharia','Calculo');
INSERT into curso_disciplina(codigoCurso,CodigoDisciplina)
values('Engenharia','Sistemas');
INSERT into curso_disciplina(codigoCurso,CodigoDisciplina)
values('Engenharia','Dados');
INSERT into curso_disciplina(codigoCurso,CodigoDisciplina)
values('Engenharia','Linguagem');
INSERT into curso_disciplina(codigoCurso,CodigoDisciplina)
values('Ciencia','Linguagem');
INSERT into curso_disciplina(codigoCurso,CodigoDisciplina)
values('Ciencia','Gerencia');
INSERT into curso_disciplina(codigoCurso,CodigoDisciplina)
values('Ciencia','Gestao');
INSERT into curso_disciplina(codigoCurso,CodigoDisciplina)
values('Ciencia','Sistemas');

INSERT into aluno(matricula,nome,pagaMensalidade,codigoCurso)
values(191072043,'Luck','S','Engenharia');
INSERT into aluno(matricula,nome,pagaMensalidade,codigoCurso)
values(151277068,'Juan Matheus','N','Ciencia');

INSERT into notas(idnota,notas,matricula)
values(101112,10,191072043);
INSERT into notas(idnota,notas,matricula)
values(101113,9,191072043);
INSERT into notas(idnota,notas,matricula)
values(111112,10,151277068);
INSERT into notas(idnota,notas,matricula)
values(111113,9,151277068);

SELECT a.nome,c.nome,d.nome
FROM aluno a JOIN curso c
    on(a.codigocurso = c.codigocurso)
JOIN curso_disciplina cd
    on(cd.codigocurso = c.codigocurso)
JOIN disciplina d
    on(d.codigodisciplina = cd.codigodisciplina);