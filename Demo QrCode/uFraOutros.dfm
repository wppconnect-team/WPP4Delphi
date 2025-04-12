object frameOutros: TframeOutros
  Left = 0
  Top = 0
  Width = 420
  Height = 356
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
    Height = 356
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
