unit uCadastroEmpresaMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadraoMDI, ImgList, ExtCtrls, ComCtrls, ToolWin,
  StdCtrls, Mask, uEdit_numerico, DB, DBClient;

type
  TfrCadastroEmpresaMDI = class(TfrCadastroPadraoMDI)
    lb_id_emp: TLabel;
    lb_nome_fantasia_emp: TLabel;
    lb_razao_social_emp: TLabel;
    lb_cnpj_emp: TLabel;
    lb_inscricao_estadual_emp: TLabel;
    lb_inscricao_municipal_emp: TLabel;
    lb_telefone_emp: TLabel;
    lb_email_emp: TLabel;
    lb_cep_emp: TLabel;
    lb_uf_emp: TLabel;
    lb_cidade_emp: TLabel;
    lb_bairro_emp: TLabel;
    lb_logradouro_emp: TLabel;
    lb_complemento_emp: TLabel;
    lb_site_emp: TLabel;
    lb_fundacao_emp: TLabel;
    lb_tipo_emp: TLabel;
    lb_num_endereco_emp: TLabel;
    ed_id_emp: TEdit_numerico;
    ed_nome_fantasia_emp: TEdit;
    ed_razao_social_emp: TEdit;
    ed_cnpj_emp: TMaskEdit;
    ed_cep_emp: TMaskEdit;
    ed_inscricao_estadual_emp: TEdit_numerico;
    ed_inscricao_municipal_emp: TEdit_numerico;
    ck_matriz_emp: TCheckBox;
    ck_ativa_emp: TCheckBox;
    dtp_fundacao_emp: TDateTimePicker;
    ed_telefone_emp: TMaskEdit;
    ed_email_emp: TEdit;
    ed_site_emp: TEdit;
    ed_uf_emp: TMaskEdit;
    ed_cidade_emp: TEdit;
    ed_bairro_emp: TEdit;
    ed_logradouro_emp: TEdit;
    ed_complemento_emp: TEdit;
    ed_num_endereco_emp: TEdit_numerico;
    ed_tipo_emp: TEdit;
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
  frCadastroEmpresaMDI: TfrCadastroEmpresaMDI;

implementation

uses uConsultaEmpresaMDI, udmTreinamento, uUtils;

{$R *.dfm}

{ TfrCadastroEmpresaMDI }

