unit udmTreinamento;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, Dialogs, Forms, FMTBcd,
  DBClient, Provider;

type
  TdmTreinamento = class(TDataModule)
    SQLConnection: TSQLConnection;
    t_pessoa: TSQLTable;
    dsp_pessoa: TDataSetProvider;
    cds_pessoa: TClientDataSet;
    t_espaco: TSQLTable;
    dsp_espaco: TDataSetProvider;
    cds_espaco: TClientDataSet;
    t_etapa: TSQLTable;
    dsp_etapa: TDataSetProvider;
    cds_etapa: TClientDataSet;
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
