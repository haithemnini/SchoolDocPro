unit Print_doum_certifi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.StdCtrls,System.UITypes, frxClass,DateUtils,
  Vcl.Buttons, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm25 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edt_Num: TEdit;
    edt_Nom: TEdit;
    edt_Num_doum: TEdit;
    DateTimePicker1: TDateTimePicker;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure Printdoum;
    procedure btn_cancelClick(Sender: TObject);
    procedure edt_NumKeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }
   var
   myclas , myCertif_Docum , myclas_docu  : Integer ;
    ishow :Integer ;
   date_exit , myanne , myanne_exit  , Date_cer_conta , Memoday: TDate ;
    Nom_cer_conta ,Num_cer_conta : string ;
  public
    { Public declarations }
  end;

var
  Form25: TForm25;

implementation

{$R *.dfm}

uses DM_G, Liste_etud_Arch, Doum_certifi;

procedure TForm25.btn_cancelClick(Sender: TObject);
begin
 Close ;
end;

procedure TForm25.btn_saveClick(Sender: TObject);
begin
  myclas := Form3.DBGrid1.Fields[0].AsInteger ;
  myanne := Form3.DBGrid1.Fields[9].AsDateTime ;
  myanne_exit := Incday(myanne,-365);
  Memoday := Incday(Now,+365);

 if (edt_Num.Text = '') or (edt_Nom.Text = '') or (edt_Num_doum.Text = '')then
  begin
    MessageDlg('Ì—ÃÌ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;   exit;
  end
   else
    begin
     if DB.Query_Certif.Locate('Num_ele',myclas,[]) then
      begin
       with DB do
        begin
          myCertif_Docum   :=   Query_Certif['Num_certifi'];
          //ShowMessage(myCertif_Docum.ToString);

         if DB.Query_Certif_Docum.Locate('Num_certifi;Nom_cer_instit_envo',VarArrayOf([(myCertif_Docum) ,Trim(edt_Nom.Text)]),[]) then
           begin
             MessageDlg('·ﬁœ  „  ÊÀÌﬁ ‘Â«œ… „œ—”Ì… „‰ ﬁ»·' ,mtInformation,[mbok],0 ) ;   exit;
           end
            else
              begin
               if DB.Query_Certif_Docum.RecordCount > 0 then
                 begin
                  DB.Query_Certif_Docum.Last;
                  myclas_docu := Form26.DBGrid1.Fields[0].AsInteger + 1;
                 end else myclas_docu := 1 ;

                 Query_Certif_Docum.Append;
                 Query_Certif_Docum['Num_cer_docu']                                           := myclas_docu  ;
                 Query_Certif_Docum['Num_cer_conta']                                          := Trim(edt_Num.Text)  ;
                 Query_Certif_Docum['Nom_cer_instit_envo']                                    := Trim(edt_Nom.Text)  ;

                 Nom_cer_conta  := Trim(edt_Nom.Text) ;
                 Num_cer_conta  := Trim(edt_Num.Text)  ;

                 Query_Certif_Docum['Nom_cer_docu']                                           := Trim(edt_Num_doum.Text);
                 Query_Certif_Docum['Date_cer_conta']                                         := DateTimePicker1.DateTime ;

                 Date_cer_conta  := DateTimePicker1.DateTime ;

                 Query_Certif_Docum['Num_certifi']                                            := myCertif_Docum ;
                 Query_Certif_Docum.Post;
                 //ShowMessage(' „ «·Õ›Ÿ');

               if DB.Query_Exclusion.Locate('Num_ele',myclas,[]) then
                 begin
                  date_exit               := DB.Query_Exclusion['Date_exclu_sorti'];
                  ishow := 1;
                 end else ishow := 0;

               if DB.Query_Uneleve.RecordCount > 0 then
                 begin
                    Printdoum ;
                    DB.Re_Certif_docu.ShowReport();
                    Form25.Close ;
                 end
                  else  MessageDlg('«·ﬁ«∆„… ›«—€…' ,mtWarning,[mbok],0 ) ;   exit;
              end;
        end;
      end
       else
         MessageDlg('«· ·„Ì– €Ì— „ÊÃÊœ ›Ì ÃœÊ· «·‘Â«œ«  «·„œ—”Ì…' ,mtWarning,[mbok],0 ) ;   exit;
    end;
end;

procedure TForm25.edt_NumKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then btn_save.Click ;
end;

Procedure TForm25.FormShow(Sender: TObject);
begin
 edt_Num.Clear ;
 edt_Nom.Clear ;
 edt_Num_doum.Clear ;
 edt_Num_doum.Text := '«À»«  ’Õ… ‘Â«œ… „œ—”Ì…';
 DateTimePicker1.Date := Date ;
 edt_Num.SetFocus ;
end;

procedure TForm25.Printdoum;
var
date_exi , myyear ,myannee , myclas_certi , Date_cer_conta_ , Nom_cer_conta_,Num_cer_conta_ , Memoday_: TfrxMemoView;
begin
    myclas_certi    := TfrxMemoView(DB.Re_Certif_docu.FindObject('Memomyclas_certi'));
    date_exi        := TfrxMemoView(DB.Re_Certif_docu.FindObject('Memodate_exit'));
    myyear          := TfrxMemoView(DB.Re_Certif_docu.FindObject('Memomyyear'));
    myannee         := TfrxMemoView(DB.Re_Certif_docu.FindObject('Memomyannee'));
    Memoday_        := TfrxMemoView(DB.Re_Certif_docu.FindObject('Memoday'));

    Num_cer_conta_         := TfrxMemoView(DB.Re_Certif_docu.FindObject('MemoNum_cer_conta_'));
    Date_cer_conta_        := TfrxMemoView(DB.Re_Certif_docu.FindObject('MemomDate_cer_conta_'));
    Nom_cer_conta_         := TfrxMemoView(DB.Re_Certif_docu.FindObject('Memonom'));
   //====
if (date_exi <> nil) then
     begin
      if ishow = 1 then
       begin
        myyear.Text := '';
        date_exi.Memo.text := DateToStr(date_exit) ;
        date_exi.Text := FormatDateTime ('yyyy/mm/dd', date_exit);
       end
        else
         begin
          date_exi.Text := '';
          date_exi.Text := '/06/30';
          myyear.Memo.text := DateToStr(myanne) ;
          myyear.Text := FormatDateTime ('yyyy', myanne);
         end;



      Date_cer_conta_.Memo.text := DateToStr(Date_cer_conta) ;
      Date_cer_conta_.Text := FormatDateTime ('yyyy/mm/dd', Date_cer_conta);

      myannee.Memo.text := DateToStr(myanne_exit) ;
      myannee.Text := FormatDateTime ('yyyy', myanne_exit);

      Nom_cer_conta_.Text :=  Nom_cer_conta ;

      Num_cer_conta_.Text := Num_cer_conta;

      myclas_certi.Memo.Text :=   FormatFloat('000',myCertif_Docum) ;

      Memoday_.Memo.text := DateToStr(Memoday) ;
      Memoday_.Text := FormatDateTime ('yyyy', Memoday);

     end;
end;

end.
