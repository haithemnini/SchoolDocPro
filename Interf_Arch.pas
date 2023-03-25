unit Interf_Arch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,System.UITypes,
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
  dxTileControl, acPNG, System.Actions, Vcl.ActnList, ResizeKit, Vcl.ComCtrls,
  Vcl.Menus, System.ImageList, Vcl.ImgList, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Comp.UI;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    la_user: TLabel;
    la_time: TLabel;
    Timer1: TTimer;
    dxTileControl1: TdxTileControl;
    dxTileControl1Group1: TdxTileControlGroup;
    dxTileControl1Item1: TdxTileControlItem;
    dxTileControl1Item2: TdxTileControlItem;
    dxTileControl1Item3: TdxTileControlItem;
    dxTileControl1Item4: TdxTileControlItem;
    dxTileControl1Item7: TdxTileControlItem;
    dxTileControl1Item8: TdxTileControlItem;
    dxTileControl1Item9: TdxTileControlItem;
    dxTileControl1Item10: TdxTileControlItem;
    dxTileControl1Item5: TdxTileControlItem;
    dxTileControl1Item6: TdxTileControlItem;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Image3: TImage;
    Image1: TImage;
    ActionList1: TActionList;
    Esc: TAction;
    dxTileControl1Item12: TdxTileControlItem;
    dxTileControl1Item11: TdxTileControlItem;
    ResizeKit1: TResizeKit;
    la_data: TLabel;
    la_Conne: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ImageList1: TImageList;
    N7: TMenuItem;
    N6: TMenuItem;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dxTileControl1Item1Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item9Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item4Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item8Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item5Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item2Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item3Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item7Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item10Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item6Click(Sender: TdxTileControlItem);
    procedure EscExecute(Sender: TObject);
    procedure dxTileControl1Item11Click(Sender: TdxTileControlItem);
    procedure dxTileControl1Item12Click(Sender: TdxTileControlItem);
    procedure open_all;
    procedure close_all;
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses login_Arch, Liste_etud_Arch, Divi_Arch, Class_Arch, Editeur, annee,
  Exclusion, Certificat, Doum_certifi, Releve_notes, Rel_note_Docum, ch_User,
  Back_Restore, DM_G, about, about_Haithem, show_Pass;

procedure TForm2.close_all;
begin
  try
    with DB do
     begin
      Query_Uneleve.Close;
      Query_Division.Close;
      Query_Classe.Close;
      Query_Annee.Close;
      Query_Editeur.Close;
      Query_Exclusion.Close;
      Query_Certif.Close;
      Query_Certif_Docum.Close;
      Query_Releve_notes.Close;
      Query_Rel_note_Docu.Close;
     end;
  finally
  end;

end;

procedure TForm2.dxTileControl1Item10Click(Sender: TdxTileControlItem);
begin
      Form27.ShowModal ;
end;

procedure TForm2.dxTileControl1Item11Click(Sender: TdxTileControlItem);
begin
   Form38.ShowModal ;
end;

procedure TForm2.dxTileControl1Item12Click(Sender: TdxTileControlItem);
begin
    Form34.ShowModal ;
end;

procedure TForm2.dxTileControl1Item1Click(Sender: TdxTileControlItem);
begin
   Form3.ShowModal ;
end;

procedure TForm2.dxTileControl1Item2Click(Sender: TdxTileControlItem);
begin
   Form18.ShowModal ;
end;

procedure TForm2.dxTileControl1Item3Click(Sender: TdxTileControlItem);
begin
   Form21.ShowModal ;
end;

procedure TForm2.dxTileControl1Item4Click(Sender: TdxTileControlItem);
begin
   Form9.ShowModal ;
end;

procedure TForm2.dxTileControl1Item5Click(Sender: TdxTileControlItem);
begin
   Form15.ShowModal ;
end;

procedure TForm2.dxTileControl1Item6Click(Sender: TdxTileControlItem);
begin
   Form32.ShowModal ;
end;

procedure TForm2.dxTileControl1Item7Click(Sender: TdxTileControlItem);
begin
   Form26.ShowModal ;

end;

procedure TForm2.dxTileControl1Item8Click(Sender: TdxTileControlItem);
begin
   Form12.ShowModal ;
end;

procedure TForm2.dxTileControl1Item9Click(Sender: TdxTileControlItem);
begin
   Form6.ShowModal ;
end;

procedure TForm2.EscExecute(Sender: TObject);
begin
Close;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if messagedlg('Â·  —Ìœ Œ—ÊÃ «·»—‰«„Ã ..ø',mtconfirmation, [mbyes,mbno], 0) = mryes then
  begin
    canclose := true;
    DB.FDConnection.Connected := False;
    application.terminate;
  end
  else
    canclose := false;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 open_all;
//===
   la_user.Caption := Form1.DBLookCombo_login.text ;
//==
 Formatsettings.ShortDateFormat:='yyyy/mm/dd';
 //Formatsettings.LongTimeFormat:='yyyy/mm/dd';
 Formatsettings.DateSeparator := '/';
end;

procedure TForm2.N1Click(Sender: TObject);
begin
    Form34.btn_save.Click;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
    Form34.BitBtn1.Click;
end;

procedure TForm2.N4Click(Sender: TObject);
begin
   Form35.ShowModal;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
   Form36.ShowModal;
end;

procedure TForm2.open_all;
begin
  try
    with DB do
     begin
      Query_Uneleve.Open;
      Query_Division.Open;
      Query_Classe.Open;
      Query_Annee.Open;
      Query_Editeur.Open;
      Query_Exclusion.Open;
      Query_Certif.Open;
      Query_Certif_Docum.Open;
      Query_Releve_notes.Open;
      Query_Rel_note_Docu.Open;
     end;
  finally
  end;

end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
 la_time.Caption := timeTostr(time)  ;
 la_data.Caption := DateToStr(Date)  ;
end;

end.
