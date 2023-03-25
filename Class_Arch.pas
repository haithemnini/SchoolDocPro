unit Class_Arch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.WinXCtrls,System.UITypes,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, ResizeKit, uAsSrchBox;

type
  TForm9 = class(TForm)
    Panel2: TPanel;
    btn_add: TBitBtn;
    btn_Edit: TBitBtn;
    BitBtn2: TBitBtn;
    btn_supp: TBitBtn;
    btn_cancel: TBitBtn;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    R_divi_nom: TRadioButton;
    R_class_nom: TRadioButton;
    R_Date: TRadioButton;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    asSearchBox1: TAsSearchBox;
    AsSearchBox2: TEdit;
    procedure btn_EditClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_suppClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure R_class_nomClick(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure R_divi_nomClick(Sender: TObject);
    procedure AsSearchBox2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

uses DM_G, Add_Class_Arch, Edit_Class_Arch;

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


procedure TForm9.AsSearchBox2Change(Sender: TObject);
begin
 if Trim(ASSearchBox2.Text) <> '' then
  begin
    if not DB.Query_Classe.Filtered then
    DB.Query_Classe.Filtered := True;
    DB.Query_Classe.Refresh;

   if DB.Query_Classe.RecordCount > 0  then
    ASSearchBox2.Color := $BFFFBF  else ASSearchBox2.Color := $D7D7FF ;

  end
 else
  begin
   DB.Query_Classe.Filtered := False;
   ASSearchBox2.Color := $FFFFFF ;
  end;
end;

procedure TForm9.BitBtn2Click(Sender: TObject);
begin
 DB.Query_Classe.Refresh ;
end;

procedure TForm9.btn_addClick(Sender: TObject);
begin
   Form10.ShowModal
end;

procedure TForm9.btn_cancelClick(Sender: TObject);
begin
if (DB.Query_Classe.RecordCount > 0) then
   begin
    if MessageDlg('Â·   ƒﬂœ ⁄·Ï ⁄„·Ì… «·Õœ› «·ﬂ·',  mtWarning, [mbYesToAll, mbNo], 0) = mrYesToAll then
      begin
        DB.Query_Classe.First;
        while not(DB.Query_Classe.Eof) do
        begin
           DB.Query_Classe.Next ;
           DB.Query_Classe.Delete ;
        end;

       MessageDlg(' „ Õ–› »‰Ã«Õ',  mtConfirmation, [mbOK], 0) ;
       DB.Query_Classe.Refresh ;
      end else Exit;
   end else MessageDlg('ﬁ«∆„… ›«—€… ',mtInformation,[mbOK], 0) ;
end;

procedure TForm9.btn_EditClick(Sender: TObject);
begin
 if DB.Query_Classe.RecordCount = 0 then
  begin
   MessageDlg('«·ﬁ«∆„… ›«—€…', mtWarning,[mbYes], 0);
  end else  Form11.ShowModal;
end;

procedure TForm9.btn_suppClick(Sender: TObject);
begin
 if MessageDlg('Â· √‰  „ √ﬂœ „‰ «·Õ–› ø',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   DB.Query_Classe.Delete;
  end;
end;

procedure TForm9.EscExecute(Sender: TObject);
begin
Close;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   asSearchBox1.Clear;
   asSearchBox2.Clear;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
  R_class_nom.Checked := True;
  asSearchBox1.Clear;
  asSearchBox1.SetFocus;
end;

procedure TForm9.R_class_nomClick(Sender: TObject);
begin
   AsSearchBox2.Clear;
   AsSearchBox2.Visible:= False;
   DBGrid1.DataSource.DataSet.Filtered := False;
//===
   AsSearchBox1.Clear;
   AsSearchBox1.Visible:= True;
   AsSearchBox1.SetFocus;
end;

procedure TForm9.R_divi_nomClick(Sender: TObject);
begin
   AsSearchBox1.Clear;
   AsSearchBox1.Visible:= False;
//===
  AsSearchBox2.Clear;
  AsSearchBox2.Visible:= True;
  AsSearchBox2.SetFocus;
end;

procedure TForm9.SearchBox1Change(Sender: TObject);
begin
 if Trim(ASSearchBox1.Text) <> '' then
  begin
      if R_class_nom.Checked = True  then
         AsSearchBox1.AddSearchItem('Nom_class')
  end
 else
  begin
    DB.Query_Classe.Filtered := False;
  end;
end;

end.
