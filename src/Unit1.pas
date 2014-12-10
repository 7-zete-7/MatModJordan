unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, Unit2, Buttons, MatModUtil, Spin, ShellApi,
  Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Frame21: TFrame2;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Frame22: TFrame2;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    Panel5: TPanel;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SpeedButton5: TSpeedButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    CheckBox2: TCheckBox;
    SpeedButton7: TSpeedButton;
    Label7: TLabel;
    CheckBox3: TCheckBox;
    Button1: TButton;
    ListBox1: TListBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SpeedButton6: TSpeedButton;
    SaveDialog1: TSaveDialog;
    SpeedButton8: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Frame22StringGrid1SelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure Frame21StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Frame22StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Frame21Edit1Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Frame21StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Step, Rang: Integer;

implementation

uses StrUtils;

var
  BakTabl1, BakTabl2: TTabl;
  StringGrid: array[1..99] of TStringGrid;

{$R *.dfm}

procedure SPom(var a,b: string; flag: Integer = 0);
var
  c: string;
begin
  case flag of
    0: begin
         c:=a;
         a:=b;
         b:=c;
       end;
  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  if Self.ClientWidth<>536 then
    begin
      Self.ClientWidth:=536;
      Self.Panel3.Visible:=False;
    end
  else
    begin
      Self.ClientWidth:=800;
      Self.Panel3.Visible:=True;
    end;
end;

procedure TForm1.Frame22StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  Visible:=Visible;

end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
  i,ARow,ACol: Integer;
begin
  if Self.CheckBox1.Checked then
    begin
      for ACol:=1 to Self.Frame21.StringGrid1.ColCount-1 do
        for ARow:=1 to Self.Frame21.StringGrid1.RowCount-1 do
          if Self.Frame21.StringGrid1.Cells[ACol,ARow]='' then
            begin
              ShowMessage('Таблица заполнена не целиком!');
              Exit;
            end;
      Self.Frame21.StringGrid1.Options:=Self.Frame21.StringGrid1.Options-[goEditing]; 
      Self.CheckBox1.Checked:=False;
      MRefreshGrid(Self.Frame21.StringGrid1);
      Self.SpeedButton1.Enabled:=False;
      Self.SpeedButton3.Caption:='Перейти к редактированию'; 
      Self.SpeedButton4.Enabled:=True;    
      Self.SpeedButton5.Enabled:=False;
      Self.RadioButton1.Enabled:=False;
      Self.RadioButton2.Enabled:=False;
      Self.GroupBox1.Enabled:=False;
      Self.SpeedButton7.Enabled:=False;
    end
  else
    begin
      Self.Frame21.StringGrid1.Options:=Self.Frame21.StringGrid1.Options+[goEditing];//+[goAlwaysShowEditor];
      Self.Frame21.Edit1.Visible:=False;
      Self.CheckBox1.Checked:=True;
      MRefreshGrid(Self.Frame21.StringGrid1); 
      Self.SpeedButton1.Enabled:=True;  
      Self.SpeedButton3.Caption:='Выбрать разрешающий элемент';
      Self.SpeedButton4.Enabled:=False;  
      Self.SpeedButton5.Enabled:=True;
      Self.RadioButton1.Enabled:=True;
      Self.RadioButton2.Enabled:=True; 
      Self.GroupBox1.Enabled:=True;
      Self.SpeedButton7.Enabled:=True;
    end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  i,j,k: Integer;
begin
  Self.Frame21.StringGrid1.ColCount:=Self.Frame22.StringGrid1.ColCount;
  Self.Frame21.StringGrid1.RowCount:=Self.Frame22.StringGrid1.RowCount;
  for i:=0 to Self.Frame22.StringGrid1.RowCount do
    for j:=0 to Self.Frame22.StringGrid1.ColCount do
      Self.Frame21.StringGrid1.Cells[j,i]:=Self.Frame22.StringGrid1.Cells[j,i];
  MGridResize(Self.Frame21.StringGrid1);
  Self.SpinEdit1.Text:=IntToStr(Self.Frame22.StringGrid1.ColCount-1);
  Self.SpinEdit2.Text:=IntToStr(Self.Frame22.StringGrid1.RowCount-1);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
var
  i,j: Integer;
  Tabl: TTabl;
  q: array[1..2,1..99] of string;
