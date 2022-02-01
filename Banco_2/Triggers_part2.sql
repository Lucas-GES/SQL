Create table curso_audit( 
    id number(5) not null,
    nom_curso varchar2(50) not null,
    carga_horaria number(4) not null,
    data_transacao date not null);
    
CREATE TABLE cliente_log(
    operacao varchar2(50) not null,
    codigo_do_cliente number(5) not null,
    nome_do_cliente varchar2(30) not null,
    data_transacao date not null,
    usuario varchar2(30) not null
);

INSERT INTO CLIENTE(ID_CLIENTE, NOM_CLIENTE, IND_SEXO, NUM_TELEFONE, DES_ENDERECO)
            VALUES(97,'Lucas Gabriel','M',NULL,'RUA ODILON BRAGA 222');

DELETE FROM CLIENTE WHERE id_cliente = 97;

SELECT * FROM CLIENTE;
SELECT * FROM CLIENTE_LOG;