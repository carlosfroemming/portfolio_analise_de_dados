CREATE DATABASE energia_renovavel2;

CREATE TABLE geracao_distribuida (
    SigAgente VARCHAR(50) NOT NULL,
	DscClasseConsumo VARCHAR(50) NOT NULL,
	DscSubGrupoTarifario VARCHAR(3) NOT NULL,
	municipiouf VARCHAR(50) NOT NULL,
	SigTipoConsumidor CHAR(2) NOT NULL,
	DthAtualizaCadastralEmpreend DATE NOT NULL,
	SigModalidadeEmpreendimento	CHAR(1) NOT NULL,
	DscModalidadeHabilitado	VARCHAR(100) NOT NULL,
	QtdUCRecebeCredito INT NOT NULL,
	SigTipoGeracao CHAR(3) NOT NULL,
	DscFonteGeracao VARCHAR(50) NOT NULL,
	DscPorte VARCHAR(20) NOT NULL,
	MdaPotenciaInstaladaKW NUMERIC (10,2) NOT NULL
);


--No psql com: 

--psql -U carlos -d energia_renovavel2

--\copy geracao_distribuida FROM 'C:\\Users\\Carlos\\Desktop\\energia_distribuida_brasil_format2.csv' DELIMITER ',' CSV HEADER;


ALTER TABLE geracao_distribuida
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM geracao_distribuida;

---------------------------------------------------------------------------------------------------------------------

-- TABELA AGENTE:

CREATE TABLE agente(sigla VARCHAR(50) NOT NULL);

INSERT INTO agente (sigla)
SELECT sigagente
FROM geracao_distribuida;

DELETE FROM agente
WHERE ctid NOT IN (
    SELECT min(ctid)
    FROM agente
    GROUP BY sigla
);

ALTER TABLE agente
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM agente;

-----------------------------------------------------------------------------------------------------------------------

-- TABELA CLASSE_CONSUMO:

CREATE TABLE classe_consumo(descricao VARCHAR(50) NOT NULL);

INSERT INTO classe_consumo (descricao)
SELECT dscclasseconsumo
FROM geracao_distribuida;

DELETE FROM classe_consumo
WHERE ctid NOT IN (
    SELECT min(ctid)
    FROM classe_consumo
    GROUP BY descricao
);

ALTER TABLE classe_consumo
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM classe_consumo;

------------------------------------------------------------------------------------------------------------------------

-- TABELA SUB_GRUPO_TARIFARIO:

