--NOMES DOS INTEGRANTES DO GRUPO:
--RM96960 - Alícia Vitória Guiradelo da Silva
--RM96997 - Ana Carolina Dantas Prado
--RM96525 - Arthur Foschiani de Souza
--RM96848 - Bruna Menegatti Vienna
--RM96384 - Larah Rangel Feliciano Correa

drop table pessoa cascade constraints;
drop table pj cascade constraints;
drop table empresa cascade constraints;
drop table funcionario cascade constraints;
drop table adquirivel cascade constraints;
drop table estoque cascade constraints;
drop table solicitacao cascade constraints;
drop table cotacao cascade constraints;
drop table servico cascade constraints;
drop table produto cascade constraints;
drop table fornecedor cascade constraints;
drop table cotacao_contem_solicitacao cascade constraints;
drop table fornecedor_realiza_cotacao cascade constraints;

CREATE TABLE pessoa (
    id_pessoa number(4) PRIMARY KEY,
    nome_pessoa varchar(40)
);
 
CREATE TABLE pj (
    cnpj char(14),
    id_pessoa number(4) PRIMARY KEY REFERENCES pessoa
);
 
CREATE TABLE empresa (
    cep char(8),
    id_pessoa number(4) PRIMARY KEY REFERENCES pj
);
 
CREATE TABLE funcionario (
    cpf_pf varchar(11),
    sexo_pf varchar(1),
    email_pf varchar(30),
    senha_pf varchar(10),
    id_pessoa number(4) PRIMARY KEY REFERENCES pessoa,
    id_empresa number(4) REFERENCES empresa
);
 
CREATE TABLE adquirivel (
    id_adquirivel number(4) PRIMARY KEY,
    nome_adquirivel varchar(20)
);
 
CREATE TABLE estoque (
    qtd_atual varchar(10),
    qtd_max varchar(10),
    qtd_min varchar(10),
    id_estoque number(4) PRIMARY KEY,
    id_adquirivel number(4) REFERENCES adquirivel,
    id_empresa number(4) REFERENCES empresa
);
 
CREATE TABLE solicitacao (
    id_solicitacao number(4) PRIMARY KEY,
    qtd_solicitacao varchar(10),
    id_adquirivel number(4) REFERENCES adquirivel
);
 
CREATE TABLE cotacao (
    id_cotacao number(4) PRIMARY KEY,
    dt_cotacao date,
    status_cotacao varchar(20),
    id_funcionario number(4) REFERENCES funcionario
);
 
CREATE TABLE servico (
    carga_horaria varchar(10),
    id_adquirivel number(4) PRIMARY KEY REFERENCES adquirivel
);

CREATE TABLE produto (
    tamanho_prod varchar(20),
    id_adquirivel number(4) PRIMARY KEY REFERENCES adquirivel
);
 
CREATE TABLE fornecedor (
    dt_entrada date,
    email_forn varchar(30),
    id_pj number(4) PRIMARY KEY REFERENCES pj
);
 
CREATE TABLE cotacao_contem_solicitacao (
    id_cotacao number(4) REFERENCES cotacao,
    id_solicitacao number(4) REFERENCES solicitacao
);
 
CREATE TABLE fornecedor_realiza_cotacao (
    id_fornecedor number(4) REFERENCES fornecedor,
    id_cotacao number(4) REFERENCES cotacao
);
 
commit;


INSERT INTO pessoa VALUES (1001, 'João Silva');
INSERT INTO pessoa VALUES (1002, 'Maria Fernandes');
INSERT INTO pessoa VALUES (1003, 'Carlos Souza');
INSERT INTO pessoa VALUES (1004, 'Ana Paula');
INSERT INTO pessoa VALUES (1005, 'Ricardo Alves');
INSERT INTO pessoa VALUES (1006, 'Empresa A');
INSERT INTO pessoa VALUES (1007, 'Empresa B');
INSERT INTO pessoa VALUES (1008, 'Empresa C');
INSERT INTO pessoa VALUES (1009, 'Empresa D');
INSERT INTO pessoa VALUES (1010, 'Empresa E');
INSERT INTO pessoa VALUES (1011, 'Fornecedor A');
INSERT INTO pessoa VALUES (1012, 'Fornecedor B');
INSERT INTO pessoa VALUES (1013, 'Fornecedor C');
INSERT INTO pessoa VALUES (1014, 'Fornecedor D');
INSERT INTO pessoa VALUES (1015, 'Fornecedor E');
 

