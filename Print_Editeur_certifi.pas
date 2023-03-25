unit Print_Editeur_certifi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, frxClass,DateUtils,
  Vcl.DBCtrls, Vcl.ComCtrls, System.Actions, Vcl.ActnList, ResizeKit,System.UITypes;

type
  TForm24 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBLookCombo_Editeur: TDBLookupComboBox;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    pnl3: TPanel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    pnl1: TPanel;
    pnl33: TPanel;
    procedure FormShow(Sender: TObject);
    procedure DBLookCombo_EditeurKeyPress(Sender: TObject; var Key: Char);
    procedure btn_saveClick(Sender: TObject);
    procedure Print ;
    procedure EscExecute(Sender: TObject);
    procedure chr_Live;
    procedure Certificat_show;
    procedure btn1Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form24: TForm24;
  myclas, myclas_certif  , ishow :Integer ;
  icerfi : Boolean = False;
  date_exit , myanne , myanne_exit : TDate ;
implementation

{$R *.dfm}

uses DM_G, Liste_etud_Arch, Certificat, Exclusion, Print_Editeur_certifi_02;

procedure TForm24.btn1Click(Sender: TObject);
begin
 if pnl1.Visible = True then  pnl1.Visible := False else  pnl1.Visible := True ;
end;

procedure TForm24.btn_saveClick(Sender: TObject);
begin
    if (rb1.Checked = true) or (rb2.Checked = true)  then
     begin
         Certificat_show;
         Close;
     end
     else if (icerfi = True) then Certificat_show;
end;

procedure TForm24.Certificat_show;
begin
  myclas := Form3.DBGrid1.Fields[0].AsInteger ;
////==== €Ì— „ÊÃÊœ

    if DB.Query_Certif.RecordCount > 0 then
     begin
      DB.Query_Certif.Last;
      myclas_certif := Form21.DBGrid1.Fields[0].AsInteger + 1 ;
     end else myclas_certif := 1 ;

    with DB do
    begin
     Query_Certif.Append;
     Query_Certif['Num_certifi']                           := myclas_certif             ;
     Query_Certif['nom']                                   := Form3.DBGrid1.Fields[1].AsString ;
     Query_Certif['Pren']                                  := Form3.DBGrid1.Fields[2].AsString ;
     Query_Certif['Nom_certifi']                           := '‘Â«œ… „œ—”Ì…' ;

      if icerfi = True then
       DB.Query_Certif['Num_edit']                          :=  Form39.dblkcbbDBLookCombo_Editeur.KeyValue
      else Query_Certif['Num_edit']                         :=  DBLookCombo_Editeur.KeyValue ;

     Query_Certif['Date_edit_certifi']                       := Date  ;
     Query_Certif['Num_ele']                                 := myclas ;
     Query_Certif.Post;
    end;


 if rb2.Checked = true then
  begin
   if DB.Query_Exclusion.Locate('Num_ele',myclas,[]) then
    begin
     date_exit               := DB.Query_Exclusion['Date_exclu_sorti'];
     ishow := 1;
    end else ishow := 0;
  end;

 if DB.Query_Uneleve.RecordCount > 0 then
  begin
   Print ;
   DB.Rep_Certif.ShowReport();
  end
 else MessageDlg('ﬁ«∆„…  ·«„Ì– ›«—€…' ,mtWarning,[mbok],0 ) ; exit;
end;

procedure TForm24.chr_Live;
begin
  if DB.Query_Exclusion.Locate('Num_ele',Form3.DBGrid1.Fields[11].AsInteger,[]) then
   begin

     rb1.Visible := False;
     rb2.Visible := False;
     //rb1.Checked := True;
   end
  else
   begin
     //pnl1.Visible:= True;
     //pnl1.Enabled := False;
     //rb1.Checked := False;
     //rb2.Checked := False;
     icerfi := True;
   end
end;

procedure TForm24.DBLookCombo_EditeurKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then btn_save.Click ;
end;

procedure TForm24.EscExecute(Sender: TObject);
begin
Close;
end;


procedure TForm24.FormShow(Sender: TObject);
begin
   rb1.Checked := True ;
   icerfi := false ;
   ishow := 0;
   DBLookCombo_Editeur.KeyValue := DBLookCombo_Editeur.ListSource.DataSet.FieldByName(DBLookCombo_Editeur.KeyField).Value;
   DBLookCombo_Editeur.SetFocus ;
   btn_save.SetFocus;
end;

procedure TForm24.Print;
var   date_exi , myclas_certi,Num_edi ,myannee , myyear, _class , date_dep: TfrxMemoView;

begin
    date_exi       := TfrxMemoView(DB.Rep_Certif.FindObject('MemoD'));
    myclas_certi   := TfrxMemoView(DB.Rep_Certif.FindObject('MemoC'));
    Num_edi        := TfrxMemoView(DB.Rep_Certif.FindObject('MemoE'));
    myannee        := TfrxMemoView(DB.Rep_Certif.FindObject('MemoDD'));
    myyear         := TfrxMemoView(DB.Rep_Certif.FindObject('Memoyy'));
    _class         := TfrxMemoView(DB.Rep_Certif.FindObject('memo_class'));
    date_dep       := TfrxMemoView(DB.Rep_Certif.FindObject('memo42'));
   //====
  if (date_exi <> nil) and (Num_edi <> nil)then
     begin
      if ishow = 1 then
       begin
         myyear.Text:= '';
         _class.Text:= '';
         _class.Text := Form18.DBGrid1.Fields[3].AsString;
         date_exi.Memo.text := DateToStr(date_exit) ;
         date_exi.Text := FormatDateTime ('yyyy/mm/dd', date_exit);
         date_dep.Text := FormatDateTime ('yyyy', date_exit);
         myanne := Form18.DBGrid1.Fields[4].AsDateTime ;
       //====
       end
        else
         begin
           _class.Text:= '';
           date_exi.Clear;
           myyear.Text:= '';
           if icerfi = True then
           _class.Text := Form39.dblkcbbDBLookCombo_class.Text
           else _class.Text := Form3.DBGrid1.Fields[10].AsString;
           myyear.Memo.text := DateToStr(myanne) ;
           if icerfi = True then  myanne := StrToDate(Form39.dblkcbbDBLookCombo_annee.Text)  else   myanne := Form3.DBGrid1.Fields[9].AsDateTime ;
           myyear.Text := FormatDateTime ('yyyy', myanne);
           date_dep.Text := FormatDateTime ('yyyy', myanne);
           date_exi.Text := '/06/30';
         end;
      myanne_exit := Incday(myanne,-365);
      myannee.Memo.text := DateToStr(myanne_exit) ;
      myannee.Text := FormatDateTime ('yyyy', myanne_exit);
      myclas_certi.Memo.Text :=   FormatFloat('000',myclas_certif) ;
      if icerfi = True then  Num_edi.Memo.Text  := Form39.dblkcbbDBLookCombo_Editeur.Text  else Num_edi.Memo.Text  := DBLookCombo_Editeur.Text
     //====
     end;

end;

procedure TForm24.rb1Click(Sender: TObject);
begin
   rb1.Checked := True;
end;

procedure TForm24.rb2Click(Sender: TObject);
begin
  rb2.Checked := True;
end;

end.

