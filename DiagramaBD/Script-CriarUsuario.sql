INSERT INTO PAIS (DESCRICAO) VALUES ("BRASIL");
INSERT INTO ESTADO (DESCRICAO,PAIS_id) VALUES ("SANTA CATARINA", 1);
INSERT INTO MUNICIPIO (DESCRICAO,ESTADO_PAIS_id) VALUES("BLUMENAU",1);
INSERT INTO CEP (DESCRICAO,MUNICIPIO_ESTADO_PAIS_id) VALUES("000-000",1);
INSERT INTO ENDERECO (MUNICIPIO_id,ESTADO_id,PAIS_id,CEP_id,numero,logradouro) VALUES(1,1,1,1,"S/N","SEM LOGRADOURO");
INSERT INTO CARGO (DESCRICAO) VALUES("DESENVOLVEDOR");
INSERT INTO PESSOA (NOME.CNPJCPF.CELULAR,EHFUNCIONARIO,EHCLIENTE,ENDERECO_id,CARGO_id,EMAIL,IDENTIFICACAO) VALUES("USUARIO PADRAO",0,"(47)9960-75616",1,0,1,1,"USUARIO.PADRAO@GMAIL.COM","000.000.000-00");
INSERT INTO USUARIO (NOME,SENHA,PESSOA_id) VALUES ("usuario.padrao","12345",1);