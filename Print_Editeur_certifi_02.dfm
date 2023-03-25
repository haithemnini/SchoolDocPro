object Form39: TForm39
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 185
  ClientWidth = 547
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
  object pnl4: TPanel
    Left = 0
    Top = 150
    Width = 547
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    object btn_save: TBitBtn
      AlignWithMargins = True
      Left = 4
      Top = 3
      Width = 140
      Height = 32
      Cursor = crHandPoint
      BiDiMode = bdRightToLeft
      Caption = #1605#1608#1575#1589#1604#1577
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
  end
  object grp1: TGroupBox
    Left = 0
    Top = 0
    Width = 547
    Height = 150
    Align = alClient
    BiDiMode = bdRightToLeft
    Caption = #1575#1582#1578#1585' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arabic UI Display Medium'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    object pnl3: TPanel
      Left = 2
      Top = 21
      Width = 543
      Height = 127
      Align = alClient
      BevelOuter = bvNone
      Color = clBtnShadow
      ParentBackground = False
      TabOrder = 0
      StyleElements = []
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 543
        Height = 127
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Lbl_1: TLabel
          Left = 435
          Top = 10
          Width = 57
          Height = 21
          Caption = #1575#1604#1602#1587#1600#1600#1605' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Arabic UI Display Medium'
          Font.Style = []
          ParentFont = False
        end
        object Lbl_11: TLabel
          Left = 390
          Top = 49
          Width = 102
          Height = 21
          Caption = #1575#1604#1587#1606#1577' '#1575#1604#1583#1585#1575#1587#1610#1577' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Arabic UI Display Medium'
          Font.Style = []
          ParentFont = False
        end
        object Lbl_12: TLabel
          Left = 432
          Top = 89
          Width = 60
          Height = 21
          Align = alCustom
          Caption = #1575#1604#1605#1600#1600#1581#1585#1585' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Arabic UI Display Medium'
          Font.Style = []
          ParentFont = False
        end
        object dblkcbbDBLookCombo_class: TDBLookupComboBox
          Left = 32
          Top = 6
          Width = 338
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
          TabOrder = 0
        end
        object dblkcbbDBLookCombo_annee: TDBLookupComboBox
          Left = 32
          Top = 45
          Width = 338
          Height = 29
          BiDiMode = bdRightToLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Arabic UI Display Medium'
          Font.Style = []
          KeyField = 'Num_annee_scol'
          ListField = 'Annee_scol'
          ListSource = DB.ds_Query_Annee
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 1
        end
        object dblkcbbDBLookCombo_Editeur: TDBLookupComboBox
          Left = 32
          Top = 85
          Width = 338
          Height = 29
          Align = alCustom
          BiDiMode = bdRightToLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Arabic UI Display Medium'
          Font.Style = []
          KeyField = 'Num_edit'
          ListField = 'Nom_edit'
          ListSource = DB.ds_Query_Editeur
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  object rszkt2: TResizeKit
    FormPos = rpDefault
    FormWidth = 0
    FormHeight = 0
    FormMaxWidth = 0
    FormMaxHeight = 0
    FormMinWidth = 0
    FormMinHeight = 0
    ResizeFont = True
    Enabled = False
    ValidTaskbar = True
    Left = 671
    Top = 146
    DesignFrmW = 547
    DesignFrmH = 185
    DesignDpiW = 96
    DesignDpiH = 96
  end
  object actlst1: TActionList
    Left = 200
    Top = 168
    object actEsc: TAction
      Caption = 'actEsc'
      ShortCut = 27
      OnExecute = actEscExecute
    end
  end
end
