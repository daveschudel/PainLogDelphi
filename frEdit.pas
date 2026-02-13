unit frEdit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.DateTimeCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects;


type


  TPainRec = record
    UUID: Int64;
    RecordDT: TDateTime;
    PainLevel: Integer;
    Meds: Integer;
    Notes: string;
    Temperature: Integer;
    Pressure: Integer;
  end;

  TEditFrame = class(TFrame)
    RootLayout: TLayout;
    CardRect: TRectangle;
    Scroll: TVertScrollBox;
    DateLayout: TLayout;
    Label1: TLabel;
    deDate: TDateEdit;
    TimeEdit: TTimeEdit;
    PainLevelLayout: TLayout;
    Label2: TLabel;
    tbPain: TTrackBar;
    MedsLayout: TLayout;
    Label3: TLabel;
    cbMeds: TCheckBox;
    TempLayout: TLayout;
    Label4: TLabel;
    edTemp: TEdit;
    PressureLayout: TLayout;
    Label5: TLabel;
    edPressure: TEdit;
    NotesLayout: TLayout;
    memNotes: TMemo;
    ButtonLayout: TLayout;
    btnCancel: TButton;
    btnSave: TButton;
  private
    { Private declarations }
  public
    procedure LoadFromRec(const R: TPainRec);
    procedure SaveToRec(out R: TPainRec);
  end;






implementation

{$R *.fmx}

procedure TFrameEdit.LoadFromRec(const R: TPainRec);
begin
  deDate.Date := R.RecordDT;
  tbPain.Value := R.PainLevel;
  cbMeds.IsChecked := R.Meds = 1;
  memNotes.Text := R.Notes;
  edTemp.Text := R.Temperature.ToString;
  edPressure.Text := R.Pressure.ToString;
end;

procedure TFrameEdit.SaveToRec(out R: TPainRec);
begin
  R.RecordDT := deDate.Date;
  R.PainLevel := Round(tbPain.Value);
  R.Meds := Ord(cbMeds.IsChecked);
  R.Notes := memNotes.Text;
  R.Temperature := StrToIntDef(edTemp.Text, 0);
  R.Pressure := StrToIntDef(edPressure.Text, 0);
end;

end.
