unit Add_annee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm16 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

uses DM_G, annee;

procedure TForm16.btn_saveClick(Sender: TObject);
var iAnn :Integer ;
begin
 if DB.Query_Annee.Locate('Annee_scol',DateTimePicker1.Date,[]) then
  begin
   MessageDlg('Ì—ÃÏ  €Ì— «·»Ì«‰« ' ,mtWarning,[mbok],0 ) ;   Exit;
  end
   else
    begin
     if DB.Query_Division.RecordCount > 0 then
       begin
        DB.Query_Annee.Last;
        iAnn := Form15.DBGrid1.Fields[0].AsInteger + 1 ;
       end else iAnn := 1 ;

      DB.Query_Annee.Append;
      DB.Query_Annee['Num_annee_scol']                     := iAnn ;
      DB.Query_Annee['Annee_scol']                         := DateTimePicker1.Date ;
    //====
      DB.Query_Annee.Post;
      MessageDlg(' „ «÷«›… ”‰… «·œ—«”Ì… »‰Ã«Õ', mtConfirmation,[mbYes], 0);
      close;
    end;
end;

procedure TForm16.EscExecute(Sender: TObject);
begin
  Close;
end;

procedure TForm16.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Now;
end;

end.
