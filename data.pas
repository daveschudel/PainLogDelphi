unit data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, System.IOUtils, FMX.Dialogs, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    DBConnection: TFDConnection;
    qSelectAll: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure InitDatabase;
    procedure InitSchema;
    function DBPath : string;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

function TDM.DBPath: string;
begin
var
  P: string;
begin
  P := TPath.GetDocumentsPath;

  //try
  //  TFile.WriteAllText(TPath.Combine(P, 'write_test.txt'), 'hello');

  //except
  //  on E: Exception do
  //    ShowMessage('CANNOT WRITE to: ' + P + sLineBreak + E.ClassName + ': ' + E.Message);
  //end;
end;

  Result := TPath.Combine(TPath.GetDocumentsPath, 'PainLog.db');
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  InitDatabase;
end;

procedure TDM.InitDatabase;
var
  DB: string;
begin
  DB := DBPath;

  {$IFDEF MSWINDOWS}
  DB := DB.Replace('/', '\');
{$ENDIF}


  DBConnection.LoginPrompt := False;
  DBConnection.Connected := False;

  DBConnection.Params.Clear;
  DBConnection.Params.Values['Database'] := DB;
  DBConnection.Params.Values['DriverID'] := 'SQLite';
  DBConnection.DriverName := 'SQLite';
  DBConnection.LoginPrompt := False;

  try
    DBConnection.Connected := True;
    DBConnection.ExecSQL(
      'CREATE TABLE IF NOT EXISTS entries (' +
      'id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT);'
    );

    InitSchema;

  except
    on E: Exception do
      ShowMessage('SQLite error: ' + E.ClassName + ': ' + E.Message);
  end;
end;

procedure TDM.InitSchema;
begin
  DBConnection.ExecSQL(' CREATE TABLE IF NOT EXISTS "PainRecs" ( ' +
	'"UUID"	INTEGER NOT NULL UNIQUE, ' +
	'"RecordDate"	TEXT, ' +
	'"PainLevel"	INTEGER, ' +
	'"Meds"	INTEGER, ' +
	'"Notes"	TEXT, ' +
	'"Temperature"	INTEGER, ' +
	'"Pressure"	INTEGER, ' +
	'PRIMARY KEY("UUID") ' +
  ' );'  );

  DBConnection.ExecSQL( 'CREATE TABLE IF NOT EXISTS entries (id INTEGER ' +
  'PRIMARY KEY AUTOINCREMENT, title TEXT) ;'  );

end;
end.
