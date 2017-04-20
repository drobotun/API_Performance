object aboutForm: TaboutForm
  Left = 540
  Top = 277
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'API Performance'
  ClientHeight = 118
  ClientWidth = 312
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 281
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1086#1094#1077#1085#1082#1080' '#1074#1088#1077#1084#1077#1085#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' API-'#1092#1091#1085#1082#1094#1080#1081
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 281
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1088#1072#1073#1086#1090#1099' '#1089' '#1092#1072#1081#1083#1072#1084#1080
  end
  object Label3: TLabel
    Left = 16
    Top = 56
    Width = 104
    Height = 13
    Caption = #1044#1088#1086#1073#1086#1090#1091#1085' '#1045'. ('#1089') 2017'
  end
  object Bevel1: TBevel
    Left = 0
    Top = 78
    Width = 312
    Height = 2
  end
  object aboutButton: TButton
    Left = 232
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = aboutButtonClick
  end
end
