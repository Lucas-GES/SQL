CREATE TABLE Time (
cod_time Number(3) not null PRIMARY KEY,
nom_time Varchar2(30) not null,
ind_serie Varchar2(1) not null
);

CREATE TABLE Torneio (
cod_torneio Number(3) not null PRIMARY KEY,
des_torneio Varchar2(30) not null,
val_inscricao Number(6,2) not null
);

CREATE TABLE Torneio_Time (
cod_torneio Number(3) not null,
cod_time Number(3) not null,
PRIMARY KEY(cod_torneio,cod_time),
FOREIGN KEY(cod_torneio) REFERENCES Torneio (cod_torneio),
FOREIGN KEY(cod_time) REFERENCES Time (cod_time)
);

CREATE TABLE Cobranca (
id Number(5) not null PRIMARY KEY,
dat_geracao Date not null,
dat_pagamento Date,
valor Number(6,2) not null,
cod_time Number(3) not null,
FOREIGN KEY(cod_time) REFERENCES Time (cod_time)
);
