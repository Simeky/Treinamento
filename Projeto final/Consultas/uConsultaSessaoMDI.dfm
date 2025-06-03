inherited frConsultaSessaoMDI: TfrConsultaSessaoMDI
  Left = 334
  Top = 163
  Caption = 'Consulta de Sess'#245'es Cadastradas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited gr_consulta: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'bd_id_ses'
        Title.Caption = 'ID Sess'#227'o'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_id_pes'
        Title.Caption = 'ID Pessoa'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_id_loc'
        Title.Caption = 'ID Local'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_id_eve'
        Title.Caption = 'ID Evento'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_etapa_ses'
        Title.Caption = 'Etapa'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_inicio_ses'
        Title.Caption = 'In'#237'cio da Sess'#227'o'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bd_fim_ses'
        Title.Caption = 'Fim da Sess'#227'o'
        Width = 107
        Visible = True
      end>
  end
  inherited ds_consulta: TDataSource
    DataSet = dmTreinamento.cds_sessao
  end
end
