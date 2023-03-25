unit edit_Releve_notes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes,
  System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm29 = class(TForm)
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
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure edt_NomKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
      var iNUM ,inom :Integer ;
      myPren_ele,myNom_ele,myNom_Rel :string ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form29: TForm29;

implementation

{$R *.dfm}

uses DM_G, Releve_notes;

procedure TForm29.btn_cancelClick(Sender: TObject);
begin
   Close ;
end;

procedure TForm29.btn_saveClick(Sender: TObject);
begin
  if (edt_Pren.Text = '') or (edt_Nom.Text = '') or(edt_Nom_Rel.Text = '')  or (edt_Rel_not.Text = '') then
   begin
     MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
     Exit;
   end
    else
     begin
      if (DB.Query_Uneleve.Locate('Nom_ele;Pren_ele', VarArrayOf ([Trim(edt_Nom.Text),Trim(edt_Pren.Text)]),[])) then
        begin
         iNom := DB.Query_Uneleve['Num_ele']  ;
        //===
         if (Trim(edt_Pren.Text) <> myPren_ele) or (Trim(edt_Nom.Text) <> myPren_ele) or (Trim(edt_Nom_Rel.Text) <> myNom_Rel) then
            if (DB.Query_Releve_notes.Locate('Nom_Rel_not;Num_ele',VarArrayOf ([Trim(edt_Nom_Rel.Text), iNom]),[]))then
                iNom := 0
        //===
         end else iNom := 0 ;

      if (iNom = 0)then
       begin
        MessageDlg('Ì—ÃÏ «· √ﬂœ „‰  Ê«›ﬁ «·»Ì«‰«  «··«“„…', mtWarning,[mbYes], 0);
        edt_Nom.SetFocus;
        Exit ;
       end
        else
         begin
          if DB.Query_Releve_notes.Locate('Num_Rel_not',iNUM,[]) then
           begin
            with DB do
             begin
              Query_Releve_notes.Edit;

              Query_Releve_notes['Nom_Rel_not']                           := Trim(edt_Nom_Rel.Text) ;
              Query_Releve_notes['Archi_Rel_not']                         := Trim(edt_Rel_not.Text) ;
              Query_Releve_notes['Num_ele']                               := iNom ;
             end;
             //====
            DB.Query_Releve_notes.Post;
            MessageDlg(' „  ⁄œÌ· «—‘Ì› ﬂ‘› ',mtConfirmation,[mbYes], 0);
            close;
           end;
         end;
     end;
end;

procedure TForm29.edt_NomKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then btn_save.Click;
end;

procedure TForm29.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form27.SearchBox1.SetFocus;
 Close;
end;

procedure TForm29.FormShow(Sender: TObject);
begin
if DB.Query_Releve_notes.Locate('Num_Rel_not',Form27.DBGrid1.Fields[0].AsInteger,[]) then
  begin
   iNUM := DB.Query_Releve_notes['Num_Rel_not'] ;
   inom := DB.Query_Releve_notes['Num_ele'] ;
    with DB do
       begin
         edt_Nom_Rel.Text                            := Query_Releve_notes['Nom_Rel_not'];
         edt_Rel_not.Text                            := Query_Releve_notes['Archi_Rel_not'];
       //====
        myNom_Rel := Query_Releve_notes['Nom_Rel_not']  ;
       end;
  end;

//====
 if DB.Query_Uneleve.Locate('Num_ele',inom,[]) then
  begin
   edt_Pren.Text                               := DB.Query_Uneleve['Pren_ele'];
   edt_Nom.Text                                := DB.Query_Uneleve['Nom_ele'];
  //====
   myPren_ele                                  := DB.Query_Uneleve['Pren_ele'] ;
   myNom_ele                                   := DB.Query_Uneleve['Nom_ele'];
  end;

 Form27.SearchBox1.Clear;
 Form27.DBGrid1.DataSource.DataSet.Filtered := False;
end;

end.
