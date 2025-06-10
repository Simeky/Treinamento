unit uCadastroPessoaMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadraoMDI, ImgList, ComCtrls, ToolWin, StdCtrls, Mask,
  uEdit_numerico, ExtCtrls, DB, DBClient;

type
  TfrCadastroPessoaMDI = class(TfrCadastroPadraoMDI)
    lb_id_pes: TLabel;
    lb_nome_pes: TLabel;
    lb_email_pes: TLabel;
    lb_cpf_pes: TLabel;
    lb_id_emp: TLabel;
    ed_id_pes: TEdit_numerico;
    ed_id_emp: TEdit_numerico;
    ed_nome_pes: TEdit;
    ed_email_pes: TEdit;
    ed_cpf_pes: TMaskEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setIndice: String; override;
    function setEdit_id: TEdit; override;
    procedure salvar; override;
    function consultar: TForm; override;
    procedure carregar; override;
    function validar: Boolean; override;
    
  end;

var
  frCadastroPessoaMDI: TfrCadastroPessoaMDI;

implementation

uses udmTreinamento, uConsultaPessoaMDI, uUtils;

{$R *.dfm}

{ TfrCadastroPessoaMDI }

procedure TfrCadastroPessoaMDI.carregar;
begin
  inherited;
  ed_id_pes.Text    := tabela.FieldByName('bd_id_pes').AsString;
  ed_nome_pes.Text  := tabela.FieldByName('bd_nome_pes').AsString;
  ed_email_pes.Text := tabela.FieldByName('bd_email_pes').AsString;
  ed_cpf_pes.Text  := tabela.FieldByName('bd_cpf_pes').AsString;
  ed_id_emp.Text    := tabela.FieldByName('bd_id_emp').AsString;
end;

function TfrCadastroPessoaMDI.consultar: TForm;
begin
  Result := TfrConsultaPessoaMDI.Create(ed_id_pes);
end;

procedure TfrCadastroPessoaMDI.salvar;
begin
  inherited;

  tabela.FieldByName('bd_id_pes').AsInteger   := StrToIntDef(ed_id_pes.Text, 0);
  tabela.FieldByName('bd_nome_pes').AsString  := ed_nome_pes.Text;
  tabela.FieldByName('bd_email_pes').AsString := ed_email_pes.Text;
  tabela.FieldByName('bd_cpf_pes').AsString   := ed_cpf_pes.Text;
  tabela.FieldByName('bd_id_emp').AsInteger   := StrToIntDef(ed_id_emp.Text, 0);

end;

function TfrCadastroPessoaMDI.setEdit_id: TEdit;
begin
  Result := ed_id_pes;
end;

function TfrCadastroPessoaMDI.setIndice: String;
begin
  Result := 'bd_id_pes';
end;

function TfrCadastroPessoaMDI.setTabela: TClientDataSet;
begin
  Result := dmTreinamento.cds_pessoa;
end;

procedure TfrCadastroPessoaMDI.FormShow(Sender: TObject);
begin
  inherited;
  Height  := 241;
  Width   := 274;
end;

function TfrCadastroPessoaMDI.validar: Boolean;
begin

  dmTreinamento.qSelect.Close;
  dmTreinamento.qSelect.SQL.Clear;
  dmTreinamento.qSelect.SQL.Add(
    'Select 1 from t_empresa ' +
    'Where bd_id_emp = :bd_id_emp;');

  dmTreinamento.qSelect.ParamByName('bd_id_emp').AsInteger := StrToIntDef(ed_id_emp.Text, 0);
  dmTreinamento.qSelect.open;

  if dmTreinamento.qSelect.IsEmpty then
  begin
    ShowMessage('A Empresa com o ID: ' + ed_id_emp.Text + ' Não existe.' );
    Result := False;
    Exit;
  end;
  dmTreinamento.qSelect.Close;

  if not validar_email(ed_email_pes.Text) then
  begin
    ShowMessage('O E-mail deve seguir o Formato xxx@xxx.');
    Result := False;
    Exit;
  end;

  if not validar_cpf(ed_cpf_pes.Text) then
  begin
    ShowMessage('Insira um CPF válido.');
    Result := False;
    Exit;
  end;

  dmTreinamento.qSelect.Close;
  dmTreinamento.qSelect.SQL.Clear;
  dmTreinamento.qSelect.SQL.Add(
    'Select 1 from t_pessoa ' +
    'Where bd_cpf_pes = :bd_cpf_pes;');

  dmTreinamento.qSelect.ParamByName('bd_cpf_pes').AsString := ed_cpf_pes.Text;
  dmTreinamento.qSelect.open;

  if not dmTreinamento.qSelect.IsEmpty then
  begin
    ShowMessage('A Pessoa com o CPF: ' + ed_cpf_pes.Text + ' Já está Cadastrada.' );
    Result := False;
    Exit;
  end;
  dmTreinamento.qSelect.Close;

  ShowMessage('Pessoa cadastrada ou Alterada com Sucesso.');
  Result := True;
end;

end.
