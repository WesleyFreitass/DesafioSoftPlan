unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfTarefas = class(TForm)
    mnPrincipal: TMainMenu;
    mniTarefas: TMenuItem;
    smiTarefa1: TMenuItem;
    smiTarefa2: TMenuItem;
    smiTarefa3: TMenuItem;
    procedure smiTarefa1Click(Sender: TObject);
    procedure smiTarefa2Click(Sender: TObject);
    procedure smiTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefas: TfTarefas;

implementation

uses
  ufTarefa1, ufTarefa2, ufTarefa3;

{$R *.dfm}

procedure TfTarefas.smiTarefa1Click(Sender: TObject);
begin
  Application.CreateForm(TfTarefa1,fTarefa1);
end;

procedure TfTarefas.smiTarefa2Click(Sender: TObject);
begin
  Application.CreateForm(TfTarefa2,fTarefa2);
end;

procedure TfTarefas.smiTarefa3Click(Sender: TObject);
begin
  Application.CreateForm(TfTarefa3,fTarefa3);
end;

end.
