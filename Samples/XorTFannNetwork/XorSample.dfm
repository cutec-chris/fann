object Form1: TForm1
  Left = 278
  Top = 151
  BorderStyle = bsSingle
  Caption = 'Delphi FANN Xor Demo'
  ClientHeight = 124
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LblError: TLabel
    Left = 120
    Top = 12
    Width = 111
    Height = 13
    Caption = 'Mean Square Error:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblMSE: TLabel
    Left = 232
    Top = 12
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnTrain: TButton
    Left = 8
    Top = 56
    Width = 97
    Height = 25
    Caption = 'Train'
    Enabled = False
    TabOrder = 0
    OnClick = btnTrainClick
  end
  object btnRun: TButton
    Left = 8
    Top = 96
    Width = 97
    Height = 25
    Caption = 'Run'
    Enabled = False
    TabOrder = 1
    OnClick = btnRunClick
  end
  object memoXor: TMemo
    Left = 120
    Top = 32
    Width = 169
    Height = 89
    ReadOnly = True
    TabOrder = 2
  end
  object btnBuild: TButton
    Left = 8
    Top = 16
    Width = 97
    Height = 25
    Caption = 'Build'
    TabOrder = 3
    OnClick = btnBuildClick
  end
  object NN: TFannNetwork
    Layers.Strings = (
      '2'
      '3'
      '1')
    LearningRate = 0.699999988079071100
    ConnectionRate = 1.000000000000000000
    TrainingAlgorithm = taFANN_TRAIN_RPROP
    ActivationFunctionHidden = afFANN_SIGMOID
    ActivationFunctionOutput = afFANN_SIGMOID
    Left = 192
    Top = 40
  end
end
