unit uCadastroSessaoMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadraoMDI, ImgList, ExtCtrls, ComCtrls, ToolWin,
  StdCtrls, uEdit_numerico, DBClient;

type
  TfrCadastroSessaoMDI = class(TfrCadastroPadraoMDI)
    la_id_ses: TLabel;
    la_id_pes: TLabel;
    la_id_loc: TLabel;
    la_id_eve: TLabel;
    la_etapa_ses: TLabel;
    la_inicio_ses: TLabel;
    la_fim_ses: TLabel;
    ed_id_ses: TEdit_numerico;
    ed_id_pes: TEdit_numerico;
    ed_id_loc: TEdit_numerico;
    ed_id_eve: TEdit_numerico;
    dtp_inicio_ses_date: TDateTimePicker;
    dtp_fim_ses_date: TDateTimePicker;
    dtp_inicio_ses_time: TDateTimePicker;
    dtp_fim_ses_time: TDateTimePicker;
    cb_etapa_ses: TComboBox;
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
  frCadastroSessaoMDI: TfrCadastroSessaoMDI;

implementation

uses udmTreinamento, uConsultaSessaoMDI;

{$R *.dfm}

procedure TfrCadastroSessaoMDI.carregar;
begin
  inherited;
  ed_id_ses.Text            := tabela.FieldByName('bd_id_ses').AsString;
  ed_id_pes.Text            := tabela.FieldByName('bd_id_pes').AsString;
  ed_id_loc.Text            := tabela.FieldByName('bd_id_loc').AsString;
  ed_id_eve.Text            := tabela.FieldByName('bd_id_eve').AsString;
  cb_etapa_ses.Text         := tabela.FieldByName('bd_etapa_ses').AsString;
  dtp_inicio_ses_date.Date  := tabela.FieldByName('bd_inicio_ses').AsDateTime;
  dtp_inicio_ses_time.Time  := tabela.FieldByName('bd_inicio_ses').AsDateTime;
  dtp_fim_ses_date.Date     := tabela.FieldByName('bd_fim_ses').AsDateTime;
  dtp_fim_ses_time.Time     := tabela.FieldByName('bd_fim_ses').AsDateTime;
end;

function TfrCadastroSessaoMDI.consultar: TForm;
begin
  Result :=  TfrConsultaSessaoMDI.Create(ed_id_ses);
end;

procedure TfrCadastroSessaoMDI.FormShow(Sender: TObject);
begin
  inherited;
  Height := 267;
  Width := 386;
end;

procedure TfrCadastroSessaoMDI.salvar;
begin
  inherited;
  tabela.FieldByName('bd_id_ses').AsInteger       := StrToIntDef(ed_id_eve.Text, 0);
  tabela.FieldByName('bd_id_pes').AsInteger       := StrToIntDef(ed_id_pes.Text, 0);
  tabela.FieldByName('bd_id_loc').AsInteger       := StrToIntDef(ed_id_loc.Text, 0);
  tabela.FieldByName('bd_id_eve').AsInteger       := StrToIntDef(ed_id_eve.Text, 0);
  tabela.FieldByName('bd_etapa_ses').AsString     := cb_etapa_ses.Text;
  tabela.FieldByName('bd_inicio_ses').AsDateTime  := dtp_inicio_ses_date.Date + dtp_inicio_ses_time.Time;
  tabela.FieldByName('bd_fim_ses').AsDateTime     := dtp_fim_ses_date.Date + dtp_fim_ses_time.Time;


end;

function TfrCadastroSessaoMDI.setEdit_id: TEdit;
begin
  Result := ed_id_ses;
end;

function TfrCadastroSessaoMDI.setIndice: String;
begin
  Result := 'bd_id_ses';
end;

function TfrCadastroSessaoMDI.setTabela: TClientDataSet;
begin
  Result := dmTreinamento.cds_sessao;
end;

function TfrCadastroSessaoMDI.validar: Boolean;
begin
  dmTreinamento.cds_local.Open;
  if  dmTreinamento.cds_local.FieldByName('bd_capacidade_atual_loc').AsInteger >=
      dmTreinamento.cds_local.FieldByName('bd_capacidade_max_loc').AsInteger then
  begin
    ShowMessage('Não foi Possível Inserir o Registro pois Excede a Capacidade Máxima do Local escolhido.');
    Result := false;
    dmTreinamento.cds_local.Close;
    Exit;
  end;
  dmTreinamento.cds_local.Close;

  dmTreinamento.cds_evento.Open;
  if dmTreinamento.cds_evento.FieldByName('bd_inicio_eve').AsDateTime <
     StrToDateTime(DateToStr(dtp_inicio_ses_date.Date) + ' ' + TimeToStr(dtp_inicio_ses_time.Time)) then
  begin
    ShowMessage('O Início da Sessão não pode ser antes do Início do Evento.');
    Result := false;
    dmTreinamento.cds_evento.Close;
    Exit;
  end;

  if StrToDateTime(DateToStr(dtp_fim_ses_date.Date) + ' ' + TimeToStr(dtp_fim_ses_time.Time)) <=
     StrToDateTime(DateToStr(dtp_inicio_ses_date.Date) + ' ' + TimeToStr(dtp_inicio_ses_time.Time)) then
  begin
    ShowMessage('O Fim da Sessão não pode ser antes ou igual ao Início do Sessão.');
    Result := false;
    dmTreinamento.cds_evento.Close;
    Exit;
  end;
  dmTreinamento.cds_evento.Close;

  ShowMessage('Sessão Cadastrada com Sucesso.');
  Result := True;
end;

end.
