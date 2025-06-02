unit uConsultaPessoaLocalMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMDI, StdCtrls, uEdit_numerico, DB, ImgList,
  Grids, DBGrids, ComCtrls, ToolWin, DBClient;

type
  TfrConsultaPessoaLocalMDI = class(TfrConsultaPadraoMDI)
    ed_id_consulta: TEdit_numerico;
    procedure tbt_confirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaPessoaLocalMDI: TfrConsultaPessoaLocalMDI;

implementation

uses udmTreinamento;

{$R *.dfm}

{ TfrConsultaPessoaLocalMDI }

function TfrConsultaPessoaLocalMDI.setChave: String;
begin
  Result := 'bd_id_loc';
end;

function TfrConsultaPessoaLocalMDI.setTabela: TClientDataSet;
begin
  Result := dmTreinamento.cds_pessoa_local;
end;

procedure TfrConsultaPessoaLocalMDI.tbt_confirmarClick(Sender: TObject);
begin
  inherited;
  if not dmTreinamento.SQLConnection.Connected then
    dmTreinamento.SQLConnection.Connected := True;

  if dmTreinamento.cds_local.Active then
    dmTreinamento.cds_local.Close;

  dmTreinamento.cds_pessoa_local.Close;
  dmTreinamento.qSelect.SQL.Clear;

  dmTreinamento.qSelect.SQL.Add(
  'Select ' +
    'loc.bd_id_loc, ' +
    'loc.bd_nome_loc, ' +
    'eve.bd_nome_eve, ' +
    'ses.bd_etapa_ses, ' +
    'ses.bd_inicio_ses, ' +
    'ses.bd_fim_ses, ' +
    'pes.bd_nome_pes, ' +
    'pes.bd_cpf_pes ' +
  'From t_sessao ses ' +
  'Join t_pessoa pes on ses.bd_id_pes = pes.bd_id_pes ' +
  'Join t_local loc on ses.bd_id_loc = loc.bd_id_loc ' +
  'Join t_evento eve on ses.bd_id_eve = eve.bd_id_eve ' +
  'Where loc.bd_id_loc = :bd_id_loc;');

  dmTreinamento.qSelect.ParamByName('bd_id_loc').AsInteger := ed_id_consulta.id;
  dmTreinamento.cds_pessoa_local.Open;
  ds_consulta.DataSet := dmTreinamento.cds_pessoa_local;

  if dmTreinamento.cds_pessoa_local.IsEmpty then
    ShowMessage('O código informado não foi cadastrado ou não existe!');
end;

end.
