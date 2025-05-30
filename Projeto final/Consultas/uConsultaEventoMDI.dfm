inherited frConsultaEventoMDI: TfrConsultaEventoMDI
  Left = 298
  Top = 183
  Caption = 'Consulta Evento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited gr_consulta: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'bd_id_eve'
        Title.Caption = 'ID Evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_nome_eve'
        Title.Caption = 'Nome'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_desc_eve'
        Title.Caption = 'Descri'#231#227'o'
        Width = 282
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_inicio_eve'
        Title.Caption = 'In'#237'cio do evento'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_fim_eve'
        Title.Caption = 'Fim do evento'
        Width = 148
        Visible = True
      end>
  end
  inherited il_images: TImageList
    Left = 456
    Top = 8
  end
  inherited il_hot_images: TImageList
    Left = 488
    Top = 8
  end
  inherited il_disable_images: TImageList
    Left = 520
    Top = 8
  end
  inherited ds_consulta: TDataSource
    DataSet = dmTreinamento.cds_evento
    Left = 424
    Top = 8
  end
end
