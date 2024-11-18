object dm: Tdm
  OldCreateOrder = False
  Height = 447
  Width = 506
  object sqlSearch: TFDQuery
    Connection = FDConnection1
    Left = 136
    Top = 136
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=database.db')
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 136
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 328
    Top = 120
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 328
    Top = 56
  end
  object sqlPost: TFDQuery
    Connection = FDConnection1
    Left = 136
    Top = 192
  end
  object sqlTicket: TFDQuery
    Connection = FDConnection1
    Left = 136
    Top = 248
  end
end
