unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Menus, graph, check, trust, savefile;

type
  TmainForm = class(TForm)
    indexEdit: TEdit;
    indexUpDown: TUpDown;
    Label1: TLabel;
    APIComboBox: TComboBoxEx;
    Label2: TLabel;
    timeAPIEdit: TEdit;
    trustComboBox: TComboBoxEx;
    Label3: TLabel;
    Label4: TLabel;
    trustLEdit: TEdit;
    Label5: TLabel;
    trustREdit: TEdit;
    Bevel1: TBevel;
    exitButton: TButton;
    Bevel2: TBevel;
    graphPaintBox: TPaintBox;
    startButton: TButton;
    sigmaEdit: TEdit;
    Label6: TLabel;
    MainMenu: TMainMenu;
    fileItem: TMenuItem;
    N2: TMenuItem;
    dirItem: TMenuItem;
    saveItem: TMenuItem;
    bevelItem: TMenuItem;
    exitItem: TMenuItem;
    Label8: TLabel;
    zoomEdit: TEdit;
    zoomUpDown: TUpDown;
    Label9: TLabel;
    refreshButton: TButton;
    Label7: TLabel;
    trustLCheckBox: TCheckBox;
    trustRCheckBox: TCheckBox;
    SaveFile: TSaveDialog;
    procedure exitButtonClick(Sender: TObject);
    procedure startButtonClick(Sender: TObject);
    procedure indexEditKeyPress(Sender: TObject; var Key: Char);
    procedure exitItemClick(Sender: TObject);
    procedure zoomEditKeyPress(Sender: TObject; var Key: Char);
    procedure refreshButtonClick(Sender: TObject);
    procedure indexUpDownChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure saveItemClick(Sender: TObject);
    procedure dirItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainForm : TmainForm;
  APIresult : array of real;
  
implementation

uses dir, about;

{$R *.dfm}

procedure TmainForm.exitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TmainForm.startButtonClick(Sender: TObject);
begin
  clearWorkRect;
  setLength(APIresult, getIndex);
  case mainForm.APIComboBox.ItemIndex of
    0 : begin
         checkCreateFile;
         APIName := 'CreateFile';
        end;
    1 : begin
         checkReadFile;
         APIName := 'ReadFile';
        end;
    2 : begin
         checkWriteFile;
         APIName := 'WriteFile';
        end;
    3 : begin
         checkDeleteFile;
         APIName := 'DeleteFile';
        end;
    4 : begin
         checkMoveFile;
         APIName := 'MoveFile';
        end;
    5 : begin
         checkCopyFile;
         APIName := 'CopyFile';
        end;
    6 : begin
         checkRemoveDirectory;
         APIName := 'RemoveDirectory';
        end;
    7 : begin
         checkCreateDirectory;
         APIName := 'CreateDirectory';
        end;
  end;
  mainForm.timeAPIEdit.Text := floattostr(getSumm);
  mainform.sigmaEdit.Text := floattostr(getSigma);
  mainForm.trustLEdit.Text := floattostr(getLTrust);
  mainForm.trustREdit.Text := floattostr(getRTrust);
  setGraph;
  refreshButton.Enabled := true;
  saveItem.Enabled := true;
end;

procedure TmainForm.indexEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #13, #8]) then Key := #0;
  if Key = #13 then
    mainForm.startButton.Click;
end;

procedure TmainForm.exitItemClick(Sender: TObject);
begin
  Close;
end;

procedure TmainForm.zoomEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #13, #8]) then Key := #0;
  if ((Key = #13) and mainForm.refreshButton.Enabled) then
    setGraph;
end;

procedure TmainForm.refreshButtonClick(Sender: TObject);
begin
  setGraph;
end;

procedure TmainForm.indexUpDownChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  refreshButton.Enabled := false;
end;

procedure TmainForm.saveItemClick(Sender: TObject);
begin
  with SaveFile do
    if Execute then begin
      saveFileName := FileName;
      saveResult;
    end;
end;

procedure TmainForm.dirItemClick(Sender: TObject);
begin
  dirForm.ShowModal;
end;

procedure TmainForm.FormCreate(Sender: TObject);
begin
  mainForm.APIComboBox.itemindex := 0;
  mainForm.trustComboBox.itemindex := 0;
  dirName := GetCurrentDir;
end;

procedure TmainForm.N2Click(Sender: TObject);
begin
  aboutForm.ShowModal;
end;

end.

