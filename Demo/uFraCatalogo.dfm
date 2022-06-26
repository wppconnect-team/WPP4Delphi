object frameCatalogo: TframeCatalogo
  Left = 0
  Top = 0
  Width = 870
  Height = 522
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Roboto'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnlGridCatalogo: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 161
    Align = alTop
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 32
      Width = 868
      Height = 128
      Align = alClient
      DataSource = dsCatalogo
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'isHidden'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'catalogWid'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'url'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'description'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'availability'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reviewStatus'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'canAppeal'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'currency'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'priceAmount1000'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'salePriceAmount1000'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'salePriceStartDate'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'salePriceEndDate'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'retailerId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'imageCount'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'index'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'additionalImageCdnUrl'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'additionalImageHashes'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'imageCdnUrl'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'imageHash'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 't'
          Visible = True
        end>
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 215
      Height = 25
      Margins.Right = 650
      Align = alTop
      Caption = 'Buscar Cat'#225'logo'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object gbOpcoesCatalogo: TGroupBox
    Left = 600
    Top = 161
    Width = 270
    Height = 361
    Align = alRight
    Caption = 'Op'#231#245'es'
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 161
    Width = 273
    Height = 361
    Align = alLeft
    Caption = 'Imagens do produto'
    TabOrder = 2
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 2
      Top = 17
      Width = 269
      Height = 342
      Align = alClient
      DataSource = dsImagens
      PanelHeight = 171
      PanelWidth = 252
      TabOrder = 0
      RowCount = 2
      object DBImage1: TDBImage
        Left = 0
        Top = 0
        Width = 252
        Height = 171
        Align = alClient
        DataField = 'imagem'
        DataSource = dsImagens
        Proportional = True
        QuickDraw = False
        Stretch = True
        TabOrder = 0
      end
    end
  end
  object dsCatalogo: TDataSource
    DataSet = cdsCatalogo
    Left = 456
    Top = 176
  end
  object cdsCatalogo: TClientDataSet
    PersistDataPacket.Data = {
      EC0200009619E0BD010000001800000017000000000003000000EC0202696401
      0049000000010005574944544802000200140008697348696464656E02000300
      000000000A636174616C6F675769640100490000000100055749445448020002
      001E000375726C0100490000000100055749445448020002009600046E616D65
      01004900000001000557494454480200020064000B6465736372697074696F6E
      010049000000010005574944544802000200C8000C617661696C6162696C6974
      7901004900000001000557494454480200020064000C72657669657753746174
      757301004900000001000557494454480200020014000963616E41707065616C
      02000300000000000863757272656E6379010049000000010005574944544802
      00020003000F7072696365416D6F756E74313030300800040000000100075355
      42545950450200490006004D6F6E6579001373616C655072696365416D6F756E
      7431303030080004000000010007535542545950450200490006004D6F6E6579
      001273616C655072696365537461727444617465010049000000010005574944
      5448020002000A001073616C655072696365456E644461746501004900000001
      00055749445448020002000A000A72657461696C657249640100490000000100
      0557494454480200020032000A696D616765436F756E74040001000000000005
      696E646578010049000000010005574944544802000200140015616464697469
      6F6E616C496D61676543646E55726C0200490000000100055749445448020002
      00F401156164646974696F6E616C496D61676548617368657301004900000001
      000557494454480200020064000B696D61676543646E55726C02004900000001
      0005574944544802000200200309696D61676548617368010049000000010005
      5749445448020002003200017401004900000001000557494454480200020032
      000F696D6167656D50726F6475746F0D0A04004B000000010007535542545950
      4502004900070042696E617279000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'isHidden'
        DataType = ftBoolean
      end
      item
        Name = 'catalogWid'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'url'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'description'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'availability'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'reviewStatus'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'canAppeal'
        DataType = ftBoolean
      end
      item
        Name = 'currency'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'priceAmount1000'
        DataType = ftCurrency
      end
      item
        Name = 'salePriceAmount1000'
        DataType = ftCurrency
      end
      item
        Name = 'salePriceStartDate'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'salePriceEndDate'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'retailerId'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'imageCount'
        DataType = ftInteger
      end
      item
        Name = 'index'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'additionalImageCdnUrl'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'additionalImageHashes'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'imageCdnUrl'
        DataType = ftString
        Size = 800
      end
      item
        Name = 'imageHash'
        DataType = ftString
        Size = 50
      end
      item
        Name = 't'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'imagemProduto'#13#10
        DataType = ftBlob
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsCatalogoAfterScroll
    Left = 464
    Top = 264
    object cdsCatalogoid: TStringField
      FieldName = 'id'
    end
    object cdsCatalogoisHidden: TBooleanField
      FieldName = 'isHidden'
    end
    object cdsCatalogocatalogWid: TStringField
      FieldName = 'catalogWid'
      Size = 30
    end
    object cdsCatalogourl: TStringField
      FieldName = 'url'
      Size = 150
    end
    object cdsCatalogoname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object cdsCatalogodescription: TStringField
      FieldName = 'description'
      Size = 200
    end
    object cdsCatalogoavailability: TStringField
      FieldName = 'availability'
      Size = 100
    end
    object cdsCatalogoreviewStatus: TStringField
      FieldName = 'reviewStatus'
    end
    object cdsCatalogocanAppeal: TBooleanField
      FieldName = 'canAppeal'
    end
    object cdsCatalogocurrency: TStringField
      FieldName = 'currency'
      Size = 3
    end
    object cdsCatalogopriceAmount1000: TCurrencyField
      FieldName = 'priceAmount1000'
    end
    object cdsCatalogosalePriceAmount1000: TCurrencyField
      FieldName = 'salePriceAmount1000'
    end
    object cdsCatalogosalePriceStartDate: TStringField
      FieldName = 'salePriceStartDate'
      Size = 10
    end
    object cdsCatalogosalePriceEndDate: TStringField
      FieldName = 'salePriceEndDate'
      Size = 10
    end
    object cdsCatalogoretailerId: TStringField
      FieldName = 'retailerId'
      Size = 50
    end
    object cdsCatalogoimageCount: TIntegerField
      FieldName = 'imageCount'
    end
    object cdsCatalogoindex: TStringField
      FieldName = 'index'
    end
    object cdsCatalogoadditionalImageCdnUrl: TStringField
      FieldName = 'additionalImageCdnUrl'
      Size = 500
    end
    object cdsCatalogoadditionalImageHashes: TStringField
      FieldName = 'additionalImageHashes'
      Size = 100
    end
    object cdsCatalogoimageCdnUrl: TStringField
      FieldName = 'imageCdnUrl'
      Size = 800
    end
    object cdsCatalogoimageHash: TStringField
      FieldName = 'imageHash'
      Size = 50
    end
    object cdsCatalogot: TStringField
      FieldName = 't'
      Size = 50
    end
    object cdsCatalogoimagemProduto: TBlobField
      FieldName = 'imagemProduto'#13#10
    end
  end
  object dsImagens: TDataSource
    DataSet = cdsImagens
    Left = 114
    Top = 290
  end
  object cdsImagens: TClientDataSet
    PersistDataPacket.Data = {
      550000009619E0BD010000001800000002000000000003000000550002696401
      0049000000010005574944544802000200320006696D6167656D04004B000000
      0100075355425459504502004900070042696E617279000000}
    Active = True
    Aggregates = <>
    Filtered = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'imagem'
        DataType = ftBlob
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 98
    Top = 234
    object cdsImagensid: TStringField
      FieldName = 'id'
      Size = 50
    end
    object cdsImagensimagem: TBlobField
      FieldName = 'imagem'
    end
  end
end