INSERT INTO pj VALUES ('12345000000144', 1006);
INSERT INTO pj VALUES ('23456000000144', 1007);
INSERT INTO pj VALUES ('34567000000144', 1008);
INSERT INTO pj VALUES ('45678000000144', 1009);
INSERT INTO pj VALUES ('56789000000144', 1010);
INSERT INTO pj VALUES ('67890100000144', 1011);
INSERT INTO pj VALUES ('78901200000133', 1012);
INSERT INTO pj VALUES ('89012300000122', 1013);
INSERT INTO pj VALUES ('90123400000111', 1014);
INSERT INTO pj VALUES ('01234500000100', 1015);
 

INSERT INTO empresa VALUES ('12345678', 1006);
INSERT INTO empresa VALUES ('23456789', 1007);
INSERT INTO empresa VALUES ('34567890', 1008);
INSERT INTO empresa VALUES ('45678901', 1009);
INSERT INTO empresa VALUES ('56789012', 1010);
 

INSERT INTO funcionario VALUES ('12345678901', 'M', 'joao@email.com', 'senha123', 1001, 1006);
INSERT INTO funcionario VALUES ('23456789012', 'F', 'maria@email.com', 'senha123', 1002, 1007);
INSERT INTO funcionario VALUES ('34567890123', 'M', 'carlos@email.com', 'senha123', 1003, 1008);
INSERT INTO funcionario VALUES ('45678901234', 'F', 'ana@email.com', 'senha123', 1004, 1009);
INSERT INTO funcionario VALUES ('56789012345', 'M', 'ricardo@email.com', 'senha123', 1005, 1010);
 

INSERT INTO adquirivel VALUES (2001, 'Produto A');
INSERT INTO adquirivel VALUES (2002, 'Produto B');
INSERT INTO adquirivel VALUES (2003, 'Serviço C');
INSERT INTO adquirivel VALUES (2004, 'Produto D');
INSERT INTO adquirivel VALUES (2005, 'Serviço E');
 

INSERT INTO estoque VALUES ('50', '100', '10', 3001, 2001, 1006);
INSERT INTO estoque VALUES ('30', '80', '5', 3002, 2002, 1007);
INSERT INTO estoque VALUES ('40', '90', '15', 3003, 2003, 1008);
INSERT INTO estoque VALUES ('20', '70', '10', 3004, 2004, 1009);
INSERT INTO estoque VALUES ('60', '110', '20', 3005, 2005, 1010);
 

INSERT INTO solicitacao VALUES (4001, '5', 2001);
INSERT INTO solicitacao VALUES (4002, '10', 2002);
INSERT INTO solicitacao VALUES (4003, '8', 2003);
INSERT INTO solicitacao VALUES (4004, '12', 2004);
INSERT INTO solicitacao VALUES (4005, '6', 2005);
 

INSERT INTO cotacao VALUES (5001, TO_DATE('2023-08-16', 'YYYY-MM-DD'), 'Em análise', 1001);
INSERT INTO cotacao VALUES (5002, TO_DATE('2023-08-16', 'YYYY-MM-DD'), 'Aprovada', 1002);
INSERT INTO cotacao VALUES (5003, TO_DATE('2023-09-17', 'YYYY-MM-DD'), 'Recusada', 1003);
INSERT INTO cotacao VALUES (5004, TO_DATE('2023-10-18', 'YYYY-MM-DD'), 'Em espera', 1004);
INSERT INTO cotacao VALUES (5005, TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'Finalizada', 1005);
 

INSERT INTO servico VALUES ('40 horas', 2003);
INSERT INTO servico VALUES ('30 horas', 2005);
 

