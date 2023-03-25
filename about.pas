unit about;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  ResizeKit, System.Actions, Vcl.ActnList, dxGDIPlusClasses;

type
  TForm35 = class(TForm)
    Panel2: TPanel;
    btn_cancel: TBitBtn;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    ActionList1: TActionList;
    Esc: TAction;
    ResizeKit1: TResizeKit;
    Lbl_1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form35: TForm35;

implementation

{$R *.dfm}

procedure TForm35.btn_cancelClick(Sender: TObject);
begin
 Close;
end;

procedure TForm35.FormShow(Sender: TObject);
begin
  btn_cancel.SetFocus;
end;

end.
