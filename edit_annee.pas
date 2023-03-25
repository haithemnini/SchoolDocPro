unit edit_annee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,System.UITypes,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm17 = class(TForm)
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
    var iNUM :Integer ;
  public
    { Public declarations }
  end;

var
  Form17: TForm17;
  Date : tDate ;
  iNom : Integer ;
implementation

{$R *.dfm}

uses DM_G, annee;

procedure TForm17.btn_saveClick(Sender: TObject);

begin
 if (DateTimePicker1.Date) <> (Date)then
  begin
   if DB.Query_Annee.Locate('Annee_scol',(DateTimePicker1.Date),[]) then
      iNom := 0 else iNom := 1;
  end else iNom := 1 ;

  if iNom = 0 then
   begin
    MessageDlg('Ì—ÃÏ  €Ì— «·»Ì«‰« ' ,mtWarning,[mbok],0 ) ;   Exit;
   end
    else
     begin
         if DB.Query_Annee.Locate('Num_annee_scol',iNUM) then
          begin
           with DB do
            begin
             Query_Annee.Edit ;
             Query_Annee['Annee_scol']                   := DateTimePicker1.Date  ;
            end;
          //====
           DB.Query_Annee.Post;
           MessageDlg(' „  ⁄œÌ· ”‰… œ—«”Ì… »‰Ã«Õ', mtConfirmation,[mbYes], 0);
           close;
          end;
     end;
end;

procedure TForm17.EscExecute(Sender: TObject);
begin
  Close;
end;

procedure TForm17.FormShow(Sender: TObject);
begin
   if DB.Query_Annee.Locate('Num_annee_scol',Form15.DBGrid1.Fields[0].AsInteger,[]) then
     iNUM := DB.Query_Annee['Num_annee_scol'] ;
   begin
      DateTimePicker1.Date                               := DB.Query_Annee['Annee_scol'];
   //====
      Date  := DateTimePicker1.Date ;
   end;
end;

end.
