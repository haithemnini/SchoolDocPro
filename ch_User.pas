unit ch_User;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes, acPNG, ResizeKit;

type
  TForm33 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edt_Nomuse: TEdit;
    edt_Pass: TEdit;
    ActionList1: TActionList;
    Esc: TAction;
    Panel2: TPanel;
    btn_save: TBitBtn;
    btn_cancel: TBitBtn;
    SpeedButton1: TSpeedButton;
    ResizeKit1: TResizeKit;
    procedure FormShow(Sender: TObject);
    procedure edt_NomuseKeyPress(Sender: TObject; var Key: Char);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form33: TForm33;

implementation

{$R *.dfm}

uses DM_G, Interf_Arch;

procedure TForm33.btn_cancelClick(Sender: TObject);
begin
   Close;
end;

procedure TForm33.btn_saveClick(Sender: TObject);
begin
 if (edt_Nomuse.Text = '')  or (edt_Pass.Text='')then
  begin
   MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
  end
   else
    begin
     if (DB.Query_Users.Locate('ID',1,[])) then
      begin
       DB.Query_Users.Edit;
       DB.Query_Users['Username']  := Trim(edt_Nomuse.Text) ;
       DB.Query_Users['Password']  := Trim(edt_Pass.Text) ;
       DB.Query_Users.Post;
       MessageDlg(' „ Õ›Ÿ' ,mtConfirmation,[mbok],0 ) ;
       form2.la_user.Caption  :=  Trim(edt_Nomuse.Text);
       Close;
       exit;
      end;
    end;
end;

procedure TForm33.edt_NomuseKeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then btn_save.Click;
end;

procedure TForm33.FormShow(Sender: TObject);
begin
  if (DB.Query_Users.Locate('ID',1,[])) then
   begin
      edt_Nomuse.Text := DB.Query_Users['Username'];
      edt_Pass.Text   := DB.Query_Users['Password'];
   end;
 edt_Pass.SetFocus;
 edt_Pass.SelectAll;
end;

procedure TForm33.SpeedButton1Click(Sender: TObject);
begin
   if (edt_Pass.PasswordChar = #0)  then
     edt_Pass.PasswordChar := '*'
      else
      edt_Pass.PasswordChar := #0 ;
end;

end.
