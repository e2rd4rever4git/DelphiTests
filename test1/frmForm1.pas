unit frmForm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmForm2Unt2, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure ShowToolWin(S:TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TForm1 }

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  for var i:integer:=0 to ComponentCount-1 do
    if Components[i] is TForm2 then
    begin
      (Components[i] as TForm2).Show;
      Break;
    end;
end;

procedure TForm1.ShowToolWin(S: TObject);
begin
  TForm2.Create(Self);
end;

end.
