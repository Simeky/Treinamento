unit uConsultaLocalMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMDI, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient;

type
  TfrConsultaLocalMDI = class(TfrConsultaPadraoMDI)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaLocalMDI: TfrConsultaLocalMDI;

implementation

uses udmTreinamento;

{$R *.dfm}

{ TfrConsultaLocalMDI }

function TfrConsultaLocalMDI.setChave: String;
begin
  Result := 'bd_id_loc';
end;

function TfrConsultaLocalMDI.setTabela: TClientDataSet;
begin
  Result := dmTreinamento.cds_local;
end;

end.
