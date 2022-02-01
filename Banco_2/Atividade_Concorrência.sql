-- 1)
-- A)
create user vendas1 IDENTIFIED by vendas1
default tablespace users
temporary tablespace temp;

create user vendas2 IDENTIFIED by vendas2
default tablespace users
temporary tablespace temp;

grant connect to vendas1;
grant resource to vendas1;

grant connect to vendas2;
grant resource to vendas2;

-- B)
Create role rl_vendas;

-- C)
grant rl_vendas to vendas1;
grant rl_vendas to vendas2;

-- D)
grant select, insert, update, delete  
on aula.produto
to rl_vendas;

grant select, insert, update, delete  
on aula.cliente
to rl_vendas;

grant select, insert, update, delete  
on aula.pedido
to rl_vendas;

grant select, insert, update, delete  
on aula.item_pedido
to rl_vendas;

-- E)
select c.owner, c.object_name, c.object_type, a.oracle_username, b.sid, b.serial#, b.status, b.osuser, b.machine
from v$locked_object a , v$session b, dba_objects c
where b.sid = a.session_id
and a.object_id = c.object_id;

-- 2)
select * from aula.produto;

update aula.produto set val_produto = 600
where id_produto = 1;

-- 4)
COMMIT;

-- 7)
update aula.produto set val_produto = 500
where id_produto = 2;

-- 9)
select * from aula.cliente;
update aula.cliente set nom_cliente = 'Maria Joaquina'
where id_cliente = 2;

-- 14)
COMMIT;

-- 15)
-- Conectado como vendas1
update aula.cliente set nom_cliente = 'Maria Joaquina'
where id_cliente = 2;

-- Conectado como venda2
update aula.cliente set nom_cliente = 'Maria Betania'
where id_cliente = 2;