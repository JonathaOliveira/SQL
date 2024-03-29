﻿/*
==== SCRIPT´S (EBOOK - Banco de Dados & SQL para inciantes) ====
Autor:        Jonatha Araujo Oliveira
Github:       https://github.com/JonathaOliveira
Telefone:     (61) 9 9919-8141
E-mail:       pantheon.jonatha@gmail.com
Versão:       1.0
*/

/*== Cap (SQL - Introdução) ==*/

-- CRIANDO TABELA DE ALUNOS
CREATE TABLE ALUNO
(
NOME VARCHAR2(60),
SERIE INT,
TURMA CHAR(1),
NOTA NUMBER(*,4)
);
-- INSERINDO ALUNO JOAO 
INSERT INTO ALUNO (NOME,SERIE,TURMA,NOTA) VALUES ('JOAO',1,'A',10);
-- CONFIRMANDO AÇÃO
COMMIT;
-- VISUALIZANDO
SELECT * FROM ALUNO;

/*== Cap (SQL - Tabelas) ==*/

--CRIANDO TABELA PRODUTOS
CREATE TABLE PRODUTOS (
CODIGO INT PRIMARY KEY NOT NULL,
DESCRICAO VARCHAR2(80) NOT NULL,
SKU NUMBER(13) NULL,
DESCRICAO_WEB CLOB,
ATIVO CHAR(1) DEFAULT 'A');

--INSERINDO DADOS NA TABELA PRODUTOS
INSERT INTO PRODUTOS (CODIGO, DESCRICAO) VALUES (1,'COPO BRANCO');
INSERT INTO PRODUTOS (CODIGO, DESCRICAO) VALUES (2,'COPO BRANCO');
INSERT INTO PRODUTOS (CODIGO, DESCRICAO) VALUES (3,'COPO VERDE');
COMMIT;

-- VISUALIZANDO PRODUTOS
SELECT * FROM PRODUTOS;

-- ADICIONANDO COLUNA (ALTER - ADD)
ALTER TABLE PRODUTOS ADD DT_CADASTRO DATE;
COMMIT;

-- VISUALIZANDO PRODUTOS
SELECT * FROM PRODUTOS;

-- RENOMEANDO TABELA (RENAME)
ALTER TABLE PRODUTOS RENAME TO PRODUTOS2;

-- RENOMEANDO COLUNA (ALTER - RENAME COLUMN)
ALTER TABLE PRODUTOS2 RENAME COLUMN DESCRICAO_WEB TO WEB;
COMMIT;

-- ALTERANDO COLUNA (MODIFY)
ALTER TABLE PRODUTOS2 MODIFY DESCRICAO VARCHAR2(80);
COMMIT;

-- EXCLUINDO COLUNA
ALTER TABLE PRODUTOS2 DROP COLUMN WEB;
COMMIT;

-- EXCLUIR A TABELA
DROP TABLE PRODUTOS2;
COMMIT;


/*== Cap (SQL - Insert e Select) ==*/


-- CRIANDO TABELA CLIENTES
CREATE TABLE CLIENTES (
CODCLI INT NOT NULL,
NOME VARCHAR2(80) NOT NULL,
CPF NUMBER(11) NOT NULL,
DT_CADASTRO DATE DEFAULT SYSDATE,
OBS VARCHAR2(200),
CONSTRAINT CODCLI_PK PRIMARY KEY(CODCLI));

-- INSERINDO CLIENTE JOAO
INSERT INTO CLIENTES (CODCLI, NOME, CPF, OBS)
VALUES (1,'JOAO',123456789,' XML: TESTE');
COMMIT;

-- INSERINDO CLIENTE MARIA
INSERT INTO CLIENTES (CODCLI, NOME, CPF, OBS)
VALUES (2,'MARIA',88888888,' JSON: TESTE2');
COMMIT;

-- VISUALIZANDO CLIENTE
SELECT * FROM CLIENTES;

-- INSERINDO NOVAS COLUNAS
ALTER TABLE CLIENTES ADD LIMITE_CREDITO NUMBER(*,4);
ALTER TABLE CLIENTES ADD VENDEDOR INT;
ALTER TABLE CLIENTES ADD  ATIVO CHAR(1) DEFAULT 'A';
ALTER TABLE CLIENTES ADD  DT_NASCIMENTO DATE;
COMMIT;

