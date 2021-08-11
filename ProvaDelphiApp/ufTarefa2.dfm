object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'Tarefa 2'
  ClientHeight = 123
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblTempo2: TLabel
    Left = 8
    Top = 54
    Width = 179
    Height = 13
    Caption = 'Tempo para itera'#231#227'o 2 (Milisegundos)'
  end
  object lblTempo1: TLabel
    Left = 8
    Top = 19
    Width = 179
    Height = 13
    Caption = 'Tempo para itera'#231#227'o 1 (Milisegundos)'
  end
  object pbTempo1: TProgressBar
    Left = 283
    Top = 16
    Width = 339
    Height = 21
    TabOrder = 1
  end
  object pbTempo2: TProgressBar
    Left = 283
    Top = 51
    Width = 339
    Height = 21
    TabOrder = 3
  end
  object edtTempo1: TEdit
    Left = 203
    Top = 16
    Width = 74
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = '0'
  end
  object edtTempo2: TEdit
    Left = 203
    Top = 51
    Width = 74
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    Text = '0'
  end
  object btnInicia: TButton
    Left = 520
    Top = 88
    Width = 102
    Height = 25
    Caption = 'Iniciar Progresso'
    TabOrder = 4
    OnClick = btnIniciaClick
  end
end
