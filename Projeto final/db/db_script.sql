/*
  Drops
*/

drop table t_etapa;
drop table t_sessao;
drop table t_pessoa;
drop table t_espaco;

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

CREATE DOMAIN DM_ETAPA AS CHAR(1);

/*
  Tables
*/

Create table t_empresa (
bd_id_emp integer,
bd_nome_fantasia_emp dm_nome,
bd_razao_social_emp dm_nome,
bd_cnpj_emp char(18), -- 00.000.000/0000-00
bd_inscricao_estadual_emp varchar(30),
bd_inscricao_municipal_emp varchar(30),
bd_telefone_emp char(15), -- (00) 90000-0000
bd_email_emp dm_email,
bd_cep_emp char(9),
bd_uf_emp char(2),
bd_cidade_emp varchar(100),
bd_bairro_emp dm_nome,
bd_logradouro_emp dm_nome,
bd_site_emp varchar(100),
bd_fundacao_emp date,
bd_tipo_emp varchar(50), -- Ex: MEI, LTDA
bd_status_emp boolean,
constraint pk_empresa primary key(bd_id_emp)
);

Create table t_pessoa (
bd_id_pes integer,
bd_nome_pes dm_nome, 
bd_email_pes dm_email,
bd_cpf_pes dm_cpf,
bd_id_emp integer,
constraint pk_pessoa primary key (bd_id_pes),
constraint fk_pessoa_empresa foreign key(bd_id_emp) references t_empresa(bd_id_emp)
);

Create table t_evento (
bd_id_evento integer,
bd_nome_evento dm_nome, -- Palestra sobre IA com Stuart Little
bd_data_inicio date,
bd_data_fim date,
constraint pk_evento primary key (bd_id_evento)
);

Create table t_local (
bd_id_loc integer,
bd_nome_loc dm_nome,
bd_capacidade_max_loc dm_capacidade,
bd_capacidade_atual_loc dm_capacidade,
bd_tipo_loc dm_nome,
constraint pk_espaco primary key (bd_id_esp)
);

Create table t_sessao(
bd_id_ses integer,
bd_id_pes integer not null,
bd_id_esp integer not null,
bd_id_evento integer not null,
bd_etapa_ses dm_etapa,    -- Ex: Primeira etapa/etapa 1, Primeiro intervalo/intervalo 1
bd_inicio_ses timestamp,
bd_fim_ses timestamp,
constraint pk_sessao primary key(bd_id_ses),
constraint fk_sessao_pessoa foreign key(bd_id_pes) references t_pessoa(bd_id_pes),
constraint fk_sessao_espaco foreign key(bd_id_esp) references t_espaco(bd_id_esp),
constraint fk_sessao_evento foreign key(bd_id_esp) references t_evento(bd_id_eve)
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