-- VISUALIZANDO CLIENTE COM NOVAS COLUNAS
SELECT * FROM CLIENTES;

-- SCRIPT INSERT DE VARIOS CLIENTES

INSERT INTO CLIENTES (CODCLI, NOME, CPF, OBS, LIMITE_CREDITO, DT_NASCIMENTO)
VALUES (3,'AMANDA',22222222,'X', 1000, '18-02-1993');

INSERT INTO CLIENTES (CODCLI, NOME, CPF, OBS, LIMITE_CREDITO, DT_NASCIMENTO)
VALUES (4,'FRANCISCO FLAGO',33333333,'X', 500, '01-01-1994');

INSERT INTO CLIENTES (CODCLI, NOME, CPF, OBS, LIMITE_CREDITO, DT_NASCIMENTO)
VALUES (5,'FRANCISCO CHAGAS',339999999,'X', 0, '01-01-1995');

INSERT INTO CLIENTES (CODCLI, NOME, CPF, OBS, LIMITE_CREDITO, DT_NASCIMENTO)
VALUES (6,'FRANCISCO MEDEIROS',33333348,'X', 25000, '01-01-1988');

INSERT INTO CLIENTES (CODCLI, NOME, CPF, OBS, LIMITE_CREDITO, DT_NASCIMENTO)
VALUES (7,'FLAVIA VIEIRA',44445555,'X', 90, '01-01-2004');

INSERT INTO CLIENTES (CODCLI, NOME, CPF, OBS, LIMITE_CREDITO, DT_NASCIMENTO)
VALUES (8,'BRUNA DE SAICCO',337777773,'X', 1000, '01-01-2000');

INSERT INTO CLIENTES (CODCLI, NOME, CPF, OBS, LIMITE_CREDITO, DT_NASCIMENTO)
VALUES (9,'FRANCISCO CHAGAS',66886966,'X', 1000, '01-01-1990');

COMMIT;

-- VISUALIZANDO TABELA CLIENTES FILTRANDO A COLUNA NOME ONDE HOUVER AMANDA
SELECT * FROM CLIENTES WHERE NOME = 'AMANDA';

-- VISUALIZANDO TABELA CLIENTES FILTRANDO LIMITE DE CREDITO SUPERIOR A 1000
SELECT * FROM CLIENTES WHERE LIMITE_CREDITO > 1000;

-- VISUALIZANDO TABELA CLIENTES FILTRANDO LIMITE DE CREDITO SUPERIOR OU IGUAL 1000
SELECT * FROM CLIENTES WHERE LIMITE_CREDITO >= 1000;

-- VISUALIZANDO TABELA CLIENTES FILTRANDO LIMITE DE CREDITO MENOR QUE 1000
SELECT * FROM CLIENTES WHERE LIMITE_CREDITO < 1000;

-- VISUALIZANDO TABELA CLIENTES FILTRANDO LIMITE DE CREDITO MENOR OU IGUAL 1000
SELECT * FROM CLIENTES WHERE LIMITE_CREDITO <= 1000;

-- TRAGA TODOS OS CLIENTES ONDE O OBS SEJA DIFERENTE DE X (1º FORMA)
SELECT * FROM CLIENTES WHERE OBS <> 'X';

-- TRAGA TODOS OS CLIENTES ONDE O OBS SEJA DIFERENTE DE X (2º FORMA)
SELECT * FROM CLIENTES WHERE OBS != 'X';

--FILTRANDO CLIENTES COM NOME AMANDA E MARIA
SELECT * FROM CLIENTES WHERE NOME IN ('AMANDA','MARIA');

--FILTRANDO TODOS OS CLIENTES QUE INICIAM COM A LETRA (F)
SELECT * FROM CLIENTES WHERE NOME LIKE 'F%';

--FILTRANDO TODOS OS CLIENTES QUE INICIAM COM A LETRA (A)
SELECT * FROM CLIENTES WHERE NOME LIKE 'A%';

--FILTRANDO TODOS OS CLIENTES ONDE A COLUNA DT_NASCIMENTO SEJA IGUAL 01-01-1988 (1º FORMA)
SELECT * FROM CLIENTES WHERE DT_NASCIMENTO = '01/01/1988';

--FILTRANDO TODOS OS CLIENTES ONDE A COLUNA DT_NASCIMENTO SEJA IGUAL 01-01-1988 (2º FORMA)
SELECT * FROM CLIENTES WHERE DT_NASCIMENTO = '01-JAN-1988';

