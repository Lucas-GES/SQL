-- 1) 
Create table Fatura(numero_da_fatura number(5) not null,
                    data_da_emissao date not null,
                    data_do_vencimento date not null,
                    data_do_pagamento date not null,
                    valor number(10) not null,
                    Constraint pk_fatura primary key(numero_da_fatura));
                    
-- 2)
Create table Auditoria( numero_da_fatura number(5) not null,
                        data_da_emissao date not null,
                        data_do_pagamento date not null,
                        data_do_vencimento date not null,
                        valor number(10) not null,
                        Constraint pk_auditoria primary key(numero_da_fatura),
                        Constraint fk_fatura Foreign Key(numero_da_fatura) 
                        References Fatura(numero_da_fatura));
                        
-- 3) 
INSERT into Fatura(numero_da_fatura, 
                    data_da_emissao,
                    data_do_vencimento,
                    data_do_pagamento,
                    valor)
VALUES(55555, '01/04/2021', '06/04/2021', '05/05/2021', 1000); 

select * from fatura;
select * from auditoria;

DELETE FROM fatura Where numero_da_fatura = 55555;

UPDATE fatura set valor = 1400 
WHERE numero_da_fatura = 55555;

