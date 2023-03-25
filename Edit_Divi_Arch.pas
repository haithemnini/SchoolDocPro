unit Edit_Divi_Arch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes,
  System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm8 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edt_Nom_Divi: TEdit;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure edt_Nom_DiviKeyPress(Sender: TObject; var Key: Char);
    procedure EscExecute(Sender: TObject);
  private
  var iNUM : Integer ;
       myNom_Divi :string ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  iNom : Integer ;
implementation

{$R *.dfm}

uses DM_G, Divi_Arch;

procedure TForm8.btn_saveClick(Sender: TObject);
begin
 if(edt_Nom_Divi.Text = '') then
  begin
   MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
   edt_Nom_Divi.SelectAll ;
   edt_Nom_Divi.SetFocus;
   Exit;
  end
   else
    begin
    if (Trim(edt_Nom_Divi.Text) <> myNom_Divi) then
      begin
       if DB.Query_Division.Locate('Nom_divisi',Trim(edt_Nom_Divi.Text),[]) then
            iNom := 0 else iNom := 1;
       end else iNom := 1 ;


    if iNom = 0  then
      begin
       MessageDlg('Ì—ÃÏ  €Ì— «·»Ì«‰« ' ,mtWarning,[mbok],0 ) ;
       edt_Nom_Divi.SelectAll ;
       edt_Nom_Divi.SetFocus;
       Exit;
       end
      else
       begin
          if DB.Query_Division.Locate('Num_divisi',iNUM) then
           begin
            with DB do
             begin
              Query_Division.Edit ;
              Query_Division['Nom_divisi']                   := Trim(edt_Nom_Divi.Text) ;
              end;
           //====
            DB.Query_Division.Post;
            MessageDlg(' „  ⁄œÌ· ‘⁄»… »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
            close;
            end;
       end ;

    end;
end;

procedure TForm8.edt_Nom_DiviKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then btn_save.Click;
end;

procedure TForm8.EscExecute(Sender: TObject);
begin
   Close ;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
  if DB.Query_Division.Locate('Num_divisi',Form6.DBGrid1.Fields[0].AsInteger,[]) then
  iNUM := DB.Query_Division['Num_divisi'] ;
   begin
      edt_Nom_Divi.Text                               := DB.Query_Division['Nom_divisi'];
      myNom_Divi                                      := DB.Query_Division['Nom_divisi'];
   end;
  edt_Nom_Divi.SelectAll ;
  edt_Nom_Divi.SetFocus ;
end;

end.
