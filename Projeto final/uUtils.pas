unit uUtils;

interface
  function so_numeros(pr_numero_texto: String): String;
  function validar_cpf(pr_cpf: String): Boolean;
  function validar_cnpj(pr_cnpj: String): Boolean;
  function validar_email(pr_email: String): Boolean;

implementation
uses SysUtils;

function so_numeros(pr_numero_texto: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(pr_numero_texto) do
  begin
    if pr_numero_texto[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      Result := Result + pr_numero_texto[i];
  end;
end;

function validar_cpf(pr_cpf: string): Boolean;
var
  wcpfNumeros: string;
  wdigito10, wdigito11: Char;
  wsoma, wresto: Integer;
  i: Byte;
begin
  Result := False;
  wcpfNumeros := so_numeros(pr_cpf);

  if Length(wcpfNumeros) <> 11 then
    Exit;

  //Evita CPFs com um único tipo de digito.
  if StringOfChar(wcpfNumeros[1], 11) = wcpfNumeros then 
    Exit;

  //Primeiro dígito verificador
  wsoma := 0;
  for i := 0 to 8 do
    wsoma := wsoma + (Ord(wcpfNumeros[i + 1]) - Ord('0')) * (10 - i);

  wresto := 11 - (wsoma mod 11);
  if wresto >= 10 then
    wdigito10 := '0'
  else
    wdigito10 := Char(wresto + Ord('0'));

  //Segundo dígito verificador
  wsoma := 0;
  for i := 0 to 9 do
    wsoma := wsoma + (Ord(wcpfNumeros[i + 1]) - Ord('0')) * (11 - i);

  wresto := 11 - (wsoma mod 11);
  if wresto >= 10 then
    wdigito11 := '0'
  else
    wdigito11 := Char(wresto + Ord('0'));

  Result := (wdigito10 = wcpfNumeros[10]) and (wdigito11 = wcpfNumeros[11]);
end;

//------------//------------//

function validar_cnpj(pr_cnpj: String): Boolean;
const
  wpeso1: array[1..12] of Integer = (5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2);
  wpeso2: array[1..13] of Integer = (6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2);
var
  wcnpjNumeros: string;
  wdigito13, wdigito14: Char;
  wsoma, wresto: Integer;
  i: Integer;
begin
  Result := False;
  wcnpjNumeros := so_numeros(pr_cnpj);

  if Length(wcnpjNumeros) <> 14 then
    Exit;

  //Evita CNPJs com um único tipo de digito.
  if StringOfChar(wcnpjNumeros[1], 14) = wcnpjNumeros then
    Exit;

  //Cálculo do 13º dígito (primeiro verificador)
  wsoma := 0;
  for i := 1 to 12 do
    wsoma := wsoma + (Ord(wcnpjNumeros[i]) - Ord('0')) * wpeso1[i];

  wresto := wsoma mod 11;
  if wresto < 2 then
    wdigito13 := '0'
  else
    wdigito13 := Char((11 - wresto) + Ord('0'));

  //Cálculo do 14º dígito (segundo verificador)
  wsoma := 0;
  for i := 1 to 13 do
    wsoma := wsoma + (Ord(wcnpjNumeros[i]) - Ord('0')) * wpeso2[i];

  wresto := wsoma mod 11;
  if wresto < 2 then
    wdigito14 := '0'
  else
    wdigito14 := Char((11 - wresto) + Ord('0'));

  Result := (wdigito13 = wcnpjNumeros[13]) and (wdigito14 = wcnpjNumeros[14]);
end;

//Verifica se possui @ e . no email
function validar_email(pr_email: string): Boolean;
begin
  Result := (Pos('@', pr_email) > 1) and
            (Pos('.', Copy(pr_email, Pos('@', pr_email) + 2, Length(pr_email))) > 0);
end;



end.