begin
  MStringGridToTabl(Tabl, Self.Frame21.StringGrid1);
  for i:=1 to 99 do
    begin
      q[1,i]:=Self.Frame21.StringGrid1.Cells[0,i];
      q[2,i]:=Self.Frame21.StringGrid1.Cells[i,0];
    end;
  if Self.RadioButton1.Checked then
    if not MJordan(Tabl, Self.Frame21.StringGrid1.Col, Self.Frame21.StringGrid1.Row, False) then
      Exit
    else
      begin
      end
  else
    if not MJordan(Tabl, Self.Frame21.StringGrid1.Col, Self.Frame21.StringGrid1.Row, True) then
      Exit;
  if Self.CheckBox3.Checked then
  for i:=1 to Tabl.y do
    if q[2,i]=' -0' then
      begin
        Tabl.y:=Tabl.y-1;
        for j:=i to Self.Frame21.StringGrid1.ColCount do
          begin
            Tabl.Tabl[j]:=Tabl.Tabl[j+1];
            q[2,j]:=q[2,j+1];
          end;
      end;
  MTablToStringGrid(Tabl, Self.Frame22.StringGrid1);
  MGridResize(Self.Frame22.StringGrid1);
  for i:=1 to 99 do
    begin
      Self.Frame22.StringGrid1.Cells[0,i]:=q[1,i];
      Self.Frame22.StringGrid1.Cells[i,0]:=q[2,i];
    end;
  i:=Self.Frame21.StringGrid1.Col;     // x
  j:=Self.Frame21.StringGrid1.Row;     // y
  Self.ListBox1.Items.Add(Self.Frame22.StringGrid1.Cells[i,0]+'<->'+Self.Frame22.StringGrid1.Cells[0,j]);
  Self.Frame22.StringGrid1.Cells[i,0]:=LeftStr(Self.Frame22.StringGrid1.Cells[i,0],2)+RightStr(Self.Frame21.StringGrid1.Cells[0,j],Length(Self.Frame21.StringGrid1.Cells[0,j])-2);
  Self.Frame22.StringGrid1.Cells[0,j]:=LeftStr(Self.Frame22.StringGrid1.Cells[0,j],2)+RightStr(Self.Frame21.StringGrid1.Cells[i,0],Length(Self.Frame21.StringGrid1.Cells[i,0])-2);
  Self.Frame21.Edit1.Enabled:=True;
  Self.CheckBox3Click(Sender);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Self.Frame21.SetFocus;
  Self.Frame21.StringGrid1.SetFocus;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
var
  i: Integer;
begin                  
  //if LeftStr(Self.Frame21.StringGrid1.Cells[2,0],2)<>' -' then Exit;
  with Self.Frame21.StringGrid1 do
    for i:=1 to 999 do
      Cells[i,0]:='  '+RightStr(Cells[i,0],Length(Cells[i,0])-2);
  with Self.Frame22.StringGrid1 do
    for i:=1 to 999 do
      Cells[i,0]:='  '+RightStr(Cells[i,0],Length(Cells[i,0])-2);
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
var
  i: Integer;
begin
  if LeftStr(Self.Frame21.StringGrid1.Cells[1,0],2)=' -' then Exit;
  with Self.Frame21.StringGrid1 do
    for i:=1 to 999 do
      if Cells[i,0]<>'  1' then
        Cells[i,0]:=' -'+RightStr(Cells[i,0],Length(Cells[i,0])-2);
  with Self.Frame22.StringGrid1 do
    for i:=1 to 999 do
      Cells[i,0]:=' -'+RightStr(Cells[i,0],Length(Cells[i,0])-2);
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
var
  i,j: Integer;
begin
  if Self.CheckBox3.Checked then
  begin
  for i:=1 to Self.Frame22.StringGrid1.ColCount do
    if Copy(Self.Frame22.StringGrid1.Cells[i,0],3,1)='0' then
      begin
        for j:=i to Self.Frame22.StringGrid1.ColCount-1 do
          Self.Frame22.StringGrid1.Cols[j]:=Self.Frame22.StringGrid1.Cols[j+1];
        Self.Frame22.StringGrid1.ColCount:=Self.Frame22.StringGrid1.ColCount-1;
      end;
  MGridResize(Self.Frame22.StringGrid1);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
