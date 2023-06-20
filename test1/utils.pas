unit utils;

interface

uses
  Generics.Collections,
  utils2;

type
  TMyColors = (clRed, clGreen, clBlue);

const
  clrMnemo: array[TMyColors] of string = ('RED','GREEN','BLUE');

type
  TAcls = class(TInterfacedObject, IFoo)
  private
    FList:  TList<TMyColors>;
    FStr: String;
  public
      constructor Create;
      destructor Destroy; override;
      function GetStr(): string;
      function GetMnemo(): string;
      //
      function IFoo.Add = plus;
      procedure IFoo.Show = pokaz;
      function plus(a:integer;b:integer):integer;
      procedure pokaz;
  end;

implementation

{ TAcls }

constructor TAcls.Create;
begin
  FStr:='hellow';
  FList:=TList<TMyColors>.Create;
  FList.Add(clRed);
  FList.Add(clRed);
  FList.Add(clGreen);
end;

destructor TAcls.Destroy;
begin
  FList.Free;
  inherited;
end;

function TAcls.GetMnemo: string;
begin
  Result:=clrMnemo[FList[0]];
end;

function TAcls.GetStr: string;
begin
  Result:=FStr;
end;

function TAcls.plus(a, b: integer): integer;
begin
  Result:=a+b;
end;

procedure TAcls.pokaz;
begin
  //
end;

initialization

finalization

end.