procedure TfrCadastroEmpresaMDI.carregar;
begin
  inherited;
  ed_id_emp.Text                  := tabela.FieldByName('bd_id_emp').AsString;
  ed_nome_fantasia_emp.Text       := tabela.FieldByName('bd_nome_fantasia_emp').AsString;
  ed_razao_social_emp.Text        := tabela.FieldByName('bd_razao_social_emp').AsString;
  ed_cnpj_emp.Text               := tabela.FieldByName('bd_cnpj_emp').AsString;
  ed_inscricao_estadual_emp.Text  := tabela.FieldByName('bd_inscricao_estadual_emp').AsString;
  ed_inscricao_municipal_emp.Text := tabela.FieldByName('bd_inscricao_municipal_emp').AsString;
  ed_telefone_emp.Text           := tabela.FieldByName('bd_telefone_emp').AsString;
  ed_email_emp.Text               := tabela.FieldByName('bd_email_emp').AsString;
  ed_cep_emp.Text                := tabela.FieldByName('bd_cep_emp').AsString;
  ed_uf_emp.Text                 := tabela.FieldByName('bd_uf_emp').AsString;
  ed_cidade_emp.Text              := tabela.FieldByName('bd_cidade_emp').AsString;
  ed_bairro_emp.Text              := tabela.FieldByName('bd_bairro_emp').AsString;
  ed_logradouro_emp.Text          := tabela.FieldByName('bd_logradouro_emp').AsString;
  ed_num_endereco_emp.Text        := tabela.FieldByName('bd_numero_emp').AsString;
  ed_complemento_emp.Text         := tabela.FieldByName('bd_complemento_emp').AsString;
  ed_site_emp.Text                := tabela.FieldByName('bd_site_emp').AsString;
  dtp_fundacao_emp.Date           := tabela.FieldByName('bd_fundacao_emp').AsDateTime;
  ed_tipo_emp.Text                := tabela.FieldByName('bd_tipo_emp').AsString;
  if tabela.FieldByName('bd_matriz_emp').AsInteger = 1 then
    ck_matriz_emp.Checked        := True
  else
    ck_matriz_emp.Checked        := False;

  if tabela.FieldByName('bd_ativa_emp').AsInteger = 1 then
    ck_ativa_emp.Checked         := True
  else
    ck_ativa_emp.Checked         := False;

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
  tabela.FieldByName('bd_cnpj_emp').AsString                := ed_cnpj_emp.Text;
  tabela.FieldByName('bd_inscricao_estadual_emp').AsString  := ed_inscricao_estadual_emp.Text;
  tabela.FieldByName('bd_inscricao_municipal_emp').AsString := ed_inscricao_municipal_emp.Text;
  tabela.FieldByName('bd_telefone_emp').AsString            := ed_telefone_emp.Text;
  tabela.FieldByName('bd_email_emp').AsString               := ed_email_emp.Text;
  tabela.FieldByName('bd_cep_emp').AsString                 := ed_cep_emp.Text;
  tabela.FieldByName('bd_uf_emp').AsString                  := UpperCase(ed_uf_emp.Text);
  tabela.FieldByName('bd_cidade_emp').AsString              := ed_cidade_emp.Text;
  tabela.FieldByName('bd_bairro_emp').AsString              := ed_bairro_emp.Text;
  tabela.FieldByName('bd_logradouro_emp').AsString          := ed_logradouro_emp.Text;
  tabela.FieldByName('bd_numero_emp').AsString              := ed_num_endereco_emp.Text;
  tabela.FieldByName('bd_complemento_emp').AsString         := ed_complemento_emp.Text;
  tabela.FieldByName('bd_site_emp').AsString                := ed_site_emp.Text;
  tabela.FieldByName('bd_fundacao_emp').AsDateTime          := dtp_fundacao_emp.Date;
  tabela.FieldByName('bd_tipo_emp').AsString                := ed_tipo_emp.Text;
  if ck_matriz_emp.Checked then
    tabela.FieldByName('bd_matriz_emp').AsInteger           := 1
  else
    tabela.FieldByName('bd_matriz_emp').AsInteger           := 0;

  if ck_ativa_emp.Checked then
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

procedure TfrCadastroEmpresaMDI.FormShow(Sender: TObject);
begin
  inherited;
  Height := 269;
  Width := 1542;
  dtp_fundacao_emp.Date := Now;
end;

function TfrCadastroEmpresaMDI.validar: Boolean;
begin

  if not validar_cnpj(ed_cnpj_emp.Text) then
  begin
    ShowMessage('Insira um CNPJ Válido.');
    Result := False;
    Exit;
  end;

  if Trim(so_numeros(ed_cep_emp.Text)) = '' then
  begin
    ShowMessage('O CEP deve ser Preenchido.');
    Result := False;
    Exit;
  end;

  if Trim(ed_inscricao_estadual_emp.Text) = '' then
  begin
    ShowMessage('A Inscrição Estadual deve ser Preenchida.');
    Result := False;
    Exit;
  end;

  if Trim(ed_inscricao_municipal_emp.Text) = '' then
  begin
    ShowMessage('A Inscrição Municipal deve ser Preenchido.');
    Result := False;
    Exit;
  end;

  if Trim(ed_razao_social_emp.Text) = '' then
  begin
    ShowMessage('A Razão Social deve ser Preenchida.');
    Result := False;
    Exit;
  end;

  if not validar_email(ed_email_emp.Text) then
  begin
    ShowMessage('O E-mail deve conter @ e .');
    Result := False;
    Exit;
  end;

  if Trim(ed_uf_emp.Text) = '' then
  begin
    ShowMessage('A UF deve ser Preenchida.');
    Result := False;
    Exit;
  end;

  if Trim(ed_num_endereco_emp.Text) = '' then
  begin
    ShowMessage('O Número de Endereço deve ser Preenchido.');
    Result := False;
    Exit;
  end;

  ShowMessage('Empresa Cadastrada ou Alterada com Sucesso.');
  Result := true;
end;

end.
