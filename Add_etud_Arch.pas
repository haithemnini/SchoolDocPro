unit Add_etud_Arch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes,
  Vcl.DBCtrls, Vcl.ComCtrls, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm4 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    edt_Nom: TEdit;
    edt_Pren: TEdit;
    edt_Lieu_naiss: TEdit;
    DateTimePicker1: TDateTimePicker;
    edt_Adr: TEdit;
    edt_gardi: TEdit;
    DBLookCombo_annee: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBLookCombo_class: TDBLookupComboBox;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure clEdit;
    procedure edt_NomKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cancelClick(Sender: TObject);
    procedure edt_NomExit(Sender: TObject);
    procedure edt_PrenExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses DM_G, Liste_etud_Arch;

procedure TForm4.btn_cancelClick(Sender: TObject);
begin
  DB.Query_Uneleve.Cancel;
  Close;
end;

procedure TForm4.btn_saveClick(Sender: TObject);
var iclass : Integer ;
begin
  if (edt_Pren.Text = '') or (edt_Nom.Text = '') or(edt_Lieu_naiss.Text = '') or(edt_gardi.Text = '')
    or (DBLookCombo_annee.Text = '') or (DBLookCombo_class.Text = '') then
   begin
     MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
     Exit;
   end
    else
     begin
      if DB.Query_Uneleve.Locate('Nom_ele;Pren_ele',VarArrayOf([edt_Nom.Text,edt_Pren.Text]),[]) then
      begin
       MessageDlg('Ì—ÃÏ  €Ì— «·«”„ Ê«··›»' ,mtWarning,[mbok],0 ) ;
       edt_Nom.SelectAll ;
       edt_Nom.SetFocus;
       Exit;
      end
       else
        begin
          if DB.Query_Uneleve.RecordCount > 0 then
            begin
              DB.Query_Uneleve.Last;
              iclass := Form3.DBGrid1.Fields[0].AsInteger + 1 ;
            end else iclass := 1 ;

          with DB do
           begin
             Query_Uneleve.Append;
             Query_Uneleve['Num_ele']                    := iclass ;
             Query_Uneleve['Nom_ele']                    := Trim(edt_Nom.Text) ;
             Query_Uneleve['Pren_ele']                   := Trim(edt_Pren.Text) ;
             Query_Uneleve['Date_naiss_ele']             := DateTimePicker1.Date ;
             Query_Uneleve['Lieu_naiss_ele']             := edt_Lieu_naiss.Text ;
             Query_Uneleve['Adr_ele']                    := Trim(edt_Adr.Text) ;
             Query_Uneleve['Nom_gardi']                  := Trim(edt_gardi.Text) ;
             Query_Uneleve['Num_annee_scol']             := DBLookCombo_annee.KeyValue;
             Query_Uneleve['Num_class']                  := DBLookCombo_class.KeyValue ;
           end;
         //====
           DB.Query_Uneleve.Post;
           MessageDlg(' „ «÷«›…  ·„Ì– »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
           close;
        end;
     end;

end;

procedure TForm4.clEdit;
begin
  edt_Pren.Text := '' ;
  edt_Nom.Text := '' ;
  edt_Lieu_naiss.Text := '' ;
  edt_Adr.Text := '' ;
  edt_gardi.Text := '' ;
//====
  DB.Query_Classe.Last ;
  DBLookCombo_class.KeyValue := DB.Query_Classe['Num_class'];
//====
  DB.Query_Annee.Last ;
  DBLookCombo_annee.KeyValue := DB.Query_Annee['Num_annee_scol'];
end;

procedure TForm4.edt_PrenExit(Sender: TObject);
begin
   edt_Pren.Text := trim(edt_Pren.Text);
end;

procedure TForm4.edt_NomExit(Sender: TObject);
begin
   edt_Nom.Text := trim(edt_Nom.Text);
end;

procedure TForm4.edt_NomKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then btn_save.Click;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Form3.ASSearchBox1.Clear;
   Form3.AsSearchBox1.SetFocus;
end;

procedure TForm4.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #9 then
  begin
   key := #0 ;
   SelectNext(ActiveControl , true , true );
  end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  edt_Nom.SetFocus;
  clEdit;
  Form3.DBGrid1.DataSource.DataSet.Filtered := False;
  Form3.AsSearchBox1.Clear;
end;

end.
