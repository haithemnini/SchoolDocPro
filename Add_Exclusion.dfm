object Form19: TForm19
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 322
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 282
    Width = 563
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clMoneyGreen
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    object btn_save: TBitBtn
      AlignWithMargins = True
      Left = 145
      Top = 4
      Width = 140
      Height = 35
      Cursor = crHandPoint
      BiDiMode = bdRightToLeft
      Caption = #1581#1601#1592
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000008080800247A0437E4A9F401800000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000FF000146A0439147A043FF47A044CC4BA53C11000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000055AA5503489F43A047A043F8489F426047A043D647A043D64A9F40180000
        00000000000000000000000000000000000000000000000000000000000000FF
        0001469F439547A043FA48A1425100000000489F402047A043DF47A044CC4BA5
        3C110000000000000000000000000000000000000000000000000000000047A1
        423647A043F3489F414A0000000000000000000000004A9F401847A043D647A0
        43D64A9F40180000000000000000000000000000000000000000000000000000
        000046A2461600000000000000000000000000000000000000004A9F401847A0
        43D647A043D64A9F401800000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000489F
        402047A043DF47A044CC4BA53C11000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000489F402047A043DF47A044CC4BA53C110000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000489F402047A043DF47A044CC4BA53C1100000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000004A9F401847A043B7489F402000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      Layout = blGlyphRight
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = btn_saveClick
    end
    object btn_cancel: TBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 4
      Width = 140
      Height = 35
      Cursor = crHandPoint
      BiDiMode = bdRightToLeft
      Caption = #1575#1594#1604#1575#1602
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000B08282C1B146A74231A919F2218909F1710
        68730806272B0000000000000000000000000000000000000000000000000000
        00000000000004030C0D2A2194A14032EAFE3D2FEAFF3B2CE9FF3829E8FF3627
        E7FF3424E5FE1F158F9F02020B0C000000000000000000000000000000000000
        000004030C0D3A2FC0CF4537ECFF4235EBFF4032EBFF3D2FEAFF3B2CE9FF3829
        E8FF3627E7FF3424E6FF281BB9CE02020B0C0000000000000000000000000000
        0000302898A24A3DEEFF473AEDFF4537EBFF4235EAFF4032EBFF3D2FEAFF3B2C
        E8FF3829E7FF3627E7FF3424E6FF1E148E9E0000000000000000000000000D0B
        26284D40EDFD4C3FEFFF4A3DEDFFB5B0EFFF948DE9FF4235EAFF4032EAFF9089
        E8FFB1ACEDFF3829E7FF3627E7FF3424E4FD0705222600000000000000002821
        747B5043F0FF4E41EFFF4C3FEEFF958DE9FFFEFEFFFF948DE9FF928CE8FFFEFE
        FFFF8D86E7FF3B2CE8FF3829E8FF3627E7FF18116C780000000000000000342D
        979F5245F1FF5043F0FF4E41EFFF4C3FEEFF9E97EBFFFEFEFFFFFEFEFFFF9A94
        EAFF4032EAFF3D2FEAFF3B2CE9FF3829E8FF21188F9E0000000000000000352E
        979F5348F2FF5245F1FF5043F0FF4E41EEFF8E86E8FFFEFEFFFFFEFEFFFF8A82
        E7FF4235EAFF4032EBFF3D2FEAFF3B2CE9FF2319909E00000000000000002A25
        767C554AF2FF5348F2FF5245F0FF9891EBFFFEFEFFFF9891EAFF9790EAFFFEFE
        FFFF928BE8FF4235EAFF4032EBFF3D2FEAFF1C156F790000000000000000100E
        2B2D574CF2FE554AF2FF5348F1FFB8B4F0FF9A93EBFF4E41EEFF4C3FEEFF9790
        EAFFB5B0EFFF4537EBFF4235EBFF4032EAFE0A08272B00000000000000000000
        00003C35A5AC574CF3FF554AF2FF5348F1FF5245F0FF5043F0FF4E41EFFF4C3F
        EEFF4A3DEDFF473AEDFF4537ECFF2B239BA80000000000000000000000000000
        000006050F104940C8D1574CF3FF554AF2FF5348F2FF5245F1FF5043F0FF4E41
        EFFF4C3FEFFF4A3DEEFF3A2FC1D004030E0F0000000000000000000000000000
        00000000000006050F103C35A6AD574CF3FF554AF2FF5348F2FF5245F1FF5043
        F0FF4E41EEFE332AA0AB04040E0F000000000000000000000000000000000000
        0000000000000000000000000000100E2D2F2C277C8237309CA4352E9CA42923
        7A810E0C2B2E0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      Layout = blGlyphRight
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = btn_cancelClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 563
    Height = 282
    Align = alClient
    BiDiMode = bdRightToLeft
    Caption = #1575#1590#1575#1601#1577' '#1605#1602#1585#1585' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arabic UI Display Medium'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 24
    ExplicitTop = 8
    object Label1: TLabel
      Left = 437
      Top = 51
      Width = 87
      Height = 21
      BiDiMode = bdLeftToRight
      Caption = ' : '#1604#1602#1600#1600#1576' '#1578#1604#1605#1610#1584
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 442
      Top = 91
      Width = 82
      Height = 21
      Caption = #1575#1587#1600#1600#1605' '#1578#1604#1605#1610#1584' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 423
      Top = 214
      Width = 101
      Height = 21
      Caption = #1578#1600#1600#1575#1585#1610#1582' '#1575#1604#1582#1585#1608#1580' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 464
      Top = 132
      Width = 60
      Height = 21
      Caption = #1575#1604#1587#1600#1600#1576#1576' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 432
      Top = 174
      Width = 92
      Height = 21
      Caption = #1570#1582#1600#1600#1585' '#1605#1587#1578#1608#1609' : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      ParentFont = False
    end
    object edt_Pren: TEdit
      Left = 39
      Top = 86
      Width = 351
      Height = 31
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = edt_PrenExit
      OnKeyPress = edt_PrenKeyPress
    end
    object edt_Nom: TEdit
      Left = 39
      Top = 46
      Width = 351
      Height = 31
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = edt_NomExit
      OnKeyPress = edt_PrenKeyPress
    end
    object DateTimePicker1: TDateTimePicker
      Left = 39
      Top = 210
      Width = 351
      Height = 29
      Date = 44540.000000000000000000
      Time = 0.894549930555513100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = edt_PrenKeyPress
    end
    object edt_Raison: TEdit
      Left = 39
      Top = 127
      Width = 351
      Height = 31
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edt_PrenKeyPress
    end
    object DBLookCombo_class: TDBLookupComboBox
      Left = 39
      Top = 168
      Width = 351
      Height = 29
      BiDiMode = bdRightToLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arabic UI Display Medium'
      Font.Style = []
      KeyField = 'Num_class'
      ListField = 'Nom_class'
      ListSource = DB.ds_Query_Classe
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 4
    end
  end
  object ActionList1: TActionList
    Left = 200
    Top = 72
    object Esc: TAction
      Caption = 'Esc'
      ShortCut = 27
      OnExecute = btn_cancelClick
    end
  end
  object ResizeKit1: TResizeKit
    FormPos = rpDefault
    FormWidth = 0
    FormHeight = 0
    FormMaxWidth = 0
    FormMaxHeight = 0
    FormMinWidth = 0
    FormMinHeight = 0
    ResizeFont = True
    Enabled = True
    ValidTaskbar = True
    Left = 104
    Top = 72
    DesignFrmW = 563
    DesignFrmH = 322
    DesignDpiW = 96
    DesignDpiH = 96
  end
end