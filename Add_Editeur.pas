unit Add_Editeur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes,
  System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm13 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edt_Nom_Editeur: TEdit;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure edt_Nom_EditeurKeyPress(Sender: TObject; var Key: Char);
    procedure EscExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

uses DM_G, Editeur;

procedure TForm13.btn_saveClick(Sender: TObject);
var iEdit :Integer ;
begin
 if(edt_Nom_Editeur.Text = '') then
  begin
   MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
   edt_Nom_Editeur.SetFocus;
   Exit;
  end
   else
    begin
     if DB.Query_Editeur.Locate('Nom_edit', Trim(edt_Nom_Editeur.Text),[]) then
      begin
         MessageDlg('Ì—ÃÏ  €Ì— «·»Ì«‰« ' ,mtWarning,[mbok],0 ) ;   Exit;
         edt_Nom_Editeur.SetFocus;
         edt_Nom_Editeur.SelectAll ;
      end
       else
         begin
         if DB.Query_Editeur.RecordCount > 0 then
          begin
           DB.Query_Editeur.Last;
           iEdit := Form12.DBGrid1.Fields[0].AsInteger + 1 ;
          end else iEdit := 1 ;

         DB.Query_Editeur.Append;
         DB.Query_Editeur['Num_edit']                     := iEdit ;
         DB.Query_Editeur['Nom_edit']                     := Trim(edt_Nom_Editeur.Text) ;
        //====
         DB.Query_Editeur.Post;
         MessageDlg(' „ «÷«›… „Õ—— »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
         close;
        end;
    end;
end;

procedure TForm13.edt_Nom_EditeurKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then btn_save.Click;
end;

procedure TForm13.EscExecute(Sender: TObject);
begin
 Close;
end;

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form12.AsSearchBox1.SetFocus;
end;

procedure TForm13.FormShow(Sender: TObject);
begin
   edt_Nom_Editeur.Clear;
   edt_Nom_Editeur.SetFocus;
   Form12.AsSearchBox1.Clear;
end;

end.