INSERT INTO produto VALUES ('30 metros', 2001);
INSERT INTO produto VALUES ('20 metros', 2002);
INSERT INTO produto VALUES ('2 metros', 2004);
 

INSERT INTO fornecedor VALUES (TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'fornecedorA@email.com', 1011);
INSERT INTO fornecedor VALUES (TO_DATE('2023-09-18', 'YYYY-MM-DD'), 'fornecedorB@email.com', 1012);
INSERT INTO fornecedor VALUES (TO_DATE('2023-09-21', 'YYYY-MM-DD'), 'fornecedorC@email.com', 1013);
INSERT INTO fornecedor VALUES (TO_DATE('2023-10-22', 'YYYY-MM-DD'), 'fornecedorD@email.com', 1014);
INSERT INTO fornecedor VALUES (TO_DATE('2023-11-29', 'YYYY-MM-DD'), 'fornecedorE@email.com', 1015);
 

INSERT INTO cotacao_contem_solicitacao VALUES (5001, 4001);
INSERT INTO cotacao_contem_solicitacao VALUES (5002, 4002);
INSERT INTO cotacao_contem_solicitacao VALUES (5003, 4003);
INSERT INTO cotacao_contem_solicitacao VALUES (5004, 4004);
INSERT INTO cotacao_contem_solicitacao VALUES (5005, 4005);
 

INSERT INTO fornecedor_realiza_cotacao VALUES (1011, 5001);
INSERT INTO fornecedor_realiza_cotacao VALUES (1012, 5002);
INSERT INTO fornecedor_realiza_cotacao VALUES (1013, 5003);
INSERT INTO fornecedor_realiza_cotacao VALUES (1014, 5004);
INSERT INTO fornecedor_realiza_cotacao VALUES (1015, 5005);

commit;

SELECT
----------------------------------------------------

set serveroutput on
set verify off

--Ex 2
CREATE OR REPLACE FUNCTION validar_cpf(cpf IN VARCHAR) RETURN VARCHAR IS
BEGIN
    IF LENGTH(cpf) = 11 THEN
        RETURN 'Válido';
    ELSE
        RETURN 'Inválido';
    END IF;
END;

SELECT validar_cpf(cpf_pf) FROM FUNCIONARIO WHERE ID_PESSOA = 1001;

CREATE OR REPLACE FUNCTION verificar_funcionario_empresa(v_id_pessoa IN NUMBER, id_empresa IN NUMBER) RETURN VARCHAR IS
    v_id_empresa NUMBER;
BEGIN
    SELECT id_empresa INTO v_id_empresa 
    FROM funcionario 
    WHERE id_pessoa = v_id_pessoa;

    IF v_id_empresa = id_empresa THEN
        RETURN 'O funcionário é desta empresa';
    ELSE
        RETURN 'O funcionário não é desta empresa';
    END IF;
END;

SELECT verificar_funcionario_empresa(1001, 1006) FROM DUAL;

--Ex 3

    --Pessoa
CREATE OR REPLACE PROCEDURE insert_pessoa (p_id_pessoa IN NUMBER, p_nome_pessoa IN VARCHAR)
IS
BEGIN
    INSERT INTO pessoa (id_pessoa, nome_pessoa) VALUES (p_id_pessoa, p_nome_pessoa);
END;

CREATE OR REPLACE PROCEDURE update_pessoa (p_id_pessoa IN NUMBER, p_nome_pessoa IN VARCHAR)
IS
BEGIN
    UPDATE pessoa SET nome_pessoa = p_nome_pessoa WHERE id_pessoa = p_id_pessoa;
END;

CREATE OR REPLACE PROCEDURE delete_pessoa (p_id_pessoa IN NUMBER)
IS
BEGIN
    DELETE FROM pessoa WHERE id_pessoa = p_id_pessoa;
END;

    --pj
CREATE OR REPLACE PROCEDURE insert_pj(p_cnpj IN CHAR, p_id_pessoa IN NUMBER, p_nome_pessoa IN VARCHAR)
IS
BEGIN
  INSERT INTO pessoa (id_pessoa, nome_pessoa) VALUES (p_id_pessoa, p_nome_pessoa);
  INSERT INTO pj (cnpj, id_pessoa) VALUES (p_cnpj, p_id_pessoa);
