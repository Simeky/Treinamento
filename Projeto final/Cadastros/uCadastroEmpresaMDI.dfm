inherited frCadastroEmpresaMDI: TfrCadastroEmpresaMDI
  Left = -6
  Top = 92
  VertScrollBar.Range = 0
  AutoScroll = False
  Caption = 'Cadastro Empresa'
  ClientHeight = 230
  ClientWidth = 1526
  Constraints.MaxHeight = 269
  Constraints.MinHeight = 269
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited tb_ferramentas: TToolBar
    Width = 1526
  end
  inherited pn_cadastro: TPanel
    Width = 1526
    Height = 184
    AutoSize = True
    object lb_id_emp: TLabel
      Left = 24
      Top = 16
      Width = 55
      Height = 13
      Caption = 'ID Empresa'
    end
    object lb_nome_fantasia_emp: TLabel
      Left = 8
      Top = 48
      Width = 71
      Height = 13
      Caption = 'Nome Fantasia'
    end
    object lb_razao_social_emp: TLabel
      Left = 736
      Top = 48
      Width = 63
      Height = 13
      Caption = 'Raz'#227'o Social'
    end
    object lb_cnpj_emp: TLabel
      Left = 296
      Top = 16
      Width = 27
      Height = 13
      Caption = 'CNPJ'
    end
    object lb_inscricao_estadual_emp: TLabel
      Left = 744
      Top = 16
      Width = 82
      Height = 13
      Caption = 'Incri'#231#227'o Estadual'
    end
    object lb_inscricao_municipal_emp: TLabel
      Left = 1128
      Top = 16
      Width = 91
      Height = 13
      Caption = 'Inscri'#231#227'o Municipal'
    end
    object lb_telefone_emp: TLabel
      Left = 1280
      Top = 80
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object lb_email_emp: TLabel
      Left = 50
      Top = 80
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object lb_cep_emp: TLabel
      Left = 560
      Top = 16
      Width = 21
      Height = 13
      Caption = 'CEP'
    end
    object lb_uf_emp: TLabel
      Left = 64
      Top = 112
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object lb_cidade_emp: TLabel
      Left = 136
      Top = 112
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object lb_bairro_emp: TLabel
      Left = 648
      Top = 112
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object lb_logradouro_emp: TLabel
      Left = 1008
      Top = 112
      Width = 54
      Height = 13
      Caption = 'Logradouro'
    end
    object lb_complemento_emp: TLabel
      Left = 14
      Top = 144
      Width = 64
      Height = 13
      Caption = 'Complemento'
    end
    object lb_site_emp: TLabel
      Left = 656
      Top = 80
      Width = 18
      Height = 13
      Caption = 'Site'
    end
    object lb_fundacao_emp: TLabel
      Left = 368
      Top = 144
      Width = 86
      Height = 13
      Caption = 'Data de funda'#231#227'o'
    end
    object lb_tipo_emp: TLabel
      Left = 1040
      Top = 144
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object lb_num_endereco_emp: TLabel
      Left = 688
      Top = 144
      Width = 100
      Height = 13
      Caption = 'N'#250'mero de endere'#231'o'
    end
    object ed_id_emp: TEdit_numerico
      Left = 88
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '0'
      id = 0
    end
    object ed_nome_fantasia_emp: TEdit
      Left = 88
      Top = 48
      Width = 641
      Height = 21
      TabOrder = 5
    end
    object ed_razao_social_emp: TEdit
      Left = 808
      Top = 48
      Width = 609
      Height = 21
      TabOrder = 6
    end
    object med_cnpj_emp: TMaskEdit
      Left = 328
      Top = 16
      Width = 111
      Height = 21
      EditMask = '00\.000\.000\/0000\-00;1; '
      MaxLength = 18
      TabOrder = 1
      Text = '  .   .   /    -  '
    end
    object med_cep_emp: TMaskEdit
      Left = 584
      Top = 16
      Width = 55
      Height = 21
      EditMask = '00000\-00;1; '
      MaxLength = 8
      TabOrder = 2
      Text = '     -  '
    end
    object ed_inscricao_estadual_emp: TEdit_numerico
      Left = 840
      Top = 16
      Width = 185
      Height = 21
      TabOrder = 3
      Text = '0'
      id = 0
    end
    object ed_inscricao_municipal_emp: TEdit_numerico
      Left = 1232
      Top = 16
      Width = 185
      Height = 21
      TabOrder = 4
      Text = '0'
      id = 0
    end
    object ck_matriz_emp: TCheckBox
      Left = 1264
      Top = 144
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Matriz'
      TabOrder = 18
    end
    object ck_ativa_emp: TCheckBox
      Left = 1376
      Top = 144
      Width = 41
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativa'
      TabOrder = 19
    end
    object dtp_fundacao_emp: TDateTimePicker
      Left = 464
      Top = 144
      Width = 153
      Height = 21
      Date = 45806.628773703710000000
      Format = 'dd/MM/yyyy'
      Time = 45806.628773703710000000
      TabOrder = 15
    end
    object med_telefone_emp: TMaskEdit
      Left = 1328
      Top = 80
      Width = 85
      Height = 21
      EditMask = '!\(00\) 90000-0000;1; '
      MaxLength = 15
      TabOrder = 9
      Text = '(  )      -    '
    end
    object ed_email_emp: TEdit
      Left = 88
      Top = 80
      Width = 529
      Height = 21
      TabOrder = 7
    end
    object ed_site_emp: TEdit
      Left = 680
      Top = 80
      Width = 513
      Height = 21
      TabOrder = 8
    end
    object med_uf_emp: TMaskEdit
      Left = 88
      Top = 112
      Width = 23
      Height = 21
      EditMask = 'LL;1; '
      MaxLength = 2
      TabOrder = 10
      Text = '  '
    end
    object ed_cidade_emp: TEdit
      Left = 176
      Top = 112
      Width = 441
      Height = 21
      TabOrder = 11
    end
    object ed_bairro_emp: TEdit
      Left = 680
      Top = 112
      Width = 305
      Height = 21
      TabOrder = 12
    end
    object ed_logradouro_emp: TEdit
      Left = 1064
      Top = 112
      Width = 353
      Height = 21
      TabOrder = 13
    end
    object ed_complemento_emp: TEdit
      Left = 88
      Top = 144
      Width = 257
      Height = 21
      TabOrder = 14
    end
    object ed_num_endereco_emp: TEdit_numerico
      Left = 792
      Top = 144
      Width = 193
      Height = 21
      TabOrder = 16
      Text = '0'
      id = 0
    end
    object ed_tipo_emp: TEdit
      Left = 1064
      Top = 144
      Width = 129
      Height = 21
      TabOrder = 17
    end
  end
end
