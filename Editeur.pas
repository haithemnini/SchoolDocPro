unit Editeur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.WinXCtrls,System.UITypes,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, ResizeKit, uAsSrchBox;

type
  TForm12 = class(TForm)
    Panel2: TPanel;
    btn_add: TBitBtn;
    btn_Edit: TBitBtn;
    BitBtn2: TBitBtn;
    btn_supp: TBitBtn;
    btn_cancel: TBitBtn;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    AsSearchBox1: TAsSearchBox;
    procedure btn_addClick(Sender: TObject);
    procedure btn_EditClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_suppClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AsSearchBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

uses DM_G, Add_Editeur, edit_Editeur;

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




procedure TForm12.AsSearchBox1Change(Sender: TObject);
begin
    AsSearchBox1.AddSearchItem('Nom_edit');
end;

procedure TForm12.BitBtn2Click(Sender: TObject);
begin
  DB.Query_Editeur.Refresh ;
   AsSearchBox1.SetFocus;
end;

procedure TForm12.btn_addClick(Sender: TObject);
begin
   Form13.ShowModal ;
end;

procedure TForm12.btn_cancelClick(Sender: TObject);
begin
if (DB.Query_Editeur.RecordCount > 0) then
   begin
    if MessageDlg('Â·   ƒﬂœ ⁄·Ï ⁄„·Ì… «·Õœ› «·ﬂ·',  mtWarning, [mbYesToAll, mbNo], 0) = mrYesToAll then
      begin
        DB.Query_Editeur.First;
        while not(DB.Query_Editeur.Eof) do
        begin
           DB.Query_Editeur.Next ;
           DB.Query_Editeur.Delete ;
        end;

       MessageDlg(' „ Õ–› »‰Ã«Õ',  mtConfirmation, [mbOK], 0) ;
       DB.Query_Editeur.Refresh ;
      end else Exit;
   end else MessageDlg('ﬁ«∆„… ›«—€… ',mtInformation,[mbOK], 0) ;
 AsSearchBox1.SetFocus;
end;

procedure TForm12.btn_EditClick(Sender: TObject);
begin
 if DB.Query_Editeur.RecordCount = 0 then
  begin
   MessageDlg('«·ﬁ«∆„… ›«—€…', mtWarning,[mbYes], 0);
  end else  Form14.ShowModal;
end;

procedure TForm12.btn_suppClick(Sender: TObject);
begin
 if MessageDlg('Â· √‰  „ √ﬂœ „‰ «·Õ–› ø',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   DB.Query_Editeur.Delete;
  end;
 AsSearchBox1.SetFocus;
end;

procedure TForm12.EscExecute(Sender: TObject);
begin
Close;
end;

procedure TForm12.FormShow(Sender: TObject);
begin
    AsSearchBox1.Clear;
    AsSearchBox1.SetFocus;
end;

end.