CREATE TABLE sub_grupo_tarifario(
	sigla VARCHAR(3) NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

INSERT INTO sub_grupo_tarifario (sigla, descricao) VALUES ('A1', 'Tensão de fornecimento igual ou superior a 230 kV');
INSERT INTO sub_grupo_tarifario (sigla, descricao) VALUES ('A2', 'Tensão de fornecimento de 88 kV a 138 kV');
INSERT INTO sub_grupo_tarifario (sigla, descricao) VALUES ('A3', 'Tensão de fornecimento de 69 kV');
INSERT INTO sub_grupo_tarifario (sigla, descricao) VALUES ('A3a', 'Tensão de fornecimento de 30 kV a 44 kV');
INSERT INTO sub_grupo_tarifario (sigla, descricao) VALUES ('A4', 'Tensão de fornecimento de 2,3 kV a 25 kV');
INSERT INTO sub_grupo_tarifario (sigla, descricao) VALUES ('AS', 'Subterrâneo');
INSERT INTO sub_grupo_tarifario (sigla, descricao) VALUES ('B1', 'Residencial');
INSERT INTO sub_grupo_tarifario (sigla, descricao) VALUES ('B2', 'Rural');
INSERT INTO sub_grupo_tarifario (sigla, descricao) VALUES ('B3', 'Demais classes');
INSERT INTO sub_grupo_tarifario (sigla, descricao) VALUES ('B4', 'Iluminação pública');

ALTER TABLE sub_grupo_tarifario
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM sub_grupo_tarifario;

---------------------------------------------------------------------------------------------------------------------

-- TABELA MUNICIPIO:

CREATE TABLE municipio(
    Municipio VARCHAR(50) NOT NULL,
    Populacao NUMERIC (20) NOT NULL,
    Domicilios NUMERIC (20) NOT NULL,
    UF CHAR(2) NOT NULL,
    Regiao VARCHAR(20) NOT NULL
);

--No psql com: 

--psql -U carlos -d energia_renovavel2

--\copy municipio FROM 'C:\\Users\\Carlos\\Desktop\\municipios_brasil_format2.csv' DELIMITER ',' CSV HEADER;

ALTER TABLE municipio
RENAME COLUMN municipio TO nome;

ALTER TABLE municipio
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM municipio;

---------------------------------------------------------------------------------------------------------------------

-- TABELA ESTADO:

CREATE TABLE estado(
    sigla CHAR(2) NOT NULL,
    nome VARCHAR(50) NOT NULL
);

INSERT INTO estado (sigla, nome) VALUES
    ('AC', 'Acre'),
    ('AL', 'Alagoas'),
    ('AP', 'Amapá'),
    ('AM', 'Amazonas'),
    ('BA', 'Bahia'),
    ('CE', 'Ceará'),
    ('DF', 'Distrito Federal'),
    ('ES', 'Espírito Santo'),
    ('GO', 'Goiás'),
    ('MA', 'Maranhão'),
    ('MT', 'Mato Grosso'),
    ('MS', 'Mato Grosso do Sul'),
    ('MG', 'Minas Gerais'),
    ('PA', 'Pará'),
    ('PB', 'Paraíba'),
    ('PR', 'Paraná'),
    ('PE', 'Pernambuco'),
    ('PI', 'Piauí'),
    ('RJ', 'Rio de Janeiro'),
    ('RN', 'Rio Grande do Norte'),
    ('RS', 'Rio Grande do Sul'),
    ('RO', 'Rondônia'),
    ('RR', 'Roraima'),
    ('SC', 'Santa Catarina'),
    ('SP', 'São Paulo'),
    ('SE', 'Sergipe'),
    ('TO', 'Tocantins');

ALTER TABLE estado
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM estado;

---------------------------------------------------------------------------------------------------------------------

-- TABELA REGIAO:

CREATE TABLE regiao(nome VARCHAR(20) NOT NULL);

INSERT INTO regiao (nome) VALUES
    ('Norte'),
    ('Nordeste'),
    ('Centro Oeste'),
    ('Sudeste'),
    ('Sul');

ALTER TABLE regiao
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM regiao;

---------------------------------------------------------------------------------------------------------------------

-- TABELA TIPO_CONSUMIDOR:

CREATE TABLE tipo_consumidor (
	sigla CHAR(2) NOT NULL,
    descricao VARCHAR(50) NOT NULL
);

INSERT INTO tipo_consumidor (sigla, descricao) VALUES ('PJ', 'Pessoa Jurídica');
INSERT INTO tipo_consumidor (sigla, descricao) VALUES ('PF', 'Pessoa Física');

ALTER TABLE tipo_consumidor
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM tipo_consumidor;

---------------------------------------------------------------------------------------------------------------------

-- TABELA MODALIDADE:

CREATE TABLE modalidade(
    sigla CHAR(1) NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

INSERT INTO modalidade (sigla, descricao) VALUES ('P', 'Com Microgeracao ou Minigeracao distribuida');
INSERT INTO modalidade (sigla, descricao) VALUES ('R', 'Caracterizada como Autoconsumo remoto');
INSERT INTO modalidade (sigla, descricao) VALUES ('C', 'Caracterizada como Geracao compartilhada');
INSERT INTO modalidade (sigla, descricao) VALUES ('M', 'Integrante de empreendimento de Multiplas UC');

ALTER TABLE modalidade
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM modalidade;

---------------------------------------------------------------------------------------------------------------------

-- TABELA TIPO_GERACAO:

CREATE TABLE tipo_geracao (
	sigla CHAR(3) NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

INSERT INTO tipo_geracao (sigla, descricao) VALUES ('UTN', 'Usina Termonuclear');
INSERT INTO tipo_geracao (sigla, descricao) VALUES ('UTE', 'Usina Termelétrica');
INSERT INTO tipo_geracao (sigla, descricao) VALUES ('UHE', 'Usina Hidrelétrica');
INSERT INTO tipo_geracao (sigla, descricao) VALUES ('UFV', 'Central Geradora Solar Fotovoltaica');
INSERT INTO tipo_geracao (sigla, descricao) VALUES ('PCH', 'Pequena Central Hidrelétrica');
INSERT INTO tipo_geracao (sigla, descricao) VALUES ('EOL', 'Central Geradora Eólica');
INSERT INTO tipo_geracao (sigla, descricao) VALUES ('CGU', 'Central Geradora Undi-elétrica');
INSERT INTO tipo_geracao (sigla, descricao) VALUES ('CGH', 'Central Geradora Hidrelétrica');

ALTER TABLE tipo_geracao
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM tipo_geracao;

-----------------------------------------------------------------------------------------------------------------------

-- TABELA FONTE_GERACAO:

CREATE TABLE fonte_geracao(descricao VARCHAR(50) NOT NULL);

INSERT INTO fonte_geracao (descricao)
SELECT dscfontegeracao
FROM geracao_distribuida;

DELETE FROM fonte_geracao
WHERE ctid NOT IN (
    SELECT min(ctid)
    FROM fonte_geracao
    GROUP BY descricao
);

ALTER TABLE fonte_geracao
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM fonte_geracao;

-----------------------------------------------------------------------------------------------------------------------

-- TABELA PORTE:

CREATE TABLE porte(descricao VARCHAR(20) NOT NULL);

INSERT INTO porte (descricao)
SELECT dscporte
FROM geracao_distribuida;

DELETE FROM porte
WHERE ctid NOT IN (
    SELECT min(ctid)
    FROM porte
    GROUP BY descricao
);

ALTER TABLE porte
ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM porte;

---------------------------------------------------------------------------------------------------------------------


--ADIÇÃO DAS CHAVES ESTRANGEIRAS E OTIMIZAÇÃO DA TABELA GERACAO_DISTRIBUIDA

--id_agente

ALTER TABLE geracao_distribuida
ADD COLUMN id_agente INT;

UPDATE geracao_distribuida
SET id_agente = agente.id
FROM agente
WHERE geracao_distribuida.sigagente = agente.sigla;

ALTER TABLE geracao_distribuida
ADD CONSTRAINT fk_id_agente
FOREIGN KEY (id_agente)
REFERENCES agente (id)
ON DELETE CASCADE;

ALTER TABLE geracao_distribuida
ALTER COLUMN id_agente SET NOT NULL;

ALTER TABLE geracao_distribuida
DROP COLUMN sigagente;

--id_classe_consumo

ALTER TABLE geracao_distribuida
ADD COLUMN id_classe_consumo INT;

UPDATE geracao_distribuida
SET id_classe_consumo = classe_consumo.id
FROM classe_consumo
WHERE geracao_distribuida.dscclasseconsumo = classe_consumo.descricao;

ALTER TABLE geracao_distribuida
ADD CONSTRAINT fk_id_classe_consumo
FOREIGN KEY (id_classe_consumo)
REFERENCES classe_consumo (id)
ON DELETE CASCADE;

ALTER TABLE geracao_distribuida
ALTER COLUMN id_classe_consumo SET NOT NULL;

ALTER TABLE geracao_distribuida
DROP COLUMN dscclasseconsumo;

--id_sub_grupo_tarifario

ALTER TABLE geracao_distribuida
ADD COLUMN id_sub_grupo_tarifario INT;

UPDATE geracao_distribuida
SET id_sub_grupo_tarifario = sub_grupo_tarifario.id
FROM sub_grupo_tarifario
WHERE geracao_distribuida.dscsubgrupotarifario = sub_grupo_tarifario.sigla;

ALTER TABLE geracao_distribuida
ADD CONSTRAINT fk_id_sub_grupo_tarifario
FOREIGN KEY (id_sub_grupo_tarifario)
REFERENCES sub_grupo_tarifario (id)
ON DELETE CASCADE;

ALTER TABLE geracao_distribuida
ALTER COLUMN id_sub_grupo_tarifario SET NOT NULL;

ALTER TABLE geracao_distribuida
DROP COLUMN dscsubgrupotarifario;

--id_municipio

ALTER TABLE geracao_distribuida
ADD COLUMN id_municipio INT;

UPDATE geracao_distribuida
SET id_municipio = municipio.id
FROM municipio
WHERE geracao_distribuida.municipiouf = municipio.nome;

ALTER TABLE geracao_distribuida
ADD CONSTRAINT fk_id_municipio
FOREIGN KEY (id_municipio)
REFERENCES municipio (id)
ON DELETE CASCADE;

ALTER TABLE geracao_distribuida
ALTER COLUMN id_municipio SET NOT NULL;

ALTER TABLE geracao_distribuida
DROP COLUMN municipiouf;

--id_tipo_consumidor

ALTER TABLE geracao_distribuida
ADD COLUMN id_tipo_consumidor INT;

UPDATE geracao_distribuida
SET id_tipo_consumidor = tipo_consumidor.id
FROM tipo_consumidor
WHERE geracao_distribuida.sigtipoconsumidor = tipo_consumidor.sigla;

ALTER TABLE geracao_distribuida
ADD CONSTRAINT fk_id_tipo_consumidor
FOREIGN KEY (id_tipo_consumidor)
REFERENCES tipo_consumidor (id)
ON DELETE CASCADE;

ALTER TABLE geracao_distribuida
ALTER COLUMN id_tipo_consumidor SET NOT NULL;

ALTER TABLE geracao_distribuida
DROP COLUMN sigtipoconsumidor;

--id_modalidade

ALTER TABLE geracao_distribuida
ADD COLUMN id_modalidade INT;

UPDATE geracao_distribuida
SET id_modalidade = modalidade.id
FROM modalidade
WHERE geracao_distribuida.sigmodalidadeempreendimento = modalidade.sigla;

ALTER TABLE geracao_distribuida
ADD CONSTRAINT fk_id_modalidade
FOREIGN KEY (id_modalidade)
REFERENCES modalidade (id)
ON DELETE CASCADE;

ALTER TABLE geracao_distribuida
ALTER COLUMN id_modalidade SET NOT NULL;

ALTER TABLE geracao_distribuida
DROP COLUMN sigmodalidadeempreendimento;

ALTER TABLE geracao_distribuida
DROP COLUMN dscmodalidadehabilitado;

--id_tipo_geracao

ALTER TABLE geracao_distribuida
ADD COLUMN id_tipo_geracao INT;

UPDATE geracao_distribuida
SET id_tipo_geracao = tipo_geracao.id
FROM tipo_geracao
WHERE geracao_distribuida.sigtipogeracao = tipo_geracao.sigla;

ALTER TABLE geracao_distribuida
ADD CONSTRAINT fk_id_tipo_geracao
FOREIGN KEY (id_tipo_geracao)
REFERENCES tipo_geracao (id)
ON DELETE CASCADE;

ALTER TABLE geracao_distribuida
ALTER COLUMN id_tipo_geracao SET NOT NULL;

ALTER TABLE geracao_distribuida
DROP COLUMN sigtipogeracao;

--id_fonte_geracao

ALTER TABLE geracao_distribuida
ADD COLUMN id_fonte_geracao INT;

UPDATE geracao_distribuida
SET id_fonte_geracao = fonte_geracao.id
FROM fonte_geracao
WHERE geracao_distribuida.dscfontegeracao = fonte_geracao.descricao;

ALTER TABLE geracao_distribuida
ADD CONSTRAINT fk_id_fonte_geracao
FOREIGN KEY (id_fonte_geracao)
REFERENCES fonte_geracao (id)
ON DELETE CASCADE;

ALTER TABLE geracao_distribuida
ALTER COLUMN id_fonte_geracao SET NOT NULL;

ALTER TABLE geracao_distribuida
DROP COLUMN dscfontegeracao;

--id_porte

ALTER TABLE geracao_distribuida
ADD COLUMN id_porte INT;

UPDATE geracao_distribuida
SET id_porte = porte.id
FROM porte
WHERE geracao_distribuida.dscporte = porte.descricao;

ALTER TABLE geracao_distribuida
ADD CONSTRAINT fk_id_porte
FOREIGN KEY (id_porte)
REFERENCES porte (id)
ON DELETE CASCADE;

ALTER TABLE geracao_distribuida
ALTER COLUMN id_porte SET NOT NULL;

ALTER TABLE geracao_distribuida
DROP COLUMN dscporte;

----------------------------------------------------------------------------------------------------------------------

--ADIÇÃO DAS CHAVES ESTRANGEIRAS E OTIMIZAÇÃO DA TABELA MUNICIPIO

--id_estado

ALTER TABLE municipio
ADD COLUMN id_estado INT;

UPDATE municipio
SET id_estado = estado.id
FROM estado
WHERE municipio.uf = estado.sigla;

ALTER TABLE municipio
ADD CONSTRAINT fk_id_estado
FOREIGN KEY (id_estado)
REFERENCES estado (id)
ON DELETE CASCADE;

ALTER TABLE municipio
ALTER COLUMN id_estado SET NOT NULL;

ALTER TABLE municipio
DROP COLUMN uf;

--id_regiao

ALTER TABLE municipio
ADD COLUMN id_regiao INT;

UPDATE municipio
SET id_regiao = regiao.id
FROM regiao
WHERE municipio.regiao = regiao.nome;

ALTER TABLE municipio
ADD CONSTRAINT fk_id_regiao
FOREIGN KEY (id_regiao)
REFERENCES regiao (id)
ON DELETE CASCADE;

ALTER TABLE municipio
ALTER COLUMN id_regiao SET NOT NULL;

ALTER TABLE municipio
DROP COLUMN regiao;

----------------------------------------------------------------------------------------------------------------------

-- PARA CONFERIR A FK

SELECT
    conname AS constraint_name,
    conrelid::regclass AS table_name,
    a.attname AS column_name,
    confrelid::regclass AS foreign_table_name,
    af.attname AS foreign_column_name
FROM
    pg_constraint AS c
JOIN
    pg_attribute AS a ON a.attnum = ANY(c.conkey) AND a.attrelid = c.conrelid
JOIN
    pg_attribute AS af ON af.attnum = ANY(c.confkey) AND af.attrelid = c.confrelid
WHERE
    c.contype = 'f'
    AND conrelid::regclass::text = 'municipio'
    AND confrelid::regclass::text = 'estado';