object mainForm: TmainForm
  Left = 360
  Top = 310
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1086#1094#1077#1085#1082#1080' '#1074#1088#1077#1084#1077#1085#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' API-'#1092#1091#1085#1082#1094#1080#1081
  ClientHeight = 426
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 8
    Width = 97
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1063#1080#1089#1083#1086' '#1080#1090#1077#1088#1072#1094#1080#1081
  end
  object Label2: TLabel
    Left = 104
    Top = 48
    Width = 257
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1042#1099#1073#1086#1088' API-'#1092#1091#1085#1082#1094#1080#1080
  end
  object Label3: TLabel
    Left = 208
    Top = 8
    Width = 153
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1044#1086#1074#1077#1088#1080#1090#1077#1083#1100#1085#1072#1103' '#1074#1077#1088#1086#1103#1090#1085#1086#1089#1090#1100
  end
  object Label4: TLabel
    Left = 368
    Top = 8
    Width = 153
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1057#1088#1077#1076#1085#1077#1077' '#1074#1088#1077#1084#1103' API-'#1092#1091#1085#1082#1094#1080#1080
  end
  object Label5: TLabel
    Left = 528
    Top = 8
    Width = 265
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1043#1088#1072#1085#1080#1094#1099' '#1076#1086#1074#1077#1088#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1080#1085#1090#1077#1088#1074#1072#1083#1072
  end
  object Bevel1: TBevel
    Left = 2
    Top = 0
    Width = 800
    Height = 94
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 2
    Top = 96
    Width = 800
    Height = 297
    Shape = bsFrame
  end
  object graphPaintBox: TPaintBox
    Left = 6
    Top = 100
    Width = 790
    Height = 288
    Color = clCream
    ParentColor = False
  end
  object Label6: TLabel
    Left = 368
    Top = 48
    Width = 153
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1057#1090#1072#1085#1076#1072#1088#1090#1085#1086#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1077
  end
  object Label8: TLabel
    Left = 664
    Top = 24
    Width = 97
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1088#1072#1074#1099#1081
  end
  object Label9: TLabel
    Left = 8
    Top = 8
    Width = 89
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1052#1072#1089#1096#1090#1072#1073
  end
  object Label7: TLabel
    Left = 528
    Top = 24
    Width = 129
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1051#1077#1074#1099#1081
  end
  object indexEdit: TEdit
    Left = 104
    Top = 24
    Width = 81
    Height = 21
    TabOrder = 0
    Text = '3'
    OnKeyPress = indexEditKeyPress
  end
  object indexUpDown: TUpDown
    Left = 185
    Top = 24
    Width = 17
    Height = 21
    Associate = indexEdit
    Min = 3
    Max = 60
    Position = 3
    TabOrder = 1
    Wrap = True
    OnChanging = indexUpDownChanging
  end
  object APIComboBox: TComboBoxEx
    Left = 104
    Top = 64
    Width = 257
    Height = 22
    ItemsEx = <
      item
        Caption = 'CreateFile'
      end
      item
        Caption = 'ReadFile'
      end
      item
        Caption = 'WriteFile'
      end
      item
        Caption = 'DeleteFile'
      end
      item
        Caption = 'MoveFile'
      end
      item
        Caption = 'CopyFile'
      end
      item
        Caption = 'RemoveDirectory'
      end
      item
        Caption = 'Create directory'
      end>
    Style = csExDropDownList
    ItemHeight = 16
    TabOrder = 2
    DropDownCount = 8
  end
  object timeAPIEdit: TEdit
    Left = 368
    Top = 24
    Width = 153
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object trustComboBox: TComboBoxEx
    Left = 208
    Top = 24
    Width = 153
    Height = 22
    ItemsEx = <
      item
        Caption = '0,95'
      end
      item
        Caption = '0,99'
      end>
    Style = csExDropDownList
    ItemHeight = 16
    TabOrder = 4
    DropDownCount = 8
  end
  object trustLEdit: TEdit
    Left = 528
    Top = 40
    Width = 129
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object trustREdit: TEdit
    Left = 664
    Top = 40
    Width = 129
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object exitButton: TButton
    Left = 722
    Top = 396
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 7
    OnClick = exitButtonClick
  end
  object startButton: TButton
    Left = 718
    Top = 64
    Width = 75
    Height = 25
    Caption = #1057#1090#1072#1088#1090
    TabOrder = 8
    OnClick = startButtonClick
  end
  object sigmaEdit: TEdit
    Left = 368
    Top = 64
    Width = 153
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object zoomEdit: TEdit
    Left = 8
    Top = 24
    Width = 74
    Height = 21
    TabOrder = 10
    Text = '1'
    OnKeyPress = zoomEditKeyPress
  end
  object zoomUpDown: TUpDown
    Left = 82
    Top = 24
    Width = 17
    Height = 21
    Associate = zoomEdit
    Min = 1
    Max = 20
    Position = 1
    TabOrder = 11
    Wrap = True
  end
  object refreshButton: TButton
    Left = 6
    Top = 64
    Width = 92
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    Enabled = False
    TabOrder = 12
    OnClick = refreshButtonClick
  end
  object trustLCheckBox: TCheckBox
    Left = 616
    Top = 22
    Width = 17
    Height = 17
    TabOrder = 13
  end
  object trustRCheckBox: TCheckBox
    Left = 736
    Top = 22
    Width = 17
    Height = 17
    TabOrder = 14
  end
  object MainMenu: TMainMenu
    Left = 680
    Top = 392
    object fileItem: TMenuItem
      Caption = #1060#1072#1081#1083
      object dirItem: TMenuItem
        Caption = #1056#1072#1073#1086#1095#1080#1081' '#1082#1072#1090#1072#1083#1086#1075
        OnClick = dirItemClick
      end
      object saveItem: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099
        Enabled = False
        OnClick = saveItemClick
      end
      object bevelItem: TMenuItem
        Caption = '-'
      end
      object exitItem: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = exitItemClick
      end
    end
    object N2: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N2Click
    end
  end
  object SaveFile: TSaveDialog
    FileName = 'result.txt'
    Left = 648
    Top = 392
  end
end
