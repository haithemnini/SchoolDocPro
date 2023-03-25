unit Divi_Arch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.WinXCtrls, Vcl.Grids, Vcl.DBGrids,System.UITypes, System.Actions,
  Vcl.ActnList, ResizeKit, uAsSrchBox;

type
  TForm6 = class(TForm)
    Panel2: TPanel;
    btn_add: TBitBtn;
    btn_Edit: TBitBtn;
    BitBtn2: TBitBtn;
    btn_supp: TBitBtn;
    btn_cancel: TBitBtn;
    DBGrid1: TDBGrid;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    pnl1: TPanel;
    asSearchBox1: TAsSearchBox;
    procedure btn_addClick(Sender: TObject);
    procedure btn_EditClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_suppClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure asSearchBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses DM_G, Interf_Arch, Add_Divi_Arch, Edit_Divi_Arch;

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

procedure TForm6.asSearchBox1Change(Sender: TObject);
begin
   AsSearchBox1.AddSearchItem('Nom_divisi');
end;

procedure TForm6.BitBtn2Click(Sender: TObject);
begin
   DB.Query_Division.Refresh ;
end;

procedure TForm6.btn_addClick(Sender: TObject);
begin
  Form7.ShowModal;
end;

procedure TForm6.btn_cancelClick(Sender: TObject);
begin
 if (DB.Query_Division.RecordCount > 0) then
   begin
    if MessageDlg('Â·   ƒﬂœ ⁄·Ï ⁄„·Ì… «·Õœ› «·ﬂ·',  mtWarning, [mbYesToAll, mbNo], 0) = mrYesToAll then
      begin
        DB.Query_Division.First;
        while not(DB.Query_Division.Eof) do
        begin
           DB.Query_Division.Next ;
           DB.Query_Division.Delete ;
        end;

       MessageDlg(' „ Õ–› »‰Ã«Õ',  mtConfirmation, [mbOK], 0) ;
       DB.Query_Division.Refresh ;
      end else Exit;
   end else MessageDlg('ﬁ«∆„… ›«—€… ',mtInformation,[mbOK], 0) ;

end;

procedure TForm6.btn_EditClick(Sender: TObject);
begin
 if DB.Query_Division.RecordCount = 0 then
  begin
   MessageDlg('«·ﬁ«∆„… ›«—€…', mtWarning,[mbYes], 0);
  end else  Form8.ShowModal;
end;

procedure TForm6.btn_suppClick(Sender: TObject);
begin
  if MessageDlg('Â· √‰  „ √ﬂœ „‰ «·Õ–› ø',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DB.Query_Division.Delete;
    end;
end;

procedure TForm6.EscExecute(Sender: TObject);
begin
 Close;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    asSearchBox1.Clear;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
   asSearchBox1.Clear;
   asSearchBox1.SetFocus ;
end;

end.
