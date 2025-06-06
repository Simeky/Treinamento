unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, Menus, ExtCtrls, StdCtrls;

type
  TfrPrincipal = class(TForm)
    mm_menu_principal: TMainMenu;
    mm_cadastros: TMenuItem;
    mm_pessoa: TMenuItem;
    mm_local: TMenuItem;
    mm_sessao: TMenuItem;
    mm_empresa: TMenuItem;
    mm_evento: TMenuItem;
    mm_consultas: TMenuItem;
    mm_locais_pessoa: TMenuItem;
    mm_quantidade_pessoas_sala: TMenuItem;
    lb_principal: TLabel;
    procedure mm_pessoaClick(Sender: TObject);
    procedure mm_empresaClick(Sender: TObject);
    procedure mm_eventoClick(Sender: TObject);
    procedure mm_localClick(Sender: TObject);
    procedure mm_sessaoClick(Sender: TObject);
    procedure mm_locais_pessoaClick(Sender: TObject);
    procedure mm_quantidade_pessoas_salaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation

uses uCadastroPessoaMDI, uCadastroEmpresaMDI, uCadastroEventoMDI,
  uCadastroLocalMDI, uConsultaLocalPessoaMDI, uCadastroSessaoMDI,
  uConsultaPessoaLocalMDI;

{$R *.dfm}

{ TfrPrincipal }

procedure TfrPrincipal.mm_pessoaClick(Sender: TObject);
begin
   TfrCadastroPessoaMDI.Create(self);
end;

procedure TfrPrincipal.mm_empresaClick(Sender: TObject);
begin
  TfrCadastroEmpresaMDI.Create(self);
end;

procedure TfrPrincipal.mm_eventoClick(Sender: TObject);
begin
  TfrCadastroEventoMDI.Create(Self);
end;

procedure TfrPrincipal.mm_localClick(Sender: TObject);
begin
  TfrCadastroLocalMDI.Create(self);
end;

procedure TfrPrincipal.mm_sessaoClick(Sender: TObject);
begin
 TfrCadastroSessaoMDI.Create(self);
end;

procedure TfrPrincipal.mm_locais_pessoaClick(Sender: TObject);
begin
  TfrConsultaLocalPessoaMDI.Create(self);
end;

procedure TfrPrincipal.mm_quantidade_pessoas_salaClick(Sender: TObject);
begin
  TfrConsultaPessoaLocalMDI.Create(self);
end;

end.
