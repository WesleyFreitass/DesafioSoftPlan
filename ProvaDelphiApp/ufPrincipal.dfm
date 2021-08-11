object fTarefas: TfTarefas
  Left = 0
  Top = 0
  Caption = 'ProvaDelphiApp'
  ClientHeight = 512
  ClientWidth = 819
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object mnPrincipal: TMainMenu
    Left = 192
    Top = 8
    object mniTarefas: TMenuItem
      Caption = 'Tarefas'
      object smiTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = smiTarefa1Click
      end
      object smiTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = smiTarefa2Click
      end
      object smiTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = smiTarefa3Click
      end
    end
  end
end
