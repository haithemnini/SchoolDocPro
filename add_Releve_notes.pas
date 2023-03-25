unit add_Releve_notes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes,
  System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm28 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edt_Pren: TEdit;
    edt_Nom: TEdit;
    edt_Nom_Rel: TEdit;
    edt_Rel_not: TEdit;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure btn_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_NomKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form28: TForm28;

implementation

{$R *.dfm}

uses Releve_notes, DM_G;

procedure TForm28.btn_cancelClick(Sender: TObject);
begin
   Close;
end;

procedure TForm28.btn_saveClick(Sender: TObject);
 var iNom ,iExc:Integer ;
begin
  if (edt_Pren.Text = '') or (edt_Nom.Text = '') or(edt_Nom_Rel.Text = '')  or (edt_Rel_not.Text = '') then
   begin
     MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
     edt_Nom.SetFocus ;
     Exit;
   end
    else
     begin
      if DB.Query_Releve_notes.RecordCount > 0 then
        begin
          DB.Query_Releve_notes.Last;
          iExc := Form27.DBGrid1.Fields[0].AsInteger + 1 ;
        end else iExc := 1 ;
     //====
      if DB.Query_Uneleve.Locate('Nom_ele;Pren_ele',VarArrayOf([Trim(edt_Nom.Text),Trim(edt_Pren.Text)]),[]) then
       begin
        iNom := DB.Query_Uneleve['Num_ele'];
       //====
        if DB.Query_Releve_notes.Locate('Nom_Rel_not',Trim(edt_Nom_Rel.Text),[]) then  iNom := 0 ;
       //====
       end else iNom := 0 ;
     //====

      if iNom = 0  then
        begin
           MessageDlg('Ì—ÃÏ «· √ﬂœ „‰  Ê«›ﬁ «·»Ì«‰«  «··«“„…', mtWarning,[mbYes], 0);
           edt_Nom.SetFocus;
           Exit ;
        end
         else
          begin
             with DB do
              begin
               Query_Releve_notes.Append;

               Query_Releve_notes['Num_Rel_not']                           := iExc             ;
               Query_Releve_notes['Nom_Rel_not']                           := Trim(edt_Nom_Rel.Text) ;
               Query_Releve_notes['Archi_Rel_not']                         := Trim(edt_Rel_not.Text) ;
               Query_Releve_notes['Num_ele']                               := iNom ;
              end;
         //====
          DB.Query_Releve_notes.Post;
          MessageDlg(' „ «÷«›… «—‘Ì› ﬂ‘› »‰Ã«Õ', mtConfirmation,[mbYes], 0);
          close;
         end
     end;
end;

procedure TForm28.edt_NomKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then  btn_save.Click ;
end;

procedure TForm28.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form27.SearchBox1.SetFocus;
 Close;
end;

procedure TForm28.FormShow(Sender: TObject);
begin
   edt_Pren.Clear;
   edt_Nom.Clear ;
   edt_Nom_Rel.Clear;
   edt_Rel_not.Clear ;
   edt_Nom.SetFocus ;

   Form27.SearchBox1.Clear;
   Form27.DBGrid1.DataSource.DataSet.Filtered := False;
end;

end.
