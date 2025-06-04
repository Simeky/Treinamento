/*
  Drops
*/

drop table t_sessao;
drop table t_evento;
drop table t_pessoa;
drop table t_local;
drop table t_empresa;

drop domain dm_boolean;
drop domain dm_capacidade;
drop domain dm_cep;
drop domain dm_cnpj;
drop domain dm_cpf;
drop domain dm_data;
drop domain dm_datetime;
drop domain dm_email;
drop domain dm_etapa;
drop domain dm_inscricao;
drop domain dm_nome;
drop domain dm_num_endereco;
drop domain dm_telefone;
drop domain dm_tipo;
drop domain dm_uf;

drop trigger t_empresa_bi_autoin;
drop trigger t_evento_bi_autoin;
drop trigger t_local_bi_autoin;
drop trigger t_pessoa_bi_autoin;
drop trigger t_sessao_bi_autoin;
drop trigger t_local_ai_capacidade_atual;
drop trigger t_sessao_ai_update_capacidade;
drop trigger t_sessao_bi_ex_capacidade;
drop trigger t_empresa_bd_pessoa;
drop trigger t_evento_bd_sessao;
drop trigger t_local_bd_sessao;
drop trigger t_pessoa_bd_sessao;
drop trigger t_sessao_ad_capacidade_atual;
drop trigger t_sessao_au_capacidade_atual;

drop exception ex_lotacao_excedida;

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
bd_razao_social_emp dm_nome,
bd_cnpj_emp dm_cnpj, -- 00.000.000/0000-00
bd_inscricao_estadual_emp dm_inscricao,
bd_inscricao_municipal_emp dm_inscricao,
bd_telefone_emp dm_telefone, -- (00) 90000-0000
bd_email_emp dm_email,
bd_cep_emp dm_cep, -- 00000-000
bd_uf_emp dm_uf,
bd_cidade_emp dm_nome,
bd_bairro_emp dm_nome,
bd_logradouro_emp dm_nome,
bd_numero_emp dm_num_endereco,
bd_complemento_emp dm_nome,
bd_site_emp dm_nome,
bd_fundacao_emp dm_data,
bd_tipo_emp varchar(50), -- Ex: MEI, LTDA
bd_matriz_emp dm_boolean, -- 1 = true, 2 = false
bd_ativa_emp dm_boolean,
constraint pk_t_empresa primary key(bd_id_emp)
);

Create table t_pessoa (
bd_id_pes integer,
bd_nome_pes dm_nome, 
bd_email_pes dm_email,
bd_cpf_pes dm_cpf,
bd_id_emp integer,
constraint pk_t_pessoa primary key (bd_id_pes),
constraint fk_pessoa_empresa foreign key(bd_id_emp) references t_empresa(bd_id_emp)
);

Create table t_evento (
bd_id_eve integer,
bd_nome_eve dm_nome, -- IA no mercado
bd_desc_eve dm_nome, -- Palestra sobre ia com Stuart Little
bd_inicio_eve dm_datetime,  -- 'yyyy/mm/dd hh:mm:ss'
bd_fim_eve dm_datetime,
constraint pk_t_evento primary key (bd_id_eve)
);

Create table t_local (
bd_id_loc integer,
bd_nome_loc dm_nome, -- Sala 1
bd_capacidade_max_loc dm_capacidade,
bd_capacidade_atual_loc dm_capacidade,
constraint pk_t_local primary key (bd_id_loc)
);

Create table t_sessao(
bd_id_ses integer,
bd_id_pes integer,
bd_id_loc integer,
bd_id_eve integer,
bd_etapa_ses dm_etapa,    -- Ex: Primeira etapa/etapa 1, Primeiro intervalo/intervalo 1
bd_inicio_ses dm_datetime,
bd_fim_ses dm_datetime,
constraint pk_t_sessao primary key(bd_id_ses),
constraint fk_sessao_pessoa foreign key(bd_id_pes) references t_pessoa(bd_id_pes),
constraint fk_sessao_local foreign key(bd_id_loc) references t_local(bd_id_loc),
constraint fk_sessao_evento foreign key(bd_id_eve) references t_evento(bd_id_eve)
);


/*
  Exception
*/

