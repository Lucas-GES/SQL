create table departamento(
  cod_depto         number(3) not null,
  des_depto         varchar2(40) not null);

create table funcionario ( 
  num_matricula    	number(8) not null,
  nom_funcionario   varchar2(40) not null,
  dat_admissao      date not null,
  tip_estado      	varchar2(1) not null,
  dat_demissao      date,
  val_salario       number(8,2),
  cod_depto         number(3) not null);

alter table departamento add constraint pk_depto primary key (cod_depto);
alter table funcionario add constraint pk_func primary key (num_matricula);

alter table funcionario add constraint fk_depto foreign key (cod_depto) References departamento(cod_depto);

create sequence seq_matricula start with 1 increment by 1;

INSERT INTO DEPARTAMENTO VALUES(100,'VENDAS');
INSERT INTO DEPARTAMENTO VALUES(200,'PRODUÇÃO');
COMMIT;

CREATE OR REPLACE PROCEDURE P_INCLUI_FUNCIONARIO
  (P_NOME IN VARCHAR2, P_ESTADOCIVIL IN VARCHAR2, 
   P_SALARIO IN NUMBER, P_TIPOFUNC IN NUMBER) AS
   
  V_COD_DEPTO     FUNCIONARIO.COD_DEPTO%TYPE;
BEGIN
  IF P_TIPOFUNC >= 1 AND P_TIPOFUNC <= 10 THEN
     V_COD_DEPTO := 100; 
  ELSE
     V_COD_DEPTO := 200;
  END IF;

  INSERT INTO FUNCIONARIO
    (NUM_MATRICULA,NOM_FUNCIONARIO,DAT_ADMISSAO,
     TIP_ESTADO,VAL_SALARIO, COD_DEPTO)
     VALUES(SEQ_MATRICULA.NEXTVAL, P_NOME, SYSDATE, 
            P_ESTADOCIVIL, P_SALARIO, V_COD_DEPTO);
END;
/

EXECUTE P_INCLUI_FUNCIONARIO('EDSON', 'C',1000, 10);

SELECT * FROM FUNCIONARIO;

CREATE OR REPLACE FUNCTION F_RETORNA_SAL (MATRICULA IN NUMBER) RETURN NUMBER AS
  V_VAL_SALARIO    FUNCIONARIO.VAL_SALARIO%TYPE;
BEGIN
  SELECT VAL_SALARIO INTO V_VAL_SALARIO
    FROM FUNCIONARIO
    WHERE NUM_MATRICULA = MATRICULA;
  RETURN(V_VAL_SALARIO);
EXCEPTION
WHEN OTHERS THEN
   RETURN 0;  
END;
/

SELECT F_RETORNA_SAL (3) FROM DUAL;

DECLARE
  V_SAL NUMBER(8,2);
BEGIN
  V_SAL := F_RETORNA_SAL (&MATRICULA);
  DBMS_OUTPUT.PUT_LINE(V_SAL);
END;
/