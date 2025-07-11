object frameOutros: TframeOutros
  Left = 0
  Top = 0
  Width = 642
  Height = 531
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Roboto'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 241
    Height = 531
    Align = alLeft
    Caption = 'Outras Fun'#231#245'es'
    TabOrder = 0
    object btnMudarImagem: TButton
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 231
      Height = 30
      Align = alTop
      Caption = 'Mudar Imagem do Profile'
      TabOrder = 0
      OnClick = btnMudarImagemClick
    end
    object edtNumberContact: TLabeledEdit
      Left = 17
      Top = 208
      Width = 200
      Height = 23
      EditLabel.Width = 93
      EditLabel.Height = 15
      EditLabel.Caption = 'Number Contact'
      TabOrder = 1
      TextHint = '558891030999@c.us'
    end
    object edtNameContact: TLabeledEdit
      Left = 17
      Top = 256
      Width = 200
      Height = 23
      EditLabel.Width = 81
      EditLabel.Height = 15
      EditLabel.Caption = 'Name Contact'
      TabOrder = 2
    end
    object edtSurnameContact: TLabeledEdit
      Left = 17
      Top = 305
      Width = 200
      Height = 23
      EditLabel.Width = 99
      EditLabel.Height = 15
      EditLabel.Caption = 'Surname Contact'
      TabOrder = 3
    end
    object btnSaveContacts: TButton
      AlignWithMargins = True
      Left = 82
      Top = 346
      Width = 135
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Save Contacts'
      ImageIndex = 9
      TabOrder = 4
      OnClick = btnSaveContactsClick
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.ti' +
      'ff)|*.gif;*.png;*.jpg;*.jpeg;*.bmp;|Portable Network Graphics (*' +
      '.png)|*.png|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpe' +
      'g)|*.jpeg|Bitmaps (*.bmp)|*.bmp'
    Left = 288
    Top = 67
  end
end
