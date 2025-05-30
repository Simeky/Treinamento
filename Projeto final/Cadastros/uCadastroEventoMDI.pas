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
    dtp_inicio_eve: TDateTimePicker;
    dtp_fim_eve: TDateTimePicker;
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
  ed_id_eve.Text      := tabela.FieldByName('bd_id_eve').AsString;
  ed_nome_eve.Text    := tabela.FieldByName('bd_nome_eve').AsString;
  ed_desc_eve.Text    := tabela.FieldByName('bd_desc_eve').AsString;
  dtp_inicio_eve.Date := tabela.FieldByName('bd_inicio_eve').AsDateTime;
  dtp_fim_eve.Date    := tabela.FieldByName('bd_fim_eve').AsDateTime;
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
  tabela.FieldByName('bd_inicio_eve').AsDateTime  := dtp_inicio_eve.DateTime;
  tabela.FieldByName('bd_fim_eve').AsDateTime     := dtp_fim_eve.DateTime;
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
  Height := 210;
  Width := 498;
end;

end.
