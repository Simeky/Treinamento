inherited frCadastroSessaoMDI: TfrCadastroSessaoMDI
  Left = 585
  Width = 386
  Height = 267
  Caption = 'Cadastro Sess'#227'o'
  Constraints.MaxHeight = 267
  Constraints.MinHeight = 267
  Constraints.MinWidth = 386
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited tb_ferramentas: TToolBar
    Width = 370
  end
  inherited pa_cadastro: TPanel
    Width = 370
    Height = 182
    object la_id_ses: TLabel
      Left = 40
      Top = 16
      Width = 49
      Height = 13
      Caption = 'ID Sess'#227'o'
    end
    object la_id_pes: TLabel
      Left = 192
      Top = 16
      Width = 49
      Height = 13
      Caption = 'ID Pessoa'
    end
    object la_id_loc: TLabel
      Left = 48
      Top = 48
      Width = 40
      Height = 13
      Caption = 'ID Local'
    end
    object la_id_eve: TLabel
      Left = 192
      Top = 48
      Width = 48
      Height = 13
      Caption = 'ID Evento'
    end
    object la_etapa_ses: TLabel
      Left = 7
      Top = 80
      Width = 84
      Height = 13
      Caption = 'Etapa da Sess'#227'o '
    end
    object la_inicio_ses: TLabel
      Left = 8
      Top = 112
      Width = 80
      Height = 13
      Caption = 'In'#237'cio da Sess'#227'o'
    end
    object la_fim_ses: TLabel
      Left = 16
      Top = 144
      Width = 69
      Height = 13
      Caption = 'Fim da Sess'#227'o'
    end
    object ed_id_ses: TEdit_numerico
      Left = 96
      Top = 16
      Width = 89
      Height = 21
      TabOrder = 0
      Text = '0'
      id = 0
    end
    object ed_id_pes: TEdit_numerico
      Left = 248
      Top = 16
      Width = 89
      Height = 21
      TabOrder = 1
      Text = '0'
      id = 0
    end
    object ed_id_loc: TEdit_numerico
      Left = 96
      Top = 48
      Width = 89
      Height = 21
      TabOrder = 2
      Text = '0'
      id = 0
    end
    object ed_id_eve: TEdit_numerico
      Left = 248
      Top = 48
      Width = 89
      Height = 21
      TabOrder = 3
      Text = '0'
      id = 0
    end
    object ed_etapa_ses: TEdit
      Left = 96
      Top = 80
      Width = 241
      Height = 21
      TabOrder = 4
    end
    object dtp_inicio_ses_date: TDateTimePicker
      Left = 96
      Top = 112
      Width = 113
      Height = 21
      Date = 45807.728880219910000000
      Format = 'dd/MM/yyyy'
      Time = 45807.728880219910000000
      TabOrder = 5
    end
    object dtp_fim_ses_date: TDateTimePicker
      Left = 96
      Top = 144
      Width = 113
      Height = 21
      Date = 45807.728880219910000000
      Format = 'dd/MM/yyyy'
      Time = 45807.728880219910000000
      TabOrder = 7
    end
    object dtp_inicio_ses_time: TDateTimePicker
      Left = 216
      Top = 112
      Width = 121
      Height = 21
      Date = 45810.700561770830000000
      Time = 45810.700561770830000000
      Kind = dtkTime
      TabOrder = 6
    end
    object dtp_fim_ses_time: TDateTimePicker
      Left = 216
      Top = 144
      Width = 121
      Height = 21
      Date = 45810.704193506940000000
      Time = 45810.704193506940000000
      Kind = dtkTime
      TabOrder = 8
    end
  end
end
