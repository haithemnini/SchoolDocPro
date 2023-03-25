unit Rel_note_Docum;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes,
  System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm32 = class(TForm)
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    btn_supp: TBitBtn;
    btn_cancel: TBitBtn;
    Panel3: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    ActionList1: TActionList;
    Esc: TAction;
    GroupBox1: TGroupBox;
    R_nom_co: TRadioButton;
    R_Pern: TRadioButton;
    R_nom: TRadioButton;
    R_date: TRadioButton;
    R_Num: TRadioButton;
    R_num_co: TRadioButton;
    ResizeKit1: TResizeKit;
    SearchBox1: TEdit;
    procedure btn_suppClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure R_nomClick(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form32: TForm32;

implementation

{$R *.dfm}

uses DM_G;

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

procedure TForm32.BitBtn2Click(Sender: TObject);
begin
  DB.Query_Rel_note_Docu.Refresh;

SearchBox1.Clear;
SearchBox1.SetFocus;
end;

procedure TForm32.btn_cancelClick(Sender: TObject);
begin
 if (DB.Query_Rel_note_Docu.RecordCount > 0) then
   begin
    if MessageDlg('åá  ÊÄßÏ Úáì ÚãáíÉ ÇáÍÏÝ Çáßá',  mtWarning, [mbYesToAll, mbNo], 0) = mrYesToAll then
      begin
        DB.Query_Rel_note_Docu.First;
        while not(DB.Query_Rel_note_Docu.Eof) do
        begin
           DB.Query_Rel_note_Docu.Next ;
           DB.Query_Rel_note_Docu.Delete ;
        end;

       MessageDlg('Êã ÍÐÝ ÈäÌÇÍ',  mtConfirmation, [mbOK], 0) ;
       DB.Query_Rel_note_Docu.Refresh ;
      end else Exit;
   end else MessageDlg('ÞÇÆãÉ ÝÇÑÛÉ ',mtInformation,[mbOK], 0);

SearchBox1.Clear;
SearchBox1.SetFocus;
end;

procedure TForm32.btn_suppClick(Sender: TObject);
begin
   if DB.Query_Rel_note_Docu.RecordCount > 0 then
 begin
   if MessageDlg('åá ÃäÊ ãÊÃßÏ ãä ÇáÍÐÝ ¿',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DB.Query_Rel_note_Docu.Delete;
    end;
 end else MessageDlg('ÇáÞÇÆãÉ ÝÇÑÛÉ ', mtError,[mbYes], 0);  exit;

SearchBox1.Clear;
SearchBox1.SetFocus;
end;

procedure TForm32.EscExecute(Sender: TObject);
begin
     close;
end;

procedure TForm32.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SearchBox1.Clear;
  Close;
end;

procedure TForm32.FormShow(Sender: TObject);
begin
   SearchBox1.Clear;
   SearchBox1.SetFocus ;
   R_nom.Checked := True;
   DB.Query_Rel_note_Docu.Refresh;
end;

procedure TForm32.R_nomClick(Sender: TObject);
begin
  SearchBox1.Clear;
  SearchBox1.SetFocus;
  DBGrid1.DataSource.DataSet.Filtered := False;
end;

procedure TForm32.SearchBox1Change(Sender: TObject);
begin
 if (SearchBox1.Text = '' )then
  begin
   DBGrid1.DataSource.DataSet.Filtered := False;
   SearchBox1.Color := $FFFFFF ;
  end
   else
    begin
      if R_Num.Checked = True then
         filterr(DB.Query_Rel_note_Docu,'Num_rel_conta', SearchBox1.Text) else

      if R_nom_co.Checked = True then
         filterr(DB.Query_Rel_note_Docu,'Nom_rel_instit_envo', SearchBox1.Text) else

      if R_date.Checked = True then
         filterr(DB.Query_Rel_note_Docu,'Date_rel_conta', SearchBox1.Text) else

     if R_num_co.Checked = True then
         filterr(DB.Query_Rel_note_Docu,'Num_Rel_not', SearchBox1.Text) else

     if R_Pern.Checked = True then
        begin
         DBGrid1.DataSource.DataSet.Filtered := False;
         DBGrid1.DataSource.DataSet.Filtered := True;
        end else

      if R_Nom.Checked = True  then
        begin
         DBGrid1.DataSource.DataSet.Filtered := False;
         DBGrid1.DataSource.DataSet.Filtered := True;
        end;
      if DB.Query_Rel_note_Docu.RecordCount > 0  then
        SearchBox1.Color := $BFFFBF  else SearchBox1.Color := $D7D7FF ;
    end;
end;

end.
