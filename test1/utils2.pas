unit utils2;

interface

type
  TFoo = record
    i:  integer;
    s:  string;
    case c:Integer of
      1: (a:int32);
      2: (b:byte);
  end;

  IFoo = interface
    ['{FD1AC71F-6763-401D-8F4C-1C9FCD44F0A3}']
    function Add(a:integer; b:integer):integer;
    procedure Show;
  end;

implementation

end.
