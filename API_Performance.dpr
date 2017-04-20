program API_Performance;

uses
  Forms,
  main in 'main.pas' {mainForm},
  graph in 'graph.pas',
  check in 'check.pas',
  trust in 'trust.pas',
  savefile in 'savefile.pas',
  dir in 'dir.pas' {dirForm},
  about in 'about.pas' {aboutForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TdirForm, dirForm);
  Application.CreateForm(TaboutForm, aboutForm);
  Application.Run;
end.
