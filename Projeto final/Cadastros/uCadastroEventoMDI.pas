unit uCadastroEventoMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastroPadraoMDI, ImgList, ExtCtrls, ComCtrls, ToolWin,
  StdCtrls, uEdit_numerico, DBClient;

type
  TfrCadastroEventoMDI = class(TfrCadastroPadraoMDI)
    la_id_eve: TLabel;
    la_nome_eve: TLabel;
    la_desc_eve: TLabel;
    la_inicio_eve: TLabel;
    la_fim_eve: TLabel;
    ed_id_eve: TEdit_numerico;
    ed_nome_eve: TEdit;
    ed_desc_eve: TEdit;
    dtp_inicio_eve_time: TDateTimePicker;
    dtp_fim_eve_time: TDateTimePicker;
    dtp_inicio_eve_date: TDateTimePicker;
    dtp_fim_eve_date: TDateTimePicker;
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
  frCadastroEventoMDI: TfrCadastroEventoMDI;

implementation

uses udmTreinamento, uConsultaEventoMDI;

{$R *.dfm}

{ TfrCadastroEventoMDI }

procedure TfrCadastroEventoMDI.carregar;
begin
  inherited;
  ed_id_eve.Text            := tabela.FieldByName('bd_id_eve').AsString;
  ed_nome_eve.Text          := tabela.FieldByName('bd_nome_eve').AsString;
  ed_desc_eve.Text          := tabela.FieldByName('bd_desc_eve').AsString;
  dtp_inicio_eve_date.Date  := tabela.FieldByName('bd_inicio_eve').AsDateTime;
  dtp_inicio_eve_time.Time  := tabela.FieldByName('bd_inicio_eve').AsDateTime;
  dtp_fim_eve_date.Date     := tabela.FieldByName('bd_fim_eve').AsDateTime;
  dtp_fim_eve_time.Time     := tabela.FieldByName('bd_fim_eve').AsDateTime;
end;

function TfrCadastroEventoMDI.consultar: TForm;
begin
  Result := TfrConsultaEventoMDI.Create(ed_id_eve); 
end;

procedure TfrCadastroEventoMDI.salvar;
begin
  inherited;
  tabela.FieldByName('bd_id_eve').AsInteger       := StrToIntDef(ed_id_eve.Text, 0);
  tabela.FieldByName('bd_nome_eve').AsString      := ed_nome_eve.Text;
  tabela.FieldByName('bd_desc_eve').AsString      := ed_desc_eve.Text;
  tabela.FieldByName('bd_inicio_eve').AsDateTime  := StrToDateTime(DateToStr(dtp_inicio_eve_date.Date) + ' ' + TimeToStr(dtp_inicio_eve_time.Time));
  tabela.FieldByName('bd_fim_eve').AsDateTime     := StrToDateTime(DateToStr(dtp_fim_eve_date.Date) + ' ' + TimeToStr(dtp_fim_eve_time.Time));
end;

function TfrCadastroEventoMDI.setEdit_id: TEdit;
begin
  Result := ed_id_eve;
end;

function TfrCadastroEventoMDI.setIndice: String;
begin
  Result := 'bd_id_eve';
end;

function TfrCadastroEventoMDI.setTabela: TClientDataSet;
begin
  Result := dmTreinamento.cds_evento;
end;

procedure TfrCadastroEventoMDI.FormShow(Sender: TObject);
begin
  inherited;
  Height := 230;
  Width := 498;
  dtp_inicio_eve_date.Date := Now;
  dtp_fim_eve_date.Date := Now;
  dtp_inicio_eve_time.Time := Now;
  dtp_fim_eve_time.Time := Now;
end;

function TfrCadastroEventoMDI.validar: Boolean;
begin

  if Trim(ed_nome_eve.Text) = '' then
  begin
    ShowMessage('O Nome do Evento deve ser Preenchido.');
    Result := False;
    Exit;
  end;

  if StrToDateTime(DateToStr(dtp_inicio_eve_date.Date) + ' ' + TimeToStr(dtp_inicio_eve_time.Time)) <= Now then
  begin
    ShowMessage('O Início do Evento não pode ser antes ou igual a Data e Hora de agora.');
    Result := False;
    Exit;
  end;

  if StrToDateTime(DateToStr(dtp_fim_eve_date.Date) + ' ' + TimeToStr(dtp_fim_eve_time.Time)) <= StrToDateTime(DateToStr(dtp_inicio_eve_date.Date) + ' ' + TimeToStr(dtp_inicio_eve_time.Time)) then
  begin
    ShowMessage('O Fim do Evento não pode ser antes ou igual ao Início do Evento');
    Result := False;
    Exit;
  end;

  ShowMessage('Evento Cadastrado ou Alterado com Sucesso.');
  Result := true;
end;

end.
