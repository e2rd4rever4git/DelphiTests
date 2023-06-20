unit neuralUnt;

interface

uses
  System.SysUtils, FANN;

const
  connection_rate = 1.0;
  num_layers = 3;
  num_input = 10;
  num_hidden = 10;
  num_output = 1;
  fn_train = 'abelone.train';
  fn_test = 'abelone.test';
  max_epochs = 1000;
  epochs_between_reports = 10;
  desired_error = 0.001;
  fn_net = 'abelone.net';

procedure annTrain();
procedure annTest();
procedure arrayTst();

implementation

uses
  frmMainUnt, VCL.Forms, System.DateUtils;

type
  TMyArray = array[0..255] of byte;
  PMyArray = ^TMyArray;

function InExeDir(const fn: string): AnsiString;
begin
  Result:=ExtractFilePath(Application.ExeName)+fn;
end;

function InDatasetsDir(const fn: string): AnsiString;
begin
  Result:=ExtractFilePath(Application.ExeName)+'datasets\'+fn;
end;

function cbf(ann: PFann; train: PFann_Train_Data; max_epochs: Cardinal; epochs_between_reports: cardinal;
              desired_error: single; epochs: cardinal): integer; cdecl;
begin
  Result:=-1;
  WriteStr(Format('Epochs: %8d MSE: %.5f Desired-MSE: %.5f', [epochs, fann_get_MSE(ann), desired_error]));
  Result:=0;
end;

procedure annTrain();
var
  ann:  PFann;
  td:   PFann_Train_Data;
begin
  WriteStr('Training network:');
  ann:=fann_create_sparse(connection_rate, num_layers, num_input, num_hidden, num_output);
  fann_set_activation_function_hidden(ann, FANN_SIGMOID_SYMMETRIC);
  fann_set_activation_function_output(ann, FANN_SIGMOID_SYMMETRIC);
 	fann_set_activation_steepness_hidden(ann, 1);
	fann_set_activation_steepness_output(ann, 1);
  fann_set_training_algorithm(ann, FANN_TRAIN_INCREMENTAL);

  fann_set_callback(ann, cbf);
  td:=fann_read_train_from_file(PAnsiChar(InDatasetsDir(fn_train)));
  fann_train_on_data(ann, td, max_epochs, epochs_between_reports, desired_error);
  //fann_train_on_file(ann, PAnsiChar(InExeDir(fn_train)), max_epochs, epochs_between_reports, desired_error);

	fann_save(ann, PAnsiChar(InDatasetsDir(fn_net)));

  fann_destroy_train(td);
	fann_destroy(ann);
end;

procedure annTest();
var
  ann:  PFann;
  td:   PFann_Train_Data;
  td_length:  cardinal;
begin
  WriteStr('Testing network:');
  ann:=fann_create_from_file(PAnsiChar(InDatasetsDir(fn_net)));
  td:=fann_read_train_from_file(PAnsiChar(InDatasetsDir(fn_test)));
  td_length:=fann_length_train_data(td);

  fann_reset_MSE(ann);
  var st:=Now;
  for var i:integer:=0 to td_length-1 do
  begin
    fann_test(ann,@(td.input[i]^),@(td.output[i]^));
    //WriteStr(FloatToStr(td.input[i][0])+' '+FloatToStr(td.input[i][1]));
    //WriteStr(FloatToStr(td.output[i][0]));
  end;
  var ms:=MillisecondsBetween(Now,st);
  WriteStr(Format('Patterns tested: %d MSE: %.5f Timing: %.5f ms', [td_length, fann_get_MSE(ann), ms/td_length]));

  fann_destroy_train(td);
  fann_destroy(ann);
end;

procedure arrayTst();
var
  a:  TMyArray;
  pa: PMyArray;
  pb: ^byte;
begin
  for var i:integer:=Low(a) to High(a) do a[i]:=255-i;
  pb:=@a;
  //pa:=@a;
  pa:=PMyArray(pb);
  //pb:=pa;//Error
  WriteStr(IntToStr(pb^));
  WriteStr(IntToStr(pa^[0]));
  WriteStr(IntToStr(pa[1]));

end;

end.
