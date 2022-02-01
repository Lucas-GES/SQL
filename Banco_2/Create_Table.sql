create table cliente(
    id_cliente  number(5)   not null,
    nom_cliente varchar2(30) not null,
    ind_sexo    varchar2(1) not null,
    num_telefone    varchar2(11)    ,
    des_endereco    varchar2(30)     );
    
Insert into cliente values(1, 'ANA', 'F',NULL,NULL);

SELECT * FROM cliente;

Select table_name from user_tables;

Alter table cliente 
add constraint CLI_PK 
PRIMARY KEY ( ID_CLIENTE );

Create table filme(
    Cod_filme   number(5)       not null,
    Nom_filme   varchar2(30)    not null,
    Cod_genero  varchar2(2)     not null,
        Constraint pk_filme primary key(cod_filme)
);

Create table genero(
    Cod_genero  varchar2(2)     not null,
    Des_genero  varchar2(30)    not null,
        Constraint pk_genero primary key(cod_genero)
);



