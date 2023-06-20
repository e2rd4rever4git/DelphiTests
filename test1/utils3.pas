unit utils3;

interface

type

  TAlphaCls = class
    public
      constructor Create;
      destructor Destroy; override;
  end;

  TBetaCls = class(TAlphaCls)
    public
      //constructor Create;
      destructor Destroy; override;
  end;

implementation

uses
  frmMainUnt;

{ TAlphaCls }

constructor TAlphaCls.Create;
begin
  WriteStr('�������� Constructor Alpha');
end;

destructor TAlphaCls.Destroy;
begin
  WriteStr('�������� Destructor Alpha');
  inherited;
end;

{ TBetaCls }

{constructor TBetaCls.Create;
begin
  inherited;
  WriteStr('�������� Constructor Beta');
end;}

destructor TBetaCls.Destroy;
begin
  WriteStr('�������� Destructor Beta');
  inherited;
end;

end.
