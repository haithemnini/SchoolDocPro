unit add_doum_certifi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,System.UITypes,
  Vcl.ExtCtrls;

type
  TForm27 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edt_Num: TEdit;
    edt_Nom_cer: TEdit;
    edt_Num_doum: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label6: TLabel;
    edt_Num_cefi: TEdit;
    procedure btn_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form27: TForm27;

implementation

{$R *.dfm}

uses DM_G, Doum_certifi;

procedure TForm27.btn_cancelClick(Sender: TObject);
begin
 Close;
end;

procedure TForm27.btn_saveClick(Sender: TObject);
var iclass : Integer ;
begin
 if (edt_Num.Text <> '') or (edt_Nom_cer.Text <> '')  or (edt_Num_cefi.Text <> '') then
  begin
   if DB.Query_Certif.Locate('Num_certifi',StrToInt(trim(edt_Num_cefi.Text)),[]) then
    begin

     if DB.Query_Certif_Docum.Locate('Num_certifi;Nom_cer_instit_envo',VarArrayOf([(StrToInt(trim(edt_Num_cefi.Text))),trim(edt_Nom_cer.Text)]),[]) then
      begin
       MessageDlg('·ﬁœ  „  ÊÀÌﬁ „‰ ﬁ»· Â–Â «·‘Â«œ…', mtInformation,[mbYes], 0);
      end
       else
        begin
         if DB.Query_Certif_Docum.RecordCount > 0 then
          begin
           DB.Query_Certif_Docum.Last;
           iclass := Form26.DBGrid1.Fields[0].AsInteger + 1 ;
          end else iclass := 1 ;

         with DB do
          begin
            Query_Certif_Docum.Append;
            Query_Certif_Docum['Num_cer_docu']                     := iclass  ;
            Query_Certif_Docum['Num_cer_conta']                    := Trim(edt_Num.Text)  ;
            Query_Certif_Docum['Nom_cer_instit_envo']              := Trim(edt_Nom_cer.Text)  ;
            Query_Certif_Docum['Date_cer_conta']                   := DateTimePicker1.Date  ;
            Query_Certif_Docum['Num_certifi']                      := StrToInt(Trim(edt_Num_cefi.Text)) ;

           if edt_Num_doum.Text = '' then
             edt_Num_doum.Text := '«À»«  ’Õ… ‘Â«œ… „œ—”Ì…'
             else Query_Certif_Docum['Nom_cer_docu']                     := Trim(edt_Num_doum.Text) ;

          end;
           //====
          DB.Query_Certif_Docum.Post;
          MessageDlg(' „ «÷«›…  ÊÀÌﬁ ‘Â«œ… ·· ·„Ì– ', mtConfirmation,[mbYes], 0);
          close;
        end;
    end else  MessageDlg('⁄›Ê« ... —ﬁ„ ‘Â«œ… „œ—”Ì… €Ì— „ÊÃÊœ ›Ì ”Ã·«  «·‘Â«œ«  «·„œ—”Ì… ', mtConfirmation,[mbYes], 0); edt_Num.SetFocus ; Exit;
  end else  MessageDlg('Ì—ÃÌ „·«¡«·»Ì«‰«  «··«“„… ', mtConfirmation,[mbYes], 0);  exit;
end;

procedure TForm27.FormShow(Sender: TObject);
begin
 edt_Num.Clear ;
 edt_Num_cefi.Clear ;
 edt_Num_doum.Clear ;
 edt_Nom_cer.Clear ;
 edt_Num_doum.Text := '«À»«  ’Õ… ‘Â«œ… „œ—”Ì…';
 DateTimePicker1.Date := Date ;
 edt_Num_cefi.SetFocus ;
end;

end.
