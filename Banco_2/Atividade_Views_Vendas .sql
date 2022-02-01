-- 1)
CREATE VIEW vw_vendas_cliente 
AS SELECT pe.id_cliente as "Codigo", 
            c.nom_cliente as "Nome",
            c.num_telefone as "Telefone",
            p.categoria as "Categoria",
            sum(i.qtd_produto_pedido) as "Qtd Pedidos"
FROM cliente c JOIN pedido pe
ON( pe.id_cliente = c.id_cliente)
JOIN item_pedido i
ON( i.num_pedido = pe.num_pedido)
JOIN produto p
ON( p.id_produto = i.id_produto)
GROUP BY pe.id_cliente, 
        c.nom_cliente, 
        c.num_telefone, 
        p.categoria;
        
-- 2)
select * from vw_vendas_cliente ORDER BY 1 ;

-- 3) Não tenho cliente na tabela com 15 ou mais vezes de compras
-- Então vou buscar pela quantidade maior que tenho
Select vw."Nome" 
from vw_vendas_cliente vw
Where vw."Qtd Pedidos" > 3
and vw."Categoria" Like '%Informatica%';

-- 4)
CREATE VIEW vw_produto_sem_vendas 
AS SELECT pr.id_produto as "Codigo",
            pr.des_produto as "Descrição",
            pr.categoria as "Categoria"            
FROM produto pr JOIN item_pedido ip
ON(pr.id_produto = ip.id_produto(+))
WHERE pr.id_produto not in 
    (Select id_produto from item_pedido);

-- 5)
Select * from vw_produto_sem_vendas
Where "Categoria" Like '%Automotivo%'
Order By "Codigo";

-- 6)
Select * from vw_produto;
Create view vw_produto 
As Select pr.des_produto as "Descrição",
          pr.val_produto as "Valor"
From produto pr
with read only constraint produto_read_only;

-- Teste efetuando comando DML 
Delete from vw_produto 
Where "Valor" = 99;

-- 7)
Select * from vw_vendas;

CREATE or replace VIEW vw_vendas
AS SELECT   pe.num_pedido as "Numero do Pedido",
            pe.dat_pedido as "Data de Emissão",
            c.nom_cliente as "Nome",
            pr.categoria as "Categoria",
            pr.des_produto as "Descrição",            
            sum(i.qtd_produto_pedido) as "Qtd Pedidos",
            sum(pr.val_produto * i.qtd_produto_pedido) as "Valor Vendido"
FROM pedido pe JOIN cliente c
ON(pe.id_cliente = c.id_cliente)
JOIN item_pedido i
ON(i.num_pedido = pe.num_pedido)
JOIN produto pr
ON(i.id_produto = pr.id_produto)
Group BY pe.num_pedido, 
         pe.dat_pedido, 
         c.nom_cliente,
         pr.categoria,
         pr.des_produto;