END;

CREATE OR REPLACE PROCEDURE update_pj (p_cnpj IN CHAR, p_id_pessoa IN NUMBER)
IS
BEGIN
    UPDATE pj SET cnpj = p_cnpj WHERE id_pessoa = p_id_pessoa;
END;

CREATE OR REPLACE PROCEDURE delete_pj (p_id_pessoa IN NUMBER)
IS
BEGIN
    DELETE FROM pj WHERE id_pessoa = p_id_pessoa;
END;

    --Empresa
CREATE OR REPLACE PROCEDURE insert_empresa (p_cep IN CHAR, p_cnpj IN CHAR, p_id_pessoa IN NUMBER, p_nome_pessoa IN VARCHAR)
IS
BEGIN
    INSERT INTO pessoa (id_pessoa, nome_pessoa) VALUES (p_id_pessoa, p_nome_pessoa);
    INSERT INTO pj (cnpj, id_pessoa) VALUES (p_cnpj, p_id_pessoa);
    INSERT INTO empresa (cep, id_pessoa) VALUES (p_cep, p_id_pessoa);
END;

CREATE OR REPLACE PROCEDURE update_empresa (p_cep IN CHAR, p_id_pessoa IN NUMBER)
IS
BEGIN
    UPDATE empresa SET cep = p_cep WHERE id_pessoa = p_id_pessoa;
END;

CREATE OR REPLACE PROCEDURE delete_empresa (p_id_pessoa IN NUMBER)
IS
BEGIN
    DELETE FROM empresa WHERE id_pessoa = p_id_pessoa;
END;

exec insert_empresa ('12345698', '25368752364512', 1053, 'FIAP SA');
exec update_empresa ('23456789', 1053);
exec delete_empresa (1053);

    --Funcionário
CREATE OR REPLACE PROCEDURE insert_funcionario(p_cpf_pf IN VARCHAR, p_sexo_pf IN VARCHAR, p_email_pf IN VARCHAR, p_senha_pf IN VARCHAR, p_id_pessoa IN NUMBER, p_id_empresa IN NUMBER, p_nome_pessoa IN VARCHAR)
IS
BEGIN
  INSERT INTO pessoa (id_pessoa, nome_pessoa) VALUES (p_id_pessoa, p_nome_pessoa);
  INSERT INTO funcionario (cpf_pf, sexo_pf, email_pf, senha_pf, id_pessoa, id_empresa) VALUES (p_cpf_pf, p_sexo_pf, p_email_pf, p_senha_pf, p_id_pessoa, p_id_empresa);
END;

CREATE OR REPLACE PROCEDURE update_funcionario (
    p_cpf_pf IN VARCHAR,
    p_sexo_pf IN VARCHAR,
    p_email_pf IN VARCHAR,
    p_senha_pf IN VARCHAR,
    p_id_pessoa IN NUMBER,
    p_id_empresa IN NUMBER
)
IS
BEGIN
    UPDATE funcionario 
    SET cpf_pf = p_cpf_pf, 
        sexo_pf = p_sexo_pf, 
        email_pf = p_email_pf, 
        senha_pf = p_senha_pf, 
        id_empresa = p_id_empresa 
    WHERE id_pessoa = p_id_pessoa;
END;

CREATE OR REPLACE PROCEDURE delete_funcionario (p_id_pessoa IN NUMBER)
IS
BEGIN
    DELETE FROM funcionario WHERE id_pessoa = p_id_pessoa;
END;

exec insert_funcionario ('42255689974', 'M', 'art2@email.com', '12345678', 1101, 1006, 'Arthur');
exec update_funcionario ('42255689972', 'F', 'art2@email.com', '123456', 1101, 1007);
exec delete_funcionario (1101);

    --adquirivel
CREATE OR REPLACE PROCEDURE insert_adquirivel(p_id_adquirivel IN NUMBER, p_nome_adquirivel IN VARCHAR)
IS
BEGIN
  INSERT INTO adquirivel (id_adquirivel, nome_adquirivel) VALUES (p_id_adquirivel, p_nome_adquirivel);
END;

CREATE OR REPLACE PROCEDURE update_adquirivel(p_id_adquirivel IN NUMBER, p_nome_adquirivel IN VARCHAR)
IS
BEGIN
  UPDATE adquirivel SET nome_adquirivel = p_nome_adquirivel WHERE id_adquirivel = p_id_adquirivel;
END;

CREATE OR REPLACE PROCEDURE delete_adquirivel(p_id_adquirivel IN NUMBER)
IS
BEGIN
  DELETE FROM adquirivel WHERE id_adquirivel = p_id_adquirivel;
END;

    --Estoque
CREATE OR REPLACE PROCEDURE insert_estoque(p_qtd_atual IN VARCHAR, p_qtd_max IN VARCHAR, p_qtd_min IN VARCHAR, p_id_estoque IN NUMBER, p_id_adquirivel IN NUMBER, p_id_empresa IN NUMBER)
IS
BEGIN
  INSERT INTO estoque (qtd_atual, qtd_max, qtd_min, id_estoque, id_adquirivel, id_empresa) VALUES (p_qtd_atual, p_qtd_max, p_qtd_min, p_id_estoque, p_id_adquirivel, p_id_empresa);
END;

CREATE OR REPLACE PROCEDURE update_estoque(p_qtd_atual IN VARCHAR, p_qtd_max IN VARCHAR, p_qtd_min IN VARCHAR, p_id_estoque IN NUMBER, p_id_adquirivel IN NUMBER, p_id_empresa IN NUMBER)
IS
BEGIN
  UPDATE estoque SET qtd_atual = p_qtd_atual, qtd_max = p_qtd_max, qtd_min = p_qtd_min, id_adquirivel = p_id_adquirivel, id_empresa = p_id_empresa WHERE id_estoque = p_id_estoque;
END;

CREATE OR REPLACE PROCEDURE delete_estoque(p_id_estoque IN NUMBER)
IS
BEGIN
  DELETE FROM estoque WHERE id_estoque = p_id_estoque;
END;

exec insert_estoque ('123', '150', '50', 3012, 2001, 1006);
exec update_estoque ('120','200','40', 3012, 2001, 1006);
exec delete_estoque (3012);

    --solicitacao
CREATE OR REPLACE PROCEDURE insert_solicitacao(p_id_solicitacao IN NUMBER, p_qtd_solicitacao IN VARCHAR2, p_id_adquirivel IN NUMBER)
IS
BEGIN
  INSERT INTO solicitacao (id_solicitacao, qtd_solicitacao, id_adquirivel) VALUES (p_id_solicitacao, p_qtd_solicitacao, p_id_adquirivel);
END;

CREATE OR REPLACE PROCEDURE update_solicitacao(p_id_solicitacao IN NUMBER, p_qtd_solicitacao IN VARCHAR2, p_id_adquirivel IN NUMBER)
IS
BEGIN
  UPDATE solicitacao SET qtd_solicitacao = p_qtd_solicitacao, id_adquirivel = p_id_adquirivel WHERE id_solicitacao = p_id_solicitacao;
END;

CREATE OR REPLACE PROCEDURE delete_solicitacao(p_id_solicitacao IN NUMBER)
IS
BEGIN
  DELETE FROM solicitacao WHERE id_solicitacao = p_id_solicitacao;
END;

exec insert_solicitacao (4011, '130', 2001);
exec update_solicitacao (4011, '100', 2002);
exec delete_solicitacao (4011);

    -- cotacao
CREATE OR REPLACE PROCEDURE insert_cotacao(p_id_cotacao IN NUMBER, p_dt_cotacao IN DATE, p_status_cotacao IN VARCHAR2, p_id_funcionario IN NUMBER)
IS
BEGIN
  INSERT INTO cotacao (id_cotacao, dt_cotacao, status_cotacao, id_funcionario) VALUES (p_id_cotacao, p_dt_cotacao, p_status_cotacao, p_id_funcionario);
END;

