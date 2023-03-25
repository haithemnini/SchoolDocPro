unit Back_Restore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,System.UITypes,
  Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ResizeKit;

type
  TForm34 = class(TForm)
    ActionList1: TActionList;
    Esc: TAction;
    GroupBox1: TGroupBox;
    btn_save: TBitBtn;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ResizeKit1: TResizeKit;
    procedure EscExecute(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure del_data;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form34: TForm34;

implementation

{$R *.dfm}

uses DM_G, Interf_Arch;

procedure TForm34.BitBtn1Click(Sender: TObject);
begin

if OpenDialog1.Execute then
 begin
    try

     Screen.Cursor := crHourGlass;
     Application.ProcessMessages;
     DB.FDConnection.Close;
     Form2.close_all;
    //====

     del_data;
     DB.Query_Restore.SQL.Clear ;
     DB.Query_Restore.SQL.Add('USE [MASTER] RESTORE DATABASE Gestion_Archives FROM DISK =' + QuotedStr(OpenDialog1.FileName));
     DB.Query_Restore.SQL.Add('WITH FIle = 1, NOUNLOAD, STATS = 5');
     DB.Query_Restore.ExecSQL ;

    finally
     Screen.Cursor := crDefault;
     MessageDlg(' „ «” —Ã«⁄ ﬁ«⁄œ… «·»Ì«‰«  »‰Ã«Õ' ,mtConfirmation,[mbok],0 );
     DB.FDConnection.Open;
     Close;
    end;
 end;
end;

procedure TForm34.btn_saveClick(Sender: TObject);
var path:string;
begin
 if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
  begin
   path := ExtractFilePath(application.ExeName);
    try
    with DB.Query_Backup do
     begin
      SQL.Clear ;
      SQL.Add('USE [MASTER] BACKUP DATABASE [Gestion_Archives] TO DISK ='''+ SaveDialog1.FileName+'_'+FormatDateTime('yyyy-mm-dd" "hh-mm-ss',Now)+'.bak'+'''') ;
      SQL.add('WITH NOFORMAT, INIT,  NAME = ''Gestion_Archives-Full Database Backup'',  SKIP, NOREWIND, NOUNLOAD, STATS = 10');
      ExecSQL ;
     //====
      MessageDlg(' „ ⁄„· ‰”Œ… «Õ Ì«ÿÌ… »‰Ã«Õ' ,mtConfirmation,[mbok],0 ); Close; exit;

     end;

    except
         ShowMessage('Database backup failed');
    end;
  end;
end;

procedure TForm34.del_data;
begin
 try
   DB.Query_Restore.SQL.Clear ;
   DB.Query_Restore.SQL.Add('DROP DATABASE Gestion_Archives;');
   DB.Query_Restore.ExecSQL ;
 finally
 end;

end;

procedure TForm34.EscExecute(Sender: TObject);
begin
 Close;
end;

procedure TForm34.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  try
    DB.FDConnection.Open;
    Form2.open_all;
  finally
  end;
end;

procedure TForm34.FormShow(Sender: TObject);
begin
 CreateDir('C:\Back UP DATA');
end;



end.