--FILTRANDO TODOS OS CLIENTES ONDE A COLUNA DT_NASCIMENTO SEJA IGUAL 01-01-1988 (3º FORMA)
SELECT * FROM CLIENTES WHERE DT_NASCIMENTO = TO_DATE('01/01/1988' , 'DD/MM/YYYY');

--FILTRANDO POR PERIODO
SELECT * 
 FROM CLIENTES 
  WHERE DT_NASCIMENTO BETWEEN TO_DATE('01/01/1988' , 'DD/MM/YYYY')
   AND TO_DATE('31/12/2000',  'DD/MM/YYYY');
   
--FILTRANDO POR PERIODO
SELECT * FROM CLIENTES WHERE DT_NASCIMENTO BETWEEN '01/01/1988' AND '31/12/2000';

-- UTILIZANDO DOIS FILTROS , BUSQUE CLIENTES COM LIMITE MAIOR QUE 100 E QUE TENHA CHAGAS EM SEUS NOMES
SELECT * FROM CLIENTES WHERE LIMITE_CREDITO >= 1000 AND NOME LIKE '%CHAGAS';

-- BUSQUE CLIENTES QUE TENHAM CHAGAS OU MEDEIROS
SELECT * FROM CLIENTES WHERE NOME LIKE '%CHAGAS' OR NOME LIKE '%MEDEIROS';

-- CRIANDO TABELA CLIENTESVIP
CREATE TABLE CLIENTESVIP (
CODVIP INT NOT NULL,
NOME VARCHAR2(80) NOT NULL,
CONSTRAINT CODVIP_PK PRIMARY KEY(CODVIP));

-- INSERINDO CLIENTES A PARTIR DE UM SELECT , COM LIMITE SUPERIOR A 1000
INSERT INTO CLIENTESVIP (CODVIP, NOME)
SELECT clientes.codcli, clientes.nome FROM CLIENTES WHERE clientes.limite_credito > 1000;
COMMIT;

-- INSERINDO CLIENTES A PARTIR DE UM SELECT , FILTRANO CODIGO DIFERENTE DE 6
INSERT INTO CLIENTESVIP (CODVIP, NOME)
SELECT C.CODCLI, C.NOME FROM CLIENTES C WHERE C.CODCLI != 6;
COMMIT;


/*== Cap (SQL - Relacionamento entre tabelas) ==*/

-- CRIANDO TABELA VENDEDORES
CREATE TABLE VENDEDORES (
VENDEDOR INT NOT NULL,
NOMEVENDEDOR VARCHAR2(40),
CODCLI INT,
-- CHAVE ESTRANGEIRA (FK)
CONSTRAINT CODCLI_FK FOREIGN KEY (CODCLI) REFERENCES CLIENTES (CODCLI) );

-- INSERINDO VENDEDOR- INSERT VALUES
INSERT INTO VENDEDORES (VENDEDOR, NOMEVENDEDOR, CODCLI) VALUES (1, 'VENDEDOR: JOAO', 1);
INSERT INTO VENDEDORES (VENDEDOR, NOMEVENDEDOR, CODCLI) VALUES (1, 'VENDEDOR: JOAO', 2);
COMMIT;
-- INSERINDO VENDEDOR DE FORMA QUE O MESMO VALIDE O LIMITE DE CREDITO IGUAL OU INFERIROR A ZERO - INSERT COM SELECT
INSERT INTO VENDEDORES (VENDEDOR, NOMEVENDEDOR, CODCLI)
SELECT 2, 'INATIVO', C.CODCLI FROM CLIENTES C WHERE C.LIMITE_CREDITO <= 0;
COMMIT;
-- INSERINDO VENDEDOR DE FORMA QUE O MESMO VALIDE O LIMITE DE CREDITO MAIOR QUE 0 E SUPERIOR A 1000 - INSERT COM SELECT
INSERT INTO VENDEDORES (VENDEDOR, NOMEVENDEDOR, CODCLI)
SELECT 3, 'VENDEDOR: MARIA', C.CODCLI FROM CLIENTES C WHERE C.LIMITE_CREDITO > 0 AND C.LIMITE_CREDITO < 1000;
COMMIT;

