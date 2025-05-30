unit uConsultaEventoMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMDI, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient;

type
  TfrConsultaEventoMDI = class(TfrConsultaPadraoMDI)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaEventoMDI: TfrConsultaEventoMDI;

implementation

uses udmTreinamento;

{$R *.dfm}

{ TfrConsultaEventoMDI }

function TfrConsultaEventoMDI.setChave: String;
begin
  Result := 'bd_id_eve';
end;

function TfrConsultaEventoMDI.setTabela: TClientDataSet;
begin
  Result := dmTreinamento.cds_evento;
end;

end.
