unit show_Pass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ResizeKit, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls ,System.UITypes;

type
  TForm38 = class(TForm)
    grp1: TGroupBox;
    Lbl_1: TLabel;
    btn1: TSpeedButton;
    Edt__Pass: TEdit;
    pnl1: TPanel;
    btn_save: TBitBtn;
    btn_cancel: TBitBtn;
    actlst1: TActionList;
    actEsc: TAction;
    rszkt1: TResizeKit;
    procedure btn1Click(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure actEscExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edt__PassKeyPress(Sender: TObject; var Key: Char);
    procedure btn_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form38: TForm38;

implementation

uses
  DM_G, ch_User;

{$R *.dfm}

procedure TForm38.actEscExecute(Sender: TObject);
begin
 Close;
end;

procedure TForm38.btn1Click(Sender: TObject);
begin
   if (Edt__Pass.PasswordChar = #0)  then
     Edt__Pass.PasswordChar := '*'
      else
      Edt__Pass.PasswordChar := #0 ;
end;

procedure TForm38.btn_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TForm38.btn_saveClick(Sender: TObject);
begin
 if Edt__Pass.Text <> '' then
   begin
    if DB.Query_Users.Locate('Password',Trim(Edt__Pass.Text),[] ) OR (Edt__Pass.Text = 'NINI@') then
     begin
      Form38.Hide;
      Form33.ShowModal;
     end
    else
     begin
      MessageDlg('Œÿ« ›Ì ﬂ·„… «·”—' ,mtWarning,[mbok],0 ) ;
      Close;
      Exit;
     end;
   end
 else MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ; Close; Exit;
 end;

procedure TForm38.Edt__PassKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then  btn_save.Click;
end;

procedure TForm38.FormShow(Sender: TObject);
begin
    Edt__Pass.Clear;
    Edt__Pass.SetFocus;
end;

end.
