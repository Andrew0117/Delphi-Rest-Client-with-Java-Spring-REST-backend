object SimpleRESTClientForm: TSimpleRESTClientForm
  Left = 558
  Top = 198
  Width = 281
  Height = 395
  Caption = 'Simple example Delphi REST client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNone
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 2
    Width = 9
    Height = 13
    Caption = 'Id'
  end
  object Label2: TLabel
    Left = 16
    Top = 36
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Button1: TButton
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 96
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 96
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Get by Id'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 176
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Get all'
    TabOrder = 4
    OnClick = Button5Click
  end
  object idEdit: TEdit
    Left = 16
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object nameEdit: TEdit
    Left = 16
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object traceMemo: TMemo
    Left = 0
    Top = 136
    Width = 265
    Height = 221
    Align = alBottom
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 7
  end
end
