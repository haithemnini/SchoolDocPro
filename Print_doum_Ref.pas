unit Print_doum_Ref;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,System.UITypes, frxClass,DateUtils,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm31 = class(TForm)
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
    procedure btn_saveClick(Sender: TObject);
     procedure print_rel_docum;
    procedure FormShow(Sender: TObject);
    procedure edt_NumKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cancelClick(Sender: TObject);
  private
    { Private declarations }

    myclas , myCertif_Docum , myclas_docu  : Integer ;
    ishow :Integer ;
    date_exit , myanne , myanne_exit  , Date_cer_conta , Memoday: TDate ;
    Nom_cer_conta ,Num_cer_conta : string ;

  public
    { Public declarations }
  end;

var
  Form31: TForm31;

implementation

{$R *.dfm}

uses DM_G, Liste_etud_Arch, Rel_note_Docum;

procedure TForm31.btn_cancelClick(Sender: TObject);
begin
 Close ;
end;

procedure TForm31.btn_saveClick(Sender: TObject);
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
     if DB.Query_Releve_notes.Locate('Num_ele',myclas,[]) then
      begin
       with DB do
        begin
          myCertif_Docum   :=   Query_Releve_notes['Num_Rel_not'];
          //ShowMessage(myCertif_Docum.ToString);

         if DB.Query_Rel_note_Docu.Locate('Num_Rel_not;Nom_rel_instit_envo',VarArrayOf([myCertif_Docum ,edt_Nom.Text]),[]) then
           begin
             MessageDlg('·ﬁœ  „  ÊÀÌﬁ «·ﬂ‘› „‰ ﬁ»·' ,mtInformation,[mbok],0 ) ;   exit;
           end
            else
              begin
               if DB.Query_Rel_note_Docu.RecordCount > 0 then
                 begin
                  DB.Query_Rel_note_Docu.Last;
                  myclas_docu := Form32.DBGrid1.Fields[0].AsInteger+ 1;
                 // ShowMessage(myclas_docu.ToString);
                 end else myclas_docu := 1 ;


                 Query_Rel_note_Docu.Append;
                 Query_Rel_note_Docu['Num_rel_docu']                                           := myclas_docu  ;

                 Query_Rel_note_Docu['Num_rel_conta']                                          := Trim(edt_Num.Text)  ;
                 Query_Rel_note_Docu['Nom_rel_instit_envo']                                    := Trim(edt_Nom.Text)  ;

                 Nom_cer_conta  :=(Trim(edt_Nom.Text))  ;
                 Num_cer_conta  := Trim(edt_Num.Text)  ;

                 Query_Rel_note_Docu['Nom_rel_docu']                                           := Trim(edt_Num_doum.Text);
                 Query_Rel_note_Docu['Date_rel_conta']                                         := DateTimePicker1.DateTime ;

                 Date_cer_conta  := DateTimePicker1.DateTime ;

                 Query_Rel_note_Docu['Num_Rel_not']                                            := myCertif_Docum ;

                 Query_Rel_note_Docu.Post;
                 //ShowMessage(' „ «·Õ›Ÿ');

               if DB.Query_Exclusion.Locate('Num_ele',myclas,[]) then
                 begin
                  date_exit               := DB.Query_Exclusion['Date_exclu_sorti'];
                  ishow := 1;
                 end else ishow := 0;

               if DB.Query_Uneleve.RecordCount > 0 then
                 begin
                    print_rel_docum ;
                    DB.Rel_docu.ShowReport();
                    Form31.Close ;

                 end
                  else  MessageDlg('«·ﬁ«∆„… ›«—€…' ,mtWarning,[mbok],0 ) ;   exit;
              end;
        end;
      end
       else
         MessageDlg('«· ·„Ì– €Ì— „ÊÃÊœ ›Ì ÃœÊ· ﬂ‘› ' ,mtWarning,[mbok],0 ) ;   exit;
    end;










end;

procedure TForm31.edt_NumKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then btn_save.Click ;
end;

procedure TForm31.FormShow(Sender: TObject);
begin
   edt_Num.Clear ;
 edt_Nom.Clear ;
 edt_Num_doum.Clear ;
 edt_Num_doum.Text := '«À»«À ’Õ… ﬂ‘› ‰ﬁ«ÿ';
 DateTimePicker1.Date := Date ;
 edt_Num.SetFocus ;
end;

procedure TForm31.print_rel_docum;
var
date_exi , myyear ,myannee , myclas_certi , Date_cer_conta_ , Nom_cer_conta_,Num_cer_conta_ , Memoday_: TfrxMemoView;
begin
    myclas_certi    := TfrxMemoView(DB.Rel_docu.FindObject('Memomyclas_certi'));
    date_exi        := TfrxMemoView(DB.Rel_docu.FindObject('Memodate_exit'));
    myyear          := TfrxMemoView(DB.Rel_docu.FindObject('Memomyyear'));
    myannee         := TfrxMemoView(DB.Rel_docu.FindObject('Memomyannee'));
    Memoday_        := TfrxMemoView(DB.Rel_docu.FindObject('Memoday'));

    Num_cer_conta_         := TfrxMemoView(DB.Rel_docu.FindObject('MemoNum_cer_conta_'));
    Date_cer_conta_        := TfrxMemoView(DB.Rel_docu.FindObject('MemomDate_cer_conta_'));
    Nom_cer_conta_         := TfrxMemoView(DB.Rel_docu.FindObject('Memonom'));
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
