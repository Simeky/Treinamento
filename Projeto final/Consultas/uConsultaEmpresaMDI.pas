unit uConsultaEmpresaMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMDI, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient;

type
  TfrConsultaEmpresaMDI = class(TfrConsultaPadraoMDI)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaEmpresaMDI: TfrConsultaEmpresaMDI;

implementation

uses udmTreinamento;

{$R *.dfm}

{ TfrConsultaEmpresaMDI }

function TfrConsultaEmpresaMDI.setChave: String;
begin
  Result := 'bd_id_emp';
end;

function TfrConsultaEmpresaMDI.setTabela: TClientDataSet;
begin
  Result := dmTreinamento.cds_empresa;
end;

end.
