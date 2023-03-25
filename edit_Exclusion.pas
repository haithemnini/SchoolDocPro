unit edit_Exclusion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,System.UITypes,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, ResizeKit, Vcl.DBCtrls;

type
  TForm20 = class(TForm)
    Panel2: TPanel;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edt_Pren: TEdit;
    edt_Nom: TEdit;
    DateTimePicker1: TDateTimePicker;
    edt_Raison: TEdit;
    btn_save: TBitBtn;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    Label4: TLabel;
    DBLookCombo_class: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure edt_NomKeyPress(Sender: TObject; var Key: Char);
  private
  var iNUM ,inom :Integer ;
      myPren_ele,myNom_ele :string ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

{$R *.dfm}

uses DM_G, Exclusion;

procedure TForm20.btn_cancelClick(Sender: TObject);
begin
   Close ;
end;

procedure TForm20.btn_saveClick(Sender: TObject);
begin
/// btn_save.SetFocus ;
 if (edt_Pren.Text = '') or (edt_Nom.Text = '')then
   begin
     MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
     Exit;
   end
    else
     begin
      if DB.Query_Uneleve.Locate('Pren_ele;Nom_ele', VarArrayOf ([ Trim(edt_Pren.Text),Trim(edt_Nom.Text)]),[]) then
       begin
         iNom := DB.Query_Uneleve['Num_ele']  ;
       //====
         if (Trim(edt_Pren.Text) <> myPren_ele) and (Trim(edt_Nom.Text) <> myNom_ele )then
          begin
            if DB.Query_Exclusion.Locate('Num_ele',iNom,[]) then  iNom := 0 ;
          end;
       //===
       end else  iNom := 0 ;
     //====

      if iNom = 0 then
       begin
        MessageDlg('Ì—ÃÏ  €Ì— «·«”„ «Ê «··ﬁ»', mtWarning,[mbYes], 0);
        edt_Nom.SetFocus;
        Exit ;
       end
        else
         begin
          if DB.Query_Exclusion.Locate('Num_Rapp_exclu',iNUM,[]) then
           begin

            with DB do
             begin
              Query_Exclusion.Edit;

              Query_Exclusion['Nom_Rapp_exclu']                      := DBLookCombo_class.Text ;
              Query_Exclusion['Raison']                              := Trim(edt_Raison.Text) ;
              Query_Exclusion['Date_exclu_sorti']                    := DateTimePicker1.Date ;
              Query_Exclusion['Num_ele']                             := iNom ;
             end;
           //====
            DB.Query_Exclusion.Post;
            MessageDlg(' „  ⁄œÌ· «·„ﬁ—— ·· ·„Ì– »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
            close;
            end;
           end;
     end;
end;

procedure TForm20.edt_NomKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
   begin
    btn_save.SetFocus;
    btn_save.Click ;
   end;
end;

procedure TForm20.FormShow(Sender: TObject);
begin
 if DB.Query_Exclusion.Locate('Num_Rapp_exclu',Form18.DBGrid1.Fields[0].AsInteger,[]) then
  begin
   iNUM := DB.Query_Exclusion['Num_Rapp_exclu'] ;
   inom := DB.Query_Exclusion['Num_ele'] ;
    with DB do
       begin
         //DBLookCombo_class.Text                       := Query_Exclusion['Nom_Rapp_exclu'];
         edt_Raison.Text                             := Query_Exclusion['Raison'];
         DateTimePicker1.Date                        := Query_Exclusion['Date_exclu_sorti'];
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
end;


end.