-- INSERINDO VENDEDOR DE FORMA QUE O MESMO VALIDE O LIMITE DE CREDITO MAIOR OU IGUAL A 1000 - INSERT COM SELECT
INSERT INTO VENDEDORES (VENDEDOR, NOMEVENDEDOR, CODCLI)
SELECT 4, 'VENDEDOR: GUSTAVO', C.CODCLI FROM CLIENTES C WHERE C.LIMITE_CREDITO >= 1000;
COMMIT;

-- VISUALIZANDO VENDENDORES
SELECT * FROM VENDEDORES;

-- VISUALIZANDOR COM RELACIONAMENTO (INNER JOIN)
SELECT V.NOMEVENDEDOR, C.NOME
    FROM CLIENTES C
     INNER JOIN VENDEDORES V
      ON C.CODCLI = V.CODCLI;
      
-- VISUALIZANDOR COM RELACIONAMENTO (LEFT JOIN)      
  SELECT C.VENDEDOR, V.VENDEDOR
    FROM VENDEDORES V
     LEFT JOIN CLIENTES C
      ON C.VENDEDOR = V.VENDEDOR;

-- VISUALIZANDOR COM RELACIONAMENTO (RIGHT JOIN) 
SELECT V.NOMEVENDEDOR, C.NOME
    FROM CLIENTES C
     RIGHT JOIN VENDEDORES V
      ON C.CODCLI = V.CODCLI;

-- VISUALIZANDOR COM RELACIONAMENTO (CROSS JOIN) 
SELECT V.NOMEVENDEDOR, C.NOME
    FROM CLIENTES C
     CROSS JOIN VENDEDORES V
      WHERE C.CODCLI = 1 OR V.CODCLI = 1;
      
--CRIANDO TABELA DE PRODUTOS
CREATE TABLE PRODUTOS (
IDPRODUTO INT NOT NULL,
DESCRICAO VARCHAR2(80) NOT NULL,
DESCRICAOWEB VARCHAR2(120) NULL,
ARMAZEN INT,
POLITICAPRECO INT,
CODBARRAS INT NULL,
ATIVO CHAR(1) DEFAULT 'S',
CONSTRAINT IDPRODUTO_PK PRIMARY KEY (IDPRODUTO));

--CRIANDO TABELA DE ESTOQUE
CREATE TABLE ESTOQUE (
IDPRODUTO INT NOT NULL,
QUANTIDADE INT NOT NULL,
CONSTRAINT ESTOQUE_PK PRIMARY KEY (IDPRODUTO),
CONSTRAINT ESTOQUE_FK FOREIGN KEY (IDPRODUTO) REFERENCES PRODUTOS (IDPRODUTO));
 
--CRIANDO TABELA DE PREÇOS
CREATE TABLE PRECO (
IDPRODUTO INT NOT NULL,
PRECO NUMBER(*,4) NOT NULL,
CONSTRAINT PRECO_PK PRIMARY KEY (IDPRODUTO),
CONSTRAINT PRECO_FK FOREIGN KEY (IDPRODUTO) REFERENCES PRODUTOS (IDPRODUTO));

-- INSERINDO PRODUTOS
INSERT INTO PRODUTOS (IDPRODUTO, DESCRICAO, DESCRICAOWEB, ARMAZEN, POLITICAPRECO, CODBARRAS) VALUES (1, 'PRODUTO 1', 'PRODUTO 1', 1 , 1, 789123456);
INSERT INTO PRODUTOS (IDPRODUTO, DESCRICAO, DESCRICAOWEB, ARMAZEN, POLITICAPRECO, CODBARRAS) VALUES (2, 'PRODUTO 2', 'PRODUTO 2', 1 , 1, 789123567);
INSERT INTO PRODUTOS (IDPRODUTO, DESCRICAO, DESCRICAOWEB, ARMAZEN, POLITICAPRECO, CODBARRAS) VALUES (3, 'PRODUTO 3', 'PRODUTO 3', 2 , 1, 789123789);
INSERT INTO PRODUTOS (IDPRODUTO, DESCRICAO, DESCRICAOWEB, ARMAZEN, POLITICAPRECO, CODBARRAS) VALUES (4, 'PRODUTO 4', 'PRODUTO 4', 2 , 2, 789123012);
INSERT INTO PRODUTOS (IDPRODUTO, DESCRICAO, DESCRICAOWEB, ARMAZEN, POLITICAPRECO, CODBARRAS) VALUES (5, 'PRODUTO 5', 'PRODUTO 5', 1 , 2, 789123345);
COMMIT;

