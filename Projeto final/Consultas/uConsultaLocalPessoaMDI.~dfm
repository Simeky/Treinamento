inherited frConsultaLocalPessoaMDI: TfrConsultaLocalPessoaMDI
  Left = 215
  Top = 151
  Caption = 'Consulta de Locais onde a Pessoa ficara '
  PixelsPerInch = 96
  TextHeight = 13
  inherited gr_consulta: TDBGrid [0]
    Columns = <
      item
        Expanded = False
        FieldName = 'bd_id_pes'
        Title.Caption = 'ID Pessoa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_nome_pes'
        Title.Caption = 'Nome Pessoa'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_cpf_pes'
        Title.Caption = 'CPF Pessoa'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_nome_eve'
        Title.Caption = 'Nome Evento'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_etapa_ses'
        Title.Caption = 'Etapa'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_id_loc'
        Title.Caption = 'ID Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_nome_loc'
        Title.Caption = 'Nome Local'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_inicio_ses'
        Title.Caption = 'In'#237'cio da Sess'#227'o'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_fim_ses'
        Title.Caption = 'Fim da Sess'#227'o'
        Width = 124
        Visible = True
      end>
  end
  inherited tb_ferramentas: TToolBar [1]
    inherited bt_refresh: TToolButton
      Enabled = False
    end
    object lb_id_pes: TLabel
      Left = 180
      Top = 0
      Width = 53
      Height = 44
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'ID Pessoa'
      Layout = tlCenter
    end
  end
  object ed_id_consulta: TEdit_numerico [2]
    Left = 240
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
    id = 0
  end
  inherited il_images: TImageList
    Left = 440
    Top = 16
  end
  inherited il_hot_images: TImageList
    Left = 472
    Top = 16
  end
  inherited il_disable_images: TImageList
    Left = 504
    Top = 16
  end
  inherited ds_consulta: TDataSource
    DataSet = dmTreinamento.cds_local_pessoa
    Left = 408
    Top = 16
  end
end
