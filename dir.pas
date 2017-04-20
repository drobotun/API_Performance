unit dir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, ShellCtrls;

type
  TdirForm = class(TForm)
    ShellTreeView: TShellTreeView;
    dirOkButton: TButton;
    Bevel1: TBevel;
    dirCancelButton: TButton;
    procedure dirOkButtonClick(Sender: TObject);
    procedure dirCancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dirForm: TdirForm;
  dirName : string;


implementation

{$R *.dfm}

procedure TdirForm.dirOkButtonClick(Sender: TObject);
begin
  dirName := ShellTreeView.Path;
  Close;
end;

procedure TdirForm.dirCancelButtonClick(Sender: TObject);
begin
  Close;
end;

end.