CREATE OR REPLACE PROCEDURE update_cotacao(p_id_cotacao IN NUMBER, p_dt_cotacao IN DATE, p_status_cotacao IN VARCHAR2, p_id_funcionario IN NUMBER)
IS
BEGIN
  UPDATE cotacao SET dt_cotacao = p_dt_cotacao, status_cotacao = p_status_cotacao, id_funcionario = p_id_funcionario WHERE id_cotacao = p_id_cotacao;
END;

CREATE OR REPLACE PROCEDURE delete_cotacao(p_id_cotacao IN NUMBER)
IS
BEGIN
  DELETE FROM cotacao WHERE id_cotacao = p_id_cotacao;
END;

exec insert_cotacao (5050, TO_DATE('2023-08-16', 'YYYY-MM-DD'), 'Em análise', 1001);
exec update_cotacao (5050, TO_DATE('2023-10-16', 'YYYY-MM-DD'), 'Em análise', 1001);
exec delete_cotacao (5050);

    -- servico
CREATE OR REPLACE PROCEDURE insert_servico(p_carga_horaria IN VARCHAR, p_id_adquirivel IN NUMBER, p_nome_adquirivel IN VARCHAR)
IS
BEGIN
  INSERT INTO adquirivel (id_adquirivel, nome_adquirivel) VALUES (p_id_adquirivel, p_nome_adquirivel);
  INSERT INTO servico (carga_horaria, id_adquirivel) VALUES (p_carga_horaria, p_id_adquirivel);
END;

CREATE OR REPLACE PROCEDURE update_servico(p_carga_horaria IN VARCHAR2, p_id_adquirivel IN NUMBER)
IS
BEGIN
  UPDATE servico SET carga_horaria = p_carga_horaria WHERE id_adquirivel = p_id_adquirivel;
END;

CREATE OR REPLACE PROCEDURE delete_servico(p_id_adquirivel IN NUMBER)
IS
BEGIN
  DELETE FROM servico WHERE id_adquirivel = p_id_adquirivel;
END;

exec insert_servico ('40 horas', 2030, 'Serviço X');
exec update_servico ('30 horas', 2030);
exec delete_servico (2030);

    -- produto
CREATE OR REPLACE PROCEDURE insert_produto(p_tamanho_prod IN VARCHAR, p_id_adquirivel IN NUMBER, p_nome_adquirivel IN VARCHAR)
IS
BEGIN
  INSERT INTO adquirivel (id_adquirivel, nome_adquirivel) VALUES (p_id_adquirivel, p_nome_adquirivel);
  INSERT INTO produto (tamanho_prod, id_adquirivel) VALUES (p_tamanho_prod, p_id_adquirivel);
END;

CREATE OR REPLACE PROCEDURE update_produto(p_tamanho_prod IN VARCHAR2, p_id_adquirivel IN NUMBER)
IS
BEGIN
  UPDATE produto SET tamanho_prod = p_tamanho_prod WHERE id_adquirivel = p_id_adquirivel;
END;

CREATE OR REPLACE PROCEDURE delete_produto(p_id_adquirivel IN NUMBER)
IS
BEGIN
  DELETE FROM produto WHERE id_adquirivel = p_id_adquirivel;
END;

exec insert_produto ('30 metros', 2035, 'Produto X');
exec update_produto ('10 metros', 2035);
exec delete_produto (2030);

    -- fornecedor
CREATE OR REPLACE PROCEDURE insert_fornecedor (p_dt_entrada IN DATE, p_email_forn IN VARCHAR, p_cnpj IN CHAR, p_id_pessoa IN NUMBER, p_nome_pessoa IN VARCHAR)
IS
BEGIN
    INSERT INTO pessoa VALUES (p_id_pessoa, p_nome_pessoa);
    INSERT INTO pj VALUES (p_cnpj, p_id_pessoa);
    INSERT INTO fornecedor VALUES (p_dt_entrada, p_email_forn, p_id_pessoa);
END;

CREATE OR REPLACE PROCEDURE update_fornecedor(p_dt_entrada IN DATE, p_email_forn IN VARCHAR, p_id_pj IN NUMBER)
IS
BEGIN
  UPDATE fornecedor SET dt_entrada = p_dt_entrada, email_forn = p_email_forn WHERE id_pj = p_id_pj;
