[Comando para executar no SQL/Plus]
exp admin/MANAGER@XE file=c:\backup.dmp log=c:\backup.txt statistcs=none indexes=no;

[Comando para executar no SQL/Plus]
alter session set "_ORACLE_SCRIPT"=true;

[Comando para executar no SQL/Plus]
CREATE USER NOVOUSUARIO IDENTIFIED BY D#D0s DEFAULT TABLESPACE TREINAMENTO TEMPORARY TABLESPACE TEMPO ACCOUNT UNLOCK;

[Comando para executar no SQL/Plus]
GRANT UPDATE ANY TABLE TO NOVOUSUARIO WITH admin OPTION;
ALTER USER NOVOUSUARIO DEFAULT ROLE ALL;
GRANT DBA TO NOVOUSUARIO WITH admin OPTION;
GRANT ALL PRIVILEGES TO NOVOUSUARIO WITH admin OPTION;
GRANT SELECT ON V_$SESSION TO NOVOUSUARIO;

[Comando para executar no SQL/Plus]
imp admin/MANAGER ignore=y file=c:\teste\backup.dmp log=c:\teste\backup.log fromuser=admin touser=NOVOUSUARIO;

[Comando para executar no SQL/Plus]
exp admin/MANAGER@XE file=D:\temp\backup\backup.dmp log=D:\temp\backup\backup.txt statistics=none indexes=no;

