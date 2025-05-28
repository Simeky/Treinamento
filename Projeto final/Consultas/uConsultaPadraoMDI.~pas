unit uConsultaPadraoMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadraoSimples, ImgList, ComCtrls, ToolWin, DB, Grids, DBGrids, DBClient, StdCtrls;

type
  TfrConsultaPadraoMDI = class(TfrPadraoSimples)
    ds_consulta: TDataSource;
    gr_consulta: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure tbt_confirmarClick(Sender: TObject);
  private
    { Private declarations }
    f_tabela: TClientDataSet;
    f_chave: String;
  public
    { Public declarations }
    function setTabela: TClientDataSet; virtual; abstract;
    function setChave: String; virtual; abstract;
  published
    property tabela: TClientDataSet read f_tabela write f_tabela;
  end;

var
  frConsultaPadraoMDI: TfrConsultaPadraoMDI;

implementation

uses udmTreinamento;

{$R *.dfm}

procedure TfrConsultaPadraoMDI.FormCreate(Sender: TObject);
begin
  inherited;
  f_tabela := setTabela;
  f_chave := setChave;

  if Assigned(f_tabela) then
  begin
    ds_consulta.DataSet := f_tabela;
    gr_consulta.DataSource := ds_consulta;
  end;

  gr_consulta.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgCancelOnExit];

end;

procedure TfrConsultaPadraoMDI.tbt_confirmarClick(Sender: TObject);
begin
  inherited;
  if Owner is TEdit then
  begin
    TEdit(Owner).Text := f_tabela.FieldByName(f_chave).AsString;
    TEdit(Owner).SetFocus;
    Close;
  end;
end;

end.