//  MProst;
  Self.Panel3.Width:=265;
  Self.ClientHeight:=400;
  Self.ClientWidth:=800;
  for i:=1 to 99 do
    Self.Frame21.StringGrid1.Cells[i,0]:='  x'+IntToStr(i);
  for i:=1 to 99 do
    Self.Frame21.StringGrid1.Cells[0,i]:='  y'+IntToStr(i);
  for i:=1 to 99 do
    Self.Frame22.StringGrid1.Cells[i,0]:='  x'+IntToStr(i);
  for i:=1 to 99 do
    Self.Frame22.StringGrid1.Cells[0,i]:='  y'+IntToStr(i);
  for i:=1 to 99 do
    StringGrid[i]:=Self.Frame22.StringGrid1;
  Self.Frame21.StringGrid1.ColCount:=4;
  Self.Frame21.StringGrid1.RowCount:=3;
  Self.Frame22.StringGrid1.ColCount:=4;
  Self.Frame22.StringGrid1.RowCount:=3;
  MGridResize(Self.Frame21.StringGrid1);
  MGridResize(Self.Frame22.StringGrid1);
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  if Self.SpeedButton1.Enabled then
    begin
      MStringGridToTabl(BakTabl1, Self.Frame21.StringGrid1);
      MStringGridToTabl(BakTabl2, Self.Frame22.StringGrid1);
      Self.Panel3.Enabled:=False;
      Self.Frame21.StringGrid1.FixedCols:=0;
      Self.Frame21.StringGrid1.FixedRows:=0;
      Self.Frame22.StringGrid1.FixedCols:=0;
      Self.Frame22.StringGrid1.FixedRows:=0;
      Self.Frame22.StringGrid1.Options:=Self.Frame22.StringGrid1.Options+[goEditing];
    end
  else
    begin      
      MTablToStringGrid(BakTabl1, Self.Frame21.StringGrid1);
      MTablToStringGrid(BakTabl2, Self.Frame22.StringGrid1);
      Self.Panel3.Enabled:=True;
      Self.Frame21.StringGrid1.FixedCols:=1;
      Self.Frame21.StringGrid1.FixedRows:=1;
      Self.Frame22.StringGrid1.FixedCols:=1;
      Self.Frame22.StringGrid1.FixedRows:=1; 
      Self.Frame22.StringGrid1.Options:=Self.Frame22.StringGrid1.Options-[goEditing];
    end;
  Self.SpeedButton1.Enabled:=not Self.SpeedButton1.Enabled;
  Self.CheckBox2.Checked:=not Self.CheckBox2.Checked;
  Self.Frame21.StringGrid1.Col:=1;
  Self.Frame21.StringGrid1.Row:=1;
  Self.Frame22.StringGrid1.Col:=1;
  Self.Frame22.StringGrid1.Row:=1;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
var
  s: string[3];
begin
  with Self.SpinEdit1 do
    begin
      s:='0'+Text;
      s:=IntToStr(StrToInt(s));
      if s='0' then
        s:='1';
      Self.Frame21.StringGrid1.ColCount:=StrToInt(s)+1;
      MGridResize(Self.Frame21.StringGrid1);
      Text:=s;
    end;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
var
  s: string[3];
begin
  with Self.SpinEdit2 do
    begin
      s:='0'+Text;
      s:=IntToStr(StrToInt(s));
      if s='0' then
        s:='1';
      Self.Frame21.StringGrid1.RowCount:=StrToInt(s)+1;
      MGridResize(Self.Frame21.StringGrid1);
      Text:=s;
    end;
end;

procedure TForm1.Frame21StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Self.CheckBox2.Checked then
    Frame21.StringGrid1KeyPress(Sender, Key);

end;

procedure TForm1.Frame21StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  i,j: Integer;
  q: TDrob;
begin
  if Form1.CheckBox1.Checked then Exit;
  j:=0;
  for i:=0 to ACol-1 do
    Inc(j,Self.Frame21.StringGrid1.ColWidths[i]+1);
  Self.Frame21.Edit1.Left:=j;
  j:=0;
  for i:=0 to ARow-1 do
    Inc(j,Self.Frame21.StringGrid1.RowHeights[i]+1);

  Self.Frame21.Edit1.Top:=j;
  Self.Frame21.Edit1.Width:=Self.Frame21.StringGrid1.ColWidths[ACol]+1;
  Self.Frame21.Edit1.Height:=Self.Frame21.StringGrid1.RowHeights[ARow]+1;
  Self.Frame21.Edit1.Text:=Self.Frame21.StringGrid1.Cells[ACol,ARow];
  Self.Frame21.Edit1.Visible:=True;
  if Self.Frame21.StringGrid1.Cells[1,0]='  1' then
    begin
      q:=MStrToDrob(Self.Frame21.StringGrid1.Cells[ACol,ARow]);
      q:=MDiv(MStrToDrob(Self.Frame21.StringGrid1.Cells[1,ARow]),q);
      MDSokr(q);
      Self.Label7.Caption:=FloatToStr(MDrobToFloat(q));
    end;
