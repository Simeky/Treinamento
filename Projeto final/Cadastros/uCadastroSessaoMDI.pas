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
    ed_etapa_ses: TEdit;
    dsp_inicio_ses: TDateTimePicker;
    dsp_fim_ses: TDateTimePicker;
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
  frCadastroSessaoMDI: TfrCadastroSessaoMDI;

implementation

uses udmTreinamento, uConsultaSessaoMDI;

{$R *.dfm}

procedure TfrCadastroSessaoMDI.carregar;
begin
  inherited;
  ed_id_ses.Text      := tabela.FieldByName('bd_id_ses').AsString;
  ed_id_pes.Text      := tabela.FieldByName('bd_id_pes').AsString;
  ed_id_loc.Text      := tabela.FieldByName('bd_id_loc').AsString;
  ed_id_eve.Text      := tabela.FieldByName('bd_id_eve').AsString;
  ed_etapa_ses.Text   := tabela.FieldByName('bd_etapa_ses').AsString;
  dsp_inicio_ses.Date := tabela.FieldByName('bd_inicio_ses').AsDateTime;
  dsp_fim_ses.Date    := tabela.FieldByName('bd_fim_ses').AsDateTime;
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
  tabela.FieldByName('bd_etapa_ses').AsString     := ed_etapa_ses.Text;
  tabela.FieldByName('bd_inicio_ses').AsDateTime  := dsp_inicio_ses.DateTime;
  tabela.FieldByName('bd_fim_ses').AsDateTime     := dsp_fim_ses.DateTime;
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

end.
