object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'Tarefa 3'
  ClientHeight = 360
  ClientWidth = 733
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gdValoresProjetos: TDBGrid
    Left = 0
    Top = 25
    Width = 733
    Height = 231
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnlRodaPe: TPanel
    Left = 0
    Top = 256
    Width = 733
    Height = 104
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object lblSomaTotal: TLabel
      Left = 609
      Top = 7
      Width = 40
      Height = 13
      Caption = 'Total R$'
    end
    object lblSomaTotalDivisoes: TLabel
      Left = 609
      Top = 56
      Width = 81
      Height = 13
      Caption = 'Total divis'#245'es R$'
    end
    object edtSomaTotal: TEdit
      Left = 609
      Top = 24
      Width = 121
      Height = 21
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
    end
    object edtSomaTotalDivisoes: TEdit
      Left = 609
      Top = 73
      Width = 121
      Height = 21
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 1
    end
    object btnSomaTotal: TButton
      Left = 498
      Top = 22
      Width = 107
      Height = 25
      Caption = 'Obter Total'
      TabOrder = 2
      OnClick = btnSomaTotalClick
    end
    object btnSomaTotalDivisoes: TButton
      Left = 498
      Top = 71
      Width = 107
      Height = 25
      Caption = 'Obter Total Divis'#245'es'
      TabOrder = 3
      OnClick = btnSomaTotalDivisoesClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 733
    Height = 25
    Align = alTop
    TabOrder = 2
    object lblTopo: TLabel
      Left = 16
      Top = 6
      Width = 96
      Height = 13
      Caption = 'Valores por projeto:'
    end
  end
end
