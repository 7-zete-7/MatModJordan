unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, StdCtrls, MatModUtil;

type
  TFrame2 = class(TFrame)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit1Change(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frame1: TFrame;

implementation

{$R *.dfm}

uses
  Unit1;

procedure TFrame2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  i,j: Integer;
  q: TDrob;
begin
  if Form1.CheckBox1.Checked then Exit;
  j:=0;
  for i:=0 to ACol-1 do
    Inc(j,Self.StringGrid1.ColWidths[i]+1);
  Self.Edit1.Left:=j;
  j:=0;
  for i:=0 to ARow-1 do
    Inc(j,Self.StringGrid1.RowHeights[i]+1);
  Self.Edit1.Top:=j;
  Self.Edit1.Width:=Self.StringGrid1.ColWidths[ACol]+1;
  Self.Edit1.Height:=Self.StringGrid1.RowHeights[ARow]+1;
  Self.Edit1.Text:=Self.StringGrid1.Cells[ACol,ARow];
  Self.Edit1.Visible:=True;
  if Self.StringGrid1.Cells[1,0]='  1' then
    begin
      q:=MDiv(MStrToDrob (Self.StringGrid1.Cells[1,ARow]), MStrToDrob (Self.StringGrid1.Cells[ACol,ARow]));
      Form1.Label7.Caption:='Соотношение='+MDrobToStr (MDSokr (q));;
    end;
end;

procedure TFrame2.Edit1Change(Sender: TObject);
begin
//  Self.StringGrid1.Cells[Self.StringGrid1.Col, Self.StringGrid1.Row]:=Self.Edit1.Text;
end;

procedure TFrame2.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key<>#8) and ((Key<#48) or (Key>#57)) and (Key<>'/') and (Key<>'-') then Key:=#0;
end;

end.
