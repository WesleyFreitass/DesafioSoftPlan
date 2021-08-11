unit uProgresso;

interface

uses Vcl.ComCtrls, Classes;

type
  TProgresso = class(TThread)

    FoBarraDeProgresso : TProgressBar;
    FiTempoEspera      : Integer;

    procedure Execute; override;
    constructor InicializaExecucao(poBarraDeProgresso: TProgressBar; piTempoEspera : Integer);
  end;

implementation

{ TProgresso }

procedure TProgresso.Execute;
var
  liX : Integer;
begin
  for liX := 0 to 100 do
  begin
    FoBarraDeProgresso.Position := liX;

    Sleep(FiTempoEspera);
  end;
end;

constructor TProgresso.InicializaExecucao(poBarraDeProgresso: TProgressBar; piTempoEspera : Integer);
begin
  Create(False);
  FreeOnTerminate    := True;

  FoBarraDeProgresso := poBarraDeProgresso;
  FiTempoEspera      := piTempoEspera;
end;

end.
