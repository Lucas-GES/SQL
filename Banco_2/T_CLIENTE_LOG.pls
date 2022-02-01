CREATE OR REPLACE TRIGGER T_CLIENTE_LOG 
BEFORE INSERT OR UPDATE OR DELETE ON CLIENTE FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO cliente_log( operacao, 
                                codigo_do_cliente,
                                nome_do_cliente,
                                data_transacao,
                                usuario)
        VALUES (  
END;