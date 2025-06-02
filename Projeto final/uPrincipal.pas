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
    Consultas1: TMenuItem;
    Pessoaporlocal1: TMenuItem;
    SalaporPessoa1: TMenuItem;
    procedure pessoaClick(Sender: TObject);
    procedure empresaClick(Sender: TObject);
    procedure eventoClick(Sender: TObject);
    procedure localClick(Sender: TObject);
    procedure sessaoClick(Sender: TObject);
    procedure Pessoaporlocal1Click(Sender: TObject);
    procedure SalaporPessoa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation

uses uCadastroPessoaMDI, uCadastroEmpresaMDI, uCadastroEventoMDI,
  uCadastroLocalMDI, uCadastroSessaoMDI, uConsultaLocalPessoaMDI,
  uConsultaPessoaLocalMDI;

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

procedure TfrPrincipal.eventoClick(Sender: TObject);
begin
  TfrCadastroEventoMDI.Create(Self);
end;

procedure TfrPrincipal.localClick(Sender: TObject);
begin
  TfrCadastroLocalMDI.Create(self);
end;

procedure TfrPrincipal.sessaoClick(Sender: TObject);
begin
 TfrCadastroSessaoMDI.Create(self);
end;

procedure TfrPrincipal.Pessoaporlocal1Click(Sender: TObject);
begin
  TfrConsultaLocalPessoaMDI.Create(self);
end;

procedure TfrPrincipal.SalaporPessoa1Click(Sender: TObject);
begin
  TfrConsultaPessoaLocalMDI.Create(self);
end;

end.
