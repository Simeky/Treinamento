unit uCadastroPessoaMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadraoMDI, ImgList, ComCtrls, ToolWin, StdCtrls, Mask,
  uEdit_numerico, ExtCtrls, DB, DBClient;

type
  TfrCadastroPessoaMDI = class(TfrCadastroPadraoMDI)
    la_id_pes: TLabel;
    la_nome_pes: TLabel;
    la_email_pes: TLabel;
    la_cpf_pes: TLabel;
    la_id_afi: TLabel;
    ed_id_pes: TEdit_numerico;
    ed_id_afi: TEdit_numerico;
    ed_nome_pes: TEdit;
    ed_email_pes: TEdit;
    med_cpf_pes: TMaskEdit;
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
  end;

var
  frCadastroPessoaMDI: TfrCadastroPessoaMDI;

implementation

uses udmTreinamento, uConsultaPessoaMDI;

{$R *.dfm}

{ TfrCadastroPessoaMDI }

procedure TfrCadastroPessoaMDI.carregar;
begin
  inherited;
  ed_id_pes.Text    := tabela.FieldByName('bd_id_pes').AsString;
  ed_nome_pes.Text  := tabela.FieldByName('bd_nome_pes').AsString;
  ed_email_pes.Text := tabela.FieldByName('bd_email_pes').AsString;
  med_cpf_pes.Text  := tabela.FieldByName('bd_cpf_pes').AsString;
  ed_id_afi.Text    := tabela.FieldByName('bd_id_afi').AsString;
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
  tabela.FieldByName('bd_cpf_pes').AsString   := med_cpf_pes.Text;
  tabela.FieldByName('bd_id_afi').AsInteger   := StrToIntDef(ed_id_afi.Text, 0);
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

end.
