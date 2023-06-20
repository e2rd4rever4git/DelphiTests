program test2;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {MainForm},
  frmCh1Unt in 'frmCh1Unt.pas' {frmCh1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmCh1, frmCh1);
  Application.Run;
end.
