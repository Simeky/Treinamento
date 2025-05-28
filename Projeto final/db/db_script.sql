/*
  Drops
*/

drop table t_etapa;
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

CREATE DOMAIN DM_NOME AS VARCHAR(100)
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

Create table t_pessoa (
bd_id_pes integer,
bd_nome_pes dm_nome, 
bd_email_pes dm_email,
bd_cpf_pes dm_cpf,
constraint pk_pessoa primary key (bd_id_pes)
);

Create table t_espaco (
bd_id_esp integer,
bd_nome_esp dm_nome,
bd_capacidade_max_esp dm_capacidade,
bd_capacidade_atual_esp dm_capacidade,
bd_tipo_esp dm_nome,
constraint pk_espaco primary key (bd_id_esp)
);

Create table t_etapa(
bd_id_pes integer,
bd_id_esp integer,
bd_etapa dm_etapa, 
constraint pks_etapa primary key(bd_id_pes, bd_id_esp),
constraint fk1_etapa_pessoa foreign key(bd_id_pes) references t_pessoa(bd_id_pes),
constraint fk2_etapa_pessoa foreign key(bd_id_esp) references t_espaco(bd_id_esp)
);

/*
  Triggers
*/

CREATE trigger t_espaco_bi_autoin for t_espaco
active before insert position 0
AS
begin
  if (coalesce(new.bd_id_esp, 0) <= 0) then
    select coalesce(max(bd_id_esp), 0) + 1 from t_espaco
    into new.bd_id_esp;
end

CREATE trigger t_pessoa_bi_autoin for t_pessoa
active before insert position 0
AS
begin
  if (coalesce(new.bd_id_pes, 0) <= 0) then
    select coalesce(max(bd_id_pes), 0) + 1 from t_pessoa
    into new.bd_id_pes;
end

