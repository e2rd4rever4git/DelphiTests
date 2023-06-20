// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
// JCL_DEBUG_EXPERT_INSERTJDBG OFF
// JCL_DEBUG_EXPERT_DELETEMAPFILE OFF
program test1;

uses
  Vcl.Forms,
  frmMainUnt in 'frmMainUnt.pas' {frmMain},
  utils in 'utils.pas',
  utils2 in 'utils2.pas',
  utils3 in 'utils3.pas',
  frmForm1 in 'frmForm1.pas' {Form1},
  frmForm2Unt2 in 'frmForm2Unt2.pas' {Form2},
  neuralUnt in 'neuralUnt.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
