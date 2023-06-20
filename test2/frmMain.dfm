object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 635
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 128
    ExplicitWidth = 150
  end
  object MainMenu1: TMainMenu
    Left = 48
    Top = 64
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open'
      end
      object Close1: TMenuItem
        Caption = 'Close'
      end
    end
  end
end
