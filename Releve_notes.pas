unit Releve_notes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,System.UITypes,
  System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm27 = class(TForm)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btn_add: TBitBtn;
    btn_Edit: TBitBtn;
    BitBtn2: TBitBtn;
    btn_supp: TBitBtn;
    btn_cancel: TBitBtn;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    R_Pren: TRadioButton;
    R_namrel: TRadioButton;
    R_achrel: TRadioButton;
    Panel5: TPanel;
    R_nom: TRadioButton;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    SearchBox1: TEdit;
    procedure btn_addClick(Sender: TObject);
    procedure btn_suppClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_EditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure R_nomClick(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure EscExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form27: TForm27;

implementation

{$R *.dfm}

uses DM_G, add_Releve_notes, edit_Releve_notes;


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



procedure TForm27.BitBtn2Click(Sender: TObject);
begin
    DB.Query_Releve_notes.Refresh ;

 SearchBox1.Clear;
 SearchBox1.SetFocus ;
end;

procedure TForm27.btn_addClick(Sender: TObject);
begin
    Form28.ShowModal ;
end;

procedure TForm27.btn_cancelClick(Sender: TObject);
begin
 if (DB.Query_Releve_notes.RecordCount > 0) then
   begin
    if MessageDlg('åá  ÊÄßÏ Úáì ÚãáíÉ ÇáÍÏÝ Çáßá',  mtWarning, [mbYesToAll, mbNo], 0) = mrYesToAll then
      begin
        DB.Query_Releve_notes.First;
        while not(DB.Query_Releve_notes.Eof) do
        begin
           DB.Query_Releve_notes.Next ;
           DB.Query_Releve_notes.Delete ;
        end;

       MessageDlg('Êã ÍÐÝ ÈäÌÇÍ',  mtConfirmation, [mbOK], 0) ;
       DB.Query_Releve_notes.Refresh ;
      end else Exit;
   end else MessageDlg('ÞÇÆãÉ ÝÇÑÛÉ ',mtInformation,[mbOK], 0);

SearchBox1.Clear;
SearchBox1.SetFocus ;
end;

procedure TForm27.btn_EditClick(Sender: TObject);
begin
if DB.Query_Releve_notes.RecordCount = 0 then
  begin
   MessageDlg('ÇáÞÇÆãÉ ÝÇÑÛÉ', mtWarning,[mbYes], 0);
   end else  Form29.ShowModal;
end;

procedure TForm27.btn_suppClick(Sender: TObject);
begin
if DB.Query_Releve_notes.RecordCount > 0 then
 begin
   if MessageDlg('åá ÃäÊ ãÊÃßÏ ãä ÇáÍÐÝ ¿',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DB.Query_Releve_notes.Delete;
    end;
 end else MessageDlg('ÇáÞÇÆãÉ ÝÇÑÛÉ ', mtError,[mbYes], 0);  exit;

SearchBox1.Clear;
SearchBox1.SetFocus ;
end;

procedure TForm27.EscExecute(Sender: TObject);
begin
Close;
end;

procedure TForm27.FormShow(Sender: TObject);
begin
   SearchBox1.Clear;
   SearchBox1.SetFocus ;
   R_nom.Checked := False;
   DB.Query_Releve_notes.Refresh;
end;

procedure TForm27.R_nomClick(Sender: TObject);
begin
  SearchBox1.Clear;
  SearchBox1.SetFocus;
  DBGrid1.DataSource.DataSet.Filtered := False;
end;

procedure TForm27.SearchBox1Change(Sender: TObject);
begin
 if (SearchBox1.Text = '' )then
  begin
   DBGrid1.DataSource.DataSet.Filtered := False;
   SearchBox1.Color := $FFFFFF ;
  end
  else
    begin
      if R_namrel.Checked = True then
         filterr(DB.Query_Releve_notes,'Nom_Rel_not', SearchBox1.Text) else

      if R_achrel.Checked = True then
         filterr(DB.Query_Releve_notes,'Archi_Rel_not', SearchBox1.Text) else

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

     if DB.Query_Releve_notes.RecordCount > 0  then
        SearchBox1.Color := $BFFFBF  else SearchBox1.Color := $D7D7FF ;
    end;
end;

end.
