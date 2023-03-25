program SchoolDocPro;

uses
  Vcl.Forms,
  login_Arch in 'login_Arch.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  DM_G in 'DM_G.pas' {DB: TDataModule},
  Interf_Arch in 'Interf_Arch.pas' {Form2},
  Liste_etud_Arch in 'Liste_etud_Arch.pas' {Form3},
  Add_etud_Arch in 'Add_etud_Arch.pas' {Form4},
  Edit_etud_Arch in 'Edit_etud_Arch.pas' {Form5},
  Divi_Arch in 'Divi_Arch.pas' {Form6},
  Add_Divi_Arch in 'Add_Divi_Arch.pas' {Form7},
  Edit_Divi_Arch in 'Edit_Divi_Arch.pas' {Form8},
  Class_Arch in 'Class_Arch.pas' {Form9},
  Add_Class_Arch in 'Add_Class_Arch.pas' {Form10},
  Edit_Class_Arch in 'Edit_Class_Arch.pas' {Form11},
  Editeur in 'Editeur.pas' {Form12},
  Add_Editeur in 'Add_Editeur.pas' {Form13},
  edit_Editeur in 'edit_Editeur.pas' {Form14},
  annee in 'annee.pas' {Form15},
  Add_annee in 'Add_annee.pas' {Form16},
  edit_annee in 'edit_annee.pas' {Form17},
  Exclusion in 'Exclusion.pas' {Form18},
  Add_Exclusion in 'Add_Exclusion.pas' {Form19},
  edit_Exclusion in 'edit_Exclusion.pas' {Form20},
  Certificat in 'Certificat.pas' {Form21},
  add_Certificat in 'add_Certificat.pas' {Form22},
  edit_Certificat in 'edit_Certificat.pas' {Form23},
  Print_doum_certifi in 'Print_doum_certifi.pas' {Form25},
  Doum_certifi in 'Doum_certifi.pas' {Form26},
  Releve_notes in 'Releve_notes.pas' {Form27},
  add_Releve_notes in 'add_Releve_notes.pas' {Form28},
  edit_Releve_notes in 'edit_Releve_notes.pas' {Form29},
  Releve_notes_sech in 'Releve_notes_sech.pas' {Form30},
  Print_doum_Ref in 'Print_doum_Ref.pas' {Form31},
  Rel_note_Docum in 'Rel_note_Docum.pas' {Form32},
  ch_User in 'ch_User.pas' {Form33},
  Back_Restore in 'Back_Restore.pas' {Form34},
  about in 'about.pas' {Form35},
  about_Haithem in 'about_Haithem.pas' {Form36},
  exp_ele in 'exp_ele.pas' {Form37},
  show_Pass in 'show_Pass.pas' {Form38},
  Print_Editeur_certifi_02 in 'Print_Editeur_certifi_02.pas' {Form39},
  show_Pass_Admin in 'show_Pass_Admin.pas' {Form40};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(TDB, DB);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TForm21, Form21);
  Application.CreateForm(TForm22, Form22);
  Application.CreateForm(TForm23, Form23);
  Application.CreateForm(TForm25, Form25);
  Application.CreateForm(TForm26, Form26);
  Application.CreateForm(TForm27, Form27);
  Application.CreateForm(TForm28, Form28);
  Application.CreateForm(TForm29, Form29);
  Application.CreateForm(TForm30, Form30);
  Application.CreateForm(TForm31, Form31);
  Application.CreateForm(TForm32, Form32);
  Application.CreateForm(TForm33, Form33);
  Application.CreateForm(TForm34, Form34);
  Application.CreateForm(TForm35, Form35);
  Application.CreateForm(TForm36, Form36);
  Application.CreateForm(TForm37, Form37);
  Application.CreateForm(TForm38, Form38);
  Application.CreateForm(TForm39, Form39);
  Application.CreateForm(TForm40, Form40);
  Application.Run;
end.
