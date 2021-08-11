unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery;

type
  TfTarefa1 = class(TForm)
    mmColunas: TMemo;
    mmTabelas: TMemo;
    mmCondicoes: TMemo;
    btnGeraSQL: TButton;
    mmSqlGerado: TMemo;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    lblSqlGerado: TLabel;
    spPropriedades: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSQLClick(Sender: TObject);

    procedure NaoPermiteEspaco(Sender: TObject; var Key: Char);
    procedure RetiraLinhasEmBranco(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaCamposSQL(poListaSql : TStringList; poMemoCampo : TMemo);
    procedure MontaSQL;

  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.CarregaCamposSQL(poListaSql: TStringList;
  poMemoCampo: TMemo);
begin
  poListaSql.Text := poMemoCampo.Text;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTarefa1.MontaSQL;
begin
  spPropriedades.LimpaObjetos;

  CarregaCamposSQL(spPropriedades.spTabelas,mmTabelas);
  CarregaCamposSQL(spPropriedades.spColunas,mmColunas);
  CarregaCamposSQL(spPropriedades.spCondicoes,mmCondicoes);

  spPropriedades.MontaSQL;
  mmSqlGerado.Lines := spPropriedades.SQL
end;

procedure TfTarefa1.NaoPermiteEspaco(Sender: TObject; var Key: Char);
begin
  if Key = #32 then
    Key:=#0;
end;

procedure TfTarefa1.RetiraLinhasEmBranco(Sender: TObject);
var
  lsItem      : String;
  liIndex     : Integer;
  loCampoMemo : TMemo;
begin
  loCampoMemo := TMemo(Sender);

  for lsItem in loCampoMemo.Lines do
  begin
    if Trim(lsItem) = EmptyStr then
    begin
      liIndex := loCampoMemo.Lines.IndexOf(lsItem);
      loCampoMemo.Lines.Delete(liIndex)
    end;
  end;
end;

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  MontaSQL;
end;



end.
