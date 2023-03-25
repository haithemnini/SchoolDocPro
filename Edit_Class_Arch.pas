unit Edit_Class_Arch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons,System.UITypes,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm11 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edt_Nom_class: TEdit;
    DBLookCombo_divisi: TDBLookupComboBox;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure edt_Nom_classKeyPress(Sender: TObject; var Key: Char);
    procedure EscExecute(Sender: TObject);
  private
  var iNUM  , iNom: Integer ;
       myclass , mydivi :string ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

uses DM_G, Class_Arch;

procedure TForm11.btn_saveClick(Sender: TObject);
begin
 if(edt_Nom_class.Text = '') or (DBLookCombo_divisi.Text = '') then
  begin
   MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
   Exit;
  end
   else
    begin
    if (Trim(edt_Nom_class.Text) <> myclass) or (DBLookCombo_divisi.Text <> mydivi) then
      begin
       if DB.Query_Classe.Locate('Nom_class;Num_divisi',VarArrayOf([Trim(edt_Nom_class.Text),DBLookCombo_divisi.KeyValue]),[])  then
         iNom := 0  else iNom := 1;
      end else iNom := 1 ;

     if iNom = 0 then
      begin
       MessageDlg('Ì—ÃÏ  €Ì— «·»Ì«‰« ' ,mtWarning,[mbok],0 ) ;
       edt_Nom_class.SelectAll ;
       edt_Nom_class.SetFocus;
       Exit;
      end
       else
        begin
         if DB.Query_Classe.Locate('Num_class',iNUM) then
          begin
           with DB do
            begin
             Query_Classe.Edit ;
             Query_Classe['Nom_class']                       := Trim(edt_Nom_class.Text) ;
             Query_Classe['Num_divisi']                      := DBLookCombo_divisi.KeyValue  ;
            end;

           DB.Query_Classe.Post;
           MessageDlg(' „  ⁄œÌ· »Ì«‰«  «·ﬁ”„ »‰Ã«Õ', mtConfirmation,[mbYes], 0);
           close;
          end;
        end;
    end;
end;

procedure TForm11.edt_Nom_classKeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then btn_save.Click;
end;

procedure TForm11.EscExecute(Sender: TObject);
begin
Close;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
 if DB.Query_Classe.Locate('Num_class',Form9.DBGrid1.Fields[0].AsInteger,[]) then
  iNUM := DB.Query_Classe['Num_class'] ;
   begin
    with DB do
       begin
         edt_Nom_class.Text                               := Query_Classe['Nom_class'];
         DBLookCombo_divisi.KeyValue                      := Query_Classe['Num_divisi'] ;
       //====
        myclass  :=       Query_Classe['Nom_class'];
        mydivi   :=       DBLookCombo_divisi.Text ;
       end;
   end;
  edt_Nom_class.SelectAll ;
  edt_Nom_class.SetFocus ;
//====
 Form9.DBGrid1.DataSource.DataSet.Filtered := False;
 Form9.asSearchBox1.Clear;
 Form9.asSearchBox2.Clear;
end;

end.
