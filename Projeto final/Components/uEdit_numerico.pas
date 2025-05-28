unit uEdit_numerico;

interface

uses
  SysUtils, Classes, Controls, StdCtrls;

type
  TEdit_numerico = class(TEdit)
  private
    { Private declarations }
    f_decimal: Boolean;
    f_separador: Char;
    function getId: integer;
    procedure setId(const Value: integer);
    function getValor: Extended;
    procedure setValor(const Value: Extended);
  protected
    procedure KeyPress(var Key: Char); override;
    { Protected declarations }
    
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
    
  published
    { Published declarations }
    property id: integer read getId write setId;
    property valor: Extended read getValor write setValor;

    property decimal: Boolean read f_decimal write f_decimal;
    property separador: Char read f_separador write f_separador;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Academia SCI', [TEdit_numerico]);
end;

{ TEdit_numerico }

constructor TEdit_numerico.Create(AOwner: TComponent);
begin
  inherited;
  decimal := false;
  separador := ',';
  Text := EmptyStr;
end;

procedure TEdit_numerico.KeyPress(var Key: Char);
begin
  inherited;
  if decimal then
  begin
    if Key = #46 then       //46 = Delete
      Key := separador;

    if not (Key in['0'..'9', Chr(8), separador]) then //8 = Backspace
      Key := #0   //Anula a tecla
    else
    if (Key = separador) and (Pos(Key, Text) > 0) then
      Key := #0;
  end
  else
  begin
    if not (Key in['0'..'9', Chr(8)]) then
      Key := #0;
  end;
end;

//Getters 'n Setters

function TEdit_numerico.getId: integer;
begin
  Result := StrToIntDef(Text, 0);
end;

procedure TEdit_numerico.setId(const Value: integer);
begin
  Text := IntToStr(Value);
end;

function TEdit_numerico.getValor: Extended;
begin
  Result := StrToFloatDef(Text, 0);
end;

procedure TEdit_numerico.setValor(const Value: Extended);
begin
  Text := FloatToStr(Value);
end;

end.
