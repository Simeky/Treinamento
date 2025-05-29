/*
  Drops
*/

drop table t_sessao;
drop table t_evento;
drop table t_pessoa;
drop table t_local;
drop table t_empresa;

drop domain dm_nome;
drop domain dm_email;
drop domain dm_cpf;
drop domain dm_capacidade;
drop domain dm_etapa;

/*
    Domains
*/

CREATE DOMAIN DM_NOME AS VARCHAR(1055)
CHARACTER SET WIN1252
COLLATE WIN_PTBR;

CREATE DOMAIN DM_EMAIL AS VARCHAR(90)
CHARACTER SET WIN1252
COLLATE WIN_PTBR;

CREATE DOMAIN DM_CPF AS CHAR(14);

CREATE DOMAIN DM_CAPACIDADE AS INTEGER;

CREATE DOMAIN DM_ETAPA AS VARCHAR(60)
CHARACTER SET WIN1252
COLLATE WIN_PTBR;

CREATE DOMAIN DM_DATETIME AS TIMESTAMP;

CREATE DOMAIN DM_BOOLEAN AS
INTEGER;

CREATE DOMAIN DM_INSCRICAO AS VARCHAR(30)
CHARACTER SET WIN1252
COLLATE WIN_PTBR;

CREATE DOMAIN DM_CNPJ AS CHAR(18);

CREATE DOMAIN DM_TELEFONE AS CHAR(15);

CREATE DOMAIN DM_CEP AS CHAR(9);

CREATE DOMAIN DM_UF AS CHAR(2);

CREATE DOMAIN DM_DATA AS DATE;

CREATE DOMAIN DM_TIPO AS VARCHAR(50)
CHARACTER SET WIN1252
COLLATE WIN_PTBR;

CREATE DOMAIN DM_NUM_ENDERECO AS VARCHAR(133);

/*
  Tables
*/

Create table t_empresa (
bd_id_emp integer,
bd_nome_fantasia_emp dm_nome,
bd_razao_social_emp dm_nome not null,
bd_cnpj_emp dm_cnpj not null, -- 00.000.000/0000-00
bd_inscricao_estadual_emp dm_inscricao,
bd_inscricao_municipal_emp dm_inscricao,
bd_telefone_emp dm_telefone, -- (00) 90000-0000
bd_email_emp dm_email not null,
bd_cep_emp dm_cep not null, -- 00000-000
bd_uf_emp dm_uf,
bd_cidade_emp dm_nome,
bd_bairro_emp dm_nome,
bd_logradouro_emp dm_nome,
bd_numero_emp dm_num_endereco,
bd_complemento_emp dm_nome,
bd_site_emp dm_nome,
bd_fundacao_emp dm_data,
bd_tipo_emp varchar(50), -- Ex: MEI, LTDA
bd_matriz_emp dm_boolean not null, -- 1 = true, 2 = false
bd_ativa_emp dm_boolean not null,
constraint pk_empresa primary key(bd_id_emp)
);

Create table t_pessoa (
bd_id_pes integer,
bd_nome_pes dm_nome, 
bd_email_pes dm_email not null,
bd_cpf_pes dm_cpf not null,
bd_id_emp integer,
constraint pk_pessoa primary key (bd_id_pes),
constraint fk_pessoa_empresa foreign key(bd_id_emp) references t_empresa(bd_id_emp)
);

Create table t_evento (
bd_id_eve integer,
bd_nome_eve dm_nome, -- IA no mercado
bd_desc_eve dm_nome, -- Palestra sobre ia com Stuart Little
bd_inicio_eve dm_datetime not null,  -- 'yyyy/mm/dd hh:mm:ss'
bd_fim_eve dm_datetime not null,
constraint pk_evento primary key (bd_id_eve)
);

Create table t_local (
bd_id_loc integer,
bd_nome_loc dm_nome not null, -- Sala 1
bd_capacidade_max_loc dm_capacidade not null,
bd_capacidade_atual_loc dm_capacidade,
constraint pk_local primary key (bd_id_loc)
);

Create table t_sessao(
bd_id_ses integer,
bd_id_pes integer not null,
bd_id_loc integer not null,
bd_id_eve integer not null,
bd_etapa_ses dm_etapa,    -- Ex: Primeira etapa/etapa 1, Primeiro intervalo/intervalo 1
bd_inicio_ses dm_datetime not null,
bd_fim_ses dm_datetime not null,
constraint pk_sessao primary key(bd_id_ses),
constraint fk_sessao_pessoa foreign key(bd_id_pes) references t_pessoa(bd_id_pes),
constraint fk_sessao_local foreign key(bd_id_loc) references t_local(bd_id_loc),
constraint fk_sessao_evento foreign key(bd_id_eve) references t_evento(bd_id_eve)
);

/*
  Triggers
*/

CREATE trigger t_local_bi_autoin for t_local
active before insert position 0
AS
begin
  if (coalesce(new.bd_id_loc, 0) <= 0) then
    select coalesce(max(bd_id_loc), 0) + 1 from t_local
    into new.bd_id_loc;
end

CREATE trigger t_pessoa_bi_autoin for t_pessoa
active before insert position 0
AS
begin
  if (coalesce(new.bd_id_pes, 0) <= 0) then
    select coalesce(max(bd_id_pes), 0) + 1 from t_pessoa
    into new.bd_id_pes;
end

CREATE trigger t_empresa_bi_autoin for t_empresa
active before insert position 0
AS
begin
  if (coalesce(new.bd_id_emp, 0) <= 0) then
    select coalesce(max(bd_id_emp), 0) + 1 from t_empresa
    into new.bd_id_emp;
end

CREATE trigger t_evento_bi_autoin for t_evento
active before insert position 0
AS
begin
  if (coalesce(new.bd_id_eve, 0) <= 0) then
    select coalesce(max(bd_id_eve), 0) + 1 from t_evento
    into new.bd_id_eve;
end

CREATE trigger t_sessao_bi_autoin for t_sessao
active before insert position 0
AS
begin
  if (coalesce(new.bd_id_ses, 0) <= 0) then
    select coalesce(max(bd_id_ses), 0) + 1 from t_sessao
    into new.bd_id_ses;
end






