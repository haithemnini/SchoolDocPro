unit Releve_notes_sech;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,System.UITypes,
  System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm30 = class(TForm)
    Panel2: TPanel;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edt_Nom: TEdit;
    edt_Num_doum: TEdit;
    Edit1: TEdit;
    edt_Pren: TEdit;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    procedure FormShow(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form30: TForm30;

implementation

{$R *.dfm}

uses DM_G, Liste_etud_Arch;

procedure TForm30.btn_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TForm30.FormShow(Sender: TObject);
begin
   btn_cancel.SetFocus ;
  if DB.Query_Releve_notes.Locate('Num_ele',Form3.DBGrid1.Fields[0].AsInteger,[]) then
   begin
     edt_Num_doum.Text :=  DB.Query_Releve_notes['Nom_Rel_not'];
     Edit1.Text        := DB.Query_Releve_notes['Archi_Rel_not'];


     edt_Nom.Text    := Form3.DBGrid1.Fields[1].AsString ;
     edt_Pren.Text   := Form3.DBGrid1.Fields[2].AsString ;

   end;

end;

end.