-- INSERINDO PREÇOS
INSERT INTO PRECO (IDPRODUTO, PRECO) VALUES (1, 10);
INSERT INTO PRECO (IDPRODUTO, PRECO) VALUES (2, 5.99);
INSERT INTO PRECO (IDPRODUTO, PRECO) VALUES (3, 90.87);
INSERT INTO PRECO (IDPRODUTO, PRECO) VALUES (4, 300.22);
INSERT INTO PRECO (IDPRODUTO, PRECO) VALUES (5, 200.35);
COMMIT;

-- INSERINDO ESTOQUES
INSERT INTO ESTOQUE (IDPRODUTO, QUANTIDADE) SELECT P.IDPRODUTO, 100 FROM PRODUTOS P;
COMMIT;

-- VISUALIZANDOR COM RELACIONAMENTO (ALIAS)   
SELECT T.IDPRODUTO, T.DESCRICAO, P.PRECO, E.QUANTIDADE
 FROM  PRODUTOS T, ESTOQUE E, PRECO P
  WHERE T.IDPRODUTO = E.IDPRODUTO
    AND T.IDPRODUTO = P.IDPRODUTO;

/*== Cap (SQL - Update & Delete) ==*/

-- CRIANDO TABELA DE PEDIDOS
CREATE TABLE PEDIDOS (
PEDIDOID INT NOT NULL PRIMARY KEY,
VALOR NUMBER(*,4) NOT NULL,
VENDEDOR INT NOT NULL);

-- INSERINDO DADOS NA TABELA DE PEDIDOS
INSERT INTO PEDIDOS (PEDIDOID, VALOR, VENDEDOR) VALUES (100, 350.00 ,1);
INSERT INTO PEDIDOS (PEDIDOID, VALOR, VENDEDOR) VALUES (101, 199.00 ,1);
INSERT INTO PEDIDOS (PEDIDOID, VALOR, VENDEDOR) VALUES (202, 1500.00 ,4);
INSERT INTO PEDIDOS (PEDIDOID, VALOR, VENDEDOR) VALUES (232, 2500.00 ,4);
INSERT INTO PEDIDOS (PEDIDOID, VALOR, VENDEDOR) VALUES (229, 10.99 ,4);
COMMIT;

-- EXCLUINDO PEDIDOS 100 E 101 (1º FORMA)
DELETE FROM PEDIDOS WHERE PEDIDOID BETWEEN 100 AND 101;
COMMIT; 
-- EXCLUINDO PEDIDOS 100 E 101 (2º FORMA)
DELETE FROM PEDIDOS WHERE PEDIDOID IN (100,101);
COMMIT;

-- BUSCANDO CONSTRAINT DE NOME CODCLI_FK
SELECT C.TABLE_NAME FROM USER_CONSTRAINTS C WHERE C.CONSTRAINT_NAME = 'CODCLI_FK';

-- EXCLUINDO REGISTROS DE CHAVE ESTRANGEIRA
DELETE FROM VENDEDORES WHERE CODCLI IN (1,2);
COMMIT;
-- EXCLUIR CLIENTES 1 E 2
DELETE FROM CLIENTES WHERE CODCLI IN (1,2);
COMMIT;

-- DESABILITANDO CONSTRAINT CODCLI_FK
ALTER TABLE VENDEDORES
DISABLE CONSTRAINT CODCLI_FK;

-- DELETANDO O CLIENTE DE COD. 3
DELETE FROM CLIENTES WHERE CODCLI = 3;
COMMIT;

-- HABILITANDO CONSTRAINT CODCLI_FK
ALTER TABLE VENDEDORES
ENABLE CONSTRAINT CODCLI_FK;
-- == CASO NÃO SEJA POSSIVEL HABILITAR DELETE REGISTRO 3 DE CLIENTES

-- REALIZANDO UPDATE
UPDATE CLIENTES
 SET NOME = 'FRANCISCO DE ASIS'
  WHERE NOME = 'FRANCISCO CHAGAS';
  
-- VISUALIZANDO UPDATE ANTES DE CONFIRMAR AÇÃO
SELECT * FROM CLIENTES;

-- UTILIZE O ROLLBACK PARA VOLTAR A AÇÃO ANTES DE CONFIRMAR
ROLLBACK;

