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

uses udmTreinamento, uConsultaSessaoMDI, DB;

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
  tabela.FieldByName('bd_id_ses').AsInteger       := StrToIntDef(ed_id_ses.Text, 0);
  tabela.FieldByName('bd_id_pes').AsInteger       := StrToIntDef(ed_id_pes.Text, 0);
  tabela.FieldByName('bd_id_loc').AsInteger       := StrToIntDef(ed_id_loc.Text, 0);
  tabela.FieldByName('bd_id_eve').AsInteger       := StrToIntDef(ed_id_eve.Text, 0);
  tabela.FieldByName('bd_etapa_ses').AsString     := cb_etapa_ses.Text;
  tabela.FieldByName('bd_inicio_ses').AsDateTime  := StrToDateTime(DateToStr(dtp_inicio_ses_date.Date) + ' ' + TimeToStr(dtp_inicio_ses_time.Time));
  tabela.FieldByName('bd_fim_ses').AsDateTime     := StrToDateTime(DateToStr(dtp_fim_ses_date.Date) + ' ' + TimeToStr(dtp_fim_ses_time.Time));
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
  with dmTreinamento.qSelect do
  begin
    close;
    SQL.Clear;
    SQL.Add(
    'SELECT bd_capacidade_atual_loc, ' +
           'bd_capacidade_max_loc ' +
    'FROM t_local WHERE bd_id_loc = :bd_id_loc;');
    ParamByName('bd_id_loc').AsInteger := StrToInt(ed_id_loc.Text);
    Open;

    if FieldByName('bd_capacidade_atual_loc').AsInteger >=
       FieldByName('bd_capacidade_max_loc').AsInteger then
    begin
      ShowMessage('A sala j� atingiu a capacidade m�xima.');
      Result := False;
      Exit;
    end;

    Close;
  end;

  if cb_etapa_ses.Items.IndexOf(cb_etapa_ses.Text) = -1 then
  begin
    ShowMessage('A Etapa Informada N�o � V�lida.');
    Result := False;
    Exit;
  end;

  with dmTreinamento.qSelect do
  begin
    close;
    SQL.Clear;
    SQL.Add('SELECT bd_inicio_eve FROM t_evento WHERE bd_id_eve = :bd_id_eve;');
    ParamByName('bd_id_eve').AsInteger := StrToInt(ed_id_eve.Text);
    open;

    if FieldByName('bd_inicio_eve').AsDateTime >
       StrToDateTime(DateToStr(dtp_inicio_ses_date.Date) + ' ' + TimeToStr(dtp_inicio_ses_time.Time)) then
    begin
      ShowMessage('O In�cio da Sess�o n�o pode ser antes do In�cio do Evento.');
      Result := False;
      Exit;
    end;

    Close;
  end;

  if StrToDateTime(DateToStr(dtp_fim_ses_date.Date) + ' ' + TimeToStr(dtp_fim_ses_time.Time)) <=
     StrToDateTime(DateToStr(dtp_inicio_ses_date.Date) + ' ' + TimeToStr(dtp_inicio_ses_time.Time)) then
  begin
    ShowMessage('O Fim da Sess�o n�o pode ser antes ou igual ao In�cio do Sess�o.');
    Result := false;
    Exit;
  end;

  with dmTreinamento.qSelect do
  begin
    Close;
    SQL.Clear;
    SQL.Add(
      'Select 1 from t_sessao ' +
      'Where bd_id_pes = :bd_id_pes ' +
      'And bd_id_eve = :bd_id_eve ' +
      'And bd_etapa_ses = :bd_etapa_ses ' +
      'And bd_id_loc <> :bd_id_loc');

    ParamByName('bd_id_pes').AsInteger := StrToInt(ed_id_pes.Text);
    ParamByName('bd_id_eve').AsInteger := StrToInt(ed_id_eve.Text);
    ParamByName('bd_etapa_ses').AsString := cb_etapa_ses.Text;
    ParamByName('bd_id_loc').AsInteger := StrToInt(ed_id_loc.Text);
    open;

    if not IsEmpty then
    begin
      ShowMessage('Essa Pessoa j� est� Cadastrada em outro Local para esta Etapa deste Evento.');
      Result := False;
      Exit;
    end;

    Close;
  end;

  ShowMessage('Sess�o Cadastrada ou Alterada com Sucesso.');
  Result := True;
end;

end.
