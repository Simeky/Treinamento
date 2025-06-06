object frPrincipal: TfrPrincipal
  Left = 0
  Top = 1
  Width = 1544
  Height = 820
  Align = alClient
  AutoSize = True
  Caption = 'Controle '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mm_menu_principal
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object lb_principal: TLabel
    Left = 0
    Top = 0
    Width = 1528
    Height = 761
    Align = alClient
    Alignment = taCenter
    Caption = 'Seja Bem-vindo(a)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -67
    Font.Name = 'MS Gothic'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object mm_menu_principal: TMainMenu
    Left = 720
    Top = 72
    object mm_cadastros: TMenuItem
      Caption = 'Cadastros'
      object mm_empresa: TMenuItem
        Caption = 'Empresa'
        OnClick = mm_empresaClick
      end
      object mm_pessoa: TMenuItem
        Caption = 'Pessoa'
        OnClick = mm_pessoaClick
      end
      object mm_local: TMenuItem
        Caption = 'Local'
        OnClick = mm_localClick
      end
      object mm_evento: TMenuItem
        Caption = 'Evento'
        OnClick = mm_eventoClick
      end
      object mm_sessao: TMenuItem
        Caption = 'Sess'#227'o'
        OnClick = mm_sessaoClick
      end
    end
    object mm_consultas: TMenuItem
      Caption = 'Consultas'
      object mm_locais_pessoa: TMenuItem
        Caption = 'Localiza'#231#227'o Pessoa em cada Etapa'
        OnClick = mm_locais_pessoaClick
      end
      object mm_quantidade_pessoas_sala: TMenuItem
        Caption = 'Pessoas em Determinada Sala'
        OnClick = mm_quantidade_pessoas_salaClick
      end
    end
  end
end
