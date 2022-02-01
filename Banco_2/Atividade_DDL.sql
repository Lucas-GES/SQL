-- 1)

Select table_name from user_tables;

-- 2)
    desc cliente;
    desc filme;
    desc genero;
    desc pedido;
    desc item_pedido;
    desc produto;

-- 3)
SELECT table_name , CONSTRAINT_NAME 
FROM user_constraints
WHERE CONSTRAINT_TYPE = 'P';

-- 4)
-- A)
Alter table pedido Add Constraint fk_cliente 
Foreign Key(ID_CLIENTE) References cliente(id_cliente);
-- B)
Alter table item_pedido Add Constraint fk_pedido 
Foreign Key(NUM_PEDIDO) References pedido(num_pedido);
-- C)
Alter table item_pedido Add Constraint fk_produto 
Foreign Key(ID_PRODUTO) References produto(id_produto);

-- 5)
Alter table cliente add constraint Ck_Sex
Check (ind_sexo in ('M', 'F'));

-- 6)
Alter table pedido add constraint Ck_Tip_Origem
Check (tip_origem in ('WEB', 'BAL', 'TEL'));

-- 7)
SELECT table_name , CONSTRAINT_NAME, CONSTRAINT_TYPE  
FROM user_constraints;

-- 8)
Insert into cliente(id_cliente, nom_cliente, ind_sexo, num_telefone, des_endereco)
values(97, 'Lucas Gabriel', 'M', '991859703', 'Rua Odilon Braga 222');

-- 9)
Insert into produto(id_produto, des_produto, qtd_estoque, val_produto)
values(0004, 'produto4', 1000, 100);
Insert into produto(id_produto, des_produto, qtd_estoque, val_produto)
values(0005, 'produto5', 1000, 99);

alter table produto modify(val_produto number(6,2));

Insert into produto(id_produto, des_produto, qtd_estoque, val_produto)
values(0006, 'produto6', 1000, 2100);


-- 10)

Alter table pedido modify(tip_origem  varchar2(3));

Insert into pedido(num_pedido, dat_pedido, tip_origem, id_cliente)
values(1001, '12/02/2021', 'WEB', 1);

Insert into pedido(num_pedido, dat_pedido, tip_origem, id_cliente)
values(1002, '12/02/2021', 'WEB', 97);

Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1001, 0001, 10);
Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1001, 0002, 20);

Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1002, 0001, 25);
Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1002, 0002, 30);

-- 11)
Alter table cliente add (dat_nascimento date null);

-- 12)
select * from cliente;

Alter table produto modify(tip_unidade varchar2(3) not null);

UPDATE produto set tip_unidade = 'PAC'
        WHERE qtd_estoque = 1000;
        
-- 13)
Alter table cliente modify(des_endereco varchar2(100));

-- 14)
desc produto;

Alter table pedido modify(num_pedido number(3));

Alter table pedido drop column num_temp;

-- 15)
Alter table item_pedido drop column qtd_produto_pedido;

-- 16)
drop table item_pedido;
Alter table pedido drop column id_cliente;

-- 17)
truncate table item_pedido;
Alter table item_pedido drop Constraint fk_produto; 
Alter table produto drop column id_produto;
Alter table item_pedido drop column id_produto;

-- 18)
truncate table Item_Pedido;