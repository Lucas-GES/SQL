CREATE OR REPLACE TRIGGER T_RESTRICAO_PAGAMENTO 
BEFORE UPDATE ON FUNCIONARIO for each row
BEGIN
  if UPDATING then
    if(:NEW.val_salario < :OLD.val_salario)then
        raise_application_error(-20508, 'O salário não pode ser reduzido');
    end if;
  end if;
  
END;