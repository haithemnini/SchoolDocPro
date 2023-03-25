unit Add_Exclusion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox,System.UITypes, System.Actions,
  Vcl.ActnList, ResizeKit;

type
  TForm19 = class(TForm)
    Panel2: TPanel;
    btn_save: TBitBtn;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edt_Pren: TEdit;
    edt_Nom: TEdit;
    DateTimePicker1: TDateTimePicker;
    edt_Raison: TEdit;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    DBLookCombo_class: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure clEdit;
    procedure btn_saveClick(Sender: TObject);
    procedure edt_PrenKeyPress(Sender: TObject; var Key: Char);
    procedure edt_NomExit(Sender: TObject);
    procedure edt_PrenExit(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

{$R *.dfm}

uses DM_G, Exclusion, edit_Exclusion;

procedure TForm19.btn_cancelClick(Sender: TObject);
begin
Close;
end;

procedure TForm19.btn_saveClick(Sender: TObject);
 var iNom ,iExc:Integer ;
begin
 btn_save.SetFocus ;
 if (edt_Pren.Text = '') or (edt_Nom.Text = '') then
   begin
     MessageDlg('Ì—ÃÏ „·«¡ «·»Ì«‰«  «··«“„…' ,mtWarning,[mbok],0 ) ;
     Exit;
   end
    else
     begin
      if DB.Query_Exclusion.RecordCount > 0 then
        begin
          DB.Query_Exclusion.Last;
          iExc := Form18.DBGrid1.Fields[0].AsInteger + 1 ;
        end else iExc := 1 ;
     //====
      if DB.Query_Uneleve.Locate('Pren_ele;Nom_ele',VarArrayOf([edt_Pren.Text,edt_Nom.Text]),[]) then
       begin
        iNom := DB.Query_Uneleve['Num_ele'];
       //====

        if DB.Query_Exclusion.Locate('Num_ele',iNom,[]) then  iNom := 0 ;


       //====
       end else iNom := 0 ;
     //====

      if iNom = 0  then
        begin
           MessageDlg('Ì—ÃÏ  €Ì— «·«”„ «Ê «··ﬁ»', mtWarning,[mbYes], 0);
           edt_Nom.SetFocus;
           Exit ;
        end
         else
          begin
             with DB do
              begin
               Query_Exclusion.Append;

               Query_Exclusion['Num_Rapp_exclu']                      := iExc             ;
               Query_Exclusion['Nom_Rapp_exclu']                      := DBLookCombo_class.Text ;
               Query_Exclusion['Raison']                              := Trim(edt_Raison.Text) ;
               Query_Exclusion['Date_exclu_sorti']                    := DateTimePicker1.Date ;
               Query_Exclusion['Num_ele']                             := iNom ;
              end;
         //====
             DB.Query_Exclusion.Post;
             MessageDlg(' „ «÷«›… «·„ﬁ—— ·· ·„Ì– »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
             close;
         end;
     end;
end;

procedure TForm19.clEdit;
begin
   edt_Pren.Clear;
   edt_Nom.Clear;
   edt_Raison.Clear;
   DateTimePicker1.Date := Now;
   DBLookCombo_class.KeyValue := DBLookCombo_class.ListSource.DataSet.FieldByName(DBLookCombo_class.KeyField).Value;
end;

procedure TForm19.edt_NomExit(Sender: TObject);
begin
     edt_Nom.Text := Trim(edt_Nom.Text);
end;

procedure TForm19.edt_PrenExit(Sender: TObject);
begin
 edt_Pren.Text := Trim(edt_Pren.Text);
end;

procedure TForm19.edt_PrenKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   begin
    btn_save.SetFocus;
    btn_save.Click ;
   end;
end;

procedure TForm19.FormShow(Sender: TObject);
begin
    clEdit;
    edt_Nom.SetFocus ;
end;

end.
