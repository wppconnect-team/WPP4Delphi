object frmPrincipal: TfrmPrincipal
  Left = 359
  Top = 202
  ActiveControl = wizPgInicio
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Instalador WPP4DELPHI'
  ClientHeight = 478
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wizPrincipal: TJvWizard
    Left = 0
    Top = 0
    Width = 720
    Height = 478
    Cursor = crHandPoint
    ActivePage = wizPgInicio
    ButtonBarHeight = 42
    ButtonStart.Caption = 'Para o in'#237'cio'
    ButtonStart.NumGlyphs = 1
    ButtonStart.Width = 100
    ButtonLast.Caption = 'Para o fim'
    ButtonLast.NumGlyphs = 1
    ButtonLast.Width = 100
    ButtonBack.Caption = '< &Voltar'
    ButtonBack.NumGlyphs = 1
    ButtonBack.Width = 100
    ButtonNext.Caption = '&Pr'#243'ximo >'
    ButtonNext.NumGlyphs = 1
    ButtonNext.Width = 100
    ButtonFinish.Caption = '&Finalizar'
    ButtonFinish.NumGlyphs = 1
    ButtonFinish.Width = 100
    ButtonCancel.Caption = 'Cancelar'
    ButtonCancel.NumGlyphs = 1
    ButtonCancel.ModalResult = 2
    ButtonCancel.Width = 100
    ButtonHelp.Caption = '&Ajuda'
    ButtonHelp.NumGlyphs = 1
    ButtonHelp.Width = 100
    ShowRouteMap = True
    OnFinishButtonClick = wizPrincipalFinishButtonClick
    OnCancelButtonClick = wizPrincipalCancelButtonClick
    DesignSize = (
      720
      478)
    object wizPgInicio: TJvWizardWelcomePage
      Header.Visible = False
      Header.Height = 50
      Header.ParentFont = False
      Header.Title.Color = clNone
      Header.Title.Text = 'Bem vindo a instala'#231#227'o do projeto ACBr'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Arial'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Visible = False
      Header.Subtitle.Text = 
        'Este instalar o guiar'#225' no processo de instala'#231#227'o do projeto ACBr' +
        '.'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Arial'
      Header.Subtitle.Font.Style = []
      VisibleButtons = [bkNext, bkCancel]
      Color = clWhite
      OnNextButtonClick = wizPgInicioNextButtonClick
      WaterMark.Visible = False
      WaterMark.Image.Alignment = iaCenter
      WaterMark.Image.Layout = ilTop
      WaterMark.Width = 80
      object Label6: TLabel
        Left = 25
        Top = 13
        Width = 367
        Height = 78
        Caption = 
          'O WPP4Delphi '#233' um componente de c'#243'digo aberto'#13#10#13#10#13#10#13#10'WPP4Delphi ' +
          'utiliza como componente de terceiros o TChromium (CEF4Delphi)'#13#10'd' +
          'esenvolvido e distribu'#237'do livremente por Salvador D'#237'az Fau.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object lblUrlfrce1: TLabel
        Left = 287
        Top = 230
        Width = 241
        Height = 13
        Cursor = crHandPoint
        Caption = 'https://github.com/wppconnect-team/WPP4Delphi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = URLClick
      end
      object Label19: TLabel
        Left = 25
        Top = 230
        Width = 256
        Height = 13
        Caption = 'Para maiores informa'#231#245'es sobre o componente visite:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 287
        Top = 249
        Width = 190
        Height = 13
        Cursor = crHandPoint
        Caption = 'https://tortoisesvn.net/downloads.html'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = URLClick
      end
      object Label12: TLabel
        Left = 25
        Top = 249
        Width = 250
        Height = 13
        Caption = 'Para baixar o cliente de SVN TORTOISE visite o site:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 25
        Top = 276
        Width = 218
        Height = 13
        Caption = 'Para acesso ao reposit'#243'rio fa'#231'a checkout em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 91
        Top = 291
        Width = 241
        Height = 13
        Cursor = crHandPoint
        Caption = 'https://github.com/wppconnect-team/WPP4Delphi'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentColor = False
        ParentFont = False
        OnClick = URLClick
      end
      object Label7: TLabel
        Left = 51
        Top = 291
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Master:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 138
        Top = 138
        Width = 203
        Height = 13
        Cursor = crHandPoint
        Caption = 'https://github.com/salvadordf/CEF4Delphi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = URLClick
      end
      object Label18: TLabel
        Left = 27
        Top = 121
        Width = 239
        Height = 13
        Caption = 'Acesso ao reposit'#243'rio CEF4 de Salvador D'#237'az Fau:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 40
        Top = 140
        Width = 92
        Height = 13
        Caption = 'Componente: ->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 347
        Top = 138
        Width = 6
        Height = 13
        Caption = '*'
      end
      object Label23: TLabel
        Left = 25
        Top = 176
        Width = 278
        Height = 13
        Caption = '* Obrigat'#243'rio possuir a biblioteca CEF4 antes de continuar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object DRLabel2: TLabel
        Left = 372
        Top = 22
        Width = 179
        Height = 13
        Caption = 'Vers'#227'o CEF4Delphi homologada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DRLabel3: TLabel
        Left = 398
        Top = 41
        Width = 147
        Height = 27
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'CEF Vers'#227'o: 101.0.4951.67'#13#10'Chromium 101.0.18'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 138
        Top = 157
        Width = 251
        Height = 13
        Cursor = crHandPoint
        Caption = 'https://github.com/salvadordf/CEF4Delphi/releases/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = URLClick
      end
      object Label10: TLabel
        Left = 40
        Top = 157
        Width = 90
        Height = 13
        Caption = 'Bin'#225'rios: ------>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 395
        Top = 157
        Width = 6
        Height = 13
        Caption = '*'
      end
    end
    object wizPgConfiguracao: TJvWizardInteriorPage
      Header.Visible = False
      Header.ParentFont = False
      Header.Title.Color = clNone
      Header.Title.Text = 'Configurando a sua instala'#231#227'o'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Arial'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 
        'Selecione as op'#231#245'es de instala'#231#227'o abaixo conforme as suas necess' +
        'idades'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Arial'
      Header.Subtitle.Font.Style = []
      Color = clWhite
      Caption = 'Configura'#231#245'es'
      OnNextButtonClick = wizPgConfiguracaoNextButtonClick
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label4: TLabel
        Left = 18
        Top = 205
        Width = 79
        Height = 13
        Caption = 'Vers'#227'o do delphi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 18
        Top = 253
        Width = 52
        Height = 13
        Caption = 'Plataforma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 18
        Top = 75
        Width = 321
        Height = 13
        Caption = 
          'Diret'#243'rio onde ser'#225' instalado (o diret'#243'rio ser'#225' criado se n'#227'o ex' +
          'istir)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnSelecDirInstall: TSpeedButton
        Left = 511
        Top = 89
        Width = 26
        Height = 24
        Hint = 'Clique para procurar pelo diret'#243'rio onde deseja instalar'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSelecDirInstallClick
      end
      object Label25: TLabel
        Left = 18
        Top = 126
        Width = 271
        Height = 13
        Caption = 'Diret'#243'rio de instala'#231#227'o do CEF4 (j'#225' deve estar instalado)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnSelecCEFInstall: TSpeedButton
        Left = 511
        Top = 140
        Width = 26
        Height = 24
        Hint = 'Clique para procurar pelo diret'#243'rio onde deseja instalar'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSelecCEFInstallClick
      end
      object edtDelphiVersion: TComboBox
        Left = 18
        Top = 221
        Width = 172
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = edtDelphiVersionChange
      end
      object edtPlatform: TComboBox
        Left = 18
        Top = 269
        Width = 172
        Height = 21
        Style = csDropDownList
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Items.Strings = (
          'Win32')
      end
      object edtDirDestino: TEdit
        Left = 18
        Top = 91
        Width = 487
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'C:\Twpp4delphi'
      end
      object edtCEFDestino: TEdit
        Left = 18
        Top = 143
        Width = 487
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'C:\componentes\CEF4Delphi\trunk'
      end
    end
    object wizPgObterFontes: TJvWizardInteriorPage
      Header.Visible = False
      Header.ParentFont = False
      Header.Title.Color = clNone
      Header.Title.Text = 'Obtendo os fontes atualizados'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Arial'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 
        'O assistente far'#225' o download ou atualiza'#231#227'o dos fontes diretamen' +
        'te do reposit'#243'rio do ACBr neste momento.'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Arial'
      Header.Subtitle.Font.Style = []
      Color = clWhite
      Caption = 'Reposit'#243'rio'
      OnEnterPage = wizPgObterFontesEnterPage
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 38
        Top = 92
        Width = 91
        Height = 13
        Caption = 'URL do  reposit'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblInfoObterFontes: TLabel
        Left = 38
        Top = 66
        Width = 103
        Height = 13
        Caption = 'Texto de informa'#231#227'o.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnSVNCheckoutUpdate: TSpeedButton
        Left = 400
        Top = 285
        Width = 121
        Height = 25
        Caption = 'Checkout'
        OnClick = btnSVNCheckoutUpdateClick
      end
      object edtURL: TEdit
        Left = 38
        Top = 108
        Width = 483
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'https://github.com/wppconnect-team/WPP4Delphi'
      end
      object ckbFecharTortoise: TCheckBox
        Left = 38
        Top = 143
        Width = 447
        Height = 17
        Caption = 
          'Fechar automaticamente o tortoise se n'#227'o ocorrem erros ou confli' +
          'tos?'
        TabOrder = 1
      end
    end
    object wizPgInstalacao: TJvWizardInteriorPage
      Header.Visible = False
      Header.ParentFont = False
      Header.Title.Color = clNone
      Header.Title.Text = 'Instala'#231#227'o'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Arial'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 
        'Os pacotes escolhidos ser'#227'o instalados conforme as configura'#231#245'es' +
        ' escolhidas pelo usu'#225'rio'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Arial'
      Header.Subtitle.Font.Style = []
      Color = clWhite
      Caption = 'Instala'#231#227'o'
      OnEnterPage = wizPgInstalacaoEnterPage
      OnExitPage = wizPgInstalacaoExitPage
      OnNextButtonClick = wizPgInstalacaoNextButtonClick
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object btnInstalarfrce: TSpeedButton
        Left = 431
        Top = 336
        Width = 106
        Height = 25
        Caption = 'Instalar'
        OnClick = btnInstalarfrceClick
      end
      object btnVisualizarLogCompilacao: TSpeedButton
        Left = 21
        Top = 336
        Width = 140
        Height = 25
        Caption = 'Visualizar log'
        Visible = False
        OnClick = btnVisualizarLogCompilacaoClick
      end
      object lstMsgInstalacao: TListBox
        Left = 20
        Top = 87
        Width = 516
        Height = 220
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object pgbInstalacao: TProgressBar
        Left = 21
        Top = 313
        Width = 516
        Height = 17
        TabOrder = 2
      end
      object pnlInfoCompilador: TPanel
        Left = 20
        Top = 15
        Width = 516
        Height = 66
        BevelOuter = bvLowered
        TabOrder = 0
        object lbInfo: TListBox
          Left = 1
          Top = 1
          Width = 514
          Height = 64
          Align = alClient
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 14
          ParentColor = True
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object wizPgFinalizar: TJvWizardInteriorPage
      Header.Visible = False
      Header.ParentFont = False
      Header.Title.Color = clNone
      Header.Title.Text = 'Projeto ACBr'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -16
      Header.Title.Font.Name = 'Arial'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'O projeto ACBr foi instalado.'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -11
      Header.Subtitle.Font.Name = 'Arial'
      Header.Subtitle.Font.Style = []
      VisibleButtons = [bkFinish]
      Color = clWhite
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 23
        Top = 98
        Width = 349
        Height = 38
        Alignment = taCenter
        Caption = 'A instala'#231#227'o do Componente TWPP4Delphi'#13#10'realizada com sucesso!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Font.Quality = fqClearType
        ParentFont = False
        WordWrap = True
      end
      object Label15: TLabel
        Left = 168
        Top = 179
        Width = 241
        Height = 13
        Cursor = crHandPoint
        Caption = 'https://github.com/wppconnect-team/WPP4Delphi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = URLClick
      end
      object Label16: TLabel
        Left = 84
        Top = 160
        Width = 406
        Height = 13
        Caption = 
          'Para maiores informa'#231#245'es sobre o componente, d'#250'vidas, ajudas ou ' +
          'sugest'#245'es visite:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Label29: TLabel
      Left = 3
      Top = 442
      Width = 82
      Height = 13
      Caption = 'Vers'#227'o: 4.0.0.1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 2
      Top = 456
      Width = 103
      Height = 13
      Caption = '01/08/2022 09:00:01'
    end
    object wizMapa: TJvWizardRouteMapNodes
      Left = 0
      Top = 71
      Width = 166
      Height = 365
      ItemHeight = 30
      AllowClickableNodes = False
      Color = 18448
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.Alignment = iaLeft
      Image.Layout = ilTop
      Indent = 15
      NodeColors.Selected = clBlack
      UsePageTitle = False
    end
    object pnlTopo: TPanel
      Left = 0
      Top = 0
      Width = 720
      Height = 71
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
      object Label9: TLabel
        Left = 0
        Top = 0
        Width = 720
        Height = 71
        Align = alClient
        Alignment = taCenter
        Caption = 'Assistente de instala'#231#227'o WPP4Delphi'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        ExplicitWidth = 284
        ExplicitHeight = 19
      end
    end
  end
end
