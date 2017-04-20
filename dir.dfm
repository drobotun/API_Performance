object dirForm: TdirForm
  Left = 924
  Top = 140
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1088#1072#1090#1100' '#1088#1072#1073#1086#1095#1080#1081' '#1082#1072#1090#1072#1083#1086#1075
  ClientHeight = 280
  ClientWidth = 280
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
  object Bevel1: TBevel
    Left = 0
    Top = 240
    Width = 280
    Height = 2
  end
  object ShellTreeView: TShellTreeView
    Left = 8
    Top = 24
    Width = 264
    Height = 210
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    UseShellImages = True
    AutoRefresh = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 0
  end
  object dirOkButton: TButton
    Left = 200
    Top = 248
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 1
    OnClick = dirOkButtonClick
  end
  object dirCancelButton: TButton
    Left = 116
    Top = 248
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = dirCancelButtonClick
  end
end
