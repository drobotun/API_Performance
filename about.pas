unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TaboutForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    aboutButton: TButton;
    Bevel1: TBevel;
    procedure aboutButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  aboutForm: TaboutForm;

implementation

{$R *.dfm}

procedure TaboutForm.aboutButtonClick(Sender: TObject);
begin
  Close;
end;

end.
