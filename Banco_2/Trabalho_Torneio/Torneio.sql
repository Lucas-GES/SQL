CREATE OR REPLACE PROCEDURE P_GERA_TORNEIO 
(
  P_COD_TORNEIO IN NUMBER,
  P_DES_TORNEIO in Varchar2,
  P_VAL_INSCRICAO in Number
) AS 
BEGIN
   Insert into torneio(cod_torneio, des_torneio, val_inscricao)
    Values(P_COD_TORNEIO, P_DES_TORNEIO, P_VAL_INSCRICAO);    
    
    if time.ind_serie = 'A' then
        Insert into torneio_time(cod_torneio, cod_time)
        Values(P_COD_TORNEIO, time.cod_time);
    end if;
    
END P_GERA_TORNEIO;