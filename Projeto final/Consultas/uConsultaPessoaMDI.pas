unit uConsultaPessoaMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsultaPadraoMDI, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrConsultaPessoaMDI = class(TfrConsultaPadraoMDI)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frConsultaPessoaMDI: TfrConsultaPessoaMDI;

implementation

uses udmTreinamento;

{$R *.dfm}

end.
