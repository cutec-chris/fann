unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Spin, FannNetwork;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnLoad: TButton;
    btnBuild: TButton;
    btnTrain: TButton;
    btnRun: TButton;
    btnLoadNet: TButton;
    btnAbout: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblY1: TLabel;
    lblY2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblY0: TLabel;
    lblResult: TLabel;
    lblMSE: TLabel;
    NeuralNetwork: TFannNetwork;
    imgTest: TImage;
    imgTrain1: TImage;
    imgTrain2: TImage;
    imgTrain3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    spEpochs: TSpinEdit;
    procedure btnAboutClick(Sender: TObject);
    procedure btnBuildClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnLoadNetClick(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure btnTrainClick(Sender: TObject);
    procedure spEpochsChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation
uses
  math, srcabout;

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnLoadClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    imgTest.Picture.LoadFromFile(UTF8ToSys(OpenDialog1.FileName));
end;

procedure TForm1.btnLoadNetClick(Sender: TObject);
begin
  if FileExists('trainingdata.net') then
    NeuralNetwork.LoadFromFile('trainingdata.net')
  else
    ShowMessage('File trainingdata.net does not exists. First train network by "Train" button.');
end;

procedure TForm1.btnRunClick(Sender: TObject);
var
  inputs: array[0..7055] of single;
  outputs: array[0..2] of single;
  x, y: longint;
  c: TColor;
  R: byte;
  mx: single;
begin
  //initialize outputs
  outputs[0] := 0;
  outputs[1] := 0;
  outputs[2] := 0;

  //reading test image
  for x := 0 to 83 do
    for y := 0 to 83 do
    begin
      c := imgTest.Picture.Bitmap.Canvas.Pixels[x, y];
      R := byte(c);
      inputs[y + x * 84] := R / 255;
    end;

  NeuralNetwork.Run(inputs, outputs);
  mx := math.maxvalue(outputs);

  if mx = outputs[0] then
    lblResult.Caption := 'Recognized letter is A'
  else if mx = outputs[1] then
    lblResult.Caption := 'Recognized letter is B'
  else if mx = outputs[2] then
    lblResult.Caption := 'Recognized letter is C'
  else
    lblResult.Caption := 'Letter was nod recognized';



  lblY0.Caption := Format('Y(0) = %3.2f',[outputs[0]]);
  lblY1.Caption := Format('Y(1) = %3.2f',[outputs[1]]);
  lblY2.Caption := Format('Y(2) = %3.2f',[outputs[2]]);

end;

procedure TForm1.btnTrainClick(Sender: TObject);
const
  outputs1: array[0..2] of single = (1, 0, 0);
  outputs2: array[0..2] of single = (0, 1, 0);
  outputs3: array[0..2] of single = (0, 0, 1);
var
  inputs1, inputs2, inputs3: array[0..7055] of single;
  x, y, i: longint;
  c: TColor;
  R: byte;
begin
  btnTrain.Enabled := false;
  for x := 0 to 83 do
    for y := 0 to 83 do
    begin
      c := imgTrain1.Picture.Bitmap.Canvas.Pixels[x, y];
      R := byte(c);
      inputs1[y + x * 84] := R / 255;

      c := imgTrain2.Picture.Bitmap.Canvas.Pixels[x, y];
      R := byte(c);
      inputs2[y + x * 84] := R / 255;

      c := imgTrain3.Picture.Bitmap.Canvas.Pixels[x, y];
      R := byte(c);
      inputs3[y + x * 84] := R / 255;
    end;

  for i := 1 to spEpochs.Value do
  begin
    NeuralNetwork.Train(inputs1, outputs1);
    NeuralNetwork.Train(inputs2, outputs2);
    NeuralNetwork.Train(inputs3, outputs3);

    lblMSE.Caption := FloatToStr(NeuralNetwork.MSE);
    Application.ProcessMessages;
    Sleep(5);
    if Application.Terminated then Break;
  end;
  NeuralNetwork.SaveToFile('trainingdata.net');
  ShowMessage('Network training ended!');
  btnTrain.Enabled := true;
end;

procedure TForm1.spEpochsChange(Sender: TObject);
begin
  btnBuild.Enabled := true;
  btnTrain.Enabled := false;
  btnLoadNet.Enabled := false;
  btnRun.Enabled := false;
  NeuralNetwork.UnBuild;
end;

procedure TForm1.btnBuildClick(Sender: TObject);
begin

  NeuralNetwork.Build;

  btnTrain.Enabled := true;
  btnRun.Enabled := true;
  btnLoadnet.Enabled := true;
  btnBuild.Enabled := false;
end;

procedure TForm1.btnAboutClick(Sender: TObject);
begin
  frmAbout.ShowModal;
end;

end.

