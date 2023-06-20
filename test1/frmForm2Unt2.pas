unit frmForm2Unt2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

uses
  frmMainUnt;

{ TForm2 }

constructor TForm2.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  WriteStr('Бабай создан!');
end;

destructor TForm2.Destroy;
begin
  WriteStr('Бабай уничтожен!');
  inherited;
end;

end.
