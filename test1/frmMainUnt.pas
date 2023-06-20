unit frmMainUnt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ////
  utils, utils2, utils3, frmForm1, neuralUnt, //FannNetwork, FANN,
  ////
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.ActnCtrls,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnMenus, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.Grids, Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    ActionManager1: TActionManager;
    ActionMainMenuBar1: TActionMainMenuBar;
    ImageList1: TImageList;
    Action1: TAction;
    actANN_F1: TAction;
    ActionToolBar1: TActionToolBar;
    actANN_F2: TAction;
    mmoResult: TMemo;
    Action4: TAction;
    procedure Execute1(Sender: TObject);
    procedure Execute2(Sender: TObject);
    procedure Execute3(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure actANN_F1Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure actANN_F2Execute(Sender: TObject);
  private
    { Private declarations }
    procedure IntTest(const i:IFoo);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

procedure WriteStr(const s:string);

implementation

{$R *.dfm}

procedure WriteStr(const s:string);
begin
  frmMain.mmoResult.Lines.Add(s);
end;

procedure TfrmMain.actANN_F2Execute(Sender: TObject);
begin
  arrayTst();
end;

procedure TfrmMain.Action1Execute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.actANN_F1Execute(Sender: TObject);
begin
  annTrain();
  annTest();
end;

procedure TfrmMain.Action4Execute(Sender: TObject);
begin
  with TForm1.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.Execute1(Sender: TObject);
var
  ACls: TACls;
  i:    integer;
begin
  ACls:=TACls.Create;
  try
    mmoResult.Lines.Add(ACls.GetMnemo);
    i:=sizeof(ACls);
  finally
    ACls.Free;
  end;

  (Sender as TButton).Caption:='Рулит!';
end;

procedure TfrmMain.Execute2(Sender: TObject);
var
  ACls: TACls;
begin
  var r:TFoo;
  r.i:=100;
  r.s:='goblins';
  r.c:=2;
  r.a:=$0000;
  r.b:=$FF;
  mmoResult.Lines.Add(IntToStr(r.a));
  mmoResult.Lines.Add(IntToStr(r.b));
  mmoResult.Lines.Add(IntToStr(r.c));
  for var i:TMyColors:=Low(TMyColors) to High(TMyColors) do
    mmoResult.Lines.Add(clrMnemo[i]);
  //edtResult.Text:=IntToStr(r.a);
  ACls:=TACls.Create;
  try
    IntTest(ACls);
  finally
    ACls.Free;
  end;
end;

function foo(i:integer):integer; stdcall; external 'dll_test.dll';
procedure TfrmMain.Execute3(Sender: TObject);
begin
  var B:TAlphaCls:=TBetaCls.Create;
  try
    WriteStr('bla-bla...');
    //WriteStr(DLL_FILE);

  finally
    B.Free;
  end;
  WriteStr(IntToStr(foo(2)));
end;

procedure TfrmMain.IntTest(const i: IFoo);
var
  b:integer;
const
  c:string = 'hellow';
begin
  mmoResult.Lines.Add('Interface:');
  mmoResult.Lines.Add(IntToStr(i.Add(3,2)));
end;

end.