END;

CREATE OR REPLACE PROCEDURE delete_fornecedor(p_id_pj IN NUMBER)
IS
BEGIN
  DELETE FROM fornecedor WHERE id_pj = p_id_pj;
END;

exec insert_fornecedor (TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'fornecedorA@email.com', '17465398727364', 1112, 'Fornecedor Y');
exec update_fornecedor (TO_DATE('2023-08-25', 'YYYY-MM-DD'), 'fornecedorA@email.com', 1112);
exec delete_fornecedor (1112);

    -- cotacao_contem_solicitacao
CREATE OR REPLACE PROCEDURE insert_cotacao_contem_solicitacao(p_id_cotacao IN NUMBER, p_id_solicitacao IN NUMBER)
IS
BEGIN
  INSERT INTO cotacao_contem_solicitacao (id_cotacao, id_solicitacao) VALUES (p_id_cotacao, p_id_solicitacao);
END;

CREATE OR REPLACE PROCEDURE update_cotacao_contem_solicitacao(p_id_cotacao IN NUMBER, p_id_solicitacao IN NUMBER)
IS
BEGIN
  UPDATE cotacao_contem_solicitacao SET id_solicitacao = p_id_solicitacao WHERE id_cotacao = p_id_cotacao;
END;

CREATE OR REPLACE PROCEDURE delete_cotacao_contem_solicitacao(p_id_cotacao IN NUMBER, p_id_solicitacao IN NUMBER)
IS
BEGIN
  DELETE FROM cotacao_contem_solicitacao WHERE id_cotacao = p_id_cotacao AND id_solicitacao = p_id_solicitacao;
END;

    -- fornecedor_realiza_cotacao
CREATE OR REPLACE PROCEDURE insert_fornecedor_realiza_cotacao(p_id_fornecedor IN NUMBER, p_id_cotacao IN NUMBER)
IS
BEGIN
  INSERT INTO fornecedor_realiza_cotacao (id_fornecedor, id_cotacao) VALUES (p_id_fornecedor, p_id_cotacao);
END;

CREATE OR REPLACE PROCEDURE update_fornecedor_realiza_cotacao(p_id_fornecedor IN NUMBER, p_id_cotacao IN NUMBER)
IS
BEGIN
  UPDATE fornecedor_realiza_cotacao SET id_cotacao = p_id_cotacao WHERE id_fornecedor = p_id_fornecedor;
END;

CREATE OR REPLACE PROCEDURE delete_fornecedor_realiza_cotacao(p_id_fornecedor IN NUMBER, p_id_cotacao IN NUMBER)
IS
BEGIN
  DELETE FROM fornecedor_realiza_cotacao WHERE id_fornecedor = p_id_fornecedor AND id_cotacao = p_id_cotacao;
END;


--Ex 4
DECLARE
BEGIN
    FOR v_record IN (SELECT f.cpf_pf, f.email_pf, e.cep
                     FROM funcionario f
                     JOIN empresa e ON f.id_empresa = e.id_pessoa)
    LOOP
        DBMS_OUTPUT.PUT_LINE('CPF: ' || v_record.cpf_pf || ', Email: ' || v_record.email_pf || ', CEP Empresa: ' || v_record.cep);
    END LOOP;
END;


--Ex 5
CREATE OR REPLACE PROCEDURE relatorio_fornecedores IS
BEGIN
    FOR rec IN (SELECT f.email_forn, COUNT(c.id_cotacao) AS num_cotacoes
                FROM fornecedor f
                INNER JOIN fornecedor_realiza_cotacao fc ON f.id_pj = fc.id_fornecedor
                INNER JOIN cotacao c ON fc.id_cotacao = c.id_cotacao
                GROUP BY f.email_forn
                ORDER BY num_cotacoes DESC)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Fornecedor: ' || rec.email_forn || ', Número de Cotações: ' || rec.num_cotacoes);
    END LOOP;
END;

EXEC relatorio_fornecedores();
