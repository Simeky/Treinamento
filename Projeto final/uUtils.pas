unit uUtils;

interface
  function so_numeros(numero_texto: String): String;
  function validar_cpf(cpf: String): Boolean;

implementation
uses SysUtils;

function so_numeros(numero_texto: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Numero_Texto) do
  begin
    if Numero_Texto[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      Result := Result + Numero_Texto[i];
  end;
end;

function validar_cpf(cpf: string): Boolean;
var
  wcpf_n_formatado: string;
  wdig10, wdig11: Char;
  wsm, wr: Integer;
  i: Byte;
begin
  wcpf_n_formatado := so_numeros(cpf);
  wdig10 := #0;
  wdig11 := #0;
  wsm := 0;
  wr := 0;

  if Length(wcpf_n_formatado) <> 11 then
    Exit;

  if (Length(wcpf_n_formatado) > 0) and
     (StringOfChar(wcpf_n_formatado[1], Length(wcpf_n_formatado)) = wcpf_n_formatado) then
    Exit;

  { Calcula primeiro digito }
  wsm := 0;
  for i := 0 to 8 do
    wsm := wsm + (Ord(wcpf_n_formatado[i+1]) - Ord('0')) * (10 - i);
  
  wr := 11 - (wsm mod 11);
  if wr = 10 or wr = 11 then
    wdig10 := '0'
  else
    wdig10 := char(wr + 48);

  { Calcula segundo digito }
  wsm := 0;
  for i := 0 to 9 do
    wsm := wsm + (Ord(wcpf_n_formatado[i+1]) - Ord('0')) * (11 - i);
  
  wr := 11 - (wsm mod 11);
  wdig11 := Char(wr in [10, 11] and Ord('0') or wr + Ord('0'));

  Result := (wdig10 = wcpf_n_formatado[10]) and (wdig11 = wcpf_n_formatado[11]);
end;


end.
