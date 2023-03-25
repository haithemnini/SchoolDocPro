unit DM_G;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, frxClass, frxDBSet, frxGradient , StrUtils,System.IniFiles,
  Data.Win.ADODB, FireDAC.Comp.UI ;

type
  TDB = class(TDataModule)
    Query_Users: TFDQuery;
    ds_Query_Users: TDataSource;
    Query_Uneleve: TFDQuery;
    Query_Division: TFDQuery;
    Query_Classe: TFDQuery;
    Query_Annee: TFDQuery;
    ds_Query_Uneleve: TDataSource;
    ds_Query_Annee: TDataSource;
    ds_Query_Classe: TDataSource;
    ds_Query_Division: TDataSource;
    Query_DivisionNum_divisi: TIntegerField;
    Query_DivisionNom_divisi: TWideStringField;
    Query_ClasseNum_class: TIntegerField;
    Query_ClasseNum_divisi: TIntegerField;
    Query_AnneeNum_annee_scol: TIntegerField;
    Query_AnneeAnnee_scol: TDateField;
    Query_Classedivisi: TStringField;
    Query_Editeur: TFDQuery;
    ds_Query_Editeur: TDataSource;
    Query_Exclusion: TFDQuery;
    ds_Query_Exclusion: TDataSource;
    Query_ExclusionNum_Rapp_exclu: TIntegerField;
    Query_ExclusionDate_exclu_sorti: TDateField;
    Query_ExclusionRaison: TStringField;
    Query_ExclusionNum_ele: TIntegerField;
    Query_Exclusionnom: TStringField;
    Query_ExclusionPren: TStringField;
    Query_ClasseNom_class: TWideStringField;
    Query_Certif: TFDQuery;
    ds_Query_Certif: TDataSource;
    Query_CertifNum_certifi: TIntegerField;
    Query_CertifNom_certifi: TStringField;
    Query_CertifDate_edit_certifi: TDateField;
    Query_CertifNum_edit: TIntegerField;
    Query_CertifNum_ele: TIntegerField;
    Query_Certifnom: TStringField;
    Query_CertifPren: TStringField;
    Query_CertifEditeur: TStringField;
    Rep_Certif: TfrxReport;
    DB_Certif: TfrxDBDataset;
    frxGradientObject1: TfrxGradientObject;
    Query_Certif_Docum: TFDQuery;
    ds_Query_Certif_Docum: TDataSource;
    Re_Certif_docu: TfrxReport;
    DB_Re_Certif_docu: TfrxDBDataset;
    Query_Certif_Documnom: TStringField;
    Query_Certif_DocumPren: TStringField;
    Query_Releve_notes: TFDQuery;
    ds_Query_Releve_notes: TDataSource;
    Query_Releve_notesNom_Rel_not: TStringField;
    Query_Releve_notesArchi_Rel_not: TWideStringField;
    Query_Releve_notesNum_ele: TIntegerField;
    Query_Releve_notesNom_ele: TStringField;
    Query_Releve_notesPren_ele: TStringField;
    Query_Releve_notesNum_Rel_not: TIntegerField;
    ds_Query_Rel_note_Docu: TDataSource;
    Rel_docu: TfrxReport;
    DB_Rel_docu: TfrxDBDataset;
    Query_Certif_DocumNum_cer_docu: TIntegerField;
    Query_Certif_DocumNum_cer_conta: TWideStringField;
    Query_Certif_DocumNom_cer_instit_envo: TWideStringField;
    Query_Certif_DocumNom_cer_docu: TStringField;
    Query_Certif_DocumDate_cer_conta: TDateField;
    Query_Certif_DocumNum_certifi: TIntegerField;
    Query_Rel_note_Docu: TFDQuery;
    Query_Rel_note_DocuNum_rel_docu: TIntegerField;
    Query_Rel_note_DocuNom_rel_instit_envo: TWideStringField;
    Query_Rel_note_DocuNom_rel_docu: TStringField;
    Query_Rel_note_DocuDate_rel_conta: TDateField;
    Query_Rel_note_DocuNum_Rel_not: TIntegerField;
    Query_Rel_note_DocuNom_ele: TStringField;
    Query_Rel_note_DocuPren_ele: TStringField;
    Query_Rel_note_DocuNum_rel_conta: TWideStringField;
    FDManager1: TFDManager;
    Query_Backup: TFDQuery;
    Query_Restore: TFDQuery;
    FDConnection: TFDConnection;
    Query_EditeurNum_edit: TIntegerField;
    Query_EditeurNom_edit: TStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQuery1: TFDQuery;
    Query_ExclusionNom_Rapp_exclu: TWideStringField;
    fdqry1: TFDQuery;
    intgrfld1: TIntegerField;
    strngfld1: TStringField;
    strngfld2: TStringField;
    dtfld1: TDateField;
    wdstrngfld1: TWideStringField;
    wdstrngfld2: TWideStringField;
    strngfld3: TStringField;
    intgrfld2: TIntegerField;
    intgrfld3: TIntegerField;
    dtfld2: TDateField;
    strngfld4: TStringField;
    intgrfld4: TIntegerField;
    strngfld5: TStringField;
    intgrfldQuery_UneleveNum_ele: TIntegerField;
    strngfldQuery_UnelevePren_ele: TStringField;
    strngfldQuery_UneleveNom_ele: TStringField;
    dtfldQuery_UneleveDate_naiss_ele: TDateField;
    wdstrngfldQuery_UneleveLieu_naiss_ele: TWideStringField;
    wdstrngfldQuery_UneleveAdr_ele: TWideStringField;
    strngfldQuery_UneleveNom_gardi: TStringField;
    intgrfldQuery_UneleveNum_annee_scol: TIntegerField;
    intgrfldQuery_UneleveNum_class: TIntegerField;
    Query_UneleveAnnee: TDateField;
    Query_Uneleveclass: TStringField;
    intgrfldQuery_Uneleveaa: TIntegerField;
    strngfldQuery_UneleveStringField11: TStringField;
    procedure Query_ClasseFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure Query_ExclusionFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure Query_CertifFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure Query_Releve_notesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure Query_Certif_DocumFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure Query_Rel_note_DocuFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure Query_UneleveFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DB: TDB;
    oDef: IFDStanConnectionDef;
    oParams: TFDPhysMSSQLConnectionDefParams; // MSSQL connection params
implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Edit_etud_Arch, Liste_etud_Arch, Class_Arch, Exclusion, Certificat,
  Releve_notes, Doum_certifi, Rel_note_Docum, login_Arch, Interf_Arch;

{$R *.dfm}



procedure TDB.FDConnectionAfterConnect(Sender: TObject);
begin
 Form2.la_Conne.Caption := 'متصل بقاعدة البيانات';
end;

procedure TDB.FDConnectionBeforeConnect(Sender: TObject);
begin
 Form2.la_Conne.Caption := 'غير متصل بقاعدة البيانات';
end;

procedure TDB.Query_CertifFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if Form21.R_Nom.Checked = True  then
       Accept := AnsiContainsText(DataSet.FieldByName('nom').AsString, Form21.SearchBox1.Text);

  if Form21.R_Pren.Checked = True  then
       Accept := AnsiContainsText(DataSet.FieldByName('Pren').AsString, Form21.SearchBox1.Text);

   if Form21.R_namedit.Checked = True  then
       Accept := AnsiContainsText(DataSet.FieldByName('Editeur').AsString, Form21.SearchBox1.Text);
end;

procedure TDB.Query_Certif_DocumFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
 if Form26.R_Nom.Checked = True  then
       Accept := AnsiContainsText(DataSet.FieldByName('nom').AsString, Form26.SearchBox1.Text);

  if Form26.R_Pern.Checked = True  then
       Accept := AnsiContainsText(DataSet.FieldByName('Pren').AsString, Form26.SearchBox1.Text);
end;

procedure TDB.Query_ClasseFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
 if Form9.R_divi_nom.Checked = True  then
     Accept := Pos(UpperCase(Form9.asSearchBox2.Text),UpperCase(DataSet.FieldByName('divisi').AsString)) > 0;
end;

procedure TDB.Query_ExclusionFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
   if Form18.R_Nom.Checked = True  then
       Accept := AnsiContainsText(DataSet.FieldByName('nom').AsString, Form18.SearchBox1.Text);

   if Form18.R_Pren.Checked = True  then
       Accept := AnsiContainsText(DataSet.FieldByName('Pren').AsString, Form18.SearchBox1.Text);
end;

procedure TDB.Query_Releve_notesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Form27.R_Pren.Checked = True  then
       Accept := AnsiContainsText(DataSet.FieldByName('Pren_ele').AsString, Form27.SearchBox1.Text);

  if Form27.R_Nom.Checked = True  then
       Accept := AnsiContainsText(DataSet.FieldByName('Nom_ele').AsString, Form27.SearchBox1.Text);
end;

procedure TDB.Query_Rel_note_DocuFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Form32.R_Nom.Checked = True  then
       Accept := AnsiContainsText(DataSet.FieldByName('Nom_ele').AsString, Form32.SearchBox1.Text);

  if Form32.R_Pern.Checked = True  then
       Accept := AnsiContainsText(DataSet.FieldByName('Pren_ele').AsString, Form32.SearchBox1.Text);
end;

procedure TDB.Query_UneleveFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
 //if Form3.R_class.Checked = True  then

   // Accept := Pos(UpperCase(Form3.SearchBox1.Text),UpperCase(DataSet.FieldByName('class').AsString)) > 0;


      // Accept := Pos(UpperCase(Form3.SearchBox1.text),UpperCase(Query_Uneleve.FieldByName('class').AsString))>0;
  // Accept := AnsiContainsText(DataSet.FieldByName('class').AsString, Form3.SearchBox1.Text);
  // Accept := Query_Uneleve.FieldByName('class').AsString = Form3.SearchBox1.Text;
  //  Accept := DataSet['class'].AsString = Form3.SearchBox1.Text;
//
//
//   Accept:=False;
//   if Pos('Hardware',          DataSet.FieldByName('CustomerName').AsString)) then
//      Accept:=True;


      {
     if DataSet.FieldByName('class').AsString = Form3.SearchBox1.Text then
         Accept := True
          else
           Accept := False ;
   }
end;

end.