end;

procedure TForm1.Frame22StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if SpeedButton1.Enabled then
    Frame21.StringGrid1KeyPress(Sender, Key);

end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
var
  i: Integer;
begin
  if Self.Frame21.StringGrid1.Cells[1,0]<>'  1' then
    begin
      for i:=2 to 100 do
        Self.Frame21.StringGrid1.Cells[i,0]:=Copy(Self.Frame21.StringGrid1.Cells[i,0],1,2)+'x'+IntToStr(i-1);
      for i:=1 to 100 do
        Self.Frame21.StringGrid1.Cells[0,i]:='  0';
      Self.Frame21.StringGrid1.Cells[1,0]:='  1';
    end
  else                                              
    begin
      for i:=2 to 100 do
        Self.Frame21.StringGrid1.Cells[i,0]:=Copy(Self.Frame21.StringGrid1.Cells[i,0],1,2)+'x'+IntToStr(i);
      for i:=1 to 100 do
        Self.Frame21.StringGrid1.Cells[0,i]:=Copy(Self.Frame21.StringGrid1.Cells[0,i],1,2)+'y'+IntToStr(i);
      Self.Frame21.StringGrid1.Cells[1,0]:=Copy(Self.Frame21.StringGrid1.Cells[2,0],1,2)+'x1';
    end
end;

procedure TForm1.Frame21Edit1Change(Sender: TObject);
begin
  Frame21.Edit1Change(Sender);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShellExecuteA(Self.Handle, PChar('open'), PChar('calc.exe'), nil, nil, 1);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  Self.ListBox1.Items.Clear;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
const
  e: string = '.tabl.7zete7';
type
  TR = record
    a: TTabl;
    b: array[1..2] of array[1..99] of string[10];
  end;
var
  f: file of TR;
  a: TR;
  i: Integer;
begin
  Self.SaveDialog1.FileName:='';
  if not Self.SaveDialog1.Execute then
    Exit;
  if Copy(Self.SaveDialog1.FileName,Length(Self.SaveDialog1.FileName)-Length(e)+1,Length(e))<>e then
    Self.SaveDialog1.FileName:=Self.SaveDialog1.FileName+e;
  MStringGridToTabl(a.a,Self.Frame21.StringGrid1);
  a.a.x:=Self.Frame21.StringGrid1.ColCount;
  a.a.y:=Self.Frame21.StringGrid1.RowCount;
  for i:=1 to 99 do
    begin
      a.b[1,i]:=Self.Frame21.StringGrid1.Cells[0,i];
      a.b[2,i]:=Self.Frame21.StringGrid1.Cells[i,0];
    end;
  AssignFile(f,Self.SaveDialog1.FileName);
  ReWrite(f);
  try
    Write(f,a);
  finally
    CloseFile(f);
  end;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
const
  e: string = '.tabl.7zete7';
type
  TR = record
    a: TTabl;
    b: array[1..2] of array[1..99] of string[10];
  end;
var
  f: file of TR;
  a: TR;
  i: Integer;
begin
  Self.OpenDialog1.FileName:='';
  if not Self.OpenDialog1.Execute then
    Exit;                   
  if Copy(Self.OpenDialog1.FileName,Length(Self.OpenDialog1.FileName)-Length(e)+1,Length(e))<>e then
    Self.OpenDialog1.FileName:=Self.OpenDialog1.FileName+e;
  AssignFile(f,Self.OpenDialog1.FileName);
  ReSet(f);
  try
    Read(f,a);
  finally
    CloseFile(f);
  end;
  MTablToStringGrid(a.a,Self.Frame21.StringGrid1);
  Self.Frame21.StringGrid1.ColCount:=a.a.x;
  Self.Frame21.StringGrid1.RowCount:=a.a.y;
  for i:=1 to 99 do
    begin
      Self.Frame21.StringGrid1.Cells[0,i]:=a.b[1,i];
      Self.Frame21.StringGrid1.Cells[i,0]:=a.b[2,i];
    end;
  MGridResize(Self.Frame21.StringGrid1);
  Self.SpinEdit1.Text:=IntToStr(Self.Frame22.StringGrid1.ColCount-1);
  Self.SpinEdit1.Value:=Self.Frame22.StringGrid1.ColCount-1;
  Self.SpinEdit2.Text:=IntToStr(Self.Frame22.StringGrid1.RowCount-1);
  if Self.RadioButton1.Checked then
    Self.RadioButton1Click(Sender);
  if Self.RadioButton2.Checked then
    Self.RadioButton2Click(Sender);
end;

end.
