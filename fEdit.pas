unit fEdit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TEditForm = class(TForm)
    ToolBar1: TToolBar;
    sbtnBack: TSpeedButton;
    procedure sbtnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditForm: TEditForm;

implementation
uses fMain;

{$R *.fmx}

procedure TEditForm.sbtnBackClick(Sender: TObject);
begin
  MainForm.Show;
end;

end.
