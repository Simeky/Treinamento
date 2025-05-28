program uTreinamento;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frPrincipal},
  udmTreinamento in 'udmTreinamento.pas' {dmTreinamento: TDataModule},
  uPadraoSimples in 'uPadraoSimples.pas' {frPadraoSimples},
  uCadastroPadraoMDI in 'Cadastros\uCadastroPadraoMDI.pas' {frCadastroPadraoMDI};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmTreinamento, dmTreinamento);
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.CreateForm(TfrCadastroPadraoMDI, frCadastroPadraoMDI);
  Application.Run;
end.
