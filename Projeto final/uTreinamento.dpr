program uTreinamento;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frPrincipal},
  udmTreinamento in 'udmTreinamento.pas' {dmTreinamento: TDataModule},
  uPadraoSimples in 'uPadraoSimples.pas' {frPadraoSimples},
  uCadastroPadraoMDI in 'Cadastros\uCadastroPadraoMDI.pas' {frCadastroPadraoMDI},
  uConsultaPadraoMDI in 'Consultas\uConsultaPadraoMDI.pas' {frConsultaPadraoMDI},
  uCadastroPessoaMDI in 'Cadastros\uCadastroPessoaMDI.pas' {frCadastroPessoaMDI},
  uConsultaPessoaMDI in 'Consultas\uConsultaPessoaMDI.pas' {frConsultaPessoaMDI},
  uCadastroEmpresaMDI in 'uCadastroEmpresaMDI.pas' {frCadastroEmpresaMDI},
  uConsultaEmpresaMDI in 'Consultas\uConsultaEmpresaMDI.pas' {frConsultaEmpresaMDI};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmTreinamento, dmTreinamento);
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.Run;
end.
