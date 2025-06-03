unit uCadastroPadraoMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, ExtCtrls, DBClient, StdCtrls, DB, Mask,
  uPadraoSimples;

type
  TfrCadastroPadraoMDI = class(TfrPadraoSimples)
    tbt_consultar: TToolButton;
    pa_cadastro: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure ed_idExit(Sender: TObject);
    procedure tbt_confirmarClick(Sender: TObject);
    procedure tbt_cancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbt_consultarClick(Sender: TObject);

  private
    { Private declarations }
    f_tabela : TClientDataSet;
    f_indice: String;
    f_edit_id: TEdit;
  public
    { Public declarations }
    function setTabela: TClientDataSet; virtual; abstract;
    function setIndice: String; virtual; abstract;
    function setEdit_id: TEdit; virtual; abstract;
    procedure salvar; virtual; abstract;
    function consultar: TForm; virtual; abstract;
    procedure carregar; virtual; abstract;
    procedure limpar_campos; virtual;
    function get_chave_composta: Boolean; virtual;
    function get_insercao_chave_composta: Boolean; virtual;
    function validar: Boolean; virtual;
  published
    property tabela: TClientDataSet read f_tabela write f_tabela;
  end;

var
  frCadastroPadraoMDI: TfrCadastroPadraoMDI;

implementation

uses udmTreinamento;

{$R *.dfm}

{ TfrCadastroPadraoMDI }

function TfrCadastroPadraoMDI.get_chave_composta: Boolean;
begin
  Result := false;
end;

function TfrCadastroPadraoMDI.get_insercao_chave_composta: Boolean;
begin
  Result := false;
end;

procedure TfrCadastroPadraoMDI.limpar_campos;
var
  i: integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if self.Components[i] <> f_edit_id then
      begin
        if self.Components[i] is TEdit then
          TEdit(self.Components[i]).Clear
        else
        if self.Components[i] is TComboBox then
          TComboBox(self.Components[i]).ItemIndex := -1
        else
        if self.Components[i] is TMaskEdit then
          TMaskEdit(self.Components[i]).Clear
        else
        if self.Components[i] is TDateTimePicker then
          TDateTimePicker(self.Components[i]).CleanupInstance
      end;
  end;

end;

procedure TfrCadastroPadraoMDI.FormCreate(Sender: TObject);
begin
  inherited;
  f_tabela  := setTabela;
  f_indice  := setIndice;
  f_edit_id := setEdit_id;

  if Assigned(f_edit_id) then
    f_edit_id.OnExit := ed_idExit;

  if (Trim(f_indice) <> EmptyStr) and Assigned(f_tabela) then
  begin
    f_tabela.IndexDefs.Clear;
    f_tabela.IndexDefs.Add('iPK' + f_indice, f_indice, [ixCaseInsensitive]);
    f_tabela.IndexFieldNames := f_indice;
    f_tabela.Open;
  end;

  limpar_campos;

end;

procedure TfrCadastroPadraoMDI.ed_idExit(Sender: TObject);
var
  w_encontrou: Boolean;
begin
  if Assigned(f_tabela) and Assigned(f_edit_id) then
  begin
    f_tabela.IndexFieldNames := f_indice;
    if Pos(';', f_indice) > 0 then
      w_encontrou := get_chave_composta
    else
      w_encontrou := f_tabela.FindKey([StrToIntDef(Trim(f_edit_id.Text), 0)]);

    if w_encontrou then
      carregar
    else
      limpar_campos;
  end;

end;

procedure TfrCadastroPadraoMDI.tbt_confirmarClick(Sender: TObject);
var
  w_encontrou: Boolean;
begin
  inherited;
  if Assigned(f_tabela) and Assigned(f_edit_id) then
  begin
    f_tabela.IndexFieldNames := f_indice;
    if Pos(';', f_indice) > 0 then
      w_encontrou := get_chave_composta
    else
      w_encontrou := f_tabela.FindKey([StrToIntDef(Trim(f_edit_id.Text), 0)]);

    if w_encontrou then
      f_tabela.Edit
    else
    begin
      f_tabela.Insert;
      if not get_insercao_chave_composta then
        f_tabela.FieldByName(f_indice).AsInteger := StrToIntDef(f_edit_id.Text, 0);
    end;

    salvar;

    if validar then
    begin
      f_tabela.Post;
      f_tabela.ApplyUpdates(0);
      f_tabela.Refresh;
      limpar_campos;
      if f_edit_id.CanFocus then
        f_edit_id.SetFocus;
    end
    else
      f_tabela.Cancel;    

  end;
end;

procedure TfrCadastroPadraoMDI.tbt_cancelarClick(Sender: TObject);
var
  wIndice : String;
  wEdit   : TEdit;
begin
  //inherited;
  wIndice := f_indice;
  wEdit   := f_edit_id;
  //if MessageDlg('Deseja realmente excluir esse registro?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  //begin    ta bugado
    if Assigned(f_tabela) and Assigned(wEdit) then
    begin
      f_tabela.IndexFieldNames := wIndice;
      if f_tabela.FindKey([StrToIntDef(Trim(wEdit.Text), 0)]) then
        f_tabela.Delete;

      f_tabela.ApplyUpdates(0);
      f_tabela.Refresh;

      //ShowMessage('Registro Excluído com sucesso.');  Causa access violation

      if f_edit_id.CanFocus then
        f_edit_id.SetFocus;

    end;
  //end;
end;

procedure TfrCadastroPadraoMDI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
  begin
    if ActiveControl <> f_edit_id then
      f_edit_id.SetFocus
    else
      inherited;
  end;
end;

procedure TfrCadastroPadraoMDI.tbt_consultarClick(Sender: TObject);
begin
  inherited;
  consultar;
end;

function TfrCadastroPadraoMDI.validar: Boolean;
begin
  Result := true;
end;

end.
