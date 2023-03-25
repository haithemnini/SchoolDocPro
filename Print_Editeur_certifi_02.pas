unit Print_Editeur_certifi_02;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ResizeKit, System.Actions, Vcl.ActnList,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm39 = class(TForm)
    pnl4: TPanel;
    btn_save: TBitBtn;
    grp1: TGroupBox;
    pnl3: TPanel;
    pnl2: TPanel;
    Lbl_1: TLabel;
    Lbl_11: TLabel;
    dblkcbbDBLookCombo_class: TDBLookupComboBox;
    dblkcbbDBLookCombo_annee: TDBLookupComboBox;
    Lbl_12: TLabel;
    dblkcbbDBLookCombo_Editeur: TDBLookupComboBox;
    rszkt2: TResizeKit;
    actlst1: TActionList;
    actEsc: TAction;
    procedure actEscExecute(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form39: TForm39;

implementation

uses
  DM_G, Print_Editeur_certifi, Liste_etud_Arch;

{$R *.dfm}

procedure TForm39.actEscExecute(Sender: TObject);
begin
Close;
end;

procedure TForm39.btn_saveClick(Sender: TObject);
begin
  Form24.Certificat_show;
  Close;
end;

procedure TForm39.FormShow(Sender: TObject);
begin
    icerfi := True ;
    dblkcbbDBLookCombo_class.KeyValue := form3.DBGrid1.Fields[8].AsInteger;
    dblkcbbDBLookCombo_annee.KeyValue := form3.DBGrid1.Fields[7].AsInteger;
    dblkcbbDBLookCombo_Editeur.KeyValue := dblkcbbDBLookCombo_Editeur.ListSource.DataSet.FieldByName(dblkcbbDBLookCombo_Editeur.KeyField).Value;
    dblkcbbDBLookCombo_Editeur.SetFocus ;
    btn_save.SetFocus;
end;

end.