-- REALIZANDO UPDATE CORRETO COM O FILTRO
UPDATE CLIENTES
 SET NOME = 'FRANCISCO DE ASIS'
  WHERE NOME = 'FRANCISCO CHAGAS'
   AND limite_credito = 0;
   
-- CONFIRMANDO A AÇÃO
COMMIT;

-- REALIZANDO ATUALIZAÇÃO EM MAIS DE UM COLUNA POR VEZ
UPDATE CLIENTES C
 SET C.LIMITE_CREDITO = 1500 ,
        C.OBS = 'ATUALIZACAO DE CREDITO'
      WHERE C.CODCLI = 7;
COMMIT;

/*== Cap (SQL - Usando funções) ==*/

-- CRIANDO SEQUENCIA
CREATE SEQUENCE SEQ_ROUPAS MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER NOCYCLE;

-- CRIANDO TABELA ROUPAS COM SEQUENCIA
CREATE TABLE ROUPAS(
COD_ROUPAS INT DEFAULT SEQ_ROUPAS.NEXTVAL,
DESCRICAO VARCHAR2(80),
MARCA VARCHAR2(40),
VALOR NUMBER(*,4),
CONSTRAINT CODROUPASPK PRIMARY KEY(COD_ROUPAS));

-- INSERINDO ROUPAS
INSERT INTO ROUPAS (DESCRICAO, MARCA, VALOR) VALUES ('ROUPA VERMELHA', 'POLO', 100);
INSERT INTO ROUPAS (DESCRICAO, MARCA, VALOR) VALUES ('ROUPA PRETA', 'POLO', 150);
INSERT INTO ROUPAS (DESCRICAO, MARCA, VALOR) VALUES ('ROUPA BRANCA', 'POLO', 80);
COMMIT;

-- CRIANDO TABELA FILMES
CREATE TABLE FILMES(
CODFILME INT PRIMARY KEY,
NOME VARCHAR2(60),
VALOR NUMBER(6,4));

-- INSERINDO FILMES
INSERT INTO FILMES (CODFILME, NOME, VALOR) SELECT NVL(MAX(CODFILME),0) + 1 , 'FILME 01', 20 FROM FILMES;
INSERT INTO FILMES (CODFILME, NOME, VALOR) SELECT NVL(MAX(CODFILME),0) + 1 , 'FILME 02', 20 FROM FILMES;
INSERT INTO FILMES (CODFILME, NOME, VALOR) SELECT NVL(MAX(CODFILME),0) + 1 , 'FILME 03', 20 FROM FILMES;
COMMIT;

-- VISUALIZANDO ROUPAS ORDENADAS POR VALOR (ORDEM CRESCENTE)
SELECT *
 FROM ROUPAS
  ORDER BY VALOR;

-- VISUALIZANDO ROUPAS ORDENADAS POR VALOR (ORDEM DECRESCENTE)  
SELECT *
 FROM ROUPAS
  ORDER BY VALOR DESC;

-- AGRUPANDO ROUPAS POR MARCA  
SELECT MARCA
 FROM ROUPAS
  GROUP BY MARCA;
  
-- INSERINDO MAIS ROUPAS
INSERT INTO ROUPAS (DESCRICAO, MARCA, VALOR) VALUES ('ROUPA VERMELHA', 'COLCCI', 170);
INSERT INTO ROUPAS (DESCRICAO, MARCA, VALOR) VALUES ('ROUPA PRETA', 'COLCCI', 190);
INSERT INTO ROUPAS (DESCRICAO, MARCA, VALOR) VALUES ('ROUPA BRANCA', 'COLCCI', 180);
INSERT INTO ROUPAS (DESCRICAO, MARCA, VALOR) VALUES ('ROUPA PRETA', 'MORENA ROSA', 180);
INSERT INTO ROUPAS (DESCRICAO, MARCA, VALOR) VALUES ('ROUPA BRANCA', 'MORENA ROSA', 180);
INSERT INTO ROUPAS (DESCRICAO, MARCA, VALOR) VALUES ('ROUPA VERMELHA', 'COLCCI', 150);
INSERT INTO ROUPAS (DESCRICAO, MARCA, VALOR) VALUES ('ROUPA PRETA', 'COLCCI', 150);
INSERT INTO ROUPAS (DESCRICAO, MARCA, VALOR) VALUES ('ROUPA BRANCA', 'COLCCI', 150);
COMMIT;

