-- Cliente
Insert into cliente(id_cliente, nom_cliente, ind_sexo, num_telefone, des_endereco)
values(1, 'Ana', 'F', null, null);
Insert into cliente(id_cliente, nom_cliente, ind_sexo, num_telefone, des_endereco)
values(2, 'Edson', 'M', null, 'Av Celso Garcia Cid, 165');
Insert into cliente(id_cliente, nom_cliente, ind_sexo, num_telefone, des_endereco)
values(3, 'Maria Rita', 'F', '999141298', 'Rua Santos, 380');
-- Produto
Insert into produto(id_produto, des_produto, qtd_estoque, val_produto)
values(1, 'Notebook Gamer', 200, 500);
Insert into produto(id_produto, des_produto, qtd_estoque, val_produto)
values(2, 'Fones de Ouvido Gamer', 300, 231);
Insert into produto(id_produto, des_produto, qtd_estoque, val_produto)
values(3, 'Lava-Louças', 10, 250);
-- Pedido
Insert into pedido(num_pedido, dat_pedido, tip_origem, id_cliente)
values(1001, '12/02/2021', 'BAL', 1);
Insert into pedido(num_pedido, dat_pedido, tip_origem, id_cliente)
values(1002, '11/02/2021', 'WEB', 1);   
Insert into pedido(num_pedido, dat_pedido, tip_origem, id_cliente)
values(1003, '19/02/2021', 'TEL', 3);
Insert into pedido(num_pedido, dat_pedido, tip_origem, id_cliente)
values(1004, '19/02/2021', 'WEB', 2);
-- Item_Pedido
Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1001, 1, 3);
Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1001, 2, 2);
Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1002, 1, 1);
Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1002, 3, 1);
Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1003, 1, 1);
Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1004, 1, 1);
Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1004, 2, 1);
Insert into item_pedido(num_pedido, id_produto, qtd_produto_pedido)
values(1004, 3, 1);

-- 1)
Select * from produto order by des_produto;

-- 2)
Select distinct tip_origem from pedido 
order by tip_origem desc;

-- 3)
Select c.id_cliente, c.nom_cliente, COUNT(p.id_cliente)  
from cliente c 
JOIN pedido p 
ON (p.id_cliente = c.id_cliente)
Group by c.id_cliente, c.nom_cliente
order by c.nom_cliente;

-- 4)
Select a.dat_pedido, b.dat_pedido , sum(a.id_cliente + b.id_cliente)
from pedido a , pedido b 
where a.num_pedido = 1003 and b.num_pedido = 1002
Group by a.dat_pedido, b.dat_pedido;

-- 5)
Select p.num_pedido, p.dat_pedido, c.nom_cliente, p.tip_origem
from pedido p
JOIN cliente c
ON (p.id_cliente = c.id_cliente);

-- 6)
Select p.num_pedido, p.dat_pedido, c.nom_cliente, 
p.tip_origem, pr.des_produto, ip.qtd_produto_pedido, c.des_endereço
from pedido p
JOIN cliente c
ON (p.id_cliente = c.id_cliente)
JOIN item_pedido ip
ON (p.num_pedido = ip.num_pedido)
JOIN produto pr
ON (ip.id_produto = pr.id_produto)
Order by c.nom_cliente, p.num_pedido, ip.qtd_produto_pedido, des_produto;

-- 7)
Select pr.id_produto, pr.des_produto, sum(ip.qtd_produto_pedido)
From produto pr
JOIN item_pedido ip
ON (pr.id_produto = ip.id_produto)
Group by pr.id_produto, pr.des_produto;

-- 8)
Select p.dat_pedido, c.nom_cliente, pr.des_produto,
       ip.qtd_produto_pedido, ip.qtd_produto_pedido * pr.val_produto as "VALOR"
from pedido p
JOIN cliente c
ON (p.id_cliente = c.id_cliente)
JOIN item_pedido ip
ON (p.num_pedido = ip.num_pedido)
JOIN produto pr
ON (ip.id_produto = pr.id_produto)
ORDER BY p.dat_pedido,c.nom_cliente desc, pr.des_produto, ip.qtd_produto_pedido;