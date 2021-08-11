unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type

  TfTarefa2 = class(TForm)
    pbTempo1: TProgressBar;
    pbTempo2: TProgressBar;
    edtTempo1: TEdit;
    edtTempo2: TEdit;
    lblTempo2: TLabel;
    lblTempo1: TLabel;
    btnInicia: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIniciaClick(Sender: TObject);
  private

    procedure InciaProgresso;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

uses
  uProgresso;

{$R *.dfm}

procedure TfTarefa2.btnIniciaClick(Sender: TObject);
begin
  InciaProgresso;
end;

procedure TfTarefa2.InciaProgresso;
begin
  TProgresso.InicializaExecucao(pbTempo1,StrToInt(edtTempo1.Text));
  TProgresso.InicializaExecucao(pbTempo2,StrToInt(edtTempo2.Text));
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
