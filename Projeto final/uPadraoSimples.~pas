unit uPadraoSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, ToolWin;

type
  TfrPadraoSimples = class(TForm)
    il_images: TImageList;
    il_hot_images: TImageList;
    il_disable_images: TImageList;
    tb_ferramentas: TToolBar;
    tbt_confirmar: TToolButton;
    tbt_cancelar: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbt_cancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPadraoSimples: TfrPadraoSimples;

implementation

{$R *.dfm}

procedure TfrPadraoSimples.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrPadraoSimples.tbt_cancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrPadraoSimples.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    close;

  if Key = VK_RETURN then
    tbt_confirmar.Click;
end;

end.
