object DB: TDB
  OldCreateOrder = False
  Height = 466
  Width = 1150
  object Query_Users: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Users')
    Left = 280
    Top = 385
  end
  object ds_Query_Users: TDataSource
    DataSet = Query_Users
    Left = 894
    Top = 384
  end
  object Query_Uneleve: TFDQuery
    OnFilterRecord = Query_UneleveFilterRecord
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Un_eleve'
      'ORDER BY Num_ele'
      '')
    Left = 280
    Top = 321
    object intgrfldQuery_UneleveNum_ele: TIntegerField
      FieldName = 'Num_ele'
      Origin = 'Num_ele'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object strngfldQuery_UnelevePren_ele: TStringField
      FieldName = 'Pren_ele'
      Origin = 'Pren_ele'
      Required = True
      Size = 25
    end
    object strngfldQuery_UneleveNom_ele: TStringField
      FieldName = 'Nom_ele'
      Origin = 'Nom_ele'
      Required = True
      Size = 25
    end
    object dtfldQuery_UneleveDate_naiss_ele: TDateField
      FieldName = 'Date_naiss_ele'
      Origin = 'Date_naiss_ele'
      Required = True
    end
    object wdstrngfldQuery_UneleveLieu_naiss_ele: TWideStringField
      FieldName = 'Lieu_naiss_ele'
      Origin = 'Lieu_naiss_ele'
      Required = True
    end
    object wdstrngfldQuery_UneleveAdr_ele: TWideStringField
      FieldName = 'Adr_ele'
      Origin = 'Adr_ele'
      Required = True
      Size = 30
    end
    object strngfldQuery_UneleveNom_gardi: TStringField
      FieldName = 'Nom_gardi'
      Origin = 'Nom_gardi'
      Required = True
    end
    object intgrfldQuery_UneleveNum_annee_scol: TIntegerField
      FieldName = 'Num_annee_scol'
      Origin = 'Num_annee_scol'
      Required = True
    end
    object intgrfldQuery_UneleveNum_class: TIntegerField
      FieldName = 'Num_class'
      Origin = 'Num_class'
      Required = True
    end
    object Query_UneleveAnnee: TDateField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'Annee'
      LookupDataSet = Query_Annee
      LookupKeyFields = 'Num_annee_scol'
      LookupResultField = 'Annee_scol'
      KeyFields = 'Num_annee_scol'
      Lookup = True
    end
    object Query_Uneleveclass: TStringField
      FieldKind = fkLookup
      FieldName = 'class'
      LookupDataSet = Query_Classe
      LookupKeyFields = 'Num_class'
      LookupResultField = 'Nom_class'
      KeyFields = 'Num_class'
      Size = 35
      Lookup = True
    end
    object intgrfldQuery_Uneleveaa: TIntegerField
      FieldKind = fkLookup
      FieldName = 'aa'
      LookupDataSet = Query_Classe
      LookupKeyFields = 'Nom_class'
      LookupResultField = 'Num_divisi'
      KeyFields = 'class'
      Lookup = True
    end
    object strngfldQuery_UneleveStringField11: TStringField
      FieldKind = fkLookup
      FieldName = '11'
      LookupDataSet = Query_Division
      LookupKeyFields = 'Num_divisi'
      LookupResultField = 'Nom_divisi'
      KeyFields = 'aa'
      Lookup = True
    end
  end
  object Query_Division: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Division'
      '')
    Left = 391
    Top = 272
    object Query_DivisionNum_divisi: TIntegerField
      FieldName = 'Num_divisi'
      Origin = 'Num_divisi'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Query_DivisionNom_divisi: TWideStringField
      FieldName = 'Nom_divisi'
      Origin = 'Nom_divisi'
      Required = True
    end
  end
  object Query_Classe: TFDQuery
    OnFilterRecord = Query_ClasseFilterRecord
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Classe')
    Left = 504
    Top = 384
    object Query_ClasseNum_class: TIntegerField
      FieldName = 'Num_class'
      Origin = 'Num_class'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Query_ClasseNum_divisi: TIntegerField
      FieldName = 'Num_divisi'
      Origin = 'Num_divisi'
      Required = True
    end
    object Query_Classedivisi: TStringField
      FieldKind = fkLookup
      FieldName = 'divisi'
      LookupDataSet = Query_Division
      LookupKeyFields = 'Num_divisi'
      LookupResultField = 'Nom_divisi'
      KeyFields = 'Num_divisi'
      Lookup = True
    end
    object Query_ClasseNom_class: TWideStringField
      FieldName = 'Nom_class'
      Origin = 'Nom_class'
      Required = True
      Size = 35
    end
  end
  object Query_Annee: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Annee'
      '')
    Left = 391
    Top = 384
    object Query_AnneeNum_annee_scol: TIntegerField
      FieldName = 'Num_annee_scol'
      Origin = 'Num_annee_scol'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Query_AnneeAnnee_scol: TDateField
      FieldName = 'Annee_scol'
      Origin = 'Annee_scol'
      Required = True
    end
  end
  object ds_Query_Uneleve: TDataSource
    DataSet = Query_Uneleve
    Left = 892
    Top = 320
  end
  object ds_Query_Annee: TDataSource
    DataSet = Query_Annee
    Left = 784
    Top = 384
  end
  object ds_Query_Classe: TDataSource
    DataSet = Query_Classe
    Left = 664
    Top = 384
  end
  object ds_Query_Division: TDataSource
    DataSet = Query_Division
    Left = 787
    Top = 272
  end
  object Query_Editeur: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Editeur_certificat'
      '')
    Left = 504
    Top = 272
    object Query_EditeurNum_edit: TIntegerField
      FieldName = 'Num_edit'
      Origin = 'Num_edit'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Query_EditeurNom_edit: TStringField
      FieldName = 'Nom_edit'
      Origin = 'Nom_edit'
      Required = True
    end
  end
  object ds_Query_Editeur: TDataSource
    DataSet = Query_Editeur
    Left = 668
    Top = 272
  end
  object Query_Exclusion: TFDQuery
    OnFilterRecord = Query_ExclusionFilterRecord
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Exclusion'
      '')
    Left = 166
    Top = 272
    object Query_ExclusionNum_Rapp_exclu: TIntegerField
      FieldName = 'Num_Rapp_exclu'
      Origin = 'Num_Rapp_exclu'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Query_ExclusionDate_exclu_sorti: TDateField
      FieldName = 'Date_exclu_sorti'
      Origin = 'Date_exclu_sorti'
      Required = True
    end
    object Query_ExclusionRaison: TStringField
      FieldName = 'Raison'
      Origin = 'Raison'
      Required = True
      Size = 25
    end
    object Query_ExclusionNum_ele: TIntegerField
      FieldName = 'Num_ele'
      Origin = 'Num_ele'
      Required = True
    end
    object Query_Exclusionnom: TStringField
      FieldKind = fkLookup
      FieldName = 'nom'
      LookupDataSet = Query_Uneleve
      LookupKeyFields = 'Num_ele'
      LookupResultField = 'Nom_ele'
      KeyFields = 'Num_ele'
      Lookup = True
    end
    object Query_ExclusionPren: TStringField
      FieldKind = fkLookup
      FieldName = 'Pren'
      LookupDataSet = Query_Uneleve
      LookupKeyFields = 'Num_ele'
      LookupResultField = 'Pren_ele'
      KeyFields = 'Num_ele'
      Lookup = True
    end
    object Query_ExclusionNom_Rapp_exclu: TWideStringField
      FieldName = 'Nom_Rapp_exclu'
      Origin = 'Nom_Rapp_exclu'
      Required = True
      Size = 45
    end
  end
  object ds_Query_Exclusion: TDataSource
    DataSet = Query_Exclusion
    Left = 1000
    Top = 272
  end
  object Query_Certif: TFDQuery
    OnFilterRecord = Query_CertifFilterRecord
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Certificat')
    Left = 280
    Top = 273
    object Query_Certifnom: TStringField
      FieldKind = fkLookup
      FieldName = 'nom'
      LookupDataSet = Query_Uneleve
      LookupKeyFields = 'Num_ele'
      LookupResultField = 'Nom_ele'
      KeyFields = 'Num_ele'
      Lookup = True
    end
    object Query_CertifPren: TStringField
      FieldKind = fkLookup
      FieldName = 'Pren'
      LookupDataSet = Query_Uneleve
      LookupKeyFields = 'Num_ele'
      LookupResultField = 'Pren_ele'
      KeyFields = 'Num_ele'
      Lookup = True
    end
    object Query_CertifEditeur: TStringField
      FieldKind = fkLookup
      FieldName = 'Editeur'
      LookupDataSet = Query_Editeur
      LookupKeyFields = 'Num_edit'
      LookupResultField = 'Nom_edit'
      KeyFields = 'Num_edit'
      Lookup = True
    end
    object Query_CertifNum_certifi: TIntegerField
      FieldName = 'Num_certifi'
      Origin = 'Num_certifi'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Query_CertifNom_certifi: TStringField
      FieldName = 'Nom_certifi'
      Origin = 'Nom_certifi'
      Required = True
      Size = 25
    end
    object Query_CertifDate_edit_certifi: TDateField
      FieldName = 'Date_edit_certifi'
      Origin = 'Date_edit_certifi'
      Required = True
    end
    object Query_CertifNum_edit: TIntegerField
      FieldName = 'Num_edit'
      Origin = 'Num_edit'
      Required = True
    end
    object Query_CertifNum_ele: TIntegerField
      FieldName = 'Num_ele'
      Origin = 'Num_ele'
      Required = True
    end
  end
  object ds_Query_Certif: TDataSource
    DataSet = Query_Certif
    Left = 891
    Top = 272
  end
  object Rep_Certif: TfrxReport
    Version = '6.6.15'
    DataSetName = 'Re_Certif'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1575#1604#1573#1601#1578#1585#1575#1590#1610
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44543.838776701400000000
    ReportOptions.LastChange = 44569.856466145840000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin    '
      '   MemoC1.text  := MemoC.text;'
      '   MemoDD1.text := MemoDD.text;'
      '   MemoD1.text  := MemoD.text;'
      '   Memoyy1.text := Memoyy.text;'
      '   MemoE1.text  := MemoE.text;'
      '   Memo56.text  := Memo42.text;'
      '   Memo60.text  := Memo42.text;'
      '   Memo52.text  := Memo42.text;  '
      '   Memo67.text  := memo_class.text;'
      ''
      '      '
      '   Memo61.text  := MemoDD.text;'
      '   Memo57.text  := MemoDD.text;'
      '     '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 384
    Top = 16
    Datasets = <
      item
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 4
      ColumnWidth = 69.300000000000000000
      ColumnPositions.Strings = (
        '0'
        '141'
        '135'
        '0')
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object Shape1: TfrxShapeView
        AllowVectorExport = True
        ShiftMode = smDontShift
        Width = 517.000000000000000000
        Height = 718.110700000000000000
        Frame.Typ = []
      end
      object Memo1: TfrxMemoView
        AllowVectorExport = True
        ShiftMode = smDontShift
        Top = 1.000000000000000000
        Width = 517.760000000000000000
        Height = 26.385276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1575#1604#1580#1605#1607#1608#1585#1610#1577' '#1575#1604#1580#1586#1575#1574#1585#1610#1577' '#1575#1604#1583#1610#1605#1602#1585#1575#1591#1610#1577' '#1575#1604#1588#1593#1576#1610#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo2: TfrxMemoView
        AllowVectorExport = True
        Top = 23.800000000000000000
        Width = 517.760000000000000000
        Height = 26.385276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1608#1586#1575#1585#1577' '#1575#1604#1578#1585#1576#1610#1577' '#1575#1604#1608#1591#1606#1610#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo3: TfrxMemoView
        AllowVectorExport = True
        Left = 284.400000000000000000
        Top = 57.600000000000000000
        Width = 221.760000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          #1605#1583#1610#1585#1610#1577' '#1575#1604#1578#1585#1576#1610#1577' '#1604#1608#1604#1575#1610#1577' '#1575#1604#1608#1575#1583#1610' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo4: TfrxMemoView
        AllowVectorExport = True
        Left = 9.000000000000000000
        Top = 76.400000000000000000
        Width = 500.160000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '-  '#1579#1575#1606#1608#1610#1577' '#1583#1610#1583#1610' '#1589#1575#1604#1581'  - '#1581#1587#1575#1606#1610' '#1593#1576#1583' '#1575#1604#1603#1585#1610#1600#1600#1600#1605'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo5: TfrxMemoView
        AllowVectorExport = True
        Left = 463.800000000000000000
        Top = 97.600000000000000000
        Width = 39.360000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1575#1604#1585#1602#1600#1605' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Gradient1: TfrxGradientView
        AllowVectorExport = True
        Left = 168.718275000000000000
        Top = 127.800000000000000000
        Width = 172.800000000000000000
        Height = 28.800000000000000000
        BeginColor = 5591892
        EndColor = clWhite
        Style = gsVertical
        Frame.Typ = []
        Color = 11184553
      end
      object Memo6: TfrxMemoView
        AllowVectorExport = True
        Left = 177.838275000000000000
        Top = 129.800000000000000000
        Width = 154.560000000000000000
        Height = 26.385276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1588#1607#1600#1600#1600#1600#1575#1583#1577' '#1605#1583#1585#1587#1610#1600#1600#1600#1600#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo7: TfrxMemoView
        AllowVectorExport = True
        Top = 182.400000000000000000
        Width = 500.160000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          
            ' : '#1610#1588#1607#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1583' '#1575#1604#1587#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1583'('#1577') '#1605#1583#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1585' ('#1577') '#1575#1604#1579#1575 +
            #1606#1608#1610#1577'  '#1571#1606' '#1575#1604#1578#1604#1605#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1584' ('#1577')')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo8: TfrxMemoView
        AllowVectorExport = True
        Left = 451.200000000000000000
        Top = 218.200000000000000000
        Width = 48.960000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1604#1602#1576)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo9: TfrxMemoView
        AllowVectorExport = True
        Left = 218.800000000000000000
        Top = 219.200000000000000000
        Width = 48.960000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1575#1587#1605)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo10: TfrxMemoView
        AllowVectorExport = True
        Left = 384.000000000000000000
        Top = 254.000000000000000000
        Width = 116.160000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1578#1575#1585#1610#1582' '#1608#1605#1603#1575#1606' '#1575#1604#1605#1610#1604#1575#1583)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo11: TfrxMemoView
        AllowVectorExport = True
        Left = 205.600000000000000000
        Top = 254.000000000000000000
        Width = 39.360000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1576#1600#1600#1600#1600#1600' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo12: TfrxMemoView
        AllowVectorExport = True
        Top = 297.800000000000000000
        Width = 509.760000000000000000
        Height = 24.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'SUltan Medium'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '- '#1578#1575#1576#1600#1600#1593' ('#1578') '#1583#1585#1575#1587#1578#1607' ('#1607#1575')  - ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo13: TfrxMemoView
        AllowVectorExport = True
        Left = 374.400000000000000000
        Top = 335.800000000000000000
        Width = 125.760000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1575#1604#1587#1606#1600#1600#1600#1600#1600#1577' '#1575#1604#1583#1585#1575#1587#1610#1600#1600#1600#1600#1577' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo14: TfrxMemoView
        AllowVectorExport = True
        Left = 374.400000000000000000
        Top = 371.600000000000000000
        Width = 125.760000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1575#1604#1602#1587#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1605' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo15: TfrxMemoView
        AllowVectorExport = True
        Left = 374.400000000000000000
        Top = 410.400000000000000000
        Width = 125.760000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1585#1602#1600#1600#1600#1605' '#1575#1604#1578#1587#1580#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1604' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo16: TfrxMemoView
        AllowVectorExport = True
        Left = 218.200000000000000000
        Top = 411.000000000000000000
        Width = 106.560000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1578#1600#1600#1600#1600#1575#1585#1610#1582' '#1575#1604#1582#1600#1600#1600#1585#1608#1580' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo17: TfrxMemoView
        AllowVectorExport = True
        Left = 361.800000000000000000
        Top = 460.800000000000000000
        Width = 116.160000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          ': '#1605#1581#1585#1585' '#1575#1604#1588#1607#1575#1583#1577' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo18: TfrxMemoView
        AllowVectorExport = True
        Left = 86.400000000000000000
        Top = 528.000000000000000000
        Width = 192.960000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1581#1585#1585' '#1576#1600#1600'  : '#1581#1587#1575#1606#1610' '#1593#1576#1583' '#1575#1604#1603#1585#1610#1605'  '#1601#1610'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Date: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 22.800000000000000000
        Top = 528.000000000000000000
        Width = 76.800000000000000000
        Height = 19.200000000000000000
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[Date]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo19: TfrxMemoView
        AllowVectorExport = True
        Left = 76.800000000000000000
        Top = 552.960000000000000000
        Width = 125.760000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = [fsUnderline]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1575#1604#1605#1583#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1585' ('#1577')')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Nom_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 268.800000000000000000
        Top = 218.200000000000000000
        Width = 182.400000000000000000
        Height = 19.200000000000000000
        DataField = 'Nom_ele'
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[frxDBDataset1."Nom_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo41: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 35.200000000000000000
        Top = 218.800000000000000000
        Width = 182.400000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[frxDBDataset1."Pren_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Date_naiss_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 260.000000000000000000
        Top = 254.200000000000000000
        Width = 124.800000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[frxDBDataset1."Date_naiss_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Lieu_naiss_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 10.000000000000000000
        Top = 254.600000000000000000
        Width = 201.600000000000000000
        Height = 19.200000000000000000
        DataField = 'Lieu_naiss_ele'
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[frxDBDataset1."Lieu_naiss_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Num_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 316.800000000000000000
        Top = 411.400000000000000000
        Width = 67.200000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = '0000'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[frxDBDataset1."Num_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo43: TfrxMemoView
        AllowVectorExport = True
        Left = 333.400000000000000000
        Top = 336.479820630000000000
        Width = 9.600000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '/')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo42: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 281.600000000000000000
        Top = 336.000000000000000000
        Width = 57.600000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object MemoE: TfrxMemoView
        AllowVectorExport = True
        Left = 345.600000000000000000
        Top = 491.800000000000000000
        Width = 154.560000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object MemoC: TfrxMemoView
        AllowVectorExport = True
        Left = 424.800000000000000000
        Top = 97.920000000000000000
        Width = 39.360000000000000000
        Height = 16.785276070000000000
        DisplayFormat.FormatStr = '000'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object MemoD: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 125.600000000000000000
        Top = 411.800000000000000000
        Width = 96.000000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object MemoDD: TfrxMemoView
        AllowVectorExport = True
        Left = 336.000000000000000000
        Top = 336.000000000000000000
        Width = 38.400000000000000000
        Height = 19.200000000000000000
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object Memoyy: TfrxMemoView
        AllowVectorExport = True
        Left = 140.666666670000000000
        Top = 411.880000000000000000
        Width = 45.349494950000000000
        Height = 19.393939390000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object Shape2: TfrxShapeView
        AllowVectorExport = True
        ShiftMode = smDontShift
        Left = 530.000000000000000000
        Width = 517.000000000000000000
        Height = 718.110700000000000000
        Frame.Typ = []
      end
      object Memo20: TfrxMemoView
        AllowVectorExport = True
        ShiftMode = smDontShift
        Left = 530.000000000000000000
        Top = 1.000000000000000000
        Width = 517.760000000000000000
        Height = 26.385276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1575#1604#1580#1605#1607#1608#1585#1610#1577' '#1575#1604#1580#1586#1575#1574#1585#1610#1577' '#1575#1604#1583#1610#1605#1602#1585#1575#1591#1610#1577' '#1575#1604#1588#1593#1576#1610#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo21: TfrxMemoView
        AllowVectorExport = True
        Left = 530.000000000000000000
        Top = 23.800000000000000000
        Width = 517.760000000000000000
        Height = 26.385276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1608#1586#1575#1585#1577' '#1575#1604#1578#1585#1576#1610#1577' '#1575#1604#1608#1591#1606#1610#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo22: TfrxMemoView
        AllowVectorExport = True
        Left = 641.600000000000000000
        Top = 57.600000000000000000
        Width = 394.560000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          #1605#1583#1610#1585#1610#1577' '#1575#1604#1578#1585#1576#1610#1577' '#1604#1608#1604#1575#1610#1577' '#1575#1604#1608#1575#1583#1610' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo23: TfrxMemoView
        AllowVectorExport = True
        Left = 539.000000000000000000
        Top = 76.400000000000000000
        Width = 500.160000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '-  '#1579#1575#1606#1608#1610#1577' '#1583#1610#1583#1610' '#1589#1575#1604#1581'  - '#1581#1587#1575#1606#1610' '#1593#1576#1583' '#1575#1604#1603#1585#1610#1600#1600#1600#1605'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo24: TfrxMemoView
        AllowVectorExport = True
        Left = 993.800000000000000000
        Top = 97.600000000000000000
        Width = 39.360000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1575#1604#1585#1602#1600#1605' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Gradient2: TfrxGradientView
        AllowVectorExport = True
        Left = 698.718275000000000000
        Top = 127.800000000000000000
        Width = 172.800000000000000000
        Height = 28.800000000000000000
        BeginColor = 5591892
        EndColor = clWhite
        Style = gsVertical
        Frame.Typ = []
        Color = 11184553
      end
      object Memo25: TfrxMemoView
        AllowVectorExport = True
        Left = 707.838275000000000000
        Top = 129.800000000000000000
        Width = 154.560000000000000000
        Height = 26.385276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1588#1607#1600#1600#1600#1600#1575#1583#1577' '#1605#1583#1585#1587#1610#1600#1600#1600#1600#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo26: TfrxMemoView
        AllowVectorExport = True
        Left = 530.000000000000000000
        Top = 182.400000000000000000
        Width = 500.160000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          
            ' : '#1610#1588#1607#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1583' '#1575#1604#1587#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1583'('#1577') '#1605#1583#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1585' ('#1577') '#1575#1604#1579#1575 +
            #1606#1608#1610#1577'  '#1571#1606' '#1575#1604#1578#1604#1605#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1584' ('#1577')')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo27: TfrxMemoView
        AllowVectorExport = True
        Left = 981.200000000000000000
        Top = 218.200000000000000000
        Width = 48.960000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1604#1602#1576)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo28: TfrxMemoView
        AllowVectorExport = True
        Left = 748.800000000000000000
        Top = 219.200000000000000000
        Width = 48.960000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1575#1587#1605)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo29: TfrxMemoView
        AllowVectorExport = True
        Left = 914.000000000000000000
        Top = 254.000000000000000000
        Width = 116.160000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1578#1575#1585#1610#1582' '#1608#1605#1603#1575#1606' '#1575#1604#1605#1610#1604#1575#1583)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo30: TfrxMemoView
        AllowVectorExport = True
        Left = 735.600000000000000000
        Top = 254.000000000000000000
        Width = 39.360000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1576#1600#1600#1600#1600#1600' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo31: TfrxMemoView
        AllowVectorExport = True
        Left = 530.000000000000000000
        Top = 297.800000000000000000
        Width = 509.760000000000000000
        Height = 24.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'SUltan Medium'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '- '#1578#1575#1576#1600#1600#1593' ('#1578') '#1583#1585#1575#1587#1578#1607' ('#1607#1575')  - ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo32: TfrxMemoView
        AllowVectorExport = True
        Left = 904.400000000000000000
        Top = 335.800000000000000000
        Width = 125.760000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1575#1604#1587#1606#1600#1600#1600#1600#1600#1577' '#1575#1604#1583#1585#1575#1587#1610#1600#1600#1600#1600#1577' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo33: TfrxMemoView
        AllowVectorExport = True
        Left = 904.400000000000000000
        Top = 371.600000000000000000
        Width = 125.760000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1575#1604#1602#1587#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1605' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo34: TfrxMemoView
        AllowVectorExport = True
        Left = 904.400000000000000000
        Top = 410.400000000000000000
        Width = 125.760000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1585#1602#1600#1600#1600#1605' '#1575#1604#1578#1587#1580#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1604' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo35: TfrxMemoView
        AllowVectorExport = True
        Left = 748.200000000000000000
        Top = 411.000000000000000000
        Width = 106.560000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1578#1600#1600#1600#1600#1575#1585#1610#1582' '#1575#1604#1582#1600#1600#1600#1585#1608#1580' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo36: TfrxMemoView
        AllowVectorExport = True
        Left = 891.800000000000000000
        Top = 460.800000000000000000
        Width = 116.160000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          ': '#1605#1581#1585#1585' '#1575#1604#1588#1607#1575#1583#1577' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo45: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 798.800000000000000000
        Top = 218.200000000000000000
        Width = 182.400000000000000000
        Height = 19.200000000000000000
        DataField = 'Nom_ele'
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[frxDBDataset1."Nom_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo46: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 565.200000000000000000
        Top = 218.800000000000000000
        Width = 182.400000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[frxDBDataset1."Pren_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo47: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 790.000000000000000000
        Top = 254.200000000000000000
        Width = 124.800000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[frxDBDataset1."Date_naiss_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo48: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 540.000000000000000000
        Top = 254.600000000000000000
        Width = 201.600000000000000000
        Height = 19.200000000000000000
        DataField = 'Lieu_naiss_ele'
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[frxDBDataset1."Lieu_naiss_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo50: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 860.200000000000000000
        Top = 411.400000000000000000
        Width = 48.000000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = '0000'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[frxDBDataset1."Num_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo51: TfrxMemoView
        AllowVectorExport = True
        Left = 863.400000000000000000
        Top = 336.479820630000000000
        Width = 9.600000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '/')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo52: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 811.600000000000000000
        Top = 336.000000000000000000
        Width = 57.600000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object MemoE1: TfrxMemoView
        AllowVectorExport = True
        Left = 875.600000000000000000
        Top = 491.520000000000000000
        Width = 154.560000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object MemoC1: TfrxMemoView
        AllowVectorExport = True
        Left = 956.800000000000000000
        Top = 96.920000000000000000
        Width = 39.360000000000000000
        Height = 16.785276070000000000
        DisplayFormat.FormatStr = '000'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object MemoD1: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 656.600000000000000000
        Top = 411.800000000000000000
        Width = 96.000000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '2018/10/20')
        ParentFont = False
        VAlign = vaCenter
      end
      object MemoDD1: TfrxMemoView
        AllowVectorExport = True
        Left = 866.000000000000000000
        Top = 336.000000000000000000
        Width = 38.400000000000000000
        Height = 19.200000000000000000
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object Memoyy1: TfrxMemoView
        AllowVectorExport = True
        Left = 671.666666670000000000
        Top = 411.880000000000000000
        Width = 45.349494950000000000
        Height = 19.393939390000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '2018')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo53: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 393.600000000000000000
        Top = 97.000000000000000000
        Width = 48.000000000000000000
        Height = 19.200000000000000000
        DisplayFormat.FormatStr = 'yyyy/'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[Date]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo54: TfrxMemoView
        AllowVectorExport = True
        Left = 97.800000000000000000
        Top = 57.600000000000000000
        Width = 96.960000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1587#1606#1577' '#1575#1604#1583#1585#1575#1587#1610#1577'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo56: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 8.200000000000000000
        Top = 57.600000000000000000
        Width = 57.600000000000000000
        Height = 16.320000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo57: TfrxMemoView
        AllowVectorExport = True
        Left = 64.600000000000000000
        Top = 57.600000000000000000
        Width = 38.400000000000000000
        Height = 16.320000000000000000
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo58: TfrxMemoView
        AllowVectorExport = True
        Left = 61.400000000000000000
        Top = 58.600000000000000000
        Width = 9.600000000000000000
        Height = 16.320000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '/')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo59: TfrxMemoView
        AllowVectorExport = True
        Left = 632.400000000000000000
        Top = 57.600000000000000000
        Width = 96.960000000000000000
        Height = 16.785276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1587#1606#1577' '#1575#1604#1583#1585#1575#1587#1610#1577'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo60: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 542.800000000000000000
        Top = 57.600000000000000000
        Width = 57.600000000000000000
        Height = 16.320000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo61: TfrxMemoView
        AllowVectorExport = True
        Left = 599.200000000000000000
        Top = 57.600000000000000000
        Width = 38.400000000000000000
        Height = 16.320000000000000000
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo62: TfrxMemoView
        AllowVectorExport = True
        Left = 596.000000000000000000
        Top = 58.600000000000000000
        Width = 9.600000000000000000
        Height = 16.320000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '/')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo63: TfrxMemoView
        AllowVectorExport = True
        Left = 620.400000000000000000
        Top = 528.000000000000000000
        Width = 192.960000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1581#1585#1585' '#1576#1600#1600'  : '#1581#1587#1575#1606#1610' '#1593#1576#1583' '#1575#1604#1603#1585#1610#1605'  '#1601#1610'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo64: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 556.800000000000000000
        Top = 528.000000000000000000
        Width = 76.800000000000000000
        Height = 19.200000000000000000
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[Date]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo65: TfrxMemoView
        AllowVectorExport = True
        Left = 610.800000000000000000
        Top = 552.800000000000000000
        Width = 125.760000000000000000
        Height = 19.200000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = [fsUnderline]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1575#1604#1605#1583#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1585' ('#1577')')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo66: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 926.600000000000000000
        Top = 96.000000000000000000
        Width = 48.000000000000000000
        Height = 19.200000000000000000
        DisplayFormat.FormatStr = 'yyyy/'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[Date]')
        ParentFont = False
        VAlign = vaCenter
      end
      object memo_class: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 191.400000000000000000
        Top = 371.400000000000000000
        Width = 182.400000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo67: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 722.000000000000000000
        Top = 371.400000000000000000
        Width = 182.400000000000000000
        Height = 19.200000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
    end
  end
  object DB_Certif: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = ds_Query_Uneleve
    BCDToCurrency = False
    Left = 384
    Top = 64
  end
  object frxGradientObject1: TfrxGradientObject
    Left = 1064
  end
  object Query_Certif_Docum: TFDQuery
    OnFilterRecord = Query_Certif_DocumFilterRecord
    ConstraintsEnabled = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Certificat_Docum')
    Left = 166
    Top = 320
    object Query_Certif_Documnom: TStringField
      FieldKind = fkLookup
      FieldName = 'nom'
      LookupDataSet = Query_Certif
      LookupKeyFields = 'Num_certifi'
      LookupResultField = 'nom'
      KeyFields = 'Num_certifi'
      Lookup = True
    end
    object Query_Certif_DocumPren: TStringField
      FieldKind = fkLookup
      FieldName = 'Pren'
      LookupDataSet = Query_Certif
      LookupKeyFields = 'Num_certifi'
      LookupResultField = 'Pren'
      KeyFields = 'Num_certifi'
      Lookup = True
    end
    object Query_Certif_DocumNum_cer_docu: TIntegerField
      FieldName = 'Num_cer_docu'
      Origin = 'Num_cer_docu'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Query_Certif_DocumNum_cer_conta: TWideStringField
      FieldName = 'Num_cer_conta'
      Origin = 'Num_cer_conta'
      Required = True
      Size = 25
    end
    object Query_Certif_DocumNom_cer_instit_envo: TWideStringField
      FieldName = 'Nom_cer_instit_envo'
      Origin = 'Nom_cer_instit_envo'
      Required = True
      Size = 45
    end
    object Query_Certif_DocumNom_cer_docu: TStringField
      FieldName = 'Nom_cer_docu'
      Origin = 'Nom_cer_docu'
      Required = True
      Size = 30
    end
    object Query_Certif_DocumDate_cer_conta: TDateField
      FieldName = 'Date_cer_conta'
      Origin = 'Date_cer_conta'
      Required = True
    end
    object Query_Certif_DocumNum_certifi: TIntegerField
      FieldName = 'Num_certifi'
      Origin = 'Num_certifi'
      Required = True
    end
  end
  object ds_Query_Certif_Docum: TDataSource
    DataSet = Query_Certif_Docum
    Left = 1000
    Top = 320
  end
  object Re_Certif_docu: TfrxReport
    Version = '6.6.15'
    DataSet = DB_Re_Certif_docu
    DataSetName = 'DB_Re_Certif_docu'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1575#1604#1573#1601#1578#1585#1575#1590#1610
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44543.838776701400000000
    ReportOptions.LastChange = 44547.434514328700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure Page1OnBeforePrint(Sender: TfrxComponent);            ' +
        '                 '
      ' begin    '
      '          '
      'end;                                 '
      'procedure Page1OnManualBuild(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 288
    Top = 16
    Datasets = <
      item
        DataSet = DB_Re_Certif_docu
        DataSetName = 'DB_Re_Certif_docu'
      end
      item
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 9.906000000000000000
      RightMargin = 9.906000000000000000
      TopMargin = 9.906000000000000000
      BottomMargin = 9.906000000000000000
      ColumnWidth = 277.114000000000000000
      ColumnPositions.Strings = (
        '0')
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object Memo1: TfrxMemoView
        AllowVectorExport = True
        ShiftMode = smDontShift
        Top = 1.000000000000000000
        Width = 719.360000000000000000
        Height = 26.385276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1575#1604#1580#1605#1607#1608#1585#1610#1577' '#1575#1604#1580#1586#1575#1574#1585#1610#1577' '#1575#1604#1583#1610#1605#1602#1585#1575#1591#1610#1577' '#1575#1604#1588#1593#1576#1610#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo2: TfrxMemoView
        AllowVectorExport = True
        Top = 33.400000000000000000
        Width = 719.360000000000000000
        Height = 26.385276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1608#1586#1575#1585#1577' '#1575#1604#1578#1585#1576#1610#1577' '#1575#1604#1608#1591#1606#1610#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo3: TfrxMemoView
        AllowVectorExport = True
        Left = 466.800000000000000000
        Top = 86.400000000000000000
        Width = 240.960000000000000000
        Height = 24.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          #1605#1583#1610#1585#1610#1577' '#1575#1604#1578#1585#1576#1610#1577' '#1604#1608#1604#1575#1610#1577' '#1575#1604#1608#1575#1583#1610' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo4: TfrxMemoView
        AllowVectorExport = True
        Left = 383.400000000000000000
        Top = 112.800000000000000000
        Width = 327.360000000000000000
        Height = 24.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '-  '#1579#1575#1606#1608#1610#1577' '#1583#1610#1583#1610' '#1589#1575#1604#1581'  - '#1581#1587#1575#1606#1610' '#1593#1576#1583' '#1575#1604#1603#1585#1610#1600#1600#1600#1605'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo5: TfrxMemoView
        AllowVectorExport = True
        Left = 655.800000000000000000
        Top = 141.000000000000000000
        Width = 48.960000000000000000
        Height = 21.120000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1575#1604#1585#1602#1600#1605' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Gradient1: TfrxGradientView
        AllowVectorExport = True
        Left = 178.318275000000000000
        Top = 216.000000000000000000
        Width = 297.600000000000000000
        Height = 33.600000000000000000
        BeginColor = clGray
        EndColor = clWhite
        Style = gsVertical
        Frame.Typ = []
        Color = 12566463
      end
      object Memo6: TfrxMemoView
        AllowVectorExport = True
        Left = 189.438275000000000000
        Top = 216.000000000000000000
        Width = 279.360000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1573#1579#1576#1575#1578' '#1589#1581#1577' '#1575#1604#1588#1607#1575#1583#1577' '#1575#1604#1605#1583#1585#1587#1610#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo7: TfrxMemoView
        AllowVectorExport = True
        Left = 54.000000000000000000
        Top = 324.200000000000000000
        Width = 653.760000000000000000
        Height = 35.985276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          
            ': '#1585#1583#1575' '#1593#1604#1609' '#1573#1585#1587#1575#1604#1603#1605' '#1575#1604#1605#1588#1575#1585' '#1575#1604#1610#1607'  '#1601#1610' '#1575#1604#1605#1585#1580#1593' '#1571#1593#1604#1575#1607' '#1604#1610' '#1575#1604#1588#1585#1601' '#1571#1606' '#1571#1581#1610#1591#1603 +
            #1605' '#1593#1604#1605#1575' '#1571#1606' '#1575#1604#1578#1604#1605#1610#1584' ('#1577')')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo8: TfrxMemoView
        AllowVectorExport = True
        Left = 595.200000000000000000
        Top = 385.400000000000000000
        Width = 68.160000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1604#1602#1576)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo9: TfrxMemoView
        AllowVectorExport = True
        Left = 305.200000000000000000
        Top = 385.120000000000000000
        Width = 77.760000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1575#1587#1605)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo10: TfrxMemoView
        AllowVectorExport = True
        Left = 470.400000000000000000
        Top = 441.400000000000000000
        Width = 192.960000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1578#1575#1585#1610#1582' '#1608#1605#1603#1575#1606' '#1575#1604#1605#1610#1604#1575#1583)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo11: TfrxMemoView
        AllowVectorExport = True
        Left = 272.800000000000000000
        Top = 441.760000000000000000
        Width = 58.560000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1576#1600#1600#1600#1600#1600' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo12: TfrxMemoView
        AllowVectorExport = True
        Left = 86.400000000000000000
        Top = 492.200000000000000000
        Width = 509.760000000000000000
        Height = 35.520000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'SUltan Medium'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '- '#1578#1575#1576#1600#1600#1593' ('#1578') '#1583#1585#1575#1587#1578#1607' ('#1607#1575')  - ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo13: TfrxMemoView
        AllowVectorExport = True
        Left = 432.000000000000000000
        Top = 551.400000000000000000
        Width = 231.360000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1582#1604#1575#1604' '#1575#1604#1587#1606#1600#1600#1600#1600#1600#1577' '#1575#1604#1583#1585#1575#1587#1610#1600#1600#1600#1600#1577'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo14: TfrxMemoView
        AllowVectorExport = True
        Left = 432.000000000000000000
        Top = 610.600000000000000000
        Width = 231.360000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '  : '#1601#1610' '#1602#1587#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1605' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo15: TfrxMemoView
        AllowVectorExport = True
        Left = 432.000000000000000000
        Top = 668.600000000000000000
        Width = 231.360000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1585#1602#1600#1600#1600#1605' '#1575#1604#1578#1587#1580#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1604' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo16: TfrxMemoView
        AllowVectorExport = True
        Left = 217.000000000000000000
        Top = 668.280000000000000000
        Width = 154.560000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1578#1600#1600#1600#1600#1575#1585#1610#1582' '#1575#1604#1582#1600#1600#1600#1585#1608#1580' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo17: TfrxMemoView
        AllowVectorExport = True
        Top = 727.200000000000000000
        Width = 720.960000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1608#1593#1604#1610#1577' '#1601#1573#1606' '#1575#1604#1588#1607#1575#1583#1577' '#1575#1604#1605#1583#1585#1587#1610#1577' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo18: TfrxMemoView
        AllowVectorExport = True
        Left = 98.800000000000000000
        Top = 834.200000000000000000
        Width = 269.760000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1581#1585#1585' '#1576#1600' : '#1581#1587#1575#1606#1610' '#1593#1576#1583' '#1575#1604#1603#1585#1610#1605' '#1601#1610' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Date: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 2.200000000000000000
        Top = 834.280000000000000000
        Width = 115.200000000000000000
        Height = 28.800000000000000000
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[Date]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo19: TfrxMemoView
        AllowVectorExport = True
        Left = 122.400000000000000000
        Top = 873.200000000000000000
        Width = 173.760000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = [fsUnderline]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1575#1604#1605#1583#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1585'('#1577')')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Nom_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 412.800000000000000000
        Top = 385.400000000000000000
        Width = 182.400000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Nom_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo41: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 123.600000000000000000
        Top = 385.120000000000000000
        Width = 182.400000000000000000
        Height = 25.920000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Pren_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Date_naiss_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 362.800000000000000000
        Top = 440.600000000000000000
        Width = 124.800000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Date_naiss_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Lieu_naiss_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 81.400000000000000000
        Top = 440.800000000000000000
        Width = 201.600000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Lieu_naiss_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1class: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 77.200000000000000000
        Top = 610.520000000000000000
        Width = 355.200000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."class"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Num_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 378.400000000000000000
        Top = 668.600000000000000000
        Width = 67.200000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = '0000'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Num_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo43: TfrxMemoView
        AllowVectorExport = True
        Left = 377.400000000000000000
        Top = 552.079820630000000000
        Width = 9.600000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '/')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo42: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 310.400000000000000000
        Top = 551.600000000000000000
        Width = 67.200000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Annee"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memomyclas_certi: TfrxMemoView
        AllowVectorExport = True
        Left = 607.000000000000000000
        Top = 141.120000000000000000
        Width = 48.960000000000000000
        Height = 21.120000000000000000
        DisplayFormat.FormatStr = '000'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object Memodate_exit: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 104.600000000000000000
        Top = 668.000000000000000000
        Width = 115.200000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object Memomyannee: TfrxMemoView
        AllowVectorExport = True
        Left = 384.000000000000000000
        Top = 551.600000000000000000
        Width = 48.000000000000000000
        Height = 28.800000000000000000
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object Memomyyear: TfrxMemoView
        AllowVectorExport = True
        Left = 118.666666670000000000
        Top = 668.160000000000000000
        Width = 45.349494950000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo20: TfrxMemoView
        AllowVectorExport = True
        Left = 94.600000000000000000
        Top = 86.400000000000000000
        Width = 125.760000000000000000
        Height = 24.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1587#1606#1577' '#1575#1604#1583#1585#1575#1587#1610#1577'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo21: TfrxMemoView
        AllowVectorExport = True
        Left = 460.000000000000000000
        Top = 216.400000000000000000
        Width = 202.560000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          ' :  '#1575#1604#1605#1608#1590#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1608#1593)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo23: TfrxMemoView
        AllowVectorExport = True
        Left = 466.481725000000000000
        Top = 263.400000000000000000
        Width = 212.160000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          ' : '#1575#1604#1605#1585#1580#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1593)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo24: TfrxMemoView
        AllowVectorExport = True
        Left = 374.400000000000000000
        Top = 263.000000000000000000
        Width = 125.760000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          ' : '#1573#1585#1587#1575#1604#1603#1605' '#1585#1602#1605' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object MemoNum_cer_conta_: TfrxMemoView
        AllowVectorExport = True
        Left = 217.600000000000000000
        Top = 256.320000000000000000
        Width = 164.160000000000000000
        Height = 38.400000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Khalid Art bold'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo26: TfrxMemoView
        AllowVectorExport = True
        Left = 139.400000000000000000
        Top = 262.000000000000000000
        Width = 68.160000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1576#1578#1575#1585#1610#1582)
        ParentFont = False
        VAlign = vaCenter
      end
      object MemomDate_cer_conta_: TfrxMemoView
        AllowVectorExport = True
        Left = 39.200000000000000000
        Top = 262.000000000000000000
        Width = 106.560000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object Shape1: TfrxShapeView
        AllowVectorExport = True
        Left = 504.600000000000000000
        Top = 769.400000000000000000
        Width = 24.839263800000000000
        Height = 25.467484660000000000
        Frame.Typ = []
      end
      object Memo28: TfrxMemoView
        AllowVectorExport = True
        Left = 419.600000000000000000
        Top = 767.400000000000000000
        Width = 77.760000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          #1589#1581#1610#1581#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo29: TfrxMemoView
        AllowVectorExport = True
        Left = 168.400000000000000000
        Top = 767.480000000000000000
        Width = 106.560000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          #1594#1610#1585' '#1589#1581#1610#1581#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Shape2: TfrxShapeView
        AllowVectorExport = True
        Left = 281.000000000000000000
        Top = 769.720000000000000000
        Width = 24.839263800000000000
        Height = 25.467484660000000000
        Frame.Typ = []
      end
      object Memo30: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = -8.200000000000000000
        Top = 86.400000000000000000
        Width = 76.800000000000000000
        Height = 24.000000000000000000
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[Date]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo32: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 52.800000000000000000
        Top = 86.400000000000000000
        Width = 9.600000000000000000
        Height = 24.000000000000000000
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '/')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo33: TfrxMemoView
        AllowVectorExport = True
        Left = 178.600000000000000000
        Top = 133.480000000000000000
        Width = 116.160000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          ': '#1573#1604#1609' '#1575#1604#1587#1610#1600#1600#1600#1600#1600#1600#1600#1583' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memonom: TfrxMemoView
        AllowVectorExport = True
        Left = 25.000000000000000000
        Top = 166.800000000000000000
        Width = 423.360000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object Memoday: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 57.600000000000000000
        Top = 86.400000000000000000
        Width = 48.000000000000000000
        Height = 24.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
    end
  end
  object DB_Re_Certif_docu: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'DB_Re_Certif_docu'
    CloseDataSource = False
    DataSource = ds_Query_Uneleve
    BCDToCurrency = False
    Left = 288
    Top = 64
  end
  object Query_Releve_notes: TFDQuery
    OnFilterRecord = Query_Releve_notesFilterRecord
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Releve_notes')
    Left = 504
    Top = 320
    object Query_Releve_notesNom_Rel_not: TStringField
      FieldName = 'Nom_Rel_not'
      Origin = 'Nom_Rel_not'
      Required = True
      Size = 25
    end
    object Query_Releve_notesArchi_Rel_not: TWideStringField
      FieldName = 'Archi_Rel_not'
      Origin = 'Archi_Rel_not'
      Required = True
      Size = 15
    end
    object Query_Releve_notesNum_ele: TIntegerField
      FieldName = 'Num_ele'
      Origin = 'Num_ele'
      Required = True
    end
    object Query_Releve_notesNom_ele: TStringField
      FieldKind = fkLookup
      FieldName = 'Nom_ele'
      LookupDataSet = Query_Uneleve
      LookupKeyFields = 'Num_ele'
      LookupResultField = 'Nom_ele'
      KeyFields = 'Num_ele'
      Lookup = True
    end
    object Query_Releve_notesPren_ele: TStringField
      FieldKind = fkLookup
      FieldName = 'Pren_ele'
      LookupDataSet = Query_Uneleve
      LookupKeyFields = 'Num_ele'
      LookupResultField = 'Pren_ele'
      KeyFields = 'Num_ele'
      Lookup = True
    end
    object Query_Releve_notesNum_Rel_not: TIntegerField
      FieldName = 'Num_Rel_not'
      Origin = 'Num_Rel_not'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object ds_Query_Releve_notes: TDataSource
    DataSet = Query_Releve_notes
    Left = 662
    Top = 320
  end
  object ds_Query_Rel_note_Docu: TDataSource
    DataSet = Query_Rel_note_Docu
    Left = 785
    Top = 320
  end
  object Rel_docu: TfrxReport
    Version = '6.6.15'
    DataSet = DB_Re_Certif_docu
    DataSetName = 'DB_Re_Certif_docu'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1575#1604#1573#1601#1578#1585#1575#1590#1610
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44543.838776701400000000
    ReportOptions.LastChange = 44547.623197141200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      ' begin'
      ''
      'end;'
      'procedure Page1OnManualBuild(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 168
    Top = 16
    Datasets = <
      item
        DataSet = DB_Re_Certif_docu
        DataSetName = 'DB_Re_Certif_docu'
      end
      item
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 9.906000000000000000
      RightMargin = 9.906000000000000000
      TopMargin = 9.906000000000000000
      BottomMargin = 9.906000000000000000
      ColumnWidth = 277.114000000000000000
      ColumnPositions.Strings = (
        '0')
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object Memo1: TfrxMemoView
        AllowVectorExport = True
        ShiftMode = smDontShift
        Top = 1.000000000000000000
        Width = 719.360000000000000000
        Height = 26.385276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1575#1604#1580#1605#1607#1608#1585#1610#1577' '#1575#1604#1580#1586#1575#1574#1585#1610#1577' '#1575#1604#1583#1610#1605#1602#1585#1575#1591#1610#1577' '#1575#1604#1588#1593#1576#1610#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo2: TfrxMemoView
        AllowVectorExport = True
        Top = 33.400000000000000000
        Width = 719.360000000000000000
        Height = 26.385276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1608#1586#1575#1585#1577' '#1575#1604#1578#1585#1576#1610#1577' '#1575#1604#1608#1591#1606#1610#1577)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo3: TfrxMemoView
        AllowVectorExport = True
        Left = 466.800000000000000000
        Top = 86.400000000000000000
        Width = 240.960000000000000000
        Height = 24.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          #1605#1583#1610#1585#1610#1577' '#1575#1604#1578#1585#1576#1610#1577' '#1604#1608#1604#1575#1610#1577' '#1575#1604#1608#1575#1583#1610' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo4: TfrxMemoView
        AllowVectorExport = True
        Left = 383.400000000000000000
        Top = 112.800000000000000000
        Width = 327.360000000000000000
        Height = 24.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '-  '#1579#1575#1606#1608#1610#1577' '#1583#1610#1583#1610' '#1589#1575#1604#1581'  - '#1581#1587#1575#1606#1610' '#1593#1576#1583' '#1575#1604#1603#1585#1610#1600#1600#1600#1605'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo5: TfrxMemoView
        AllowVectorExport = True
        Left = 655.800000000000000000
        Top = 141.000000000000000000
        Width = 48.960000000000000000
        Height = 21.120000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1575#1604#1585#1602#1600#1605' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Gradient1: TfrxGradientView
        AllowVectorExport = True
        Left = 178.318275000000000000
        Top = 216.000000000000000000
        Width = 297.600000000000000000
        Height = 33.600000000000000000
        BeginColor = clGray
        EndColor = clWhite
        Style = gsVertical
        Frame.Typ = []
        Color = 12566463
      end
      object Memo6: TfrxMemoView
        AllowVectorExport = True
        Left = 189.438275000000000000
        Top = 216.000000000000000000
        Width = 279.360000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1573#1579#1576#1575#1578' '#1589#1581#1577' '#1603#1588#1601' '#1606#1602#1575#1591)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo7: TfrxMemoView
        AllowVectorExport = True
        Left = 54.000000000000000000
        Top = 324.200000000000000000
        Width = 653.760000000000000000
        Height = 35.985276070000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          
            ': '#1585#1583#1575' '#1593#1604#1609' '#1573#1585#1587#1575#1604#1603#1605' '#1575#1604#1605#1588#1575#1585' '#1575#1604#1610#1607'  '#1601#1610' '#1575#1604#1605#1585#1580#1593' '#1571#1593#1604#1575#1607' '#1604#1610' '#1575#1604#1588#1585#1601' '#1571#1606' '#1571#1581#1610#1591#1603 +
            #1605' '#1593#1604#1605#1575' '#1571#1606' '#1575#1604#1578#1604#1605#1610#1584' ('#1577')')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo8: TfrxMemoView
        AllowVectorExport = True
        Left = 595.200000000000000000
        Top = 385.400000000000000000
        Width = 68.160000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1604#1602#1576)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo9: TfrxMemoView
        AllowVectorExport = True
        Left = 305.200000000000000000
        Top = 385.120000000000000000
        Width = 77.760000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1575#1587#1605)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo10: TfrxMemoView
        AllowVectorExport = True
        Left = 470.400000000000000000
        Top = 441.400000000000000000
        Width = 192.960000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1578#1575#1585#1610#1582' '#1608#1605#1603#1575#1606' '#1575#1604#1605#1610#1604#1575#1583)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo11: TfrxMemoView
        AllowVectorExport = True
        Left = 272.800000000000000000
        Top = 441.760000000000000000
        Width = 58.560000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1576#1600#1600#1600#1600#1600' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo12: TfrxMemoView
        AllowVectorExport = True
        Left = 86.400000000000000000
        Top = 492.200000000000000000
        Width = 509.760000000000000000
        Height = 35.520000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'SUltan Medium'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '- '#1578#1575#1576#1600#1600#1593' ('#1578') '#1583#1585#1575#1587#1578#1607' ('#1607#1575')  - ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo13: TfrxMemoView
        AllowVectorExport = True
        Left = 432.000000000000000000
        Top = 551.400000000000000000
        Width = 231.360000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1582#1604#1575#1604' '#1575#1604#1587#1606#1600#1600#1600#1600#1600#1577' '#1575#1604#1583#1585#1575#1587#1610#1600#1600#1600#1600#1577'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo14: TfrxMemoView
        AllowVectorExport = True
        Left = 432.000000000000000000
        Top = 610.600000000000000000
        Width = 231.360000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '  : '#1601#1610' '#1602#1587#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1605' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo15: TfrxMemoView
        AllowVectorExport = True
        Left = 432.000000000000000000
        Top = 668.600000000000000000
        Width = 231.360000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1585#1602#1600#1600#1600#1605' '#1575#1604#1578#1587#1580#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1604' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo16: TfrxMemoView
        AllowVectorExport = True
        Left = 217.000000000000000000
        Top = 668.280000000000000000
        Width = 154.560000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ': '#1578#1600#1600#1600#1600#1575#1585#1610#1582' '#1575#1604#1582#1600#1600#1600#1585#1608#1580' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo17: TfrxMemoView
        AllowVectorExport = True
        Top = 727.200000000000000000
        Width = 720.960000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1608#1593#1604#1610#1577' '#1601#1573#1606' '#1603#1588#1601' '#1606#1602#1575#1591' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo18: TfrxMemoView
        AllowVectorExport = True
        Left = 98.800000000000000000
        Top = 834.200000000000000000
        Width = 269.760000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1581#1585#1585' '#1576#1600' : '#1581#1587#1575#1606#1610' '#1593#1576#1583' '#1575#1604#1603#1585#1610#1605' '#1601#1610' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Date: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 2.200000000000000000
        Top = 834.280000000000000000
        Width = 115.200000000000000000
        Height = 28.800000000000000000
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[Date]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo19: TfrxMemoView
        AllowVectorExport = True
        Left = 122.400000000000000000
        Top = 873.200000000000000000
        Width = 173.760000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = [fsUnderline]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          #1575#1604#1605#1583#1610#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1585'('#1577')')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Nom_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 412.800000000000000000
        Top = 385.400000000000000000
        Width = 182.400000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Nom_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo41: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 123.600000000000000000
        Top = 385.120000000000000000
        Width = 182.400000000000000000
        Height = 25.920000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Pren_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Date_naiss_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 362.800000000000000000
        Top = 440.600000000000000000
        Width = 124.800000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = ARABIC_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Date_naiss_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Lieu_naiss_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 81.400000000000000000
        Top = 440.800000000000000000
        Width = 201.600000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Lieu_naiss_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1class: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 77.200000000000000000
        Top = 610.520000000000000000
        Width = 355.200000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."class"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object frxDBDataset1Num_ele: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 378.400000000000000000
        Top = 668.600000000000000000
        Width = 67.200000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = '0000'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Num_ele"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo43: TfrxMemoView
        AllowVectorExport = True
        Left = 377.400000000000000000
        Top = 552.079820630000000000
        Width = 9.600000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '/')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo42: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 310.400000000000000000
        Top = 551.600000000000000000
        Width = 67.200000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[DB_Re_Certif_docu."Annee"]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memomyclas_certi: TfrxMemoView
        AllowVectorExport = True
        Left = 607.000000000000000000
        Top = 141.120000000000000000
        Width = 48.960000000000000000
        Height = 21.120000000000000000
        DisplayFormat.FormatStr = '000'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object Memodate_exit: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 104.600000000000000000
        Top = 668.000000000000000000
        Width = 115.200000000000000000
        Height = 28.800000000000000000
        DataSet = DB_Certif
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = 'yyyy/mm/dd'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object Memomyannee: TfrxMemoView
        AllowVectorExport = True
        Left = 384.000000000000000000
        Top = 551.600000000000000000
        Width = 48.000000000000000000
        Height = 28.800000000000000000
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object Memomyyear: TfrxMemoView
        AllowVectorExport = True
        Left = 118.666666670000000000
        Top = 668.160000000000000000
        Width = 45.349494950000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo20: TfrxMemoView
        AllowVectorExport = True
        Left = 94.600000000000000000
        Top = 86.400000000000000000
        Width = 125.760000000000000000
        Height = 24.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1575#1604#1587#1606#1577' '#1575#1604#1583#1585#1575#1587#1610#1577'  ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo21: TfrxMemoView
        AllowVectorExport = True
        Left = 460.000000000000000000
        Top = 216.400000000000000000
        Width = 202.560000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          ' :  '#1575#1604#1605#1608#1590#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1608#1593)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo23: TfrxMemoView
        AllowVectorExport = True
        Left = 466.481725000000000000
        Top = 263.400000000000000000
        Width = 212.160000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          ' : '#1575#1604#1605#1585#1580#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1600#1593)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo24: TfrxMemoView
        AllowVectorExport = True
        Left = 374.400000000000000000
        Top = 263.000000000000000000
        Width = 125.760000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          ' : '#1573#1585#1587#1575#1604#1603#1605' '#1585#1602#1605' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object MemoNum_cer_conta_: TfrxMemoView
        AllowVectorExport = True
        Left = 217.600000000000000000
        Top = 256.320000000000000000
        Width = 164.160000000000000000
        Height = 38.400000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Khalid Art bold'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo26: TfrxMemoView
        AllowVectorExport = True
        Left = 139.400000000000000000
        Top = 262.000000000000000000
        Width = 68.160000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          ' : '#1576#1578#1575#1585#1610#1582)
        ParentFont = False
        VAlign = vaCenter
      end
      object MemomDate_cer_conta_: TfrxMemoView
        AllowVectorExport = True
        Left = 39.200000000000000000
        Top = 262.000000000000000000
        Width = 106.560000000000000000
        Height = 33.600000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        ParentFont = False
        VAlign = vaCenter
      end
      object Shape1: TfrxShapeView
        AllowVectorExport = True
        Left = 504.600000000000000000
        Top = 769.400000000000000000
        Width = 24.839263800000000000
        Height = 25.467484660000000000
        Frame.Typ = []
      end
      object Memo28: TfrxMemoView
        AllowVectorExport = True
        Left = 419.600000000000000000
        Top = 767.400000000000000000
        Width = 77.760000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          #1589#1581#1610#1581)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo29: TfrxMemoView
        AllowVectorExport = True
        Left = 168.400000000000000000
        Top = 767.480000000000000000
        Width = 106.560000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          #1594#1610#1585' '#1589#1581#1610#1581)
        ParentFont = False
        VAlign = vaCenter
      end
      object Shape2: TfrxShapeView
        AllowVectorExport = True
        Left = 281.000000000000000000
        Top = 769.720000000000000000
        Width = 24.839263800000000000
        Height = 25.467484660000000000
        Frame.Typ = []
      end
      object Memo30: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = -8.200000000000000000
        Top = 86.400000000000000000
        Width = 76.800000000000000000
        Height = 24.000000000000000000
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[Date]')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo32: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 52.800000000000000000
        Top = 86.400000000000000000
        Width = 9.600000000000000000
        Height = 24.000000000000000000
        DisplayFormat.FormatStr = 'yyyy'
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '/')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo33: TfrxMemoView
        AllowVectorExport = True
        Left = 178.600000000000000000
        Top = 133.480000000000000000
        Width = 116.160000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          ': '#1573#1604#1609' '#1575#1604#1587#1610#1600#1600#1600#1600#1600#1600#1600#1583' ')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memonom: TfrxMemoView
        AllowVectorExport = True
        Left = 25.000000000000000000
        Top = 166.800000000000000000
        Width = 423.360000000000000000
        Height = 28.800000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'SUltan Medium'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
      object Memoday: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 57.600000000000000000
        Top = 86.400000000000000000
        Width = 48.000000000000000000
        Height = 24.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Adobe Arabic'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        ParentFont = False
        VAlign = vaCenter
      end
    end
  end
  object DB_Rel_docu: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'DB_Rel_docu'
    CloseDataSource = False
    DataSource = ds_Query_Uneleve
    BCDToCurrency = False
    Left = 168
    Top = 64
  end
  object Query_Rel_note_Docu: TFDQuery
    OnFilterRecord = Query_Rel_note_DocuFilterRecord
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Releve_notes_Docum')
    Left = 391
    Top = 320
    object Query_Rel_note_DocuNum_rel_docu: TIntegerField
      FieldName = 'Num_rel_docu'
      Origin = 'Num_rel_docu'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Query_Rel_note_DocuNom_rel_instit_envo: TWideStringField
      FieldName = 'Nom_rel_instit_envo'
      Origin = 'Nom_rel_instit_envo'
      Size = 45
    end
    object Query_Rel_note_DocuNom_rel_docu: TStringField
      FieldName = 'Nom_rel_docu'
      Origin = 'Nom_rel_docu'
      Size = 30
    end
    object Query_Rel_note_DocuDate_rel_conta: TDateField
      FieldName = 'Date_rel_conta'
      Origin = 'Date_rel_conta'
    end
    object Query_Rel_note_DocuNum_Rel_not: TIntegerField
      FieldName = 'Num_Rel_not'
      Origin = 'Num_Rel_not'
    end
    object Query_Rel_note_DocuNom_ele: TStringField
      FieldKind = fkLookup
      FieldName = 'Nom_ele'
      LookupDataSet = Query_Releve_notes
      LookupKeyFields = 'Num_Rel_not'
      LookupResultField = 'Nom_ele'
      KeyFields = 'Num_Rel_not'
      Lookup = True
    end
    object Query_Rel_note_DocuPren_ele: TStringField
      FieldKind = fkLookup
      FieldName = 'Pren_ele'
      LookupDataSet = Query_Releve_notes
      LookupKeyFields = 'Num_Rel_not'
      LookupResultField = 'Pren_ele'
      KeyFields = 'Num_Rel_not'
      Lookup = True
    end
    object Query_Rel_note_DocuNum_rel_conta: TWideStringField
      FieldName = 'Num_rel_conta'
      Origin = 'Num_rel_conta'
      Required = True
      Size = 25
    end
  end
  object FDManager1: TFDManager
    WaitCursor = gcrAppWait
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 1072
    Top = 96
  end
  object Query_Backup: TFDQuery
    Connection = FDConnection
    Left = 992
    Top = 48
  end
  object Query_Restore: TFDQuery
    Connection = FDConnection
    Left = 1064
    Top = 48
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=Gestion_Archives'
      'Server=.\SQLEXPRESS'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    ConnectedStoredUsage = []
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    BeforeConnect = FDConnectionBeforeConnect
    Left = 40
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrAppWait
    Left = 328
    Top = 168
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'UPDATE Person')
    Left = 792
    Top = 160
  end
  object fdqry1: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * From Un_eleve'
      '')
    Left = 672
    Top = 25
    object intgrfld1: TIntegerField
      FieldName = 'Num_ele'
      Origin = 'Num_ele'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object strngfld1: TStringField
      FieldName = 'Pren_ele'
      Origin = 'Pren_ele'
      Required = True
      Size = 25
    end
    object strngfld2: TStringField
      FieldName = 'Nom_ele'
      Origin = 'Nom_ele'
      Required = True
      Size = 25
    end
    object dtfld1: TDateField
      FieldName = 'Date_naiss_ele'
      Origin = 'Date_naiss_ele'
      Required = True
    end
    object wdstrngfld1: TWideStringField
      FieldName = 'Lieu_naiss_ele'
      Origin = 'Lieu_naiss_ele'
      Required = True
    end
    object wdstrngfld2: TWideStringField
      FieldName = 'Adr_ele'
      Origin = 'Adr_ele'
      Required = True
      Size = 30
    end
    object strngfld3: TStringField
      FieldName = 'Nom_gardi'
      Origin = 'Nom_gardi'
      Required = True
    end
    object intgrfld2: TIntegerField
      FieldName = 'Num_annee_scol'
      Origin = 'Num_annee_scol'
      Required = True
    end
    object intgrfld3: TIntegerField
      FieldName = 'Num_class'
      Origin = 'Num_class'
      Required = True
    end
    object dtfld2: TDateField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'Annee'
      LookupDataSet = Query_Annee
      LookupKeyFields = 'Num_annee_scol'
      LookupResultField = 'Annee_scol'
      KeyFields = 'Num_annee_scol'
      Lookup = True
    end
    object strngfld4: TStringField
      FieldKind = fkLookup
      FieldName = 'class'
      LookupDataSet = Query_Classe
      LookupKeyFields = 'Num_class'
      LookupResultField = 'Nom_class'
      KeyFields = 'Num_class'
      Size = 35
      Lookup = True
    end
    object intgrfld4: TIntegerField
      FieldKind = fkLookup
      FieldName = 'aa'
      LookupDataSet = Query_Classe
      LookupKeyFields = 'Nom_class'
      LookupResultField = 'Num_divisi'
      KeyFields = 'class'
      Lookup = True
    end
    object strngfld5: TStringField
      FieldKind = fkLookup
      FieldName = '11'
      LookupDataSet = Query_Division
      LookupKeyFields = 'Num_divisi'
      LookupResultField = 'Nom_divisi'
      KeyFields = 'aa'
      Lookup = True
    end
  end
end
