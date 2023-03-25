unit edit_Certificat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.StdCtrls,System.UITypes,
  Vcl.Buttons, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm23 = class(TForm)
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
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure edt_NomKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cancelClick(Sender: TObject);
  private
    var iNUM ,inom :Integer ;
      myPren_ele,myNom_ele :string ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form23: TForm23;

implementation

{$R *.dfm}

uses DM_G, Certificat;

procedure TForm23.btn_cancelClick(Sender: TObject);
begin
 Close;
end;

procedure TForm23.btn_saveClick(Sender: TObject);
begin
 if (edt_Pren.Text = '') or (edt_Nom.Text = '') or(edt_Nom_Certifi.Text = '') then
   begin
     MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
     Exit;
   end
    else
     begin
      if DB.Query_Uneleve.Locate('Nom_ele;Pren_ele', VarArrayOf ([Trim(edt_Nom.Text),Trim(edt_Pren.Text)]),[]) then
       begin
         iNom := DB.Query_Uneleve['Num_ele']  ;
       //====
         if (Trim(edt_Pren.Text) <> myPren_ele) and (Trim(edt_Nom.Text) <> myNom_ele )then
          begin
            if DB.Query_Certif.Locate('Num_ele',iNom,[]) then  iNom := 0 ;
          end;
       //===
       end else  iNom := 0 ;
     //====

      if iNom = 0 then
       begin
        MessageDlg('Ì—ÃÏ  €Ì— «·«”„ «Ê «··ﬁ»', mtWarning,[mbYes], 0);
        edt_Nom.SetFocus;
        Exit ;
       end
        else
         begin
          if DB.Query_Certif.Locate('Num_certifi',iNUM,[]) then
           begin

            with DB do
             begin
              Query_Certif.Edit;

              Query_Certif['Nom_certifi']                           := Trim(edt_Nom_Certifi.Text) ;
              Query_Certif['Num_edit']                              := DBLookCombo_Editeur.KeyValue ;
              Query_Certif['Date_edit_certifi']                     := DateTimePicker1.Date ;
              Query_Certif['Num_ele']                               := iNom ;
             end;
           //====
            DB.Query_Certif.Post;
            MessageDlg(' „  ⁄œÌ· «·„ﬁ—— ·· ·„Ì– »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
            close;
            end;
         end;
     end;
end;

procedure TForm23.edt_NomKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
    btn_save.SetFocus;
    btn_save.Click ;
   end;
end;

procedure TForm23.FormShow(Sender: TObject);
begin
 if DB.Query_Certif.Locate('Num_certifi',Form21.DBGrid1.Fields[0].AsInteger,[]) then
  begin
   iNUM := DB.Query_Certif['Num_certifi'] ;
   inom := DB.Query_Certif['Num_ele'] ;
    with DB do
       begin
         edt_Nom_Certifi.Text                            := Query_Certif['Nom_certifi'];
         DBLookCombo_Editeur.KeyValue                    := Query_Certif['Num_edit'];
         DateTimePicker1.Date                            := Query_Certif['Date_edit_certifi'];
       end;
  end;

//====
 if DB.Query_Uneleve.Locate('Num_ele',inom,[]) then
  begin
   edt_Pren.Text                               := DB.Query_Uneleve['Pren_ele'];
   edt_Nom.Text                                := DB.Query_Uneleve['Nom_ele'];
  //====
   myPren_ele                                  := DB.Query_Uneleve['Pren_ele'] ;
   myNom_ele                                   := DB.Query_Uneleve['Nom_ele'];
  end;
end;

end.
