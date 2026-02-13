object DM: TDM
  OnCreate = DataModuleCreate
  Height = 1920
  Width = 2560
  PixelsPerInch = 192
  object DBConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Mac\Home\Documents\PainLog.db'
      'DriverID=SQLite')
    Left = 204
    Top = 168
  end
  object qSelectAll: TFDQuery
    Connection = DBConnection
    SQL.Strings = (
      'SELECT * FROM PainRecs;')
    Left = 204
    Top = 296
  end
end
