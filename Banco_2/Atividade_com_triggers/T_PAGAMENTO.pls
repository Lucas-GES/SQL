CREATE OR REPLACE TRIGGER T_PAGAMENTO 
BEFORE INSERT ON FATURA FOR EACH ROW
BEGIN
    if INSERTING then
        if (:NEW.data_do_pagamento - :NEW.data_do_vencimento) >= 30 then           
               raise_application_error(-20500,' A Fatura '
            ||:OLD.numero_da_fatura||' não pode ser paga. ');        
        end if;
    end if;
END;