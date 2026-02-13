program PainLogDelphi;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in '..\PainLog II\fMain.pas' {MainForm},
  data in '..\PainLog II\data.pas' {DM: TDataModule},
  fEdit in '..\PainLog II\fEdit.pas' {EditForm},
  frEdit in '..\PainLog II\frEdit.pas' {EditFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TEditForm, EditForm);
  //Application.CreateForm(TEditFrame, EditFrame);
  Application.Run;
end.
