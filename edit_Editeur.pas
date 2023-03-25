unit edit_Editeur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes,
  System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm14 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edt_Nom_Editeur: TEdit;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure edt_Nom_EditeurKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    var iNUM , iNom : Integer ;
         myNom_Editeur :string ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

uses DM_G, Editeur;

procedure TForm14.btn_saveClick(Sender: TObject);
begin
if(edt_Nom_Editeur.Text = '') then
  begin
   MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
   edt_Nom_Editeur.SetFocus;
   Exit;
  end
   else
    begin
     if (edt_Nom_Editeur.Text) <> (myNom_Editeur)then
       begin
        if DB.Query_Editeur.Locate('Nom_edit',(edt_Nom_Editeur.Text),[]) then
            iNom := 0 else iNom := 1;
       end else iNom := 1 ;

     if iNom = 0 then
       begin
        MessageDlg('Ì—ÃÏ  €Ì— «·»Ì«‰« ' ,mtWarning,[mbok],0 ) ;   Exit;
        edt_Nom_Editeur.SetFocus;
        edt_Nom_Editeur.SelectAll ;
       end
        else
         begin
          if DB.Query_Editeur.Locate('Num_edit',iNUM) then
            begin
              with DB do
                begin
                 Query_Editeur.Edit ;
                 Query_Editeur['Nom_edit']                   := Trim(edt_Nom_Editeur.Text) ;
                end;
            //====
             DB.Query_Editeur.Post;
             MessageDlg(' „  ⁄œÌ· ‘⁄»… »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
             close;
            end;
         end;
    end;
end;

procedure TForm14.edt_Nom_EditeurKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then btn_save.Click;
end;

procedure TForm14.EscExecute(Sender: TObject);
begin
 Close;
end;

procedure TForm14.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Form12.AsSearchBox1.SetFocus;
end;

procedure TForm14.FormShow(Sender: TObject);
begin
 if DB.Query_Editeur.Locate('Num_edit',Form12.DBGrid1.Fields[0].AsInteger,[]) then
  iNUM := DB.Query_Editeur['Num_edit'] ;
   begin
      edt_Nom_Editeur.Text                               := DB.Query_Editeur['Nom_edit'];
   //====
      myNom_Editeur   := DB.Query_Editeur['Nom_edit'];
   end;
   edt_Nom_Editeur.SelectAll ;
   edt_Nom_Editeur.SetFocus ;
   Form12.AsSearchBox1.Clear;
end;

end.