-- VISUALIZAR TABELA DE ROUPAS
SELECT * FROM ROUPAS;  

-- ORGANIZANDO VISUALIZAÇÃO DE ROUPAS AGRUPANDO POR MARCA E DESCRIÇÃO
SELECT R.MARCA, R.DESCRICAO
 FROM ROUPAS R GROUP BY R.MARCA, R.DESCRICAO;

-- ORGANIZANDO VISUALIZAÇÃO DE ROUPAS AGRUPANDO POR MARCA E DESCRIÇÃO E ORDENANDO POR MARCA
SELECT R.MARCA, R.DESCRICAO
   FROM ROUPAS R
      GROUP BY R.MARCA, R.DESCRICAO
          ORDER BY R.MARCA;

-- CONTAR A QUANTIDADE DE REGISTROS NA TABELA ROUPAS       
SELECT COUNT(*) FROM ROUPAS;

-- CONTAR A QUANTIDADE DE REGISTROS EM CADA MARCA DA TABELA ROUPAS
SELECT MARCA, COUNT(*)
 FROM ROUPAS
  GROUP BY MARCA;
 
-- VERIFICANDO ROUPAS COM AS MESMAS DESCRIÇÕES SUPERIOR A 1 VEZ
SELECT P.DESCRICAO, COUNT(*)
 FROM ROUPAS P
  GROUP BY P.DESCRICAO
   HAVING COUNT(*) > 1;

/*== Cap (SQL - Avançado) ==*/

-- criando tabela de produtos alimentícios
CREATE TABLE FOODS (
CODPROD INT,
DESCRICAO VARCHAR2(80) NOT NULL,
VALOR NUMBER(*,6) NULL,
DT_VALIDADE DATE NOT NULL,
PRIMARY KEY (CODPROD));

-- inserindo dados na tabela
INSERT INTO FOODS (CODPROD, DESCRICAO, VALOR, DT_VALIDADE) SELECT NVL(MAX(CODPROD),0)+1, 'FRANGO 1KG', 25.99, '01-02-2022' FROM FOODS;
INSERT INTO FOODS (CODPROD, DESCRICAO, VALOR, DT_VALIDADE) SELECT NVL(MAX(CODPROD),0)+1, 'FRANGO 2KG', 35.99, '01-02-2022' FROM FOODS;
INSERT INTO FOODS (CODPROD, DESCRICAO, VALOR, DT_VALIDADE) SELECT NVL(MAX(CODPROD),0)+1, 'FRANGO 5KG', 68.79, '01-07-2022' FROM FOODS;
INSERT INTO FOODS (CODPROD, DESCRICAO, VALOR, DT_VALIDADE) SELECT NVL(MAX(CODPROD),0)+1, 'PEIXE 500G', 9.99, '01-07-2022' FROM FOODS;
INSERT INTO FOODS (CODPROD, DESCRICAO, VALOR, DT_VALIDADE) SELECT NVL(MAX(CODPROD),0)+1, 'FILE DE PEIXE 1KG', 98, '01-08-2022' FROM FOODS;
COMMIT;

-- verificando tabela
SELECT * FROM FOODS;

-- criando tabela de validação
CREATE TABLE PRODUTOSVENCIDOS (
IDVENC INT,
CODPROD INT,
DESCARTARPRODUTO CHAR(1));

-- inserindo dados na tabela
INSERT INTO PRODUTOSVENCIDOS (IDVENC, CODPROD) VALUES (1,1);
INSERT INTO PRODUTOSVENCIDOS (IDVENC, CODPROD) VALUES (2,2);
INSERT INTO PRODUTOSVENCIDOS (IDVENC, CODPROD) VALUES (3,3);
INSERT INTO PRODUTOSVENCIDOS (IDVENC, CODPROD) VALUES (4,4);
INSERT INTO PRODUTOSVENCIDOS (IDVENC, CODPROD) VALUES (5,5);
COMMIT;

-- UPDATE COM MAIS DE UMA TABELA, UTILIZANDO FOR E LOOP
BEGIN
 FOR F IN (SELECT * FROM FOODS)
  LOOP
   UPDATE PRODUTOSVENCIDOS P
    SET P.DESCARTARPRODUTO = 'S'
     WHERE F.CODPROD = P.CODPROD
      AND F.DT_VALIDADE < '01-08-2022';
  END LOOP;
END;
-- CONFIRMANDO
COMMIT;

