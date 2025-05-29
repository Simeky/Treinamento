unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, Menus;

type
  TfrPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    pessoa: TMenuItem;
    local: TMenuItem;
    sessao: TMenuItem;
    empresa: TMenuItem;
    evento: TMenuItem;
    procedure pessoaClick(Sender: TObject);
    procedure empresaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation

uses uCadastroPessoaMDI, uCadastroEmpresaMDI;

{$R *.dfm}

{ TfrPrincipal }

procedure TfrPrincipal.pessoaClick(Sender: TObject);
begin
   TfrCadastroPessoaMDI.Create(self);
end;

procedure TfrPrincipal.empresaClick(Sender: TObject);
begin
  TfrCadastroEmpresaMDI.Create(self);
end;

end.
