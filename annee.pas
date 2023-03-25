unit annee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.WinXCtrls,System.UITypes,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, System.Actions,DateUtils,
  Vcl.ActnList, ResizeKit, uAsSrchBox;

type
  TForm15 = class(TForm)
    Panel2: TPanel;
    btn_add: TBitBtn;
    btn_Edit: TBitBtn;
    BitBtn2: TBitBtn;
    btn_supp: TBitBtn;
    btn_cancel: TBitBtn;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    AsSearchBox1: TAsSearchBox;
    Panel3: TPanel;
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_EditClick(Sender: TObject);
    procedure btn_suppClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AsSearchBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

uses DM_G, edit_annee, Add_annee;

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

procedure TForm15.AsSearchBox1Change(Sender: TObject);
begin
   AsSearchBox1.AddSearchItem('Annee_scol');
end;

procedure TForm15.BitBtn2Click(Sender: TObject);
begin
  DB.Query_Annee.Refresh;
end;

procedure TForm15.btn_addClick(Sender: TObject);
begin
   Form16.ShowModal ;
end;

procedure TForm15.btn_cancelClick(Sender: TObject);
begin
if (DB.Query_Annee.RecordCount > 0) then
   begin
    if MessageDlg('Â·   ƒﬂœ ⁄·Ï ⁄„·Ì… «·Õœ› «·ﬂ·',  mtWarning, [mbYesToAll, mbNo], 0) = mrYesToAll then
      begin
        DB.Query_Annee.First;
        while not(DB.Query_Annee.Eof) do
        begin
           DB.Query_Annee.Next ;
           DB.Query_Annee.Delete ;
        end;

       MessageDlg(' „ Õ–› »‰Ã«Õ',  mtConfirmation, [mbOK], 0) ;
       DB.Query_Annee.Refresh ;
      end else Exit;
   end else MessageDlg('ﬁ«∆„… ›«—€… ',mtInformation,[mbOK], 0) ;
end;

procedure TForm15.btn_EditClick(Sender: TObject);
begin
if DB.Query_Annee.RecordCount = 0 then
  begin
   MessageDlg('«·ﬁ«∆„… ›«—€…', mtWarning,[mbYes], 0);
  end else  Form17.ShowModal;
end;

procedure TForm15.btn_suppClick(Sender: TObject);
begin
 if MessageDlg('Â· √‰  „ √ﬂœ „‰ «·Õ–› ø',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   DB.Query_Annee.Delete;
  end;
end;

procedure TForm15.EscExecute(Sender: TObject);
begin
  Close;
end;

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ASSearchBox1.SetFocus ;
end;

procedure TForm15.FormShow(Sender: TObject);
begin
   ASSearchBox1.Clear;
   ASSearchBox1.SetFocus ;
end;

end.
