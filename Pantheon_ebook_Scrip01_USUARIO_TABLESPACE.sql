﻿/*
==== SCRIPT´S (EBOOK - Banco de Dados & SQL para inciantes) ====
Autor:        Jonatha Araujo Oliveira
Github:       https://github.com/JonathaOliveira
Telefone:     (61) 9 9919-8141
E-mail:       pantheon.jonatha@gmail.com
Versão:       1.0
*/

[Comando para executar no SQL/Plus]
alter session set "_ORACLE_SCRIPT"=true;

[Comando para executar no SQL/Plus]
CREATE SMALLFILE TEMPORARY TABLESPACE TEMPO TEMPFILE 'C:\app\jonatha\product\21c\oradata\XE\TEMPO.DBF' 
SIZE 256M AUTOEXTEND ON NEXT 128M MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1M;

[Comando para executar no SQL/Plus]
CREATE SMALLFILE TABLESPACE TREINAMENTO DATAFILE 'C:\app\jonatha\product\21c\oradata\XE\TREINAMENTO.ORA' 
SIZE 1024M AUTOEXTEND ON NEXT 512M MAXSIZE UNLIMITED LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO DEFAULT NOCOMPRESS;

[Comando para executar no SQL/Plus]
CREATE USER ADMIN IDENTIFIED BY D#D0s DEFAULT TABLESPACE TREINAMENTO TEMPORARY TABLESPACE TEMPO ACCOUNT UNLOCK;

[Comando para executar no SQL/Plus]
GRANT UPDATE ANY TABLE TO admin WITH admin OPTION;
ALTER USER admin DEFAULT ROLE ALL;
GRANT DBA TO admin WITH admin OPTION;
GRANT ALL PRIVILEGES TO admin WITH admin OPTION;
GRANT SELECT ON V_$SESSION TO admin;
