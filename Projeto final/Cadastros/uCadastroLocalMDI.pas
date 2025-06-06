unit uCadastroLocalMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadraoMDI, ImgList, ExtCtrls, ComCtrls, ToolWin,
  StdCtrls, uEdit_numerico, DBClient;

type
  TfrCadastroLocalMDI = class(TfrCadastroPadraoMDI)
    lb_id_loc: TLabel;
    lb_nome_loc: TLabel;
    lb_lotacao_max_loc: TLabel;
    ed_id_loc: TEdit_numerico;
    ed_nome_loc: TEdit;
    ed_lotacao_max_loc: TEdit_numerico;
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
  frCadastroLocalMDI: TfrCadastroLocalMDI;

implementation

uses udmTreinamento, uConsultaLocalMDI;

{$R *.dfm}

procedure TfrCadastroLocalMDI.carregar;
begin
  inherited;
  ed_id_loc.Text          := tabela.FieldByName('bd_id_loc').AsString;
  ed_nome_loc.Text        := tabela.FieldByName('bd_nome_loc').AsString;
  ed_lotacao_max_loc.Text := tabela.FieldByName('bd_lotacao_max_loc').AsString;
end;

function TfrCadastroLocalMDI.consultar: TForm;
begin
  Result := TfrConsultaLocalMDI.Create(ed_id_loc);
end;

procedure TfrCadastroLocalMDI.FormShow(Sender: TObject);
begin
  inherited;
  Height := 206;
  Width := 269;
end;

procedure TfrCadastroLocalMDI.salvar;
begin
  inherited;
  tabela.FieldByName('bd_id_loc').AsInteger         := StrToIntDef(ed_id_loc.Text, 0);
  tabela.FieldByName('bd_nome_loc').AsString        := ed_nome_loc.Text;
  tabela.FieldByName('bd_lotacao_max_loc').AsString := ed_lotacao_max_loc.Text;
end;

function TfrCadastroLocalMDI.setEdit_id: TEdit;
begin
  Result := ed_id_loc;
end;

function TfrCadastroLocalMDI.setIndice: String;
begin
  Result := 'bd_id_loc';
end;

function TfrCadastroLocalMDI.setTabela: TClientDataSet;
begin
  Result := dmTreinamento.cds_local;
end;

function TfrCadastroLocalMDI.validar: Boolean;
begin

  if Trim(ed_nome_loc.Text) = '' then
  begin
    ShowMessage('O Nome do Local deve ser Preenchido.');
    Result := False;
    Exit;
  end;

  if StrToIntDef(ed_lotacao_max_loc.Text, 0) <= 0 then
  begin
    ShowMessage('A Lotacao Máxima PRECISA ser maior do que 0.');
    Result := false;
    Exit;
  end;

  ShowMessage('Local Cadastrado ou Alterado com Sucesso.');
  Result := true;
end;

end.
