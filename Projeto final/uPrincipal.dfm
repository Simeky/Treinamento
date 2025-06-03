object frPrincipal: TfrPrincipal
  Left = -2
  Top = 0
  Width = 1544
  Height = 820
  Align = alClient
  AutoSize = True
  Caption = 'Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 352
    Top = 56
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object empresa: TMenuItem
        Caption = 'Empresa'
        OnClick = empresaClick
      end
      object pessoa: TMenuItem
        Caption = 'Pessoa'
        OnClick = pessoaClick
      end
      object local: TMenuItem
        Caption = 'Local'
        OnClick = localClick
      end
      object evento: TMenuItem
        Caption = 'Evento'
        OnClick = eventoClick
      end
      object sessao: TMenuItem
        Caption = 'Sess'#227'o'
        OnClick = sessaoClick
      end
    end
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      object locais_pessoa: TMenuItem
        Caption = 'Localiza'#231#227'o Pessoa em cada Etapa'
        OnClick = locais_pessoaClick
      end
      object quantidade_pessoas_sala: TMenuItem
        Caption = 'Pessoas em Determinada Sala'
        OnClick = quantidade_pessoas_salaClick
      end
    end
  end
end
