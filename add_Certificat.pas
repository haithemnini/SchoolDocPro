unit add_Certificat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.StdCtrls,System.UITypes,
  Vcl.Buttons, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm22 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edt_Pren: TEdit;
    edt_Nom: TEdit;
    edt_Nom_Certifi: TEdit;
    DateTimePicker1: TDateTimePicker;
    DBLookCombo_Editeur: TDBLookupComboBox;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure btn_saveClick(Sender: TObject);
     procedure clEdit ;
    procedure FormShow(Sender: TObject);
    procedure edt_NomExit(Sender: TObject);
    procedure edt_NomKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PrenExit(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

{$R *.dfm}

uses DM_G, Certificat;

procedure TForm22.btn_cancelClick(Sender: TObject);
begin
    Close ;
end;

procedure TForm22.btn_saveClick(Sender: TObject);
 var iNom ,iExc:Integer ;
begin
 btn_save.SetFocus ;
 if (edt_Pren.Text = '') or (edt_Nom.Text = '') or(edt_Nom_Certifi.Text = '') then
   begin
     MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
     edt_Nom.SetFocus ;
     Exit;
   end
    else
     begin
      if DB.Query_Certif.RecordCount > 0 then
        begin
          DB.Query_Certif.Last;
          iExc := Form21.DBGrid1.Fields[0].AsInteger + 1 ;
        end else iExc := 1 ;
     //====
      if DB.Query_Uneleve.Locate('Nom_ele;Pren_ele',VarArrayOf([edt_Nom.Text,edt_Pren.Text]),[]) then
       begin
        iNom := DB.Query_Uneleve['Num_ele'];
       //====
        if DB.Query_Certif.Locate('Num_ele',iNom,[]) then  iNom := 0 ;
       //====
       end else iNom := 0 ;
     //====

      if iNom = 0  then
        begin
           MessageDlg('Ì—ÃÏ  €Ì— «·«”„ «Ê «··ﬁ»', mtWarning,[mbYes], 0);
           edt_Nom.SetFocus;
           Exit ;
        end
         else
          begin
             with DB do
              begin
               Query_Certif.Append;

               Query_Certif['Num_certifi']                           := iExc             ;
               Query_Certif['Nom_certifi']                           := Trim(edt_Nom_Certifi.Text) ;
               Query_Certif['Num_edit']                              := DBLookCombo_Editeur.KeyValue ;
               Query_Certif['Date_edit_certifi']                     := DateTimePicker1.Date ;
               Query_Certif['Num_ele']                               := iNom ;
              end;
         //====
             DB.Query_Certif.Post;
             MessageDlg(' „ «÷«›… «·‘Â«œ… ·· ·„Ì– »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
             close;
         end
     end;
end;


procedure TForm22.clEdit;
begin
   edt_Pren.Clear;
   edt_Nom.Clear;
   DBLookCombo_Editeur.KeyValue := DBLookCombo_Editeur.ListSource.DataSet.FieldByName(DBLookCombo_Editeur.KeyField).Value;
   DateTimePicker1.Date := Now;
   edt_Nom.SetFocus ;
end;

procedure TForm22.edt_NomExit(Sender: TObject);
begin
  edt_Nom.Text := Trim(edt_Nom.Text);
end;

procedure TForm22.edt_NomKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
    btn_save.SetFocus;
    btn_save.Click ;
   end;
end;

procedure TForm22.edt_PrenExit(Sender: TObject);
begin
 edt_Pren.Text := Trim(edt_Pren.Text);
end;

procedure TForm22.FormShow(Sender: TObject);
begin
   clEdit ;
end;

end.
