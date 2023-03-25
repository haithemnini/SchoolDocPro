unit about_Haithem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, acPNG, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, System.Actions, Vcl.ActnList, ResizeKit;

type
  TForm36 = class(TForm)
    Panel2: TPanel;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ResizeKit1: TResizeKit;
    ActionList1: TActionList;
    Esc: TAction;
    procedure FormShow(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form36: TForm36;

implementation

{$R *.dfm}

procedure TForm36.btn_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TForm36.FormShow(Sender: TObject);
begin
   btn_cancel.SetFocus;
end;

end.
