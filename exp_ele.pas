unit exp_ele;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, ResizeKit, System.Actions, Vcl.ActnList,System.UITypes;

type
  TForm37 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Panel2: TPanel;
    btn_save: TBitBtn;
    cbb2: TComboBox;
    Lbl_1: TLabel;
    dtp1: TDateTimePicker;
    actlst1: TActionList;
    actEsc: TAction;
    rszkt1: TResizeKit;
    procedure FormShow(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEscExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbb2KeyPress(Sender: TObject; var Key: Char);
    procedure dtp1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form37: TForm37;
  myclas_certif :Integer ;

implementation

uses
  DM_G, Liste_etud_Arch, Exclusion;

{$R *.dfm}

procedure TForm37.actEscExecute(Sender: TObject);
begin
 Close ;
end;

procedure TForm37.btn_saveClick(Sender: TObject);
begin
  if DB.Query_Exclusion.Locate('Num_ele',Form3.DBGrid1.Fields[0].AsInteger,[]) then
    begin
    //===„ÊÃÊœ „”»ﬁ«
     with DB do
      begin
       Query_Exclusion.Edit;
       Query_Exclusion['Num_Rapp_exclu']                                      := Form18.DBGrid1.Fields[0].AsInteger;
       Query_Exclusion['Nom_Rapp_exclu']                                      := Form3.DBGrid1.Fields[10].AsString;
       Query_Exclusion['Date_exclu_sorti']                                    := dtp1.Date ;
       Query_Exclusion['Raison']                                              := cbb2.Text ;
       Query_Exclusion['Num_ele']                                             := Form3.DBGrid1.Fields[0].AsInteger ;
       Query_Exclusion.Post;

       MessageDlg(' „ ›’·  ·„Ì– »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
       close;
      end;
    end
  else
   begin
   //===€Ì— „ÊÃÊœ
    if DB.Query_Exclusion.RecordCount > 0 then
     begin
         DB.Query_Exclusion.Last;
         myclas_certif := Form18.DBGrid1.Fields[0].AsInteger + 1 ;
     end
    else myclas_certif := 1 ;

    with DB do
     begin
      Query_Exclusion.Append;
      Query_Exclusion['Num_Rapp_exclu']                                      := myclas_certif             ;
      Query_Exclusion['Nom_Rapp_exclu']                                      := Form3.DBGrid1.Fields[10].AsString;
      Query_Exclusion['Date_exclu_sorti']                                    := dtp1.Date ;
      Query_Exclusion['Raison']                                              := cbb2.Text ;
      Query_Exclusion['Num_ele']                                             := Form3.DBGrid1.Fields[0].AsInteger ;
      Query_Exclusion.Post;
     end;

     MessageDlg(' „ ›’·  ·„Ì– »‰Ã«Õ ', mtConfirmation,[mbYes], 0);
     close;
   end;
end;

procedure TForm37.cbb2KeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then btn_save.Click;
end;

procedure TForm37.dtp1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then btn_save.Click;
end;

procedure TForm37.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Close;
end;

procedure TForm37.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then btn_save.Click;
end;

procedure TForm37.FormShow(Sender: TObject);
begin
    dtp1.Date := Now;
    btn_save.SetFocus;
end;

end.
