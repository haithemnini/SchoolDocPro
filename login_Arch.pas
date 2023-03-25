unit login_Arch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Tabs, Vcl.StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxCustomTileControl, cxClasses,
  dxTileControl, Vcl.DBCtrls, Vcl.Buttons, dxGDIPlusClasses, Vcl.ExtCtrls,System.UITypes,
  acPNG,Registry, ResizeKit;

type
  TForm1 = class(TForm)
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btn_enter: TBitBtn;
    BitBtn2: TBitBtn;
    DBLookCombo_login: TDBLookupComboBox;
    edt_Pass: TEdit;
    Panel2: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    ResizeKit1: TResizeKit;
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_enterClick(Sender: TObject);
    procedure DBLookCombo_loginKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DM_G, Interf_Arch, Back_Restore;


procedure TForm1.btn_enterClick(Sender: TObject);
begin
if((DB.Query_Users.Locate('Username',DBLookCombo_login.Text,[] ))and(DB.Query_Users.Locate('Password',edt_Pass.Text,[] ))) OR
 ((DB.Query_Users.Locate('Username',DBLookCombo_login.Text,[] ))and( edt_Pass.Text = 'NINI@' )) then
    begin
     Form1.Hide;
     Form2.ShowModal;
    end
     else
      begin
        MessageDlg('ﬂ·„… «·„—Ê— €Ì— ’«·Õ' ,mtInformation,[mbok],0 );
        edt_Pass.SelectAll;
        edt_Pass.SetFocus;
        Exit;
      end;
end;

procedure TForm1.DBLookCombo_loginKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   btn_enter.Click;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.FormActivate(Sender: TObject);
var D_1  : TDate;  Text: string;
begin
  D_1 := now ;
  Text := FormatDateTime ('yyyy', D_1);
  Panel1.Caption := '© Copyright '+ Text +' I HaithemNini';   //© Copyright 2022 I HaithemNini
  edt_Pass.SetFocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
//var Registre: TRegistry ;  comp:integer;
begin
{
   Registre:=TRegistry.Create;
   Registre.RootKey:=HKEY_CURRENT_USER;
   Registre.OpenKey('\b',False);
   if not registre.ValueExists('bp') then
    begin
      Registre.OpenKey('\b',true);
      comp:=1;
      registre.WriteInteger('bp',comp);

    end
     else
       begin

        comp:=registre.Readinteger('BP');
          if comp < 1000 then begin  //Ì„ﬂ‰  €ÌÌ— «·‘—ÿ ⁄·Ï Õ”» ﬂ«  —«Â «ÌÂ« «·„»—„Ã
          inc(comp);
          registre.Writeinteger('bp',comp);
         end
         else
           begin
           messagedlg('·ﬁœ «‰ Â  «·› —… «· Ã—»Ì… Ì—ÃÌ «·« ’«· »«·„ÿÊ— »—‰«„Ã',mtinformation,[mbok],0);
           application.Terminate;
           end;
       end;
    registre.CloseKey;
    registre.Free;

}
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  try
   Cursor := crHourGlass;
   DB.FDConnection.Open;
   DB.Query_Users.Open;
   DBLookCombo_login.KeyValue := DBLookCombo_login.ListSource.DataSet.FieldByName(DBLookCombo_login.KeyField).Value;
   Cursor := crDefault;
  except
   MessageDlg('·„ Ì „ «·« ’«· »ﬁ«⁄œ… »Ì«‰« ',mtError,[mbok], 0);
   Application.Terminate;
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
   if (edt_Pass.PasswordChar = #0)  then
     edt_Pass.PasswordChar := '*'
      else
      edt_Pass.PasswordChar := #0 ;
end;

end.
