object frPrincipal: TfrPrincipal
  Left = -3
  Top = 0
  Width = 1547
  Height = 829
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
    Left = 144
    Top = 96
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object pessoa: TMenuItem
        Caption = 'Pessoa'
        OnClick = pessoaClick
      end
      object local: TMenuItem
        Caption = 'Local'
        OnClick = localClick
      end
      object sessao: TMenuItem
        Caption = 'Sess'#227'o'
        OnClick = sessaoClick
      end
      object empresa: TMenuItem
        Caption = 'Empresa'
        OnClick = empresaClick
      end
      object evento: TMenuItem
        Caption = 'Evento'
        OnClick = eventoClick
      end
    end
  end
end
