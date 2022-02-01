SELECT * FROM pedido;

Select table_name from user_tables;



CREATE TABLE pedido(
    num_pedido number(5) not null,
    dat_pedido DATE      not null,
    tip_origem  varchar2(1) not null,
    id_cliente number(5) not null,
        Constraint pk_pedido primary key(num_pedido)
);

Alter table pedido modify(tip_origem varchar2(3));


CREATE TABLE Item_Pedido(
    num_pedido number(5)   not null,
    id_produto number(5) not null,
    qtd_produto_pedido number(6,2) not null,
        Constraint pk_Item_Pedido primary key(num_pedido, id_produto)
);

Alter table Item_Pedido 
modify(qtd_produto_pedido number(6,2) not null);

Alter table Item_Pedido 
add Constraint pk_Item_Pedido 
primary key(num_pedido, id_produto);

CREATE TABLE produto(
    id_produto number(5) not null,
    des_produto varchar2(40) not null,
    qtd_estoque number(6,2) not null,
    val_produto number(5,2) not null,
        Constraint pk_produto primary key(id_produto)
);

Alter table produto modify(
    des_produto varchar2(40) not null,
    qtd_estoque number(6,2) not null,
    val_produto number(5,2) not null
);

Alter table produto add Constraint pk_produto 
primary key(id_produto);


Alter table filme Add Constraint fk_genero 
Foreign Key(COD_GENERO) References Genero(cod_genero);