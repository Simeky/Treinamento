inherited frConsultaLocalMDI: TfrConsultaLocalMDI
  Left = 302
  Top = 204
  Caption = 'Consulta de Locais Cadastrados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited gr_consulta: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'bd_id_loc'
        Title.Caption = 'ID Local'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_nome_loc'
        Title.Caption = 'Nome'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_lotacao_max_loc'
        Title.Caption = 'Lota'#231#227'o M'#225'xima'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_lotacao_atual_loc'
        Title.Caption = 'Lota'#231#227'o atual'
        Width = 72
        Visible = True
      end>
  end
  inherited il_images: TImageList
    Left = 480
    Top = 16
  end
  inherited il_hot_images: TImageList
    Left = 512
    Top = 16
  end
  inherited il_disable_images: TImageList
    Top = 16
  end
  inherited ds_consulta: TDataSource
    DataSet = dmTreinamento.cds_local
    Left = 448
    Top = 16
  end
end
