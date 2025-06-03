object dmTreinamento: TdmTreinamento
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 468
  Top = 317
  Height = 293
  Width = 596
  object SQLConnection: TSQLConnection
    ConnectionName = 'DB2Connection'
    DriverName = 'DB2'
    GetDriverFunc = 'getSQLDriverDB2'
    LibraryName = 'dbexpdb2.dll'
    Params.Strings = (
      'DriverName=DB2'
      'Database=DBNAME'
      'User_Name=user'
      'Password=password'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DB2 TransIsolation=ReadCommited')
    VendorLib = 'db2cli.dll'
    Left = 272
    Top = 16
  end
  object t_pessoa: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'T_PESSOA'
    Left = 32
    Top = 72
  end
  object dsp_pessoa: TDataSetProvider
    DataSet = t_pessoa
    Left = 32
    Top = 136
  end
  object cds_pessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_pessoa'
    Left = 32
    Top = 192
  end
  object t_local: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'T_LOCAL'
    Left = 112
    Top = 72
  end
  object dsp_local: TDataSetProvider
    DataSet = t_local
    Left = 112
    Top = 136
  end
  object cds_local: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_local'
    Left = 112
    Top = 192
  end
  object t_sessao: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'T_SESSAO'
    Left = 192
    Top = 72
  end
  object dsp_sessao: TDataSetProvider
    DataSet = t_sessao
    Left = 192
    Top = 136
  end
  object cds_sessao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_sessao'
    Left = 192
    Top = 192
  end
  object t_empresa: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'T_EMPRESA'
    Left = 272
    Top = 72
  end
  object dsp_empresa: TDataSetProvider
    DataSet = t_empresa
    Left = 272
    Top = 136
  end
  object cds_empresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_empresa'
    Left = 272
    Top = 192
  end
  object t_evento: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'T_EVENTO'
    Left = 352
    Top = 72
  end
  object dsp_evento: TDataSetProvider
    DataSet = t_evento
    Left = 352
    Top = 136
  end
  object cds_evento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_evento'
    Left = 352
    Top = 192
  end
  object qSelect: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 432
    Top = 72
  end
  object dsp_local_pessoa: TDataSetProvider
    DataSet = qSelect
    Left = 432
    Top = 136
  end
  object cds_local_pessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_local_pessoa'
    Left = 432
    Top = 192
  end
  object dsp_pessoa_local: TDataSetProvider
    DataSet = qSelect
    Left = 520
    Top = 136
  end
  object cds_pessoa_local: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_pessoa_local'
    Left = 520
    Top = 192
  end
end