-- CRIANDO VIEW
CREATE VIEW VW_MOSTRASODESCRICAO
AS
SELECT DESCRICAO FROM ROUPAS;

-- VISUALIZANDO VW
SELECT * FROM VW_MOSTRASODESCRICAO;

-- EXCLUIDNO VW 
DROP VIEW VW_MOSTRASODESCRICAO;

-- CRIANDO FUNCTION
CREATE FUNCTION FUNC_VER_TAMANHO (TEXTO CLOB)
RETURN NUMBER DETERMINISTIC IS
BEGIN
 RETURN DBMS_LOB.GETLENGTH(TEXTO);
END;

-- VER RESULTADO DA FUNÇÃO
SELECT FUNC_VER_TAMANHO('OLA, ESSE TEXTO TEM QUANTOS CARACTERES?') AS RESULTADO FROM DUAL;

-- CRIANDO TABELA DE FUNCIONARIOS
CREATE TABLE FUNCIONARIO (
    FUNC_ID INT,
    FUNC_NOME VARCHAR2(80) NOT NULL,
    FUNC_GENERO CHAR(1) NULL, 
    FUNC_SALARIO NUMBER(*,6) NOT NULL,
    PRIMARY KEY (FUNC_ID));

-- CRIANDO GATILHO QUE VALIDA O SALARIO    
CREATE OR REPLACE TRIGGER TG_VALIDA_SALARIO
BEFORE INSERT OR UPDATE OF FUNC_SALARIO
ON FUNCIONARIO
FOR EACH ROW
BEGIN
    IF :NEW.FUNC_SALARIO > 5000 THEN
        RAISE_APPLICATION_ERROR(-20000, 'SALARIO ACIMA VALOR PERMITIDO NESSA TABELA');
    END IF;
END;

-- TENTANDO INSERINDO SALARIO DE R$ 15.000 
/*
INSERT INTO FUNCIONARIO (FUNC_ID, FUNC_NOME, FUNC_GENERO, FUNC_SALARIO)
VALUES (1,'FLAVIA', 'F', 15000);

-- IRÁ RETORNAR : ORA-20000: SALARIO ACIMA VALOR PERMITIDO NESSA TABELA
*/

--INSERINDO FUNCIONARIOS
INSERT INTO FUNCIONARIO (FUNC_ID, FUNC_NOME, FUNC_GENERO, FUNC_SALARIO) VALUES (1,'FLAVIA', 'F', 1500);
INSERT INTO FUNCIONARIO (FUNC_ID, FUNC_NOME, FUNC_GENERO, FUNC_SALARIO) VALUES (2,'JOAO', 'M', 800);
INSERT INTO FUNCIONARIO (FUNC_ID, FUNC_NOME, FUNC_GENERO, FUNC_SALARIO) VALUES (3,'MARIA', 'F', 2800);
COMMIT;

--CRIANDO PROCEDURE
CREATE PROCEDURE DELETA_FUNCIONARIO
 (FUNC_ID NUMBER) AS
  FUNC NUMBER;
   BEGIN
    DELETE FROM funcionario 
     WHERE funcionario.FUNC_ID = DELETA_FUNCIONARIO.FUNC_ID; 
      FUNC := FUNC - 1;
 END;

-- EXECURANDO A PROCEDURE (1º FORMA)
EXECUTE DELETA_FUNCIONARIO(2);

-- EXECURANDO A PROCEDURE (2º FORMA)
BEGIN
  DELETA_FUNCIONARIO(2);
  END;
  COMMIT;

/*
==== DROP TODAS AS TABELAS DO EBOOK ====

drop table aluno cascade constraint;
drop table clientes cascade constraint;
drop table clientesvip cascade constraint;
drop table estoque cascade constraint;
drop table filmes cascade constraint;
drop table foods cascade constraint;
drop table funcionario cascade constraint;
drop table produtos cascade constraint;
drop table preco cascade constraint;
drop table pedidos cascade constraint;
drop table produtos2 cascade constraint;
drop table produtosvencidos cascade constraint;
drop table roupas cascade constraint;
drop table vendedores cascade constraint;
drop view VW_MOSTRASODESCRICAO;
DROP SEQUENCE Seq_Roupas;
DROP FUNCTION FUNC_VER_TAMANHO;
DROP PROCEDURE DELETA_FUNCIONARIO;
*/
