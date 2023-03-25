unit Certificat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,System.UITypes,
  System.Actions, Vcl.ActnList, ResizeKit, Vcl.Menus;

type
  TForm21 = class(TForm)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btn_add: TBitBtn;
    btn_Edit: TBitBtn;
    BitBtn2: TBitBtn;
    btn_supp: TBitBtn;
    btn_cancel: TBitBtn;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    R_cafi: TRadioButton;
    R_Nom: TRadioButton;
    R_Pren: TRadioButton;
    R_dateedit: TRadioButton;
    R_namedit: TRadioButton;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    act1: TAction;
    AltS: TAction;
    S: TAction;
    SearchBox1: TEdit;
    procedure btn_addClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_EditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure R_NomClick(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SUP ;
    procedure SUP_All;
    procedure btn_suppClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;
  SUP_D , SUP_D_show: Integer;

implementation

{$R *.dfm}

uses DM_G, add_Certificat, edit_Certificat, show_Pass_Admin;

Procedure filterr(Dataset: TDataSet; const FieldName,
  SearchTerm: string);
 begin
  Assert(Assigned(DataSet), 'No dataset is assigned');

  if SearchTerm = '' then
    DataSet.Filtered := False
  else
  begin
    DataSet.Filter := FieldName + ' LIKE ' + QuotedStr('%' + SearchTerm + '%');
    DataSet.Filtered := True;
  end;

end;
procedure TForm21.BitBtn2Click(Sender: TObject);
begin
  DB.Query_Certif.Refresh;
  SearchBox1.Clear;
  SearchBox1.SetFocus ;
end;

procedure TForm21.btn_addClick(Sender: TObject);
begin
   Form22.ShowModal ;
end;

procedure TForm21.btn_cancelClick(Sender: TObject);
begin
SUP_D := 0;
 if (DB.Query_Certif.RecordCount > 0) then
  begin
   Form40.ShowModal;
  end else MessageDlg('ﬁ«∆„… ›«—€… ',mtInformation,[mbOK], 0) ;
end;

procedure TForm21.btn_EditClick(Sender: TObject);
begin
if DB.Query_Certif.RecordCount = 0 then
  begin
   MessageDlg('«·ﬁ«∆„… ›«—€…', mtWarning,[mbYes], 0);
  end else  Form23.ShowModal;
end;

procedure TForm21.btn_suppClick(Sender: TObject);
begin
SUP_D := 1;
 if (DB.Query_Certif.RecordCount > 0) then
  begin
   Form40.ShowModal;
  end else MessageDlg('ﬁ«∆„… ›«—€… ',mtInformation,[mbOK], 0) ;
end;

procedure tForm21.EscExecute(Sender: TObject);
begin
  close;
end;

procedure TForm21.FormShow(Sender: TObject);
begin
   SUP_D_show := 0 ;
   SearchBox1.Clear;
   SearchBox1.SetFocus ;
   R_Nom.Checked := True;
   DB.Query_Certif.Refresh;
end;

procedure TForm21.N1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(DBGrid1.Fields[0].AsInteger));
end;

procedure TForm21.R_NomClick(Sender: TObject);
begin
  SearchBox1.Clear;
  SearchBox1.SetFocus;
  DBGrid1.DataSource.DataSet.Filtered := False;
end;

procedure TForm21.SearchBox1Change(Sender: TObject);
begin
   if (SearchBox1.Text = '' )then
  begin
   DBGrid1.DataSource.DataSet.Filtered := False;
   SearchBox1.Color := $FFFFFF ;
  end
   else
    begin
      if R_cafi.Checked = True then
         filterr(DB.Query_Certif,'Nom_certifi', SearchBox1.Text) else

      if R_dateedit.Checked = True then
         filterr(DB.Query_Certif,'Date_edit_certifi', SearchBox1.Text) else

     if R_namedit.Checked = True then
        begin
         DBGrid1.DataSource.DataSet.Filtered := False;
         DBGrid1.DataSource.DataSet.Filtered := True;
        end else

     if R_Pren.Checked = True  then
        begin
         DBGrid1.DataSource.DataSet.Filtered := False;
         DBGrid1.DataSource.DataSet.Filtered := True;
        end else

      if R_Nom.Checked = True  then
        begin
         DBGrid1.DataSource.DataSet.Filtered := False;
         DBGrid1.DataSource.DataSet.Filtered := True;
        end;

     if DB.Query_Certif.RecordCount > 0  then
        SearchBox1.Color := $BFFFBF  else SearchBox1.Color := $D7D7FF ;
    end;
end;

procedure TForm21.SUP;
begin
if MessageDlg('Â· √‰  „ √ﬂœ „‰ «·Õ–› ø',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DB.Query_Certif.Delete;
    end;

 SearchBox1.Clear;
 SearchBox1.SetFocus ;
end;

procedure TForm21.SUP_All;
begin
 if (DB.Query_Certif.RecordCount > 0) then
   begin
    if MessageDlg('Â·   ƒﬂœ ⁄·Ï ⁄„·Ì… «·Õœ› «·ﬂ·',  mtWarning, [mbYesToAll, mbNo], 0) = mrYesToAll then
      begin
        DB.Query_Certif.First;
        while not(DB.Query_Certif.Eof) do
        begin
           DB.Query_Certif.Next ;
           DB.Query_Certif.Delete ;
        end;

       MessageDlg(' „ Õ–› »‰Ã«Õ',  mtConfirmation, [mbOK], 0) ;
       DB.Query_Certif.Refresh ;
      end else Exit;
   end else MessageDlg('ﬁ«∆„… ›«—€… ',mtInformation,[mbOK], 0) ;

 SearchBox1.Clear;
 SearchBox1.SetFocus ;

end;

end.
