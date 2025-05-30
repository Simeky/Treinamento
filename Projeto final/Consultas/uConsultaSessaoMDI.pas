unit uConsultaSessaoMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMDI, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient;

type
  TfrConsultaSessaoMDI = class(TfrConsultaPadraoMDI)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function setChave: String; override;
  end;

var
  frConsultaSessaoMDI: TfrConsultaSessaoMDI;

implementation

uses udmTreinamento;

{$R *.dfm}

{ TfrConsultaSessaoMDI }

function TfrConsultaSessaoMDI.setChave: String;
begin
  Result := 'bd_id_ses';
end;

function TfrConsultaSessaoMDI.setTabela: TClientDataSet;
begin
  Result := dmTreinamento.cds_sessao;
end;

end.
