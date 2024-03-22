object frameMensagem: TframeMensagem
  Left = 0
  Top = 0
  Width = 968
  Height = 810
  Align = alClient
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Roboto'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 241
    Height = 804
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 59
      Width = 67
      Height = 15
      Caption = 'Mensagem:'
    end
    object Label2: TLabel
      Left = 12
      Top = 232
      Width = 109
      Height = 15
      Caption = 'Array Choices Pool'
    end
    object ed_num: TLabeledEdit
      Left = 11
      Top = 24
      Width = 214
      Height = 23
      EditLabel.Width = 96
      EditLabel.Height = 15
      EditLabel.Caption = 'N'#250'mero Destino:'
      TabOrder = 0
    end
    object mem_message: TMemo
      Left = 11
      Top = 77
      Width = 214
      Height = 148
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object edtURL: TLabeledEdit
      Left = 11
      Top = 304
      Width = 214
      Height = 23
      Cursor = crHandPoint
      EditLabel.Width = 101
      EditLabel.Height = 15
      EditLabel.Caption = 'URL Link Preview'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsUnderline]
      ParentFont = False
      TabOrder = 2
      Text = 'https://wppconnect-team.github.io/'
      OnDblClick = edtURLDblClick
    end
    object PageControl1: TPageControl
      Left = 2
      Top = 581
      Width = 237
      Height = 221
      Cursor = crHandPoint
      ActivePage = tsImage
      Align = alBottom
      TabOrder = 3
      object tsImage: TTabSheet
        Caption = 'Image Preview'
        object Image1: TImage
          Left = 0
          Top = 15
          Width = 229
          Height = 176
          Align = alClient
          Center = True
          Proportional = True
          ExplicitLeft = 56
          ExplicitTop = 48
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
        object lblCaminhoImagem: TLabel
          Left = 0
          Top = 0
          Width = 229
          Height = 15
          Align = alTop
          ExplicitWidth = 3
        end
      end
      object tsBase64: TTabSheet
        Caption = 'Base64'
        ImageIndex = 1
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 229
          Height = 191
          Align = alClient
          BorderStyle = bsNone
          Color = clInfoBk
          TabOrder = 0
        end
      end
    end
    object eChoicesPool: TEdit
      Left = 12
      Top = 252
      Width = 213
      Height = 23
      TabOrder = 4
      Text = '["OP'#199#195'O 1","OP'#199#195'O 2","OP'#199#195'O 3"]'
    end
  end
  object gbAcoesBasicas: TGroupBox
    AlignWithMargins = True
    Left = 250
    Top = 3
    Width = 231
    Height = 804
    Align = alLeft
    Caption = 'Envio de Mensagens'
    TabOrder = 1
    object btnLocalizacaoBotao: TButton
      AlignWithMargins = True
      Left = 5
      Top = 392
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar Agendamento de Liga'#231#227'o'
      ImageIndex = 11
      Images = ImageList1
      TabOrder = 12
      OnClick = btnLocalizacaoBotaoClick
    end
    object btnLink: TButton
      AlignWithMargins = True
      Left = 5
      Top = 206
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar LinkPreview'
      ImageIndex = 6
      Images = ImageList1
      TabOrder = 7
      OnClick = btnLinkClick
    end
    object btnImagemBotao: TButton
      AlignWithMargins = True
      Left = 5
      Top = 423
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Criar Canal'
      ImageIndex = 5
      Images = ImageList1
      TabOrder = 6
      OnClick = btnImagemBotaoClick
    end
    object btnImagem: TButton
      AlignWithMargins = True
      Left = 5
      Top = 175
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar Imagem'
      ImageIndex = 5
      Images = ImageList1
      TabOrder = 5
      OnClick = btnImagemClick
    end
    object btnInstantVideo: TButton
      AlignWithMargins = True
      Left = 5
      Top = 144
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar Instant Video'
      ImageIndex = 4
      Images = ImageList1
      TabOrder = 4
      OnClick = btnInstantVideoClick
    end
    object btnVideo: TButton
      AlignWithMargins = True
      Left = 5
      Top = 113
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar V'#237'deo'
      HotImageIndex = 3
      ImageIndex = 3
      Images = ImageList1
      TabOrder = 3
      OnClick = btnVideoClick
    end
    object btnListaMenu: TButton
      AlignWithMargins = True
      Left = 5
      Top = 82
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Lista/Menu'
      HotImageIndex = 2
      ImageIndex = 2
      Images = ImageList1
      TabOrder = 2
      OnClick = btnListaMenuClick
    end
    object btnBotaoSimples: TButton
      AlignWithMargins = True
      Left = 5
      Top = 51
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Criar Vota'#231#227'o'
      HotImageIndex = 2
      ImageIndex = 1
      Images = ImageList1
      TabOrder = 1
      OnClick = btnBotaoSimplesClick
    end
    object btnTextoSimples: TButton
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Texto Simples'
      ImageIndex = 0
      Images = ImageList1
      TabOrder = 0
      OnClick = btnTextoSimplesClick
    end
    object btnAudio: TButton
      AlignWithMargins = True
      Left = 5
      Top = 237
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar '#193'udio'
      ImageIndex = 7
      Images = ImageList1
      TabOrder = 8
      OnClick = btnAudioClick
    end
    object btnContato: TButton
      AlignWithMargins = True
      Left = 5
      Top = 299
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar Contato'
      ImageIndex = 9
      Images = ImageList1
      TabOrder = 10
      OnClick = btnContatoClick
    end
    object btnSticker: TButton
      AlignWithMargins = True
      Left = 5
      Top = 268
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar Sticker'
      ImageIndex = 8
      Images = ImageList1
      TabOrder = 9
      OnClick = btnStickerClick
    end
    object btnLocalizacao: TButton
      AlignWithMargins = True
      Left = 5
      Top = 330
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar Localiza'#231#227'o'
      ImageIndex = 10
      Images = ImageList1
      TabOrder = 11
      OnClick = btnLocalizacaoClick
    end
    object btnArquivo: TButton
      AlignWithMargins = True
      Left = 5
      Top = 361
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar Arquivo Selecionado Pasta'
      ImageIndex = 6
      Images = ImageList1
      TabOrder = 13
      OnClick = btnArquivoClick
    end
    object btnStatusTexto: TButton
      AlignWithMargins = True
      Left = 5
      Top = 454
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar Texto Status'
      ImageIndex = 19
      Images = ImageList1
      TabOrder = 14
      OnClick = btnStatusTextoClick
    end
    object btnStatusImagem: TButton
      AlignWithMargins = True
      Left = 5
      Top = 485
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar Imagem Status'
      ImageIndex = 5
      Images = ImageList1
      TabOrder = 15
      OnClick = btnStatusImagemClick
    end
    object btnVideoStatus: TButton
      AlignWithMargins = True
      Left = 5
      Top = 516
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Enviar Video Status'
      ImageIndex = 3
      Images = ImageList1
      TabOrder = 16
      OnClick = btnVideoStatusClick
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 5
      Top = 547
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Apagar Mensagem'
      ImageIndex = 15
      Images = ImageList1
      TabOrder = 17
      OnClick = Button2Click
    end
    object bTextoMarcandoTodosGrupo: TButton
      AlignWithMargins = True
      Left = 5
      Top = 578
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Texto Simples Marcando Todos'
      ImageIndex = 0
      Images = ImageList1
      TabOrder = 18
      OnClick = bTextoMarcandoTodosGrupoClick
    end
    object btnLigar: TButton
      AlignWithMargins = True
      Left = 5
      Top = 609
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Realizar uma Liga'#231#227'o'
      ImageIndex = 19
      Images = ImageList1
      TabOrder = 19
      OnClick = btnLigarClick
    end
    object btnEncerrarChamada: TButton
      AlignWithMargins = True
      Left = 5
      Top = 640
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Finalizar uma Liga'#231#227'o'
      ImageIndex = 19
      Images = ImageList1
      TabOrder = 20
      OnClick = btnEncerrarChamadaClick
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 487
    Top = 3
    Width = 231
    Height = 804
    Align = alLeft
    Caption = 'Op'#231#245'es de Chat'
    TabOrder = 2
    object btnLimparConversa: TButton
      AlignWithMargins = True
      Left = 5
      Top = 237
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Limpar Conversa'
      ImageIndex = 15
      Images = ImageList1
      TabOrder = 5
      OnClick = btnLimparConversaClick
    end
    object btnArquivar: TButton
      AlignWithMargins = True
      Left = 5
      Top = 175
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Arquivar Chat'
      ImageIndex = 14
      Images = ImageList1
      TabOrder = 3
      OnClick = btnArquivarClick
    end
    object btnResponder: TButton
      AlignWithMargins = True
      Left = 5
      Top = 51
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Responder Mensagem'
      ImageIndex = 14
      Images = ImageList1
      TabOrder = 1
      OnClick = btnResponderClick
    end
    object btnReagir: TButton
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Reagir Mensagem'
      ImageIndex = 12
      Images = ImageList1
      TabOrder = 0
      OnClick = btnReagirClick
    end
    object btnVerificarNumero: TButton
      AlignWithMargins = True
      Left = 5
      Top = 268
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Verificar N'#250'mero'
      ImageIndex = 16
      Images = ImageList1
      TabOrder = 6
      OnClick = btnVerificarNumeroClick
    end
    object btnStatus: TButton
      AlignWithMargins = True
      Left = 5
      Top = 361
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Verificar Status'
      ImageIndex = 18
      Images = ImageList1
      TabOrder = 7
      OnClick = btnStatusClick
    end
    object btnDetalhe: TButton
      AlignWithMargins = True
      Left = 5
      Top = 144
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Encaminhar Mensagem'
      ImageIndex = 2
      Images = ImageList1
      TabOrder = 8
      OnClick = btnDetalheClick
    end
    object btnBloquear: TButton
      AlignWithMargins = True
      Left = 5
      Top = 392
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Bloquear Contato'
      ImageIndex = 20
      Images = ImageList1
      TabOrder = 9
      OnClick = btnBloquearClick
    end
    object btnDesbloquear: TButton
      AlignWithMargins = True
      Left = 5
      Top = 423
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Desbloquear Contato'
      ImageIndex = 21
      Images = ImageList1
      TabOrder = 10
      OnClick = btnDesbloquearClick
    end
    object btnFixarChat: TButton
      AlignWithMargins = True
      Left = 5
      Top = 454
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Fixar Chat'
      ImageIndex = 22
      Images = ImageList1
      TabOrder = 11
      OnClick = btnFixarChatClick
    end
    object btnDesfixarChat: TButton
      AlignWithMargins = True
      Left = 5
      Top = 485
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Desfixar Chat'
      ImageIndex = 23
      Images = ImageList1
      TabOrder = 12
      OnClick = btnDesfixarChatClick
    end
    object BitBtn1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 206
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Desarquivar Chat'
      ImageIndex = 17
      Images = ImageList1
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object BitBtn2: TButton
      AlignWithMargins = True
      Left = 5
      Top = 82
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Status da Mensagem'
      ImageIndex = 13
      Images = ImageList1
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object btnArquivarTodosChats: TButton
      AlignWithMargins = True
      Left = 5
      Top = 516
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Arquivar todos os Chats'
      ImageIndex = 14
      Images = ImageList1
      TabOrder = 13
      OnClick = btnArquivarTodosChatsClick
    end
    object btnDeletarTodosChats: TButton
      AlignWithMargins = True
      Left = 5
      Top = 578
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Deletar todos os Chats'
      ImageIndex = 15
      Images = ImageList1
      TabOrder = 14
      OnClick = btnDeletarTodosChatsClick
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 609
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Visto por '#218'ltimo'
      ImageIndex = 18
      Images = ImageList1
      TabOrder = 15
      OnClick = Button1Click
    end
    object btnValidarListarNumeros: TButton
      AlignWithMargins = True
      Left = 5
      Top = 640
      Width = 221
      Height = 25
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Validar Lista de N'#250'meros'
      ImageIndex = 16
      Images = ImageList1
      TabOrder = 16
      OnClick = btnValidarListarNumerosClick
    end
    object btnGetMessage: TButton
      AlignWithMargins = True
      Left = 5
      Top = 671
      Width = 221
      Height = 25
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Get Plataforma'
      ImageIndex = 16
      Images = ImageList1
      TabOrder = 17
      OnClick = btnGetMessageClick
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 5
      Top = 702
      Width = 221
      Height = 25
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Get Message ACK'
      ImageIndex = 16
      Images = ImageList1
      TabOrder = 18
      OnClick = Button3Click
    end
    object Button4: TButton
      AlignWithMargins = True
      Left = 5
      Top = 733
      Width = 221
      Height = 25
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Marcar Audio como Escutado'
      ImageIndex = 16
      Images = ImageList1
      TabOrder = 19
      OnClick = Button4Click
    end
    object bEditMessage: TButton
      AlignWithMargins = True
      Left = 5
      Top = 113
      Width = 221
      Height = 25
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Editar Mensagem'
      ImageIndex = 0
      Images = ImageList1
      TabOrder = 20
      OnClick = bEditMessageClick
    end
    object btnDeletarOldChat: TButton
      AlignWithMargins = True
      Left = 5
      Top = 547
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Deletar Old Chats Novo'
      ImageIndex = 15
      Images = ImageList1
      TabOrder = 21
      OnClick = btnDeletarOldChatClick
    end
    object bGetMe: TButton
      AlignWithMargins = True
      Left = 5
      Top = 330
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'GetMe'
      ImageIndex = 18
      Images = ImageList1
      TabOrder = 22
      OnClick = bGetMeClick
    end
    object bGetMensagem: TButton
      AlignWithMargins = True
      Left = 5
      Top = 299
      Width = 221
      Height = 25
      Align = alTop
      Caption = 'Get Mensagens'
      ImageIndex = 18
      Images = ImageList1
      TabOrder = 23
      OnClick = bGetMensagemClick
    end
  end
  object GroupBox3: TGroupBox
    AlignWithMargins = True
    Left = 724
    Top = 3
    Width = 231
    Height = 804
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Fun'#231#245'es Diversas'
    TabOrder = 3
    object groupListaContatos: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 221
      Height = 229
      Align = alTop
      Caption = 'Listar Contatos'
      TabOrder = 0
      object Panel4: TPanel
        Left = 2
        Top = 17
        Width = 217
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel4'
        ShowCaption = False
        TabOrder = 0
        object btnListarCOntatos: TButton
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 213
          Height = 27
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Listar Contatos'
          ImageIndex = 9
          Images = ImageList1
          TabOrder = 0
          OnClick = btnListarCOntatosClick
        end
      end
      object listaContatos: TListView
        AlignWithMargins = True
        Left = 5
        Top = 51
        Width = 211
        Height = 173
        Align = alClient
        Columns = <>
        LargeImages = ImageList1
        ReadOnly = True
        RowSelect = True
        SmallImages = ImageList1
        StateImages = ImageList1
        TabOrder = 1
        ViewStyle = vsSmallIcon
        OnDblClick = listaContatosDblClick
      end
    end
    object groupListaChats: TGroupBox
      Left = 2
      Top = 252
      Width = 227
      Height = 550
      Align = alClient
      Caption = 'Listar Chats'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object btnListarChats: TButton
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 217
        Height = 25
        Align = alTop
        Caption = 'Listar Chats / Chat list'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ImageIndex = 19
        Images = ImageList1
        ParentFont = False
        TabOrder = 0
        OnClick = btnListarChatsClick
      end
      object listaChats: TListView
        AlignWithMargins = True
        Left = 5
        Top = 49
        Width = 217
        Height = 496
        Align = alClient
        Columns = <>
        LargeImages = ImageList1
        ReadOnly = True
        RowSelect = True
        SmallImages = ImageList1
        StateImages = ImageList1
        TabOrder = 1
        ViewStyle = vsSmallIcon
        OnDblClick = listaChatsDblClick
      end
    end
  end
  object ImageList1: TImageList
    DrawingStyle = dsTransparent
    Left = 759
    Top = 67
    Bitmap = {
      494C01011A003000040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000007000000001002000000000000070
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FFE9DED300CBA98700B9875600B0794100B7814A00C3976B00DDC3AB000000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBF1FB005AD3F40052D3
      F60052D3F60052D3F60052D3F60052D3F60052D3F60052D3F60052D3F60052D3
      F60052D3F6005AD4F400CCF2FB0000000000000000FF000000FF000000FFD0AD
      8B00AE763D00B1773E00B1773E00B1773E00B1773E00B3783E00B4793E00BB87
      5200EDE0D300000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000078DCF70052D3F60052D3
      F60052D3F60052D3F60052D3F60052D3F60052D3F60052D3F60052D3F60052D3
      F60052D3F60052D3F60078DCF70000000000000000FF000000FFC9A17900B479
      3E00B3783E00B1773E00B1773E00E7DACB00CFAF8D00B1773E00B3783E00B479
      3E00B47C4300EDE0D300000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000069D6F60052D4F70052D4
      F70052D4F70052D4F70052D4F70052D4F70052D4F70052D4F70052D4F70052D4
      F70052D4F70052D4F70069D6F60000000000000000FFDDC4AB00B4793E00B479
      3E00B4793E00B3783E00B1773E00F8F8F800E5D7C800B1773E00B1773E00B378
      3E00B4793E00BB875200000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000060D2F40053D4F70053D4
      F70053D4F70053D4F70053D4F70053D4F70053D4F70053D4F70053D4F70053D4
      F70053D4F70053D4F70060D4F50000000000000000FFB7834D00B4793E00B479
      3E00B4793E00B4793E00B3783E00B1773E00B1773E00B1773E00B1773E00B177
      3E00B3783E00B4793E00DDC3AB00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005FD3F50053D5F80053D5
      F80053D5F80053D5F80053D5F80053D5F80053D5F80053D5F80053D5F80053D5
      F80053D5F80053D5F8005FD3F50000000000E9DACA00B4793E00B4793E00B479
      3E00B4793E00B4793E00B4793E00FCFCFC00E6D7C900B1773E00B1773E00B177
      3E00B1773E00B3783E00C3976B00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000060D4F60054D6F90054D6
      F90054D6F90054D6F90054D6F90054D6F90054D6F90054D6F90054D6F90054D6
      F90054D6F90054D6F90060D4F60000000000DDC4AA00B4793E00B4793E00B479
      3E00B4793E00B4793E00B4793E00F9F8F500F8F7F500B37A4600B1773E00B177
      3E00B1773E00B1773E00B7814A00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000065D5F60054D7FA0054D7
      FA0054D7FA0054D7FA0054D7FA0054D7FA0054D7FA0054D7FA0054D7FA0054D7
      FA0054D7FA0054D7FA0065D6F60000000000DABEA300B4793E00B4793E00B479
      3E00B4793E00B4793E00B4793E00C79F7500FBFBFA00F1E8E000B1773E00B177
      3E00B1773E00B1773E00B0784100000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000069CAF00072E0FD006BDE
      FC006BDEFC006BDEFC006BDEFC006BDEFC006BDEFC006BDEFC006BDEFC006BDE
      FC006BDEFC0073E0FD0068C9F00000000000E1CAB400B4793E00B4793E00B479
      3E00B4793E00B4793E00B4793E00B4793E00D6B79800FFFFFF00D8BB9F00B177
      3E00B1773E00B1773E00B9875600000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000050B7E70038ACE60047B7
      EA0047B7EA0047B7EA0047B7EA0047B7EA0047B7EA0047B7EA0047B7EA0047B7
      EA0047B7EA0038ADE60065C1EB0000000000000000FFB1783D00B4793E00B479
      3E00B4793E00C5986C00B1793E00B4793E00B67E4800FDFDFD00EADBCC00B378
      3E00B1773E00B1773E00CBA98700000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052B7E800209DE000209D
      E000209DE000209DE000209DE0002EA6E40047B7EA0047B7EA0047B7EA0047B7
      EA0047B7EA0056C0EE00CBF0FB0000000000000000FFC89F7700B4793E00B479
      3E00B47B4000FBFBFA00F9F6F400EADBCA00F7F3EF00FFFFFF00D5B59400B479
      3E00B3783E00AE763D00E9DED300000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007FCDF000209DE000209D
      E000209DE000209DE000209DE00078CDEF00DAF6FD00DAF6FD00DAF6FD00DAF6
      FD00DAF6FD00E8F9FD000000000000000000000000FFF2E9E000B57D4700B479
      3E00B4793E00CDAB8500F4EFE900FBFAFA00FAF8F700E2CCB500B4793E00B479
      3E00B4793E00D0AD8B00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8F9FD0086DAF6006FCF
      F5006FCFF5006FCFF50086D9F600E9F9FD000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFE9DACA00B57D
      4700B4793E00B4793E00B4793E00B4793E00B4793E00B4793E00B4793E00B479
      3E00C9A17900000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FFF2E9
      E000C89F7700B1783D00B4793E00B4793E00B4793E00B4793E00B7834D00DDC4
      AB00000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FFE1CCB600DABFA500DDC3AB00E9DACA00000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D4D4D400717171002B2B2B000B0B0B000B0B0B002B2B2B0072727200D5D5
      D500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007272720065656500656565006565
      65006565650065656500656565005C5C5C0087878700D1D1D100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006E6E
      6E000303030001010100313131005A5A5A00585858002E2E2E00000000000303
      0300707070000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005656560000000000000000000000
      000000000000000000000000000054545400D7D7D70018181800ABABAB000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7B7B700000000000000
      00000000000000000000000000000000000000000000DBDBDB00000000000000
      0000000000000000000000000000000000000000000000000000444444000000
      000050505000D9D9D90000000000000000000000000000000000D7D7D7004D4D
      4D00000000004545450000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656000000000000000000D1D1
      D100BABABA0000000000000000005454540000000000B5B5B500070707009A9A
      9A00000000000000000000000000000000000000000077777700000000000000
      00000000000000000000000000000000000000000000000000002A2A2A00B2B2
      B200000000000000000000000000000000008C8C8C0004040400C4C4C4000000
      000000000000202020003636360000000000000000006D6D6D00000000000000
      0000626262000000000000000000000000000000000000000000000000000000
      00007A7A7A000000000070707000000000000000000000000000969696006666
      66005B5B5B004848480053535300595959002B2C2C000000000000000000D0D0
      D000B9B9B9000000000000000000545454000000000000000000A6A6A6000202
      0200909090000000000000000000000000004040400001010100000000000000
      0000000000000000000000000000000000000000000000000000B2B2B2000909
      0900ACACAC0000000000000000008C8C8C000000000001010100828282000000
      00002020200006060600B3B3B30000000000D4D4D40002020200505050006262
      6200000000006262620000000000000000000000000000000000000000000000
      0000000000004C4C4C0003030300D6D6D600B6B6B6004B4B4B00B1B1B1000000
      0000000000000000000000000000000000004848480000000000000000000000
      0000000000000000000000000000545454000000000000000000000000009E9E
      9E0002020200909090000000000042424200010101000F0F0F00000000000000
      000000000000000000000000000000000000000000000000000000000000ACAC
      AC0009090900ACACAC008C8C8C00000000000101010001010100818181002020
      200006060600B3B3B30000000000000000007070700001010100D9D9D9000000
      0000626262000000000062626200000000000000000000000000000000000000
      000000000000D7D7D70000000000727272005252520000000000000000000000
      000000000000000000000000000000000000646464003F3F3F004F4F4F005353
      53005454540054545400545454004E4E4E000000000000000000000000000000
      00009E9E9E000B0B0B003A3A3A00010101000101010032343400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ACACAC000707070000000000010101000101010051515100202020000606
      0600B3B3B3000000000000000000000000002A2A2A0032323200000000000000
      0000000000006262620000000000626262000000000000000000000000000000
      000000000000000000002E2E2E002B2B2B006161610000000000000000000000
      0000000000000000000000000000000000000000000066666600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003B3B3B0000000000000000000101010010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000097979700000000000000000000000000515151002121210005050500ACAD
      AD00000000000000000000000000000000000C0C0C005A5A5A00000000000000
      0000000000000000000068686800000000006161610000000000000000000000
      00000000000000000000565656000D0D0D008D8D8D00BEBEBE00000000000000
      000000000000000000000000000000000000000000006F6F6F00DBDBDB000000
      0000000000000000000091919100000000000000000000000000000000000000
      0000434343000000000000000000000000000000000001010100505050000000
      0000000000000000000000000000000000000000000000000000000000008F8F
      8F0000000000000000000000000053535300202020000606060066666600A7A7
      A700000000000000000000000000000000000B0B0B0059595900000000000000
      0000000000000000000000000000686868000000000061616100000000000000
      00000000000000000000595959000C0C0C00000000004B4B4B00000000000000
      0000000000000000000000000000000000000000000045454500737373000000
      000000000000909090009C9C9C00000000000000000000000000000000004343
      4300000000000000000000000000000000000000000000000000010101005151
      5100000000000000000000000000000000000000000000000000979797000000
      0000000000000000000052525200212121000505050067676700070707000202
      0200A2A2A2000000000000000000000000002929290031313100000000000000
      0000000000000000000000000000000000006262620000000000626262000000
      00000000000000000000303030002B2B2B0000000000D3D3D3004E4E4E00D3D3
      D300000000000000000000000000D8D8D8004F4F4F00C9C9C900A1A1A1004949
      49005050500081818100000000000000000000000000000000007E7E7E000000
      0000151515003939390015151500000000000000000000000000000000000101
      01003E3E3E008B8B8B0067676700B5B5B50000000000DBDBDB00040404000000
      0000000000005353530020202000060606006767670005050500000000000101
      0100585858004D4D4D00A9AAAA00000000006F6F6F0000000000DADADA000000
      0000000000000000000000000000000000000000000062626200000000006262
      620000000000D9D9D90001010100717171000000000000000000000000007676
      76003030300049494900303030006A6A6A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000676767000000000000000000000000000000
      0000010101001515150001010100404040000000000000000000C3C3C3008282
      8200838383002020200006060600676767000505050000000000000000005757
      57001B1B1B00010101004A4A4A0000000000D3D3D30002020200515151000000
      0000000000000000000000000000000000000000000000000000626262000000
      0000626262005050500003030300D5D5D5000000000000000000000000005A5A
      5A00AAAAAA0000000000B5B5B5004E4E4E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006868680000000000000000000000
      0000151515000101010016161600D0D0D0000000000000000000000000000000
      00002222220005050500B0B0B000ABABAB000404040000000000555555001F1F
      1F0000000000272727000000000000000000000000006B6B6B00000000007E7E
      7E00000000000000000000000000000000000000000000000000000000006262
      620000000000000000006E6E6E00000000000000000000000000000000006969
      69000000000000000000000000007D7D7D00CACACA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000048484800000000001616
      16000000000016161600CFCFCF00000000000000000000000000000000002020
      200006060600B3B3B3000000000000000000AAAAAA00595959001B1B1B000000
      00002B2B2B000000000000000000000000000000000000000000434343000000
      000051515100DADADA0000000000000000000000000000000000DADADA005050
      5000000000004444440000000000000000000000000000000000DDDDDD007575
      750000000000000000000000000088888800C8C8C80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400161616000000
      000016161600D3D3D30000000000000000000000000000000000202020000606
      0600B3B3B300000000000000000000000000000000004F4F4F00000000002B2B
      2B00000000000000000000000000000000000000000000000000000000006B6B
      6B00020202000000000030303000595959005B5B5B0032323200010101000202
      02006D6D6D000000000000000000000000000000000000000000000000005050
      5000D2D2D20000000000DBDBDB004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E6E6E00000000001818
      1800D6D6D600000000000000000000000000000000000000000035353500B3B3
      B3000000000000000000000000000000000000000000AAAAAA004B4B4B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D3D3D3006F6F6F002A2A2A000A0A0A000A0A0A002A2A2A0070707000D4D4
      D400000000000000000000000000000000000000000000000000000000000000
      00006E6E6E005555550068686800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3C3C30044444400D6D6
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000097908D0098918D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000928A8500BCB7B300DCF0DE00C6E7C800000000000000
      0000E1F2E200A0D8A50076C97D0062C06A0064C26B0078CA7F00A3DAA800E2F3
      E400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009A928E0052463E0052463E009C958F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000817A720052463B00928A8500000000005EBF670060C0680080CD
      87005CBE65005EC167005EC167005EC167005EC167005EC167005EC167005EBF
      6700A1DAA7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C3C000C4C0
      BD00C1BEBC00A39C980052463E006F665F006F665F0052463E00A5A09B00C4C0
      BD00C4C0BD00C6C3C00000000000000000000000000000000000000000000000
      0000D7D6D300A39D98008A847C008C857F00AAA4A000E5E3E200000000000000
      0000817A720052463B00817A7200000000000000000084CF8A005EC167005EC1
      67005EC167005EC167005EC167005EC167005EC167005EC167005EC167005EC1
      67005EC1670087D08E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005E544A0053473E005347
      3E0052463E0052463E0061554F00E5E5E300E5E5E30060564E0052463E005347
      3E0053473E0053473E005E534C00000000000000000000000000000000008379
      7000665C5300A19A9400BAB7B300B9B4B1009A928C005F544B0091898500A59F
      9A007B726900817A720000000000000000000000000095D59C005EC167005EC1
      67005EC167005EC167005EC167005EC167005DBE66007ECB8400A1DAA70083CE
      8A005EC167005EC16700A2DAA700000000004141C1003434BC003434BC003434
      BC0000000000A0DAFA0027ADF10028ADF10028ADF10028ADF100C5E5F70096D2
      94004FB44C0048B145006CC16900E1F2E100D3D0CE0053473E0090878200C4C0
      BD00C4C0BD00C4C0BD00E4E3E3000000000000000000E4E3E300C1BEBC00C4C0
      BD00C4C0BD009087820053473E00D3D0CE000000000000000000645A5100A9A2
      9D00000000000000000000000000000000000000000000000000938C85005145
      3B00A59F9A00000000000000000000000000E0F2E2005CBE65005EC167005EC1
      67005EC167005EC167005DBE660095D59C000000000000000000000000000000
      0000AADDAE005EC167005EBF6700E2F3E400A2A2E2004E4EC8004040C4009B9B
      E00000000000C0E9FB001AB1F5002CB5F30072CBF40072CBF400D8EEF70073C3
      76008BCE8D0096D49A004CB450007AC77E00D1CFCC0053473E00B0A9A6000000
      000000000000000000000000000000000000E9DCCA00CFB08300DBC3A3000000
      000000000000B0A9A60053473E00D1CFCC0000000000786F6700AEA8A3000000
      00000000000000000000EBD8C400E8D4BF00000000000000000000000000938C
      850091898500000000000000000000000000A0D8A5005EC167005EC167005EC1
      67005EC1670062C06A00CCEACF000000000000000000E6F4E700000000000000
      0000D6EEDA005EC167005EC16700A4DBA900000000006F6FD7005858D0000000
      00000000000000000000AAE3FB0017B5F60098DBF60000000000000000000000
      000000000000000000007ECA85005ABD6400D1CFCC0053473E00B0A9A6000000
      000000000000CEA77300BF8B4600E8D7C200B37D2F00B57C2E00B57C2E00D5B9
      930000000000AEA8A60053473E00D1CFCC00CBC7C50072675E00000000000000
      000000000000F4EAE000BF782A00D5A67500EAD8C50000000000000000000000
      00005F544B00E5E3E200000000000000000076C97D005EC167005EC167005EC1
      67005FC06700D1ECD40000000000C2E6C60065C16D0067C27000D8EED900ABDD
      B00065C36F005EC167005EC1670078CA7F00000000007474DB005B5BD3000000
      00000000000000000000000000008ADDFA001ABEF600CFEDF800000000000000
      0000D1E9D50096D29F004DB95D008BD09500D1CFCC0053473E00B0A9A6000000
      0000D3B18200B87E2E00BA823700D9BC9300B77D2E00B57C2E00B57C2E00C69E
      650000000000ACA7A20052463E00D1CFCC00938C8400B5AFAA00000000000000
      000000000000F4E9DD00C2792B00EBD6BF000000000000000000000000000000
      000098908C00A9A4A100000000000000000062C06B005EC167005EC167005EC1
      6700B2E0B70000000000B9E3BD005EC167005EC167005EC167005EC167005EC1
      67005EC167005EC167005EC1670063C16D00000000007676DE005E5ED7000000
      00000000000000000000000000000000000035CDF80059D5F800000000000000
      0000B4DEBC004BB55F0053B96600E3F3E600D1CFCC0053473E00B0A9A6000000
      0000C3935100B87E2E00B8803200DABD9700B87E2E00B77D2E00B57C2E00DDC6
      A90000000000ACA7A20052463E00D1CFCC00786F6700D5D2D100000000000000
      00000000000000000000C2792B00E4C6A7000000000000000000000000000000
      0000B8B4AF008E878000000000000000000063C16D005EC167005EC167007ACA
      800000000000000000005EBF68005EC167005EC167005EC167005EC167005EC1
      67005EC167005EC167005EC1670063C16D00B6B6EF006363DD006363DD000000
      00000000000000000000000000000000000064DDFA002AD0F800000000000000
      0000000000000000000060C0790086CE9600D1CFCC0053473E00B0A9A6000000
      0000CBA26900B87E2E00B87E2E00E2CCAE00B67D2F00C3925200EBDECB000000
      000000000000ACA7A20052463E00CECBC900766C6200D8D6D300000000000000
      000000000000EAD2BA00CB925400E6C9AC000000000000000000000000000000
      0000BAB7B3008C847D00000000000000000078C87D005EC167005EC16700B5E1
      B80000000000000000008CD192005EC167005EC167005EC167005EC167005EC1
      67005EC167005EC167005EC1670078CA7F005B5BE0004646DF006767E2000000
      000000000000BBF1FC0051DCF90088E7FB0022D5F8003AD7F900000000008DD4
      A10089D09D009DD7AD004BB86A007CCA9200D1CFCC0053473E00B0A9A6000000
      0000EADAC400B57D2D00D9BB920000000000DCC09C00B77F3300E5D1B7000000
      000000000000ACA7A20052463E00CECBC9008C867D00BBB7B200000000000000
      00000000000000000000F1E2D300EAD2BA000000000000000000000000000000
      00009F999400A39D98000000000000000000A2DAA7005EC167005EC16700BCE4
      C000000000000000000095D49B005EC167005EC167005EC167005EC167005EC1
      67005EC167005EC167005EC16700A3DAA800000000008989EC007575E9000000
      000000000000D3F7FC0032DEFA0015DBFB0027DBF800BDF3FC0000000000ABE0
      BC004BBD710043BA6C0057BF7B00D1EBDA00D1CFCC0053473E00B0A9A6000000
      000000000000D9BD9500B9813300DFC6A50000000000E0C8A900B9803400D5B4
      870000000000ACA7A20052463E00CECBC900C1BCB9007D746C00000000000000
      00000000000000000000CB8F4F00C2792B000000000000000000000000000000
      0000655B5100D7D6D3000000000000000000E1F2E2005CBE65005EC1670082CD
      8A00000000000000000060C068005EC167005EC167005EC167005EC167005EC1
      67005EC167005EC167005EBF6700E2F3E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1CFCC0053473E00B0A9A6000000
      00000000000000000000E5D2B700BF8C4600DFC6A5000000000000000000EFE4
      D20000000000AEA8A60052463E00CECBC900000000006B605800C1BEB9000000
      00000000000000000000ECD7C000E3C3A200000000000000000000000000A8A2
      9D00817A7200000000000000000000000000000000009FD9A4005EC167005EC1
      67007DCC84007DCA83005EC167005EC167005EC167005EC167005EC167005EC1
      67005EC167005EC16700A1D9A600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1CFCC0053473E00B0A9A6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B0A9A60052463E00CECBC90000000000DEDCDB005F544A00C1BE
      B900000000000000000000000000000000000000000000000000AEA8A300645A
      510000000000000000000000000000000000000000000000000086CE8D005EC1
      67005EC167005EC167005EC167005EC167005EC167005EC167005EC167005EC1
      67005EC1670087CF8D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DAD8D60052463E005E534A00685F
      5600685F5600685F5600685F5600685F5600685F5600685F5600685F5600685F
      5600685F56005E534A0053473E00DEDCDA000000000000000000DEDCDB006B60
      58007D746C00BBB7B200D7D5D100D5D2D100B5AFAA0072675E00786F67000000
      0000000000000000000000000000000000000000000000000000000000009FD9
      A4005CBE65005EC167005EC167005EC167005EC167005EC167005EC167005EBF
      6700A0D9A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A19D00746B6500746A
      6400746A6400746A6400746A6400746A6400746A6400746A6400746A6400746A
      6400746A6400756C6400A9A4A000000000000000000000000000000000000000
      0000C1BCB9008C847E00766D6400786F6700928A8300CBC7C500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E1F2E200A1DAA70078C87D0063C16C0063C16C0077C97F00A2DAA700E1F2
      E3000000000000000000000000000000000000000000E1C99200DCC38A00DDC5
      8D00F3EEE200000000000000000000000000E6EDF700CBD9F100C2D4EF00CBDA
      F100DDE7F5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3CB9400C9982800C8972800C596
      2800D7C29100CEDBEE00B4C9E8008DAEDE007FA6DF0080A7E00080A7E00080A7
      E00080A7E00089ABE000CEDCF100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D1ADAF00DABCBF00DABCBF00DABCBF00DABCBF00DABCBF00DABCBF00D0AC
      AE0000000000000000000000000000000000E2C99200C9982800C9982800C897
      2800BEB087007EA4DC007EA4DC007EA4DC007EA4DC007FA6DF0080A7E00080A7
      E00080A7E00080A7E0007FA6DD00E3EBF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096D2F50060C0F5005ABD
      F50059BBF10056BAF20056BAF20056BAF20056BBF20056BDF50058BEF60058BE
      F60058BEF60058BEF6005BBEF70077CBF800000000000000000000000000CFAA
      AC00000000000000000000000000000000000000000000000000000000000000
      0000CFAAAB00000000000000000000000000E2C99200C9982800C9982800C998
      2800C1B289007EA4DC007EA4DC007EA4DC007EA4DC007EA4DC007FA6DF0080A7
      E00080A7E00080A7E00080A7E000C2D4EF000000000000000000EAD5B700BA72
      0500BF7C1A00F2E9DE00EEE4D500B8730C00B8730C00EDE0CB00000000000000
      0000000000000000000000000000000000000000000095CEF0006ED4FC0060D1
      FF005FD0FE005FCDFA005FCDFA005FCDFA005FCDFA005FCDFA005FD0FE0060D1
      FF0060D1FF0060D1FF0060D1FF0060D1FF00000000000000000000000000D2AF
      B20000000000D2AFB20000000000DABCBF00DABCBF0000000000D2AFB2000000
      0000D2AFB200000000000000000000000000E2C99200C9982800C9982800C998
      2800C1B289007FA6DF007EA4DC007EA4DC007EA4DC007EA4DC007EA4DC007FA6
      DF0080A7E00080A7E00080A7E000BED1ED0000000000EBD6B800BC760B00E5CA
      A300D6AA6B00C1801F00E9D7BC00E0C69F00DBBB8900BA761000ECDEC8000000
      00000000000000000000000000000000000000000000B7D8EC006ED4FC0060D1
      FF0060D1FF005FD0FE005FCDFA005FCDFA005FCDFA005FCDFA005FCDFA005FD0
      FE0060D1FF0060D1FF0060D1FF0060D1FF00000000000000000000000000D2AF
      B20000000000D2AFB20000000000DABCBF00DABCBF0000000000D2AFB2000000
      0000D2AFB200000000000000000000000000E2C99200C9982800C9982800C998
      2800C1B2890080A7E0007FA6DF007EA4DC007EA4DC007EA4DC007EA4DC007EA4
      DC007FA6DF0080A7E00080A7E000BED1ED00EBD6B800BC760B00E5CBA4000000
      000000000000D6AA6B00C1801F00F1E8DA0000000000DBBB8900BA761000ECDE
      C8000000000000000000000000000000000000000000D6E2E9006ED4FC0060D1
      FF0060D1FF0060D1FF005FD0FE005FCDFA005FCDFA005FCDFA005FCDFA005FCD
      FA005FD0FE0060D1FF0060D1FF0060D1FF00000000000000000000000000D2AF
      B20000000000D2AFB20000000000DABCBF00DABCBF0000000000D2AFB2000000
      0000D2AFB200000000000000000000000000E2C99200C9982800C9982800C998
      2800C1B2890080A7E00080A7E0007FA6DF007EA4DC007EA4DC007EA4DC007EA4
      DC007EA4DC007FA6DF0080A7E000BED1ED00C2801D00E7CEA900000000000000
      00000000000000000000D6AA6B00C1801F00F1E8DA0000000000DBBB8900BA76
      1000ECDEC800000000000000000000000000ECF5FB00EDEAE6006ED4FC0060D1
      FF0060D1FF0060D1FF0060D1FF005FD0FE005FCDFA005FCDFA005FCDFA005FCD
      FA005FCDFA005FD0FE0060D1FF0060D1FF00000000000000000000000000D2AF
      B20000000000D2AFB20000000000DABCBF00DABCBF0000000000D2AFB2000000
      0000D2AFB200000000000000000000000000E2C99200C9982800C9982800C998
      2800C1B2890080A7E00080A7E00080A7E0007FA6DF007EA4DC007EA4DC007EA4
      DC007EA4DC007EA4DC007FA6DF00BED1ED000000000000000000000000000000
      0000000000000000000000000000D6AA6A00C1801F00F1E8DA0000000000DBBB
      8900BA761000ECDEC8000000000000000000EDF2F600EEEAE6006ED4FC0060D1
      FF0060D1FF0060D1FF0060D1FF0060D1FF005FD0FE005FCDFA005FCDFA005FCD
      FA005FCDFA005FCDFA005FD0FE0060D1FF00000000000000000000000000D2AF
      B20000000000D2AFB20000000000DABCBF00DABCBF0000000000D2AFB2000000
      0000D2AFB200000000000000000000000000EAD9B200C7962900C9982800C796
      2900DACEAF009DBAE60080A7E00080A7E00080A7E0007FA6DF007EA4DC007EA4
      DC007EA4DC007EA4DC007EA4DC00CDDDF1000000000000000000000000000000
      000000000000000000000000000000000000D6AA6A00C1801F00F1E8DA000000
      0000DBBB8900BA761000ECDEC80000000000ECF0F000EEEAE6006ED4FC005BCA
      FD0058C6FB0058C6FB005AC9FC005AC8FC005CCBFD005ECFFE005FCDFA005FCD
      FA005FCDFA005FCDFA005FCDFA005FD0FE00000000000000000000000000D2AF
      B20000000000D2AFB20000000000DABCBF00DABCBF0000000000D2AFB2000000
      0000D2AFB2000000000000000000000000000000000000000000000000000000
      00000000000000000000A5C0E70080A7E00080A7E00080A7E00092B3E200BED0
      EA00BED0EA00BED0EA00CAD9ED00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6AA6A00C1801F00F1E8
      DA0000000000DBBB8900BA761000ECDEC800EDEDEB00EEEAE6006ED4FC0058C5
      FB0051BCF90051BCF90059C8FC0059C7FB0059C7FB005FCFFF005FD0FE005FCD
      FA005FCDFA005FCDFA005FCDFA005FCDFA00000000000000000000000000D2AF
      B20000000000D2AFB20000000000DABCBF00DABCBF0000000000D2AFB2000000
      0000D2AFB2000000000000000000000000000000000000000000000000000000
      000000000000000000000000000083A6DE0080A7E00080A7E000BED1ED000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6AA6A00C180
      1F00F1E8DA0000000000DBB98700BE7C1C00EBE8E700EEEAE60071D4FC0060D1
      FF0060D1FF0060D1FF0060D1FF0060D1FF0060D1FF0060D1FF0060D1FF005FD0
      FE005FCDFA005FCDFA005FCDFA005FCBF800000000000000000000000000D2AF
      B20000000000E4D1D10000000000E8D8D800E8D8D80000000000E4D1D1000000
      0000D2AFB2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A8C2E70080A7E00080A7E000BED1ED000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6AA
      6B00D5AA6B00000000000000000000000000EBF2F60091CCEF00AFD7ED00CBE1
      EA00E2E7E800E4E8E800E4E8E800E4E8E800E4E8E800E4E8E800E4E8E8007DD7
      FA005FD0FE005FCDFA005FCDFA00B0E4F8000000000000000000D5B4B700A65F
      6300B3777800B3777800B3777800B3777800B3777800B3777800B3777800B377
      7800A75F6600D4B4B70000000000000000000000000000000000000000000000
      0000000000000000000000000000BBCFED0080A7E00080A7E000BED1ED000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000070C3F6004DB6F7004DB6
      F70054B8F60081C6F000BADCF000CBE0EA00DDE3E600EAE7E300EEEAE600DCE7
      E900ADD9F00087D0F8009ED7F600000000000000000000000000BE8B8D00DABC
      BF00DABCBF00DABCBF00C18E9300C08D9000C08D9000BC858800DABCBF00DABC
      BF00DABCBF00BE8B8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000BED1ED0080A7E00080A7E000BED1ED000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2E5FA0087CCF80087CC
      F80087CCF800B2DEFA0000000000000000000000000000000000F9F8F700F5F3
      F200F9F8F8000000000000000000000000000000000000000000000000000000
      00000000000000000000C99D9F000000000000000000CAA0A300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BED1ED0080A7E00080A7E000CFDDF2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D3B2B400DABCBF00DABCBF00D5B5B800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E9EFF800C2D4EF00CFDDF200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCC8CA00A5ABB50099A8B3009BA9B600A7B0B700CFCCCC000000
      0000000000000000000000000000000000000000000082828200757575007576
      7600757676007576760075757500767676007676760076767600767676007676
      7600767676007676760082828200000000000000000000000000000000000000
      000000000000F2F1F000EAE8E700E8E5E200E8E4E100E9E6E200EEECEB00F7F5
      F500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ADA68000AEA8830000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D0D0
      D100899AA9006DB1D9006EC4F4006FC7F8006FC9FB0070C8F9006FB5DF008A9D
      AF00D0D0D3000000000000000000000000008D8D8D0000000000000000000101
      0100010101000101010001010100010101000000000000000000000000000000
      00000000000000000000000000008D8D8D000000000000000000000000000000
      0000E7E4E200E3DFDD00E3DFDD00E4DFDD00E8E3E100F6F3F300EBE6E400F3F0
      EF00F1EEED000000000000000000000000000000000000000000000000000000
      000000000000E6E5E2008F816300AFC36200AEC15B0099965D00EDEAE7000000
      0000000000000000000000000000000000000000000000000000C0C1C60077A8
      C8006FC8FA006FC8FA006FC8FA006FC8FA006FC8FA0070CBFE0071CCFF0071CB
      FE0078ACCF00BCBEC50000000000000000009696960000000000000000000000
      0000010101000101010001010100010101000101010000000000000000000000
      0000000000000000000000000000989898000000000000000000FBFBFB00EAE8
      E500E4DFDD00E3DFDD00E3DFDD00E3DFDD00E4DFDD00EAE6E400F7F6F500F9F8
      F700E8E3E100E8E3E30000000000000000000000000000000000000000000000
      0000E9E6E40097887500A3979400958C6600B4C76400B1C55D009C9B5E00EBE9
      E5000000000000000000000000000000000000000000D6D5D8007AACCC0071CC
      FF0070CBFE006EB0D8006E9FBF006DA0C0006D9FC0006D9FC1006FB4DE0071CC
      FF0071CCFF0077AFD100D0D0D20000000000D7D7D70000000000000000000000
      0000000000000101010001010100010101000101010001010100000000000000
      0000000000000000000000000000D8D8D8000000000000000000ECEAE700F5F3
      F200F5F3F200E7E2E100E3DFDD00E3DFDD00E3DFDD00E4DFDD00F6F4F300F2EF
      EF00ECE8E600EAE5E300EDEBE900000000000000000000000000000000000000
      0000938B5800978C7500BAB4B3009C918D009FA06600B2C66000AC9F5000A486
      4B00EBE7DF000000000000000000000000000000000090A5B60071CCFF0071CB
      FD006F9BBA006FB6E0006FC8FA006FC8FA006FC8FA006FC8FA006DB2DA006E9D
      BC0071CBFE0071CCFF008CA2B600000000000000000069696900000000000000
      0000000000000000000001010100010101000101010001010100010101000000
      000000000000000000006B6B6B000000000000000000F6F4F400E8E3E100E8E3
      E100F4F2F100F4F2F100F1EFEF00E5E1E000E3DFDD00E7E2E000D2E8CE00A8DA
      A100B7E0B100C5E5C000BCE2B600D6EBD2000000000000000000000000009B99
      5E00B1C45D00989E5200988E7D00BFB9B80093876F00B2C16400BA954A00EAC4
      5900B6914900EAE4DE000000000000000000D6D2D2006FB9E40071CCFF006FA0
      C00071C6F70071CCFF0070CBFE006FC8FA006FC8FA006FC8FA006FC8FA006EC1
      F0006EA0C10071CCFF006FBDEC00CBC8CB000000000000000000CACACA006363
      630017171700000000001E1E1E00666666006868680022222200010101001717
      170063636300CACACA00000000000000000000000000EEEAE900E8E3E100EBE7
      E500F6F4F300E8E3E100EBE7E600F2F2F100F6F4F400F5F4F400ACDAA50079CB
      70007ACE71007BCF72007BCF72009FD7980000000000000000009B995E00B1C5
      5D00B5C96100B3C75F008F895500A79D9B00A0949000A3A76400AD8C4900E8C4
      5B00EBC45A00B6924900EAE5DE0000000000AEB7C00071CCFF0070B1D9006E9A
      B80071CCFF0071CCFF0071CCFF0070CBFE006FC8FA006FC8FA006FC8FA006FC8
      FA006D94B0006FB4DD0071CCFF00A9B3BE000000000000000000000000000000
      000000000000D7D7D70000000000969696009494940000000000D4D4D4000000
      00000000000000000000000000000000000000000000E9E3E100E8E3E100EEEB
      E900EBE6E400E8E3E100E8E3E100E8E4E200F3F2F200E5E0DF00D3E8D0007ACB
      710079CB70007ACE71007BCF720088CF80000000000099975D00B1C55E00B4C8
      61008B876300B5C9610097985300ADA2A100B2A9A8009A966700AAAD5800C5A0
      4D00E9C55C00EAC45A00B3904B0000000000A3B3C20071CCFF0071CBFE0070BE
      EC0071CCFF0071CCFF0071CCFF0071CCFF0070CBFE006FC8FA006FC8FA006FC8
      FA006EBAE6006FC8FA0070CBFE009CAFBF000000000000000000000000000000
      000000000000000000001E1E1E00000000000000000020202000000000000000
      00000000000000000000000000000000000000000000E6E1DF00E8E3E100E8E3
      E100E8E3E100E8E3E100DAD2DE00E6E1DF00F9F8F800F3F2F200EFECEB00C1E0
      BC0079CB700079CB70007ACE71007FD07600B1AB8800B2C65F00B5C96100999C
      61005C4D8B00ADBA5E00A1AC55009B8D8800B2A9A80099936A00B2C56000B393
      4B00E8C45C00E9C55C00E9C15700B39C6000A1B3C10071CCFF0071CCFF0071CC
      FF0071CCFF0071CCFF0071CBFD0071CCFF0071CCFF0070CAFD006FC7F9006FC8
      FA006FC8FA006FC8FA006FC8FA009DAFBF000000000000000000000000000000
      0000000000005555550000000000000000000000000000000000595959000000
      00000000000000000000000000000000000000000000F3EDE600F6F2EB00F7F6
      F500F3F0EF00E6E1E200806FF500C9BFCD00DBD4D200DDD7D500E3DEDB00EEEB
      EA009BD4940079CB700079CB700085CE7B00B9B39500B6C96100B5C961007365
      7C004135C4007F7A6A00A2AC54009C8D8700B9B0AF009A936A00B2C66000B292
      4A00E8C45C00E8C45C00E6BF5700B1996000AEB6C00071CCFF0071CCFF0071CC
      FF0071CCFF0070BBE80070B3DC0071CCFF0071CCFF0070B8E2006FB7E1006FC8
      FA006FC8FA006FC8FA006FC8FA00A5B1BB000000000000000000000000000000
      0000000000000606060000000000000000000000000000000000050505000000
      00000000000000000000000000000000000000000000EAC17D00EDB45300EDB4
      5300EDC27B00C0B1E9006B57FF009D8EE700D0C7C400CFC6C300D0C6C400E3DE
      DB00B3DCAC0079CB700079CB700098D0900000000000A5A56A009EA46600432C
      BA00321BDB00564B9100908D5300AFA4A200AFA6A4009C976800B0BF5E00BF9A
      4C00E8C45C00E7C25A00B28F4800EBE6E300D5D0D20072BAE50071CCFF0071CC
      FF0071CCFF0070BBE70070B3DB0071CCFF0071CCFF0070B7E10070B7E10070CB
      FE006FC8FA006FC8FA006FBCE900C7C5C8000000000000000000000000000000
      0000ACACAC00000000000000000000000000000000000000000000000000AEAE
      AE000000000000000000000000000000000000000000F0D9B500EDB45300EDB4
      5300ECB35500856DE6006B57FF00705DFC00DFD8E300E6E0DD00E6E0DE00F2EF
      EE0097D28E0079CB700079CB7000C5E0C00000000000E7E2DD00634F8500321B
      DB00321BDB003B2BCB0068576F00ADA3A1009D8D8A00ACB36A00A6A55600DCB3
      5100E8C35A00B28F4700E2DCD200000000000000000093A7B70071CCFF0071CC
      FF0071CCFF0071C2F10071BCE80071CCFF0071CCFF0070BFED0070BFED0071CC
      FF0070CBFE006FC8FA008EA5B700000000000000000000000000000000000000
      00008D8D8D000000000000000000000000000000000000000000000000008E8E
      8E00000000000000000000000000000000000000000000000000EAB96900EDB4
      5300BB94A1006C58FF006B57FF006B57FF009B8DEE00E8E3E100E8E3E100E3F0
      E0007ACE710079CB70008ACC82000000000000000000A999BA00341CD500341E
      D200412FAE00311DD7004438B0009B8D960093846F00B8CB6600B0BD5E00BC97
      4B00B5904A00E1DBD100000000000000000000000000D8D6D80080B6D60071CC
      FF0071CCFF0071CCFF0071CCFF0071CCFF0071CCFF0071CCFF0071CCFF0071CC
      FF0071CCFF007EB6D800CECFD100000000000000000000000000000000000000
      0000949494000000000000000000000000000000000000000000000000009696
      9600000000000000000000000000000000000000000000000000F7EDDC00EAB4
      5A009077DB006C58FF008C7DF9006E5CFE00715EF800E8E3E100E9E4E200CAE7
      C5007BCF72007FCC7500E1EDDD000000000000000000816FB4003926DE008976
      A800DCD5D2004936AE003B2BCD00725E7500ACB26A00B5C96100B5C961009F95
      6400E5DFD4000000000000000000000000000000000000000000C6C9CC0084B7
      D80072CCFF0071CCFF0071CCFF0071CCFF0071CCFF0071CCFF0071CCFF0072CC
      FF0082B7D900BFC2C80000000000000000000000000000000000000000000000
      0000D5D5D500030303000000000000000000000000000000000003030300D6D6
      D60000000000000000000000000000000000000000000000000000000000F6EB
      D7007F6AF0008777FD00F5F5F500A093F500644FFB00E3DEE300E8E3E100ECF3
      E90091D18900E3F0E0000000000000000000000000009683B500473CE3005742
      C000917FA900341FCE003D2BC90088816D00B6CA6200B5C96100A7A46E00E7E3
      DD0000000000000000000000000000000000000000000000000000000000D7D7
      DA0098ADBE007EC2E80078CEFF0074CDFF0074CDFF0078CEFF007DC3EB0098AB
      BB00D3D3D7000000000000000000000000000000000000000000000000000000
      0000000000008B8B8B00030303000000000000000000030303008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009B8BFA006D5AFF00988AFC00735FFE007967F800E5E0DE00EBE5E500F4F2
      F0000000000000000000000000000000000000000000EAE6E900624EAC004032
      E000321BDB00341CD7006A557B00B3C56000B5C96100A7A46E00EAE5E0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D3D0D300AEB8C100A7B5C400A6B4C200AFB8C100D0CDCF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D4D4D4009797970097979700D5D5D500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ECEAFD009B8EFD007C6BFD008E7FFA00DCD8FA0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A291
      B8008F7DB700AA9BBB00EBE7E400B8B09300B8B0930000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1EAD700E0C98700D5B35000D1A93600D2AA3600D8B55000E5CD8900F6EF
      DC000000000000000000000000000000000000000000000000009F9F9F003132
      3200292A2A008282820000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A8A8A800ACACAC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4E5E400DEE0
      E000DEDEDE00DEDEDE00DEDEDE00DEE0E000E1E3E300E1E3E300E1E3E300E1E3
      E300E1E3E300E4E5E4000000000000000000000000000000000000000000E0C8
      8300CDA42E00CFA62E00CFA62E00CFA62E00D2A82E00D3A92E00D3A92E00D1A7
      2E00E4CC8700000000000000000000000000000000007D7D7D00000000001616
      1600212121000101010053535300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C009D9D9D008F8F8F0075757500A9A9A90000000000000000000000
      000000000000000000000000000000000000000000005A605E00767B7A00787E
      7A00777D7A00777D7A00777D7A00777D7A00777D7A00787E7A00797F7B00797F
      7B00797F7B00767B7A005A605E00000000000000000000000000DDBE6300D2A8
      2E00CFA62E00CFA62E00CFA62E00CFA62E00CFA62E00D2A82E00D3A92E00D3A9
      2E00D3A92E00DDBE64000000000000000000A1A1A10000000000343434000000
      0000000000005353530001010100535353000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A4A4A400B5B5B500BEBEBE00AEAEAE007575750000000000000000000000
      000000000000000000000000000000000000B4B7B6009AA09F00AAB1B0008A92
      9000D6DEDD00838A8800838A8800838A88009BA4A100575E5B00848B8900858C
      8A00858C8A00CBD2D10099A09F00B4B7B60000000000E3CB8500D3A92E00CDA6
      3300CBA84500CCAA4600CCAA4600CCAA4600CCAA4600CCAA4600CFAC4600D0AD
      4700D2AC4000D3A92E00E4CC8700000000003131310016161600000000000000
      0000000000000000000085858500BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDC00AFAFAF00D4D5D500B2B2B2008E8E8E009F9F9F00000000000000
      000000000000000000000000000000000000AEB1B0009CA4A500C6CCD200B7BC
      C100DFE6EC00DEE6EC00DBE2E800DAE2E800CCD3D700BDC3C800DBE2E800DEE6
      EC00DFE6EC00DFE6EC009CA4A500AEB1B000F5EED900D1A72E00D3A92E00DDD1
      AE00D3D59800C6CB7E00BEC77100C4CC7900CBD08400CBD08400CBD08400CED3
      8500EBE9CE00D3A92E00D1A72E00F6EFDC002828280021212100000000000000
      0000000000000000000000000000B7B7B70088888800B8B8B800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009D9D9D00AEAEAE00878787009F9F9F00000000000000
      000000000000000000000000000000000000AEB1B000262A96002223D3002223
      D3002223D3002223D3002223D2002223CF002223CF002223CF002223CF002223
      CF002223D2002223D300262A9600AEB1B000E4CC8700D3A92E00D3A92E00E4E0
      D400ADBB4F009EB33D00AEBC4F00B0C15100AABE4A00AABE4A00AABE4A00AABF
      4A00DCDEA900D3A92E00D3A92E00E5CD89008484840000000000555555000000
      000000000000000000005C5C5C000101010001010100010101005B5B5B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DADADA00DBDBDB00ABACAC00000000000000
      000000000000000000000000000000000000AEB1B000262A96002223D3002223
      D3002223D3002223D3002223D3002223D2002223CF002223CF002223CF002223
      CF002223CF002223D200262A9600AEB1B000D7B44E00D3A92E00D2A82D00DEDA
      D000E6DB9C00E8D99300F5E0A200EADB9600C6CA6D00B2C25400ABBE4A00ADBF
      4F00DCDDB000D2A82E00D3A92E00D8B550000000000055555500000000005555
      550000000000C3C3C3000000000050505000C2C2C2004E4E4E00010101005353
      5300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500000000000000
      000000000000000000000000000000000000AEB1B000262A96002223D3002223
      D3002223D3002223D300777BDF008083E0002829D2002223CF002223CF002223
      CF002223CF002223CF00262A9500AEB1B000D2AA3700D3A92E00D0AA3C00D1C7
      B400F6E4B100F5E0A300F5E0A300F5E0A300F4DFA200F0DCA000EFDCA000F0DC
      A000EFE8D600CFA62E00D2A82E00D2AC37000000000000000000595959000000
      00005353530000000000C3C3C300000000000000000000000000535353000101
      0100535353000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCDCDC00BCBCBC00000000000000
      000000000000000000000000000000000000AEB1B000262A96002223D3002223
      D3002223D3002223D300888EE200E7EFEF00CDD5EB005A5DDA002223CF002223
      CF002223CF002223CF00262A9400AEB1B000D2AA3600D3A92E00D4BA6C00C7BA
      A00092D1D900B4D5C400F5E0A300F5E0A300F5E0A300F4DFA200F0DCA000F0DC
      A000EFE8D500CFA62E00CFA62E00D1A837000000000000000000000000005555
      55000000000055555500000000000000000000000000C3C3C300000000005858
      5800010101005151510000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D2D2D200C6C6C60000000000BBBC
      BC007A7A7A00000000000000000000000000AEB1B000262A96002223D3002223
      D3002223D3002223D300888EE200E7EFEF00CBD2EB00595CDB002223D2002223
      CF002223CF002223CF00262A9300ACAFAD00D7B44E00D3A92E00DACC9E00C3B5
      980077CCE5005EC7EF00D2DAB400F5E0A300F5E0A300F5E0A300F4DFA200F0DC
      A000EFE8D400CFA62E00CFA62E00D5B350000000000000000000000000000000
      0000555555000000000050505000C8C8C8005050500000000000C3C3C3000000
      0000535353000101010053535300000000000000000000000000000000000000
      000000000000000000000000000000000000CACACA00CDCDCD00000000009393
      930074757500000000000000000000000000AEB1B000262A96002223D3002223
      D3002223D3002223D300767ADF007D82E0002628D4002223D3002223D3002223
      D2002223CF002223CF00262A9300ACAFAD00E4CC8700D3A92E00E2D8BD00C7BA
      A000C9E3E300BADFE000DEE8D900F6EED500F6EED500F6EED500F6EED500F5ED
      D400EEE9DA00CFA62E00CFA62E00E0C987000000000000000000000000000000
      0000000000005B5B5B000000000000000000000000005C5C5C00000000000000
      0000000000005353530001010100838383000000000000000000000000000000
      000000000000000000000000000000000000C1C1C100CACACA00000000008585
      850079797900DBDBDB000000000000000000AEB1B000262A96002223D3002223
      D3002223D3002223D3002223D3002223D3002223D3002223D3002223D3002223
      D3002223D2002223CF00262A9300ACAFAD00F5EED800D0A82E00D4AB3500DABA
      6000DFCD9900DDD3B900D0C5AF00BEAA8600AA8F5C00A5885100A98D5900E1D3
      A900D3AB3500CFA62E00CDA42E00F1EAD7000000000000000000000000000000
      00000000000000000000B8B8B8008A8A8A00B9B9B90000000000000000000000
      0000000000000000000020202000292A2A000000000000000000000000000000
      000000000000000000000000000000000000C5C5C500ACACAC008D8D8D00BCBC
      BC0075757500000000000000000000000000B4B7B600292B91002223D3002223
      D3002223D3002223D3002223D3002223D3002223D3002223D3002223D3002223
      D3002223D3002223D200292C8D00B2B3B20000000000E3C98200D3A92E00D3A9
      2E00D3A92E00D3A92E00D5AF4000DBC07300E0D1A300D8CDB500D4CAB800DCC1
      7300D3A92E00D2A82E00E0C88300000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00088888800000000000000
      0000000000000000000016161600313232000000000000000000000000000000
      000000000000000000000000000000000000B7B7B7004F4F4F00BFBFBF008787
      8700CECECE0000000000000000000000000000000000474C59003E4272004042
      7300404273004042730040427300404273004042730040427300404273004042
      7300404273003E427200474C5900000000000000000000000000DBBD6200D3A9
      2E00D3A92E00D3A92E00D3A92E00D3A92E00D3A92E00D3A92E00D7B34A00D4AA
      3100D3A92E00DCBD620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005555550000000000555555000000
      00000000000034343400000000009F9F9F000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C007E7E7E00A1A1A100CDCD
      CD00000000000000000000000000000000000000000000000000E4E5E400E1E3
      E300E1E3E300E1E3E300E1E3E300E1E3E300E1E3E300E1E3E300E1E3E300E1E3
      E300E1E3E300E4E5E4000000000000000000000000000000000000000000E3CA
      8100D0A82E00D3A92E00D3A92E00D3A92E00D3A92E00D3A92E00D3A92E00D1A7
      2E00E3CB85000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000055555500000000002323
      230017171700000000007D7D7D00000000000000000000000000000000000000
      000000000000000000000000000000000000878787007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5EED800E4CC8700D7B54F00D3AB3400D3AB3400D7B54F00E4CC8700F5EE
      D900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484002828
      280031313100A1A1A10000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BBBBBB00D1D1D100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B8B6
      B300635C5500635C5500635C5500635C5500635C5500645D5600645D5600645D
      5600BBB8B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCE3CB000000000000000000000000000000000000000000F7E3DB00D961
      2D00D6490D00D6490D00D6490D00D6490D00EEB9A2000000000000000000FBCE
      5B00FCEABC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C4C3
      BF006C655F00635C5500635C5500635C5500635C5500635C5500645D56006D67
      6000C6C3C1000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBEBDD00FBC18C00FCEA
      DA00F9AE6700F8AA6300FBD7B900000000000000000000000000EBA78B00E797
      7700000000000000000000000000000000000000000000000000FBCA4A00FAD4
      6F00F9C33200FCEABA000000000000000000000000008A8AEC005656E3004949
      E1004646E2003B3BDF003939E0002F2FE0002F2FE0003939E0003B3BDF004646
      E2004949E1005454E4008787EB00000000000000000000000000000000000000
      000000000000CECCCA00635C5500635C5500635C5500635C5500D1CFCD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7E3D000FBB06700F9B1
      6E00FCAF6600F89E5300FDE9D800000000000000000000000000EAA38400EAA3
      84000000000000000000000000000000000000000000F8E1A900FADA88000000
      0000FCF0D000F9C33200FCEABA00000000008F8FED002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0009191ED000000000000000000000000000000
      00000000000000000000625B5400635C5500635C5500625B5400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7DEC500F7AE6700FBB0
      6700FCAE6400FAB37300FBD1AA00FDEADB000000000000000000EAA38400EAA3
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FCF0D000FBD06200000000005555E4002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0005656E3000000000000000000000000000000
      00000000000000000000625B5400635C5500635C5500625B5400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7D9BD00F7AE6700F7AE
      6700FBAF6600FBA55A00F8A55D00FCE8D6000000000000000000EAA38400EAA3
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242E0002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE000C1C1F6004B4BE4002F2FE0002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0004545E2000000000000000000000000000000
      00000000000000000000635C5500635C5500635C5500625B5400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7D4B200F7AE6700F7A9
      6100F39C5400FABC870000000000000000000000000000000000EAA38400EAA3
      8400000000000000000000000000000000000000000000000000000000000000
      0000E9AA9000ECAD920000000000000000003737DF002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE000FFFFFF00F8F8FE009797F0003636E1002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0003737DF000000000000000000000000000000
      00000000000000000000635C5500645D5600635C5500625B5400000000000000
      000000000000000000000000000000000000DCDBFD008379FA008076FA008076
      FA008076FA008076FA008076FA008076FA008075FA00C293A200F7A35B00EE9A
      5C00A181C8008176F6008278F900DCDBFD000000000000000000EAA38400EAA3
      840000000000E37E520000000000DC5F2800D9490C00D6490D00D85E28000000
      0000E59F8200E6A1830000000000000000002E2EDD002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE000FFFFFF00FFFFFF00FFFFFF00E3E3FB006E6EE9002F2F
      E0002F2FE0002F2FE0002F2FE0002F2FDD000000000000000000000000000000
      00000000000000000000635C5500645D5600645D5600625B5400000000000000
      0000000000000000000000000000000000009089FB006256FB006156FB006156
      FB006156FB006156FB006156FB006156FB006156FB00DA937B00C98C89006457
      F2006055F6006055F6006155F6009089FA000000000000000000EAA38400EAA3
      8400000000000000000000000000000000000000000000000000000000000000
      0000E59F8200E59F820000000000000000002E2EDD002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE000FFFFFF00FFFFFF00FFFFFF00E3E3FB006E6EE9002F2F
      E0002F2FE0002F2FE0002F2FE0002F2FDD000000000000000000000000000000
      00000000000000000000635C5500645D5600645D5600635C5500000000000000
      000000000000000000000000000000000000B0ACFC006760FC00A7A1F200A7A0
      F200B1ACF1007F79F9007A73F900B4AEF000B4AEF0007A73F900665FFB00827C
      F300827CF300665FF700665FF700ADA9F8000000000000000000EAA38400EAA3
      840000000000EFBEA80000000000ECAB8F00E99C7B00E99C7B00EBAA8F000000
      0000E59F8200E59F820000000000000000003737DF002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE000FFFFFF00F8F8FE009797F0003636E1002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0003737DF00000000006E66610088827D000000
      00000000000000000000635C5500645D5600645D5600635C5500000000000000
      00000000000087807B006D65600000000000B2AEFB006760FC00ABA5F2006760
      FC007F78F9009B95F400A7A1F2006B63FB006B64FB00A7A1F2006760FC008C86
      F5008B85F200665FF700665FF700AEAAF6000000000000000000EAA38400EAA3
      840000000000F0BEA70000000000EEB39800ECA98D00ECA98D00EEB398000000
      0000E6A18300E59F820000000000000000004242E0002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE000C1C1F6004B4BE4002F2FE0002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0004545E20000000000645D5600645D5600D8D6
      D5000000000000000000635C5500645D5600645D5600635C5500000000000000
      0000D7D5D300635C5500635C550000000000B2AEFB006760FC00ABA5F200A7A0
      F200CAC6EC006962FC00ABA5F2006760FC006760FC00ABA5F2006861FC00B5AF
      F000B4AEEF006760F700665FF700AEAAF6000000000000000000EAA38400EAA3
      8400000000000000000000000000000000000000000000000000000000000000
      0000E9A28400E6A1830000000000000000005555E4002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0005656E30000000000645D5600645D5600756F
      6A00D1CFCD0000000000635C5500645D5600645D5600635C550000000000D1CF
      CD00746D6800635C5500635C550000000000B2AEFB006760FC00A7A1F200AFAA
      F100B7B2F0006760FC00A39DF2006760FC006760FC00A39DF2008E88F600847E
      F800847EF800928BF400665FF700AEAAF6000000000000000000F0BCA500DE6B
      3900E99C7B00E99C7B00EA9C7B00E47E5300E27E5300EA9C7B00E99C7B00E99C
      7B00DF6A3800EFBBA60000000000000000008E8EEC002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2FE0002F2F
      E0002F2FE0002F2FE0002F2FE0009191ED0000000000645D5600645D5600645D
      5600645D5600645D5600645D5600645D5600645D5600645D5600645D5600645D
      5600645D5600645D5600635C550000000000B2B0FB006760FC006760FC006760
      FC006760FC006760FC006760FC006760FC006760FC006760FC006760FC006760
      FC006760FC006760FC00665FFB00B0ADF700000000000000000000000000F0BC
      A500ECA98D00ECA98D00E5865D00DC5A2300DB592200E5865E00ECA98D00ECA9
      8D00F0BCA600000000000000000000000000000000008484EB005050E2004949
      E1003C3CDF003737DF002F2FE0002F2FE0002F2FE0002F2FE0003737DF003C3C
      DF004949E1005151E3008383EB0000000000000000006C655F00645D5600645D
      5600645D5600645D5600645D5600645D5600645D5600645D5600645D5600645D
      5600645D5600645D56006E66610000000000E8E8F900B6B3FB00B6B3FC00B6B3
      FC00B6B3FC00B6B3FC00B6B3FC00B6B3FC00B6B3FC00B6B3FC00B6B3FC00B6B3
      FC00B6B3FC00B6B3FC00B7B4FC00000000000000000000000000000000000000
      00000000000000000000F0BCA500DE6B3900DF6A3800F0BCA600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0BCA500F0BCA60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000700000000100010000000000800300000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFF01F00000000
      8001E007000000008001C0030000000080018003000000008001800100000000
      8001000100000000800100010000000080010001000000008001000100000000
      80018001000000008001800100000000800380030000000080FFC00700000000
      FFFFE00F00000000FFFFFC3F00000000F00FFF003FFFFFFFE007FF7E1FFFBFBF
      C3C3FF668FBFCF1987F1C066C73FC61103F81F7EE23FE00311F87F00F03FF007
      38FC7FBFF83FF00F3C7C3F9DF01FE00F3E3CBF99E00FC0073F1C8E03C0008001
      1F88E0FFFE00C0011FC0E4FFFF00F0038FE1EE7FFF81E307C3C3CE7FFF83C78F
      E007E4FFFF87CF9FF00FF1FFFF8FFFFFFFFFFE7FFFFC300FFFFFFC3FFFF88007
      FFFFC003F0318003FFFF8001E003800108000180CFC700F008001F189CE701B0
      9C7C1808387302009E30100838F304009F3010083CF30C001F3C101838F30C00
      182011183CF30C00982018883CF30C00FFFF1C689CE78001FFFF1FF88FCFC003
      FFFF0000C01FE007FFFF8001F03FF00F8707FFFFFFFFFFFF0001FFFFFFFFF00F
      0000FFFF8000EFF70000C03F8000EA570000801F8000EA570000188F8000EA57
      00003C470000EA570000FE230000EA570000FF110000EA57FC01FF880000EA57
      FE1FFFC40000EA57FE1FFFE70000C003FE1FFFFF8001C003FE1FFFFF83C7FDBF
      FE1FFFFFFFFFFC3FFE3FFFFFFFFFFFFFF81F8001F80FFE7FE0070000F007F81F
      C0030000C003F00F80010000C001F007800180018000E0030000C0038000C001
      0000FA5F800080010000FC3F800000000000F81F800000000000F81F80008000
      0000F00F800080018001F00FC00180038001F00FC0018007C003F00FE003800F
      E007F81FF00F801FF81FFC3FF07FE07FFFFFF00FC3FFF9FFC003E00781FFF07F
      8001C00318FFF07F000080013CFFF03F000000003E3FFC3F000000001C1FFE3F
      00000000880FFFBF00000000C5C7FF3F00000000E3A3FF2700000000F011FF27
      00000000F838FF2300000000FC7CFF0700008001FF3CFF078001C003FF18FF0F
      C003E007FF81FF3FFFFFF00FFFC3FF3FFFFFFFFFFFFFFFFFE007FFF7C067FFFF
      E007FF81CFC38001F81FFF81CF910000FC3FFF80CFF90000FC3FFF80CFFF0000
      FC3FFF83CFF30000FC3F0000CA130000FC3F0000CFF30000FC3F0000CA130000
      9C390000CA1300008C310000CFF3000084210000C003000080010000E0078001
      80010001FC3FFFFFFFFFFFFFFE7FFFFF00000000000000000000000000000000
      000000000000}
  end
  object OpenDialog1: TOpenDialog
    Left = 147
    Top = 387
  end
end
