unit Liste_etud_Arch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXCtrls,System.UITypes,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI,
  System.Actions, Vcl.ActnList, ResizeKit, Vcl.Menus, System.ImageList,
  Vcl.ImgList, uAsSrchBox;

type
  TForm3 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    R_Date: TRadioButton;
    R_Nom: TRadioButton;
    R_Pren: TRadioButton;
    R_lieu: TRadioButton;
    R_ger: TRadioButton;
    Panel4: TPanel;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    btn_add: TBitBtn;
    btn_Edit: TBitBtn;
    BitBtn2: TBitBtn;
    btn_supp: TBitBtn;
    btn_cancel: TBitBtn;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    DBGrid1: TDBGrid;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N5: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    il1: TImageList;
    AsSearchBox1: TAsSearchBox;
    R_Anne: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure btn_EditClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_suppClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure R_NomClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure DBGrid1MouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure N7Click(Sender: TObject);
    procedure AsSearchBox1Change(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure R_PrenClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses DM_G, Add_etud_Arch, Edit_etud_Arch, Print_Editeur_certifi,
 Print_doum_certifi, Releve_notes_sech, Print_doum_Ref, exp_ele, Print_Editeur_certifi_02;

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


procedure TForm3.AsSearchBox1Change(Sender: TObject);
begin
      if R_Nom.Checked = True then
       AsSearchBox1.AddSearchItem('Nom_ele') else

      if R_Pren.Checked = True then
          AsSearchBox1.AddSearchItem('Pren_ele') else

      if R_Date.Checked = True then
          AsSearchBox1.AddSearchItem('Date_naiss_ele') else

      if R_lieu.Checked = True then
          AsSearchBox1.AddSearchItem('Lieu_naiss_ele') else

      if R_ger.Checked = True then
       AsSearchBox1.AddSearchItem('Nom_gardi')  else

      if R_Anne.Checked = True then
       AsSearchBox1.AddSearchItem('Annee')  else

end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  if DB.Query_Releve_notes.Locate('Num_ele',DBGrid1.Fields[0].AsInteger,[]) then
   begin
        Form31.ShowModal;
   end
    else MessageDlg('⁄›Ê« ...€Ì— „ÊÃÊœ ›Ì «—‘Ì› ﬂ‘› ‰ﬁ«ÿ ', mtInformation,[mbYes], 0);
   ASSearchBox1.Clear;
   AsSearchBox1.SetFocus;   Exit;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
   DB.Query_Uneleve.Refresh;
ASSearchBox1.Clear;
AsSearchBox1.SetFocus;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
    Form25.ShowModal;
     ASSearchBox1.Clear;
 AsSearchBox1.SetFocus;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
  if DB.Query_Releve_notes.Locate('Num_ele',DBGrid1.Fields[0].AsInteger,[]) then
   begin
        Form30.ShowModal;
   end
    else MessageDlg('⁄›Ê« ...€Ì— „ÊÃÊœ ›Ì «—‘Ì› ﬂ‘› ‰ﬁ«ÿ ', mtInformation,[mbYes], 0);
   ASSearchBox1.Clear;
   AsSearchBox1.SetFocus;   Exit;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
 if DB.Query_Uneleve.RecordCount = 0  then
 begin
   MessageDlg('ﬁ«∆„…  ·«„Ì– ›«—€…' ,mtWarning,[mbok],0 ) ;
 end
  else
   begin
    if DB.Query_Exclusion.Locate('Num_ele',Form3.DBGrid1.Fields[0].AsInteger,[]) then
    begin
        Form24.ShowModal ;
     end
    else
    begin
       Form39.ShowModal;
     end;
   end;
 ASSearchBox1.Clear;
 AsSearchBox1.SetFocus;
end ;


procedure TForm3.btn_addClick(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm3.btn_cancelClick(Sender: TObject);
begin
 if (DB.Query_Uneleve.RecordCount > 0) then
   begin
    if MessageDlg('Â·   ƒﬂœ ⁄·Ï ⁄„·Ì… «·Õœ› «·ﬂ·',  mtWarning, [mbYesToAll, mbNo], 0) = mrYesToAll then
      begin
        DB.Query_Uneleve.First;
        while not(DB.Query_Uneleve.Eof) do
        begin
           DB.Query_Uneleve.Next ;
           DB.Query_Uneleve.Delete ;
        end;

       MessageDlg(' „ Õ–› »‰Ã«Õ',  mtConfirmation, [mbOK], 0) ;
       DB.Query_Uneleve.Refresh ;
      end else Exit;
   end else MessageDlg('ﬁ«∆„… ›«—€… ',mtInformation,[mbOK], 0) ;

 ASSearchBox1.Clear;
 AsSearchBox1.SetFocus;
end;

procedure TForm3.btn_EditClick(Sender: TObject);
begin
  if DB.Query_Uneleve.RecordCount = 0 then
   begin
    MessageDlg('«·ﬁ«∆„… ›«—€…', mtWarning,[mbYes], 0);
   end else  Form5.ShowModal;
end;

procedure TForm3.btn_suppClick(Sender: TObject);
begin
if DB.Query_Uneleve.RecordCount > 0 then
 begin
   if MessageDlg('Â· √‰  „ √ﬂœ „‰ «·Õ–› ø',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DB.Query_Uneleve.Delete;
    end;
 end else MessageDlg('«·ﬁ«∆„… ›«—€… ', mtError,[mbYes], 0);  exit;

  ASSearchBox1.Clear;
  AsSearchBox1.SetFocus;
end;

procedure TForm3.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  if DB.ds_Query_Uneleve.DataSet.RecNo > 0 then
//  begin
//    if Column.Title.Caption = 'num' then
//      DBGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top, IntToStr(DB.ds_Query_Uneleve.DataSet.RecNo));
//  end;
end;

procedure TForm3.DBGrid1MouseActivate(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
   DBGrid1.PopupMenu := pm1;
end ;

procedure TForm3.EscExecute(Sender: TObject);
begin
  Close ;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   AsSearchBox1.Clear;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
   AsSearchBox1.Clear;
   R_Nom.Checked := True;
   AsSearchBox1.SetFocus;
   DB.Query_Uneleve.Refresh;
end;

procedure TForm3.N7Click(Sender: TObject);
begin
   form37.ShowModal;
end;

procedure TForm3.R_NomClick(Sender: TObject);
begin
  AsSearchBox1.Visible := True;
  AsSearchBox1.Clear;
  AsSearchBox1.SetFocus;
end;

procedure TForm3.R_PrenClick(Sender: TObject);
begin
  AsSearchBox1.Visible := True;
  AsSearchBox1.Clear;
  AsSearchBox1.SetFocus;
end;

procedure TForm3.SearchBox1Change(Sender: TObject);
begin

//    if R_class.Checked = True  then
//     begin
//       if Trim(SearchBox1.Text) <> '' then
//        begin
//          if not DB.Query_Uneleve.Filtered then
//            DB.Query_Uneleve.Filtered := True;
//            DB.Query_Uneleve.Refresh;
//        end
//
//        else
//          DB.Query_Uneleve.Filtered := False;
//
//       //  DB.Query_Classe.Refresh
//       //  DB.Query_Uneleve.Active:= False;
//       //  DBGrid1.Refresh;
//       //  DB.Query_Uneleve.Active:= True;
//       //  DB.Query_Uneleve.Refresh;
//       //  if DB.Query_Uneleve.RecordCount > 0  then
//       //  SearchBox1.Color := $BFFFBF  else SearchBox1.Color := $D7D7FF ;
//
//       // DBGrid1.DataSource.DataSet.Filter:= ('class like '+QuotedStr('*'+SearchBox1.Text+'*'));
//       // DB.Query_Uneleve.Filtered := False;
//       // DB.Query_Uneleve.Open;
//       // DB.Query_Uneleve.Filtered := False;
//       // DB.Query_Uneleve.Filter := 'class ' + QuotedStr('«·À«·À… À«‰ÊÌ ¬œ«» Ê·€« ');
//       // DB.Query_Uneleve.Filtered := True;
//       // DB.Query_Uneleve.OnFilterRecord := NewYorkFilter;
//       //
//
//   end;


end;

end.

