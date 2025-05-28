inherited frConsultaPessoaMDI: TfrConsultaPessoaMDI
  Caption = 'Consulta Pessoa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited gr_consulta: TDBGrid
    DataSource = ds_consulta
  end
  inherited ds_consulta: TDataSource
    DataSet = dmTreinamento.cds_pessoa
  end
end
