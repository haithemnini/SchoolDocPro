unit Edit_etud_Arch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.StdCtrls,System.UITypes,
  Vcl.Buttons, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm5 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edt_Pren: TEdit;
    edt_Nom: TEdit;
    edt_Lieu_naiss: TEdit;
    DateTimePicker1: TDateTimePicker;
    edt_Adr: TEdit;
    edt_gardi: TEdit;
    DBLookCombo_class: TDBLookupComboBox;
    DBLookCombo_annee: TDBLookupComboBox;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PrenKeyPress(Sender: TObject; var Key: Char);
    procedure edt_NomExit(Sender: TObject);
    procedure edt_PrenExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    var iNUM , iNom: Integer ;
       myPren , myNom  : string;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;


implementation

{$R *.dfm}

uses DM_G, Liste_etud_Arch;

procedure TForm5.btn_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TForm5.btn_saveClick(Sender: TObject);
begin
  if (edt_Pren.Text = '') or (edt_Nom.Text = '') or(edt_Lieu_naiss.Text = '') or(edt_gardi.Text = '') then
   begin
     MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
     Exit;
   end
    else
     begin
     if (Trim(edt_Nom.Text) <> myNom) OR (Trim(edt_Pren.Text) <> myPren)then
       begin
       if DB.Query_Uneleve.Locate('Nom_ele;Pren_ele', VarArrayOf ([Trim(edt_Nom.Text),Trim(edt_Pren.Text)]),[]) then
            iNom := 0 else iNom := 1;
       end else iNom := 1 ;

     //========
     if iNom = 0 then
       begin
       MessageDlg('Ì—ÃÏ  €Ì— «·«”„ «Ê «··ﬁ»', mtWarning,[mbYes], 0);
       edt_Nom.SetFocus;
       edt_Nom.SelectAll;
       Exit ;
       end
        else
         begin
          if DB.Query_Uneleve.Locate('Num_ele',iNUM) then
           begin
            with DB do
             begin
              Query_Uneleve.Edit ;
              Query_Uneleve['Num_ele']                    := iNUM;
              Query_Uneleve['Nom_ele']                    := Trim(edt_Nom.Text) ;
              Query_Uneleve['Pren_ele']                   := Trim(edt_Pren.Text) ;
              Query_Uneleve['Date_naiss_ele']             := DateTimePicker1.Date ;
              Query_Uneleve['Lieu_naiss_ele']             := Trim(edt_Lieu_naiss.Text) ;
              Query_Uneleve['Adr_ele']                    := Trim(edt_Adr.Text) ;
              Query_Uneleve['Nom_gardi']                  := Trim(edt_gardi.Text) ;
              Query_Uneleve['Num_annee_scol']             := DBLookCombo_annee.KeyValue;
              Query_Uneleve['Num_class']                  := DBLookCombo_class.KeyValue ;
             end;

            DB.Query_Uneleve.Post;
            MessageDlg(' „  ⁄œÌ· »Ì«‰«  «· ·„Ì– »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
            close;
           end;

         end;


     end;
end;

procedure TForm5.edt_NomExit(Sender: TObject);
begin
  edt_Nom.Text := trim(edt_Nom.Text);
end;

procedure TForm5.edt_PrenExit(Sender: TObject);
begin
    edt_Pren.Text := trim(edt_Pren.Text);
end;

procedure TForm5.edt_PrenKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then btn_save.Click;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Form3.ASSearchBox1.Clear;
   Form3.AsSearchBox1.SetFocus;
end;

procedure TForm5.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #9 then
  begin
   key := #0 ;
   SelectNext(ActiveControl , true , true );
  end;
end;

procedure TForm5.FormShow(Sender: TObject);
begin

   edt_Nom.SetFocus ;
   edt_Nom.SelectAll ;


 if DB.Query_Uneleve.Locate('Num_ele',Form3.DBGrid1.Fields[0].AsInteger,[]) then
 iNUM := DB.Query_Uneleve['Num_ele'] ;
   begin
    with DB do
       begin
         edt_Pren.Text                               := Query_Uneleve['Pren_ele'];
         edt_Nom.Text                                := Query_Uneleve['Nom_ele'];
         DateTimePicker1.Date                        := Query_Uneleve['Date_naiss_ele'];
         edt_Lieu_naiss.Text                         := Query_Uneleve['Lieu_naiss_ele'];
         edt_Adr.Text                                := Query_Uneleve['Adr_ele'] ;
         edt_gardi.Text                              := Query_Uneleve['Nom_gardi'];
         DBLookCombo_annee.KeyValue                  := Query_Uneleve['Num_annee_scol']  ;
         DBLookCombo_class.KeyValue                  := Query_Uneleve['Num_class'] ;
       //====
         myPren                                 := Query_Uneleve['Pren_ele'];
         myNom                                  := Query_Uneleve['Nom_ele'];
       end;

     Form3.DBGrid1.DataSource.DataSet.Filtered := False;
     Form3.AsSearchBox1.Clear;

   end;
end;

end.
