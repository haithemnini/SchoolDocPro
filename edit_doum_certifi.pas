unit edit_doum_certifi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,System.UITypes,
  Vcl.ExtCtrls;

type
  TForm28 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_Num: TEdit;
    edt_Nom_cer: TEdit;
    edt_Num_doum: TEdit;
    DateTimePicker1: TDateTimePicker;
    edt_Num_cefi: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
  private
      iNUM  :Integer ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form28: TForm28;

implementation

{$R *.dfm}

uses DM_G, Doum_certifi;

procedure TForm28.btn_cancelClick(Sender: TObject);
begin
  DB.Query_Certif_Docum.Cancel ;
  Close;
end;

procedure TForm28.btn_saveClick(Sender: TObject);
begin
if (edt_Num.Text <> '') or (edt_Nom_cer.Text <> '')  or (edt_Num_cefi.Text <> '') then
  begin
   if DB.Query_Certif.Locate('Num_certifi',StrToInt(trim(edt_Num_cefi.Text)),[]) then
    begin

     if DB.Query_Certif_Docum.Locate('Num_certifi;Nom_cer_instit_envo',VarArrayOf([(StrToInt(trim(edt_Num_cefi.Text))),trim(edt_Nom_cer.Text)]),[]) then
      begin
       MessageDlg('·ﬁœ  „  ÊÀÌﬁ „‰ ﬁ»· Â–Â «·‘Â«œ…', mtError,[mbYes], 0);
      end
       else
        begin
        if DB.Query_Certif_Docum.Locate('Num_cer_docu',iNUM,[]) then
         begin
           with DB do
            begin
              Query_Certif_Docum.Edit;
              Query_Certif_Docum['Num_cer_conta']                    := Trim(edt_Num.Text)  ;
              Query_Certif_Docum['Nom_cer_instit_envo']              := Trim(edt_Nom_cer.Text)  ;
              Query_Certif_Docum['Date_cer_conta']                   := DateTimePicker1.Date  ;
              Query_Certif_Docum['Num_certifi']                      := StrToInt(Trim(edt_Num_cefi.Text)) ;

             if edt_Num_doum.Text = '' then
               edt_Num_doum.Text := '«À»«  ’Õ… ‘Â«œ… „œ—”Ì…'
                else Query_Certif_Docum['Nom_cer_docu']                     := Trim(edt_Num_doum.Text) ;

            end;
         end;
           //====
          DB.Query_Certif_Docum.Post;
          MessageDlg(' „  ⁄œÌ· ⁄·Ï  ÊÀÌﬁ ‘Â«œ… „œ—”Ì… ·· ·„Ì– ', mtConfirmation,[mbYes], 0);
          close;

        end ;
    end else  MessageDlg('⁄›Ê« ... —ﬁ„ ‘Â«œ… „œ—”Ì… €Ì— „ÊÃÊœ ›Ì ”Ã·«  «·‘Â«œ«  «·„œ—”Ì… ', mtError,[mbYes], 0); edt_Num.SetFocus ; Exit;
  end else  MessageDlg('Ì—ÃÌ „·«¡«·»Ì«‰«  «··«“„… ', mtWarning,[mbYes], 0);  exit;
end;




procedure TForm28.FormShow(Sender: TObject);
begin
 if DB.Query_Certif_Docum.Locate('Num_cer_docu',Form26.DBGrid1.Fields[0].AsInteger,[]) then
  begin
   with DB do
    begin
     iNUM := DB.Query_Certif_Docum['Num_cer_docu'] ;
    //===
     edt_Num_cefi.Text                                    :=  Query_Certif_Docum['Num_certifi']  ;
     edt_Num.Text                                         :=  Query_Certif_Docum['Num_cer_conta'] ;
     edt_Nom_cer.Text                                     :=  Query_Certif_Docum['Nom_cer_instit_envo'] ;
     edt_Num_doum.Text                                    :=  Query_Certif_Docum['Nom_cer_docu'] ;
     DateTimePicker1.Date                                 :=  Query_Certif_Docum['Date_cer_conta'] ;
    end;
  end;


end;

end.
