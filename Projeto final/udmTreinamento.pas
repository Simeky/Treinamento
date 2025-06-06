unit udmTreinamento;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, Dialogs, Forms, FMTBcd,
  DBClient, Provider;

type
  TdmTreinamento = class(TDataModule)
    SQLConnection: TSQLConnection;
    tb_pessoa: TSQLTable;
    dsp_pessoa: TDataSetProvider;
    cds_pessoa: TClientDataSet;
    tb_local: TSQLTable;
    dsp_local: TDataSetProvider;
    cds_local: TClientDataSet;
    tb_sessao: TSQLTable;
    dsp_sessao: TDataSetProvider;
    cds_sessao: TClientDataSet;
    tb_empresa: TSQLTable;
    dsp_empresa: TDataSetProvider;
    cds_empresa: TClientDataSet;
    tb_evento: TSQLTable;
    dsp_evento: TDataSetProvider;
    cds_evento: TClientDataSet;
    qSelect: TSQLQuery;
    dsp_local_pessoa: TDataSetProvider;
    cds_local_pessoa: TClientDataSet;
    dsp_pessoa_local: TDataSetProvider;
    cds_pessoa_local: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTreinamento: TdmTreinamento;

implementation

{$R *.dfm}

procedure TdmTreinamento.DataModuleCreate(Sender: TObject);
begin
  SQLConnection.Close;

  SQLConnection.LoginPrompt := False;
  SQLConnection.ConnectionName := 'FBConnection';
  SQLConnection.DriverName := 'Firebird';
  SQLConnection.GetDriverFunc := 'getSQLDriverINTERBASE';
  SQLConnection.LibraryName := 'dbexpint.dll';//'dbxfb.dll';
  SQLConnection.VendorLib := 'fbembed.dll';

  SQLConnection.Params.Clear;
  SQLConnection.Params.Values['DriverName'] := 'Firebird';
  SQLConnection.Params.Values['Database'] := 'C:\Users\Prog04\Documents\academia\Projeto final\db\TREINAMENTO.fdb';
  SQLConnection.Params.Values['RoleName'] := EmptyStr;
  SQLConnection.Params.Values['User_Name'] := 'SYSDBA';
  SQLConnection.Params.Values['Password'] := 'masterkey';
  SQLConnection.Params.Values['ServerCharSet'] := 'WIN1252';
  SQLConnection.Params.Values['SQLDialect'] := '3';
  SQLConnection.Params.Values['ErrorResourceFile'] := EmptyStr;
  SQLConnection.Params.Values['LocaleCode'] := '0000';
  SQLConnection.Params.Values['BlobSize'] := '-1';
  SQLConnection.Params.Values['CommitRetain'] := 'True';
  SQLConnection.Params.Values['WaitOnLocks'] := 'True';
  SQLConnection.Params.Values['IsolationLevel'] := 'ReadCommitted';
  SQLConnection.Params.Values['Trim Char'] := 'False';

  SQLConnection.Open;

  if not SQLConnection.Connected then
  begin
    ShowMessage('Não foi possível conectar no banco.');
    Application.Terminate;
  end;
end;

end.
