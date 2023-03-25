unit show_Pass_Admin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ResizeKit, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes;

type
  TForm40 = class(TForm)
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
    procedure FormShow(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure Edt__PassKeyPress(Sender: TObject; var Key: Char);
    procedure actEscExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form40: TForm40;

implementation

uses
  Certificat, Exclusion;

{$R *.dfm}

procedure TForm40.actEscExecute(Sender: TObject);
begin
 Close;
end;

procedure TForm40.btn1Click(Sender: TObject);
begin
 if (Edt__Pass.PasswordChar = #0)  then
  Edt__Pass.PasswordChar := '*'
 else  Edt__Pass.PasswordChar := #0 ;
end;


procedure TForm40.btn_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TForm40.btn_saveClick(Sender: TObject);
begin
 if Trim(Edt__Pass.Text) = 'NINI@' then
  begin
   if SUP_D_show = 0 then
     begin
       if SUP_D = 0 then
       begin
         Close;
         Form21.SUP_All;
       end
       else
        if SUP_D = 1 then
         begin
           Close;
           Form21.SUP;
         end
     end
   else
    begin
     if SUP_B = 0 then
      begin
       Close;
       Form18.SUP;
      end
     else
      begin
       if SUP_B = 1 then
        begin
         Close;
         Form18.SUP_All;
        end
      end;
    end;
  end
  else MessageDlg('ﬂ·„… «·”— Œ«ÿ∆' ,mtWarning,[mbok],0 ) ; Close; Exit;
end;

procedure TForm40.Edt__PassKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then btn_save.Click;
end;

procedure TForm40.FormShow(Sender: TObject);
begin
   Edt__Pass.Clear;
   Edt__Pass.SetFocus;
end;

end.
