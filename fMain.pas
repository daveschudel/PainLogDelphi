unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation, FMX.DateTimeCtrls, data,
  fEdit;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    sbtnAdd: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbtnAddClick(Sender: TObject);
  private
    DM : TDM;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DM := TDM.Create(self);
end;

procedure TMainForm.sbtnAddClick(Sender: TObject);
begin
  EditForm.Show;
end;

end.
