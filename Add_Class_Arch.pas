unit Add_Class_Arch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes,
  Vcl.DBCtrls, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm10 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edt_Nom_class: TEdit;
    Label2: TLabel;
    DBLookCombo_divisi: TDBLookupComboBox;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure btn_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_Nom_classKeyPress(Sender: TObject; var Key: Char);
    procedure EscExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

uses DM_G, Class_Arch;

procedure TForm10.btn_saveClick(Sender: TObject);
var iclas :Integer ;
begin
if(edt_Nom_class.Text = '') or (DBLookCombo_divisi.Text = '') then
  begin
   MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
   edt_Nom_class.SetFocus;
   Exit;
  end
   else
    begin
     if DB.Query_Classe.Locate('Nom_class;Num_divisi',VarArrayOf([Trim(edt_Nom_class.Text),DBLookCombo_divisi.KeyValue]),[])  then
      begin
       MessageDlg('Ì—ÃÏ  €Ì— «·»Ì«‰« ' ,mtWarning,[mbok],0 ) ;
       edt_Nom_class.SelectAll ;
       edt_Nom_class.SetFocus;
       Exit;
      end
       else
        begin
           if DB.Query_Classe.RecordCount > 0 then
            begin
             DB.Query_Classe.Last;
              iclas := Form9.DBGrid1.Fields[0].AsInteger + 1 ;
            end else iclas := 1 ;

           DB.Query_Classe.Append;
           DB.Query_Classe['Num_class']                      := iclas ;
           DB.Query_Classe['Nom_class']                      := Trim(edt_Nom_class.Text) ;
           DB.Query_Classe['Num_divisi']                     := DBLookCombo_divisi.KeyValue ;
          //====
           DB.Query_Classe.Post;
           MessageDlg(' „ «÷«›… «·ﬁ”„ »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
           close;
        end;
    end;

end;

procedure TForm10.edt_Nom_classKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then btn_save.Click;
end;

procedure TForm10.EscExecute(Sender: TObject);
begin
 Close;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
  edt_Nom_class.Clear ;
  edt_Nom_class.SetFocus ;
//====
  DB.Query_Division.Last ;
  DBLookCombo_divisi.KeyValue := DB.Query_Division['Num_divisi'];
  Form9.DBGrid1.DataSource.DataSet.Filtered := False;
  Form9.asSearchBox1.Clear;
  Form9.asSearchBox2.Clear;
end;

end.
