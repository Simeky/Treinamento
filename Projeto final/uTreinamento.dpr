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
  uCadastroEmpresaMDI in 'Cadastros\uCadastroEmpresaMDI.pas' {frCadastroEmpresaMDI},
  uConsultaEmpresaMDI in 'Consultas\uConsultaEmpresaMDI.pas' {frConsultaEmpresaMDI},
  uCadastroEventoMDI in 'Cadastros\uCadastroEventoMDI.pas' {frCadastroEventoMDI},
  uConsultaEventoMDI in 'Consultas\uConsultaEventoMDI.pas' {frConsultaEventoMDI},
  uCadastroLocalMDI in 'Cadastros\uCadastroLocalMDI.pas' {frCadastroLocalMDI},
  uConsultaLocalMDI in 'Consultas\uConsultaLocalMDI.pas' {frConsultaLocalMDI},
  uCadastroSessaoMDI in 'Cadastros\uCadastroSessaoMDI.pas' {frCadastroSessaoMDI},
  uConsultaSessaoMDI in 'Consultas\uConsultaSessaoMDI.pas' {frConsultaSessaoMDI},
  uConsultaLocalPessoaMDI in 'Consultas\uConsultaLocalPessoaMDI.pas' {frConsultaLocalPessoaMDI},
  uConsultaPessoaLocalMDI in 'Consultas\uConsultaPessoaLocalMDI.pas' {frConsultaPessoaLocalMDI},
  uUtils in 'uUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmTreinamento, dmTreinamento);
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.Run;
end.
