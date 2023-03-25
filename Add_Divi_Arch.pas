unit Add_Divi_Arch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes,
  Vcl.DBCtrls, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm7 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    edt_Nom_Divi: TEdit;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure FormShow(Sender: TObject);
    procedure edt_Nom_DiviKeyPress(Sender: TObject; var Key: Char);
    procedure btn_saveClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
  private
   var iDivi :Integer ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

uses DM_G, Divi_Arch;

procedure TForm7.btn_saveClick(Sender: TObject);
begin
 if(edt_Nom_Divi.Text = '') then
    begin
     MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
     edt_Nom_Divi.SelectAll ;
     edt_Nom_Divi.SetFocus;
     Exit;
    end
     else
      begin
        if DB.Query_Division.Locate('Nom_divisi',Trim(edt_Nom_Divi.Text),[]) then
         begin
           MessageDlg('Ì—ÃÏ  €Ì— «·»Ì«‰« ' ,mtWarning,[mbok],0 ) ;
           edt_Nom_Divi.SelectAll ;
           edt_Nom_Divi.SetFocus;
           Exit;
         end
          else
             begin
             if DB.Query_Division.RecordCount > 0 then
              begin
                DB.Query_Division.Last;
                iDivi := Form6.DBGrid1.Fields[0].AsInteger + 1 ;
              end else iDivi := 1 ;

             DB.Query_Division.Append;
             DB.Query_Division['Num_divisi']                     := iDivi ;
             DB.Query_Division['Nom_divisi']                     := Trim(edt_Nom_Divi.Text) ;
            //====
             DB.Query_Division.Post;
             MessageDlg(' „ «÷«›… ‘⁄»… »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
             close;
           end;
      end;
end;

procedure TForm7.edt_Nom_DiviKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then btn_save.Click;
end;

procedure TForm7.EscExecute(Sender: TObject);
begin
Close;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
   edt_Nom_Divi.Clear;
   edt_Nom_Divi.SetFocus;
end;

end.
