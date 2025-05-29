unit uCadastroEmpresaMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadraoMDI, ImgList, ExtCtrls, ComCtrls, ToolWin,
  StdCtrls, Mask, uEdit_numerico, DB, DBClient;

type
  TfrCadastroEmpresaMDI = class(TfrCadastroPadraoMDI)
    la_id_emp: TLabel;
    la_nome_fantasia_emp: TLabel;
    la_razao_social_emp: TLabel;
    la_cnpj_emp: TLabel;
    la_inscricao_estadual_emp: TLabel;
    la_inscricao_municipal_emp: TLabel;
    la_telefone_emp: TLabel;
    la_email_emp: TLabel;
    la_cep_emp: TLabel;
    la_uf_emp: TLabel;
    la_cidade_emp: TLabel;
    la_bairro_emp: TLabel;
    la_logradouro_emp: TLabel;
    la_complemento_emp: TLabel;
    la_site_emp: TLabel;
    la_fundacao_emp: TLabel;
    la_tipo_emp: TLabel;
    la_num_endereco_emp: TLabel;
    ed_id_emp: TEdit_numerico;
    ed_nome_fantasia_emp: TEdit;
    ed_razao_social_emp: TEdit;
    med_cnpj_emp: TMaskEdit;
    med_cep_emp: TMaskEdit;
    ed_inscricao_estadual_emp: TEdit_numerico;
    ed_inscricao_municipal_emp: TEdit_numerico;
    ckb_matriz_emp: TCheckBox;
    ckb_ativa_emp: TCheckBox;
    dtp_fundacao_emp: TDateTimePicker;
    med_telefone_emp: TMaskEdit;
    ed_email_emp: TEdit;
    ed_site_emp: TEdit;
    med_uf_emp: TMaskEdit;
    ed_cidade_emp: TEdit;
    ed_bairro_emp: TEdit;
    ed_logradouro_emp: TEdit;
    ed_complemento_emp: TEdit;
    ed_num_endereco_emp: TEdit_numerico;
    ed_tipo_emp: TEdit;
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
  frCadastroEmpresaMDI: TfrCadastroEmpresaMDI;

implementation

uses uConsultaEmpresaMDI, udmTreinamento;

{$R *.dfm}

{ TfrCadastroEmpresaMDI }

procedure TfrCadastroEmpresaMDI.carregar;
begin
  inherited;
  ed_id_emp.Text                  := tabela.FieldByName('bd_id_emp').AsString;
  ed_nome_fantasia_emp.Text       := tabela.FieldByName('bd_nome_fantasia_emp').AsString;
  ed_razao_social_emp.Text        := tabela.FieldByName('bd_razao_social_emp').AsString;
  med_cnpj_emp.Text               := tabela.FieldByName('bd_cnpj_emp').AsString;
  ed_inscricao_estadual_emp.Text  := tabela.FieldByName('bd_inscricao_estadual_emp').AsString;
  ed_inscricao_municipal_emp.Text := tabela.FieldByName('bd_inscricao_municipal_emp').AsString;
  med_telefone_emp.Text           := tabela.FieldByName('bd_telefone_emp').AsString;
  ed_email_emp.Text               := tabela.FieldByName('bd_email_emp').AsString;
  med_cep_emp.Text                := tabela.FieldByName('bd_cep_emp').AsString;
  med_uf_emp.Text                 := tabela.FieldByName('bd_uf_emp').AsString;
  ed_cidade_emp.Text              := tabela.FieldByName('bd_cidade_emp').AsString;
  ed_bairro_emp.Text              := tabela.FieldByName('bd_bairro_emp').AsString;
  ed_logradouro_emp.Text          := tabela.FieldByName('bd_logradouro_emp').AsString;
  ed_num_endereco_emp.Text        := tabela.FieldByName('bd_numero_emp').AsString;
  ed_complemento_emp.Text         := tabela.FieldByName('bd_complemento_emp').AsString;
  ed_site_emp.Text                := tabela.FieldByName('bd_site_emp').AsString;
  dtp_fundacao_emp.Date           := tabela.FieldByName('bd_fundacao_emp').AsDateTime;
  ed_tipo_emp.Text                := tabela.FieldByName('bd_tipo_emp').AsString;
  if tabela.FieldByName('bd_matriz_emp').AsInteger = 1 then
    ckb_matriz_emp.Checked        := True
  else
    ckb_matriz_emp.Checked        := False;
  if tabela.FieldByName('bd_ativa_emp').AsInteger = 1 then
    ckb_ativa_emp.Checked         := True
  else
    ckb_ativa_emp.Checked         := False;

end;

function TfrCadastroEmpresaMDI.consultar: TForm;
begin
  Result := TfrConsultaEmpresaMDI.Create(ed_id_emp);
end;

procedure TfrCadastroEmpresaMDI.salvar;
begin
  inherited;
  tabela.FieldByName('bd_id_emp').AsInteger                 := StrToIntDef(ed_id_emp.Text, 0);
  tabela.FieldByName('bd_nome_fantasia_emp').AsString       := ed_nome_fantasia_emp.Text;
  tabela.FieldByName('bd_razao_social_emp').AsString        := ed_razao_social_emp.Text;
  tabela.FieldByName('bd_cnpj_emp').AsString                := med_cnpj_emp.Text;
  tabela.FieldByName('bd_inscricao_estadual_emp').AsString  := ed_inscricao_estadual_emp.Text;
  tabela.FieldByName('bd_inscricao_municipal_emp').AsString := ed_inscricao_municipal_emp.Text;
  tabela.FieldByName('bd_telefone_emp').AsString            := med_telefone_emp.Text;
  tabela.FieldByName('bd_email_emp').AsString               := ed_email_emp.Text;
  tabela.FieldByName('bd_cep_emp').AsString                 := med_cep_emp.Text;
  tabela.FieldByName('bd_uf_emp').AsString                  := med_uf_emp.Text;
  tabela.FieldByName('bd_cidade_emp').AsString              := ed_cidade_emp.Text;
  tabela.FieldByName('bd_bairro_emp').AsString              := ed_bairro_emp.Text;
  tabela.FieldByName('bd_logradouro_emp').AsString          := ed_logradouro_emp.Text;
  tabela.FieldByName('bd_numero_emp').AsString              := ed_num_endereco_emp.Text;
  tabela.FieldByName('bd_complemento_emp').AsString         := ed_complemento_emp.Text;
  tabela.FieldByName('bd_site_emp').AsString                := ed_site_emp.Text;
  tabela.FieldByName('bd_fundacao_emp').AsDateTime          := dtp_fundacao_emp.Date;
  tabela.FieldByName('bd_tipo_emp').AsString                := ed_tipo_emp.Text;
  if ckb_matriz_emp.Checked then
    tabela.FieldByName('bd_matriz_emp').AsInteger           := 1
  else
    tabela.FieldByName('bd_matriz_emp').AsInteger           := 0;
  if ckb_ativa_emp.Checked then
    tabela.FieldByName('bd_ativa_emp').AsInteger            := 1
  else
    tabela.FieldByName('bd_ativa_emp').AsInteger            := 0;
end;

function TfrCadastroEmpresaMDI.setEdit_id: TEdit;
begin
  Result := ed_id_emp;
end;

function TfrCadastroEmpresaMDI.setIndice: String;
begin
  Result := 'bd_id_emp';
end;

function TfrCadastroEmpresaMDI.setTabela: TClientDataSet;
begin
  Result := dmTreinamento.cds_empresa;
end;

end.
