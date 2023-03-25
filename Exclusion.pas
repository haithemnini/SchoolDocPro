unit Exclusion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,System.UITypes,
  System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm18 = class(TForm)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btn_Edit: TBitBtn;
    BitBtn2: TBitBtn;
    btn_supp: TBitBtn;
    btn_cancel: TBitBtn;
    Panel3: TPanel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    R_nomexi: TRadioButton;
    R_Nom: TRadioButton;
    R_Pren: TRadioButton;
    R_dataexi: TRadioButton;
    R_rexit: TRadioButton;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    btn_add: TBitBtn;
    SearchBox1: TEdit;
    procedure btn_addClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_EditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure R_rexitClick(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
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
  Form18: TForm18;
  SUP_B , SUP_B_show: Integer;

implementation

{$R *.dfm}

uses DM_G, Add_Exclusion, edit_Exclusion, show_Pass_Admin, Certificat;

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



procedure TForm18.BitBtn2Click(Sender: TObject);
begin
  DB.Query_Exclusion.Refresh ;
  SearchBox1.Clear;
  SearchBox1.SetFocus ;
end;

procedure TForm18.btn_addClick(Sender: TObject);
begin
  Form19.ShowModal ;
end;


procedure TForm18.btn_cancelClick(Sender: TObject);
begin
 SUP_B := 1 ;
 if (DB.Query_Exclusion.RecordCount > 0) then
  begin
   Form40.ShowModal;
  end else MessageDlg('ﬁ«∆„… ›«—€… ',mtInformation,[mbOK], 0) ;
end;

procedure TForm18.btn_EditClick(Sender: TObject);
begin
if DB.Query_Exclusion.RecordCount = 0 then
  begin
   MessageDlg('«·ﬁ«∆„… ›«—€…', mtWarning,[mbYes], 0);
  end else  Form20.ShowModal;
end;

procedure TForm18.btn_suppClick(Sender: TObject);
begin
 SUP_B := 0 ;
 if (DB.Query_Exclusion.RecordCount > 0) then
  begin
   Form40.ShowModal;
  end else MessageDlg('ﬁ«∆„… ›«—€… ',mtInformation,[mbOK], 0) ;
end;

procedure TForm18.EscExecute(Sender: TObject);
begin
 Close;
end;

procedure TForm18.FormShow(Sender: TObject);
begin
   SUP_D_show := 1 ;
   SearchBox1.Clear;
   SearchBox1.SetFocus ;
   R_Nom.SetFocus;
   DB.Query_Exclusion.Refresh;
end;

procedure TForm18.R_rexitClick(Sender: TObject);
begin
  SearchBox1.Clear;
  SearchBox1.SetFocus;
  DBGrid1.DataSource.DataSet.Filtered := False;
end;

procedure TForm18.SearchBox1Change(Sender: TObject);
begin
   if (SearchBox1.Text = '' )then
  begin
   DBGrid1.DataSource.DataSet.Filtered := False;
   SearchBox1.Color := $FFFFFF ;
  end
   else
    begin
      if R_rexit.Checked = True then
         filterr(DB.Query_Exclusion,'Raison', SearchBox1.Text) else

      if R_dataexi.Checked = True then
         filterr(DB.Query_Exclusion,'Date_exclu_sorti', SearchBox1.Text) else

      if R_nomexi.Checked = True then
         filterr(DB.Query_Exclusion,'Nom_Rapp_exclu', SearchBox1.Text) else


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

     if DB.Query_Exclusion.RecordCount > 0  then
        SearchBox1.Color := $BFFFBF  else SearchBox1.Color := $D7D7FF ;
    end;
end;

procedure TForm18.SUP;
begin
 if MessageDlg('Â· √‰  „ √ﬂœ „‰ «·Õ–› ø',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   DB.Query_Exclusion.Delete;
   end;
SearchBox1.Clear;
SearchBox1.SetFocus ;
end;

procedure TForm18.SUP_All;
begin
 if (DB.Query_Exclusion.RecordCount > 0) then
   begin
    if MessageDlg('Â·   ƒﬂœ ⁄·Ï ⁄„·Ì… «·Õœ› «·ﬂ·',  mtWarning, [mbYesToAll, mbNo], 0) = mrYesToAll then
      begin
        DB.Query_Exclusion.First;
        while not(DB.Query_Exclusion.Eof) do
        begin
           DB.Query_Exclusion.Next ;
           DB.Query_Exclusion.Delete ;
        end;

       MessageDlg(' „ Õ–› »‰Ã«Õ',  mtConfirmation, [mbOK], 0) ;
       DB.Query_Exclusion.Refresh ;
      end else Exit;
   end else MessageDlg('ﬁ«∆„… ›«—€… ',mtInformation,[mbOK], 0) ;

  SearchBox1.Clear;
  SearchBox1.SetFocus ;
end;

end.
