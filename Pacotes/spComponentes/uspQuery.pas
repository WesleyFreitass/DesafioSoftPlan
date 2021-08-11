unit uspQuery;

interface

uses
 SysUtils, Classes, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet,FireDAC.Phys.FB;

type
 TspQuery = class(TFDQuery)
 private
    FSpColunas   : TStringList;
    FSpTabelas   : TStringList;
    FSpCondicoes : TStringList;

    function MontaParteSQL(poLista : TStringList; psSeparador : String = '') : String;
    procedure ValidaCampos;
 public

    procedure MontaSQL;
    procedure LimpaObjetos;
    constructor Create(AOwner : TComponent); overload; override;
    destructor Destroy; override;
 published
    property spColunas  : TStringList read FSpColunas   write FSpColunas;
    property spTabelas  : TStringList read FSpTabelas   write FSpTabelas;
    property spCondicoes: TStringList read FSpCondicoes write FSpCondicoes;
 end;

implementation

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSpColunas   := TStringList.Create;
  FSpTabelas   := TStringList.Create;
  FSpCondicoes := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  LimpaObjetos;

  inherited;
end;

procedure TspQuery.MontaSQL;
const
  cSQL = 'SELECT %s FROM %s %s';
var
  lsColunas : String;
  lsCondicoes : String;
begin
  try
    ValidaCampos;

    lsColunas := MontaParteSQL(FSpColunas,',');

    if spCondicoes.Count > 0 then
      lsCondicoes := 'WHERE ' + MontaParteSQL(FSpCondicoes)
    else
      lsCondicoes := EmptyStr;

    Self.SQL.Text := Format(cSQL, [lsColunas,FSpTabelas.Strings[0],lsCondicoes]);

  Except
    on e: Exception do
    begin
      raise Exception.Create(e.message);
    end;
  end;
end;

procedure TspQuery.LimpaObjetos;
begin
  FSpColunas.Clear;
  FSpTabelas.Clear;
  FSpCondicoes.Clear;
end;

function TspQuery.MontaParteSQL(poLista : TStringList; psSeparador : String = '') : String;
var
  lsItem     : String;
  lsConjunto : String;
begin
  for lsItem in poLista do
  begin
    if poLista.IndexOf(lsItem) > 0 then
      lsConjunto := lsConjunto + ' ' + psSeparador + ' '+ lsItem
    else
      lsConjunto := lsItem;
  end;

  Result := lsConjunto;
end;

procedure TspQuery.ValidaCampos;
begin
  if FSpColunas.Text = EmptyStr then
    FSpColunas.Text := '*';

  if spTabelas.Text = EmptyStr then
    spTabelas.Text := 'DUAL'

  //if spTabelas.Count > 1 then
  //  raise Exception.Create('É permitido informar apenas uma tabela!');
end;

end.
