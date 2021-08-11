unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, System.Math, MidasLib;

type
  TfTarefa3 = class(TForm)
    gdValoresProjetos: TDBGrid;
    pnlRodaPe: TPanel;
    edtSomaTotal: TEdit;
    edtSomaTotalDivisoes: TEdit;
    btnSomaTotal: TButton;
    btnSomaTotalDivisoes: TButton;
    lblSomaTotal: TLabel;
    lblSomaTotalDivisoes: TLabel;
    Panel1: TPanel;
    lblTopo: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSomaTotalClick(Sender: TObject);
    procedure btnSomaTotalDivisoesClick(Sender: TObject);
  private
    { Private declarations }
    FoClientProjetos : TClientDataSet;
    FoDsProjetos     : TDataSource;

    procedure CriaComponentes;
    procedure CriaColunasCDS;
    procedure CarregaProjetos;
    procedure LimpaObjetos;

    function FazSomaTotal : Double;
    function FazSomaTotalDivisoes : Double;

  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btnSomaTotalClick(Sender: TObject);
begin
  edtSomaTotal.Text := FloatToStr(FazSomaTotal);
end;

procedure TfTarefa3.btnSomaTotalDivisoesClick(Sender: TObject);
begin
  edtSomaTotalDivisoes.Text := FloatToStr(FazSomaTotalDivisoes);
end;

procedure TfTarefa3.CarregaProjetos;
var
  liX : Integer;
begin
  for liX := 1 to 10 do
    FoClientProjetos.InsertRecord([liX, 'Projeto '+IntToStr(liX), IntToStr(RandomRange(1,1000))]);

   gdValoresProjetos.DataSource := FoDsProjetos;
end;

procedure TfTarefa3.CriaColunasCDS;
begin
  FoClientProjetos.FieldDefs.Clear;
  FoClientProjetos.FieldDefs.Add('IdProjeto'  ,ftInteger);
  FoClientProjetos.FieldDefs.Add('NomeProjeto',ftString, 85, True);
  FoClientProjetos.FieldDefs.Add('Valor'      ,ftCurrency);

  FoClientProjetos.CreateDataSet;
end;

procedure TfTarefa3.CriaComponentes;
begin
  FoClientProjetos     := TClientDataSet.Create(Nil);
  FoDsProjetos         := TDataSource.Create(Nil);
  FoDsProjetos.DataSet := FoClientProjetos;

  CriaColunasCDS;
end;

procedure TfTarefa3.LimpaObjetos;
begin
  FoClientProjetos.Free;
  FoDsProjetos.Free;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LimpaObjetos;
  Action := caFree;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  CriaComponentes;
  CarregaProjetos;
end;

function TfTarefa3.FazSomaTotal: Double;
var
  ldSoma : Double;
begin
  ldSoma := 0;

  FoClientProjetos.First;
  FoClientProjetos.DisableControls;

  while not FoClientProjetos.eof do
  begin
    ldSoma := ldSoma + FoClientProjetos.FieldByName('Valor').AsFloat;
    FoClientProjetos.Next;
  end;

  FoClientProjetos.First;
  FoClientProjetos.EnableControls;

  Result := ldSoma;
end;

function TfTarefa3.FazSomaTotalDivisoes: Double;
var
  ldSomaDivisoes : Double;
  ldValorAnterior : Double;
  ldValorSeguinte : Double;
begin
  ldSomaDivisoes := 0;

  FoClientProjetos.First;
  FoClientProjetos.DisableControls;

  while not FoClientProjetos.eof do
  begin
    ldValorAnterior := FoClientProjetos.FieldByName('Valor').AsFloat;
    FoClientProjetos.Next;

    if not FoClientProjetos.eof then
    begin
      ldValorSeguinte := FoClientProjetos.FieldByName('Valor').AsFloat;

      ldSomaDivisoes := ldSomaDivisoes + (ldValorSeguinte/ldValorAnterior);
    end;
  end;

  FoClientProjetos.First;
  FoClientProjetos.EnableControls;

  Result := ldSomaDivisoes;
end;

end.
