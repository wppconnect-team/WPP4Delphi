object frameMensagensRecebidas: TframeMensagensRecebidas
  Left = 0
  Top = 0
  Width = 777
  Height = 399
  TabOrder = 0
  object memo_unReadMessage: TMemo
    Left = 0
    Top = 89
    Width = 777
    Height = 310
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '...')
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 95
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      777
      89)
    object Image2: TImage
      Left = 672
      Top = 0
      Width = 105
      Height = 89
      Align = alRight
      Stretch = True
      ExplicitHeight = 81
    end
    object ed_profilePicThumbURL: TEdit
      Left = 12
      Top = 52
      Width = 614
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = 'ProfilePicThumbURL'
    end
    object chk_apagarMsg: TCheckBox
      Left = 12
      Top = 29
      Width = 181
      Height = 17
      Caption = 'Apagar mensagens ap'#243's receber'
      TabOrder = 1
    end
    object Button1: TButton
      Left = 568
      Top = 0
      Width = 98
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Get profile image'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
