object dmTreinamento: TdmTreinamento
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 668
  Top = 226
  Height = 297
  Width = 251
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
    Left = 104
    Top = 8
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
  object t_espaco: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'T_ESPACO'
    Left = 104
    Top = 72
  end
  object dsp_espaco: TDataSetProvider
    DataSet = t_espaco
    Left = 104
    Top = 136
  end
  object cds_espaco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_espaco'
    Left = 104
    Top = 192
  end
  object t_etapa: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'T_ETAPA'
    Left = 168
    Top = 72
  end
  object dsp_etapa: TDataSetProvider
    DataSet = t_etapa
    Left = 168
    Top = 136
  end
  object cds_etapa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_etapa'
    Left = 168
    Top = 192
  end
end
