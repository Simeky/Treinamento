inherited frConsultaLocalMDI: TfrConsultaLocalMDI
  Left = 302
  Top = 204
  Caption = 'Consulta Local'
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
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_capacidade_max_loc'
        Title.Caption = 'Capacidade M'#225'xima'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_capacidade_atual_loc'
        Title.Caption = 'Capacidade atual'
        Width = 87
        Visible = True
      end>
  end
  inherited ds_consulta: TDataSource
    DataSet = dmTreinamento.cds_local
  end
end
