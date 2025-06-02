unit uConsultaLocalPessoaMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMDI, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient, StdCtrls, uEdit_numerico;

type
  TfrConsultaLocalPessoaMDI = class(TfrConsultaPadraoMDI)
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
  frConsultaLocalPessoaMDI: TfrConsultaLocalPessoaMDI;

implementation

uses udmTreinamento;

{$R *.dfm}

{ TfrConsultaMDI }

function TfrConsultaLocalPessoaMDI.setChave: String;
begin
  Result := 'bd_id_pes';
end;

function TfrConsultaLocalPessoaMDI.setTabela: TClientDataSet;
begin
  Result := dmTreinamento.cds_local_pessoa;
end;

procedure TfrConsultaLocalPessoaMDI.tbt_confirmarClick(Sender: TObject);
begin
  inherited;
  if not dmTreinamento.SQLConnection.Connected then
    dmTreinamento.SQLConnection.Connected := True;

  if dmTreinamento.cds_pessoa.Active then
    dmTreinamento.cds_pessoa.Close;

  dmTreinamento.cds_local_pessoa.Close;
  dmTreinamento.qSelect.SQL.Clear;

  dmTreinamento.qSelect.SQL.Add(
  'Select ' +
    'pes.bd_id_pes, ' +
    'pes.bd_nome_pes, ' +
    'pes.bd_cpf_pes, ' +
    'eve.bd_nome_eve, ' +
    'ses.bd_etapa_ses, ' +
    'loc.bd_id_loc, ' +
    'loc.bd_nome_loc, ' +
    'ses.bd_inicio_ses, ' +
    'ses.bd_fim_ses ' +
  'From t_pessoa pes ' +
  'Join t_sessao ses on ses.bd_id_pes = pes.bd_id_pes ' +
  'Join t_local loc on loc.bd_id_loc = ses.bd_id_loc ' +
  'Join t_evento eve on eve.bd_id_eve = ses.bd_id_eve ' +
  'Where pes.bd_id_pes = :bd_id_pes');

  dmTreinamento.qSelect.ParamByName('bd_id_pes').AsInteger := ed_id_consulta.id;
  dmTreinamento.cds_local_pessoa.Open;
  ds_consulta.DataSet := dmTreinamento.cds_local_pessoa;

  if dmTreinamento.cds_local_pessoa.IsEmpty then
    ShowMessage('O código informado não foi cadastrado ou não existe!');
end;

end.