Create exception ex_lotacao_excedida 'Capacidade Máxima do local excedida!';

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
end;

CREATE trigger t_pessoa_bi_autoin for t_pessoa
active before insert position 0
AS
begin
  if (coalesce(new.bd_id_pes, 0) <= 0) then
    select coalesce(max(bd_id_pes), 0) + 1 from t_pessoa
    into new.bd_id_pes;
end;

CREATE trigger t_empresa_bi_autoin for t_empresa
active before insert position 0
AS
begin
  if (coalesce(new.bd_id_emp, 0) <= 0) then
    select coalesce(max(bd_id_emp), 0) + 1 from t_empresa
    into new.bd_id_emp;
end;

CREATE trigger t_evento_bi_autoin for t_evento
active before insert position 0
AS
begin
  if (coalesce(new.bd_id_eve, 0) <= 0) then
    select coalesce(max(bd_id_eve), 0) + 1 from t_evento
    into new.bd_id_eve;
end;

CREATE trigger t_sessao_bi_autoin for t_sessao
active before insert position 0
AS
begin
  if (coalesce(new.bd_id_ses, 0) <= 0) then
    select coalesce(max(bd_id_ses), 0) + 1 from t_sessao
    into new.bd_id_ses;
end;

CREATE trigger t_local_ai_capacidade_atual for t_local
active after insert position 0
AS
begin
  update t_local set bd_capacidade_atual_loc = 0 where bd_id_loc = new.bd_id_loc;
end;

CREATE trigger t_sessao_bi_ex_capacidade for t_sessao
active before insert position 0
AS
DECLARE VARIABLE w_max INTEGER;
DECLARE VARIABLE w_atual INTEGER;
BEGIN
  SELECT
    bd_capacidade_max_loc,
    bd_capacidade_atual_loc
  FROM t_local
  WHERE bd_id_loc = NEW.bd_id_loc
  INTO :w_max, :w_atual;

  IF (:w_atual >= :w_max) THEN
    EXCEPTION ex_lotacao_excedida;
END;

CREATE trigger t_sessao_ai_update_capacidade for t_sessao
active after insert position 0
AS
begin
  if (not exists(Select 1
                 from t_sessao
                 where  bd_id_loc = new.bd_id_loc
                 and    bd_id_pes = new.bd_id_pes
                 and    bd_id_ses <> new.bd_id_ses)) then
    update t_local set bd_capacidade_atual_loc = bd_capacidade_atual_loc + 1
    where bd_id_loc = new.bd_id_loc;
end;

CREATE trigger t_empresa_bd_pessoa for t_empresa
active before delete position 0
AS
begin
  Delete from t_pessoa where bd_id_emp = old.bd_id_emp;
end;

CREATE trigger t_evento_bd_sessao for t_evento
active before delete position 0
AS
begin
  Delete from t_sessao where bd_id_eve = old.bd_id_eve;
end;

CREATE trigger t_local_bd_sessao for t_local
active before delete position 0
AS
begin
  Delete from t_sessao where bd_id_loc = old.bd_id_loc;
end;

CREATE trigger t_pessoa_bd_sessao for t_pessoa
active before delete position 0
AS
begin
  Delete from t_sessao where bd_id_pes = old.bd_id_pes;
end;

CREATE trigger t_sessao_ad_capacidade_atual for t_sessao
active after delete position 0
AS
begin
  if (exists(select 1 from t_local where bd_id_loc = old.bd_id_loc and bd_capacidade_atual_loc > 0 )) then
    update t_local set bd_capacidade_atual_loc = bd_capacidade_atual_loc - 1
    where bd_id_loc = old.bd_id_loc;
end;

CREATE trigger t_sessao_au_capacidade_atual for t_sessao
active after update position 0
AS
begin
  if (exists(select 1 from t_local where bd_id_loc = old.bd_id_loc and bd_capacidade_atual_loc > 0 )) then
    update t_local set bd_capacidade_atual_loc = bd_capacidade_atual_loc - 1
    where bd_id_loc = old.bd_id_loc;
  update t_local set bd_capacidade_atual_loc = bd_capacidade_atual_loc + 1
  where bd_id_loc = new.bd_id_loc;
end;


















