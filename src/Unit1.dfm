object Form1: TForm1
  Left = 488
  Top = 154
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1046#1086#1088#1076#1072#1085#1086#1074#1072' '#1090#1072#1073#1083#1080#1094#1072
  ClientHeight = 543
  ClientWidth = 1063
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ScreenSnap = True
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 24
    Top = 192
    Width = 489
    Height = 17
    Hint = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    Caption = '^^^'
    Flat = True
    Layout = blGlyphTop
    Margin = 4
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 512
    Top = 40
    Width = 17
    Height = 353
    Caption = '...'
    Flat = True
    OnClick = SpeedButton2Click
  end
  object SpeedButton5: TSpeedButton
    Left = 8
    Top = 192
    Width = 17
    Height = 17
    Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1076#1087#1080#1089#1080' '#1090#1072#1073#1083#1080#1094#1099
    Caption = 'E'
    Flat = True
    OnClick = SpeedButton5Click
  end
  object SpeedButton6: TSpeedButton
    Left = 512
    Top = 8
    Width = 17
    Height = 17
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    Caption = 'S'
    Flat = True
    OnClick = SpeedButton6Click
  end
  object SpeedButton8: TSpeedButton
    Left = 512
    Top = 24
    Width = 17
    Height = 17
    Hint = #1054#1090#1082#1088#1099#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    Caption = 'L'
    Flat = True
    OnClick = SpeedButton8Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 505
    Height = 185
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'Panel1'
    TabOrder = 0
    inline Frame21: TFrame2
      Left = 0
      Top = 0
      Width = 501
      Height = 181
      Align = alClient
      Color = clCream
      ParentColor = False
      TabOrder = 0
      inherited StringGrid1: TStringGrid
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowMoving, goColMoving, goEditing, goTabs]
        OnKeyPress = Frame21StringGrid1KeyPress
        OnSelectCell = Frame21StringGrid1SelectCell
      end
      inherited Edit1: TEdit
        OnChange = Frame21Edit1Change
      end
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 208
    Width = 505
    Height = 185
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'Panel2'
    TabOrder = 1
    inline Frame22: TFrame2
      Left = 0
      Top = 0
      Width = 501
      Height = 181
      Align = alClient
      Color = clMoneyGreen
      ParentColor = False
      TabOrder = 0
      inherited StringGrid1: TStringGrid
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goTabs]
        OnKeyPress = Frame22StringGrid1KeyPress
        OnSelectCell = Frame22StringGrid1SelectCell
        RowHeights = (
          19
          19
          19
          19
          19)
      end
    end
  end
  object Panel3: TPanel
    Left = 528
    Top = 8
    Width = 529
    Height = 385
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clSkyBlue
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 121
      Height = 73
      Caption = #1056#1072#1079#1084#1077#1088' '#1090#1072#1073#1083#1080#1094#1099' '
      TabOrder = 0
      object Panel4: TPanel
        Left = 8
        Top = 24
        Width = 103
        Height = 18
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = ' n('#1096#1080#1088#1080#1085#1072')='
        Color = clWindow
        FullRepaint = False
        TabOrder = 0
        object SpinEdit1: TSpinEdit
          Left = 60
          Top = -2
          Width = 39
          Height = 22
          AutoSelect = False
          AutoSize = False
          Ctl3D = False
          MaxLength = 2
          MaxValue = 99
          MinValue = 1
          ParentCtl3D = False
          TabOrder = 0
          Value = 3
          OnChange = SpinEdit1Change
        end
      end
      object Panel5: TPanel
        Left = 8
        Top = 48
        Width = 103
        Height = 18
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = ' m('#1074#1099#1089#1086#1090#1072')='
        Color = clWindow
        FullRepaint = False
        TabOrder = 1
        object SpinEdit2: TSpinEdit
          Left = 60
          Top = -2
          Width = 39
          Height = 22
          AutoSelect = False
          AutoSize = False
          Ctl3D = False
          MaxLength = 2
          MaxValue = 99
          MinValue = 1
          ParentCtl3D = False
          TabOrder = 0
          Value = 2
          OnChange = SpinEdit2Change
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 88
      Width = 241
      Height = 281
      Caption = #1046#1086#1088#1076#1072#1085#1086#1074#1099' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1103
      TabOrder = 1
      object SpeedButton3: TSpeedButton
        Left = 8
        Top = 200
        Width = 193
        Height = 33
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1088#1072#1079#1088#1077#1096#1072#1102#1097#1080#1081' '#1101#1083#1077#1084#1077#1085#1090
        Margin = 8
        OnClick = SpeedButton3Click
      end
      object Label1: TLabel
        Left = 8
        Top = 88
        Width = 132
        Height = 13
        Caption = #1064#1072#1075' 1. '#1047#1072#1087#1086#1083#1085#1080#1090#1077' '#1090#1072#1073#1083#1080#1094#1091
      end
      object Label2: TLabel
        Left = 8
        Top = 104
        Width = 172
        Height = 13
        Caption = #1064#1072#1075' 2. '#1053#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1042#1099#1073#1088#1072#1090#1100
      end
      object Label3: TLabel
        Left = 24
        Top = 120
        Width = 133
        Height = 13
        Caption = #1088#1072#1079#1088#1077#1096#1072#1102#1097#1080#1081' '#1101#1083#1077#1084#1077#1085#1090'" '#1080
      end
      object Label4: TLabel
        Left = 24
        Top = 136
        Width = 72
        Height = 13
        Caption = #1074#1099#1073#1077#1088#1080#1090#1077' '#1077#1075#1086'.'
      end
      object Label5: TLabel
        Left = 8
        Top = 152
        Width = 189
        Height = 13
        Caption = #1064#1072#1075' 3. '#1053#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1042#1099#1087#1086#1083#1085#1080#1090#1100'"'
      end
      object Label6: TLabel
        Left = 24
        Top = 168
        Width = 131
        Height = 13
        Caption = #1076#1083#1103' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1088#1077#1096#1077#1085#1080#1103'.'
      end
      object SpeedButton4: TSpeedButton
        Left = 8
        Top = 240
        Width = 193
        Height = 33
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        Enabled = False
        Margin = 8
        OnClick = SpeedButton4Click
      end
      object SpeedButton7: TSpeedButton
        Left = 208
        Top = 16
        Width = 23
        Height = 22
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1080#1087' '#1087#1086#1076#1087#1080#1089#1077#1081' '#1090#1072#1073#1083#1080#1094#1099
        Caption = '*'
        Flat = True
        OnClick = SpeedButton7Click
      end
      object Label7: TLabel
        Left = 8
        Top = 72
        Width = 224
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
      end
      object RadioButton1: TRadioButton
        Left = 8
        Top = 24
        Width = 137
        Height = 17
        Caption = #1054#1073#1099#1082#1085#1086#1074#1077#1085#1085#1099#1077
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 8
        Top = 48
        Width = 137
        Height = 17
        Caption = #1052#1086#1076#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1099#1077
        TabOrder = 1
        OnClick = RadioButton2Click
      end
      object CheckBox3: TCheckBox
        Left = 184
        Top = 16
        Width = 17
        Height = 17
        Hint = #1059#1076#1072#1083#1103#1090#1100' '#1085#1091#1083#1100'-'#1089#1090#1086#1083#1073#1094#1099
        TabOrder = 2
        OnClick = CheckBox3Click
      end
    end
    object ListBox1: TListBox
      Left = 136
      Top = 8
      Width = 113
      Height = 57
      ItemHeight = 13
      PopupMenu = PopupMenu1
      TabOrder = 2
    end
    object Button1: TButton
      Left = 136
      Top = 64
      Width = 113
      Height = 17
      Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 416
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    Checked = True
    State = cbChecked
    TabOrder = 3
    Visible = False
  end
  object CheckBox2: TCheckBox
    Left = 8
    Top = 432
    Width = 97
    Height = 17
    Caption = 'CheckBox2'
    Checked = True
    State = cbChecked
    TabOrder = 4
    Visible = False
  end
  object PopupMenu1: TPopupMenu
    MenuAnimation = [maLeftToRight, maTopToBottom]
    OwnerDraw = True
    Left = 32
    Top = 472
    object N1: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N1Click
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = 'C:\Users\Zete\Desktop\123.tabl.7zete7'
    Filter = #1060#1072#1081#1083' '#1090#1072#1073#1083#1080#1094#1099'|*.tabl.7zete7|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    InitialDir = '.'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Title = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    Left = 144
    Top = 416
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.tabl.7zete7'
    Filter = #1060#1072#1081#1083' '#1090#1072#1073#1083#1080#1094#1099'|*.tabl.7zete7|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    InitialDir = '.'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1054#1090#1082#1088#1099#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    Left = 176
    Top = 416
  end
end
