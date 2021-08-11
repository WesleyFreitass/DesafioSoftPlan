object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'Tarefa 1'
  ClientHeight = 411
  ClientWidth = 649
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
  object lblColunas: TLabel
    Left = 24
    Top = 29
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lblTabelas: TLabel
    Left = 232
    Top = 29
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lblCondicoes: TLabel
    Left = 440
    Top = 29
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object lblSqlGerado: TLabel
    Left = 24
    Top = 221
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object mmColunas: TMemo
    Left = 24
    Top = 48
    Width = 185
    Height = 153
    TabOrder = 0
    OnExit = RetiraLinhasEmBranco
    OnKeyPress = NaoPermiteEspaco
  end
  object mmTabelas: TMemo
    Left = 232
    Top = 48
    Width = 185
    Height = 153
    TabOrder = 1
    OnExit = RetiraLinhasEmBranco
    OnKeyPress = NaoPermiteEspaco
  end
  object mmCondicoes: TMemo
    Left = 440
    Top = 48
    Width = 185
    Height = 153
    TabOrder = 2
    OnExit = RetiraLinhasEmBranco
  end
  object btnGeraSQL: TButton
    Left = 550
    Top = 207
    Width = 75
    Height = 25
    Caption = 'GeraSQL'
    TabOrder = 3
    OnClick = btnGeraSQLClick
  end
  object mmSqlGerado: TMemo
    Left = 24
    Top = 240
    Width = 601
    Height = 153
    TabOrder = 4
  end
  object spPropriedades: TspQuery
    Left = 416
    Top = 200
  end
end
