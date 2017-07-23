unit XorSample;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FannNetwork, StdCtrls;

type
  TForm1 = class(TForm)
    btnTrain: TButton;
    LblError: TLabel;
    lblMSE: TLabel;
    btnRun: TButton;
    memoXor: TMemo;
    btnBuild: TButton;
    NN: TFannNetwork;
    procedure btnTrainClick(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure btnBuildClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnTrainClick(Sender: TObject);
var inputs: array [0..1] of single;
    outputs: array [0..0] of single;
    e,i,j: integer;
    mse: single;
begin


        //Train the network
        for e:=1 to 30000 do //Train 30000 epochs
        begin

                for i:=0 to 1 do
                begin
                        for j:=0 to 1 do
                        begin
                            inputs[0]:=i;
                            inputs[1]:=j;
                            outputs[0]:=i Xor j;

                            mse:=NN.Train(inputs,outputs);
                            lblMse.Caption:=Format('%.4f',[mse]);
                            Application.ProcessMessages;

                        end;
                end;
        end;

        
        ShowMessage('Network Training Ended');

end;

procedure TForm1.btnRunClick(Sender: TObject);
var i,j: integer;
    output: array [0..0] of single;
    inputs: array [0..1] of single;

begin

     MemoXOR.Lines.Clear;

     for i:=0 to 1 do
     begin
        for j:=0 to 1 do
        begin

                inputs[0]:=i;
                inputs[1]:=j;
                NN.Run(inputs,output);
                MemoXor.Lines.Add(Format('%d XOR %d = %f',[i,j,Output[0]]));
        end;
     end;

     
end;

procedure TForm1.btnBuildClick(Sender: TObject);
begin
        NN.Build;
        btnBuild.Enabled:=false;
        BtnTrain.Enabled:=true;
        btnRun.Enabled:=true;

end;

end.
