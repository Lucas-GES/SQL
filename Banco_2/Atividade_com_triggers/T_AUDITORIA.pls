CREATE OR REPLACE TRIGGER T_AUDITORIA 
BEFORE UPDATE ON FATURA FOR EACH ROW
BEGIN
    if UPDATING then
        if UPDATING and :NEW.valor != :OLD.valor then           
               INSERT into Auditoria(numero_da_fatura,
                        data_da_emissao,
                        data_do_pagamento,
                        data_do_vencimento,
                        valor)
                VALUES(:OLD.numero_da_fatura , 
                        :OLD.data_da_emissao ,
                        :OLD.data_do_pagamento , 
                        :OLD.data_do_vencimento , 
                        :NEW.valor );
        end if; 
    end if;
END;