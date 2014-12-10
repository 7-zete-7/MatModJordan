unit MatModUtil;

interface

uses
  SysUtils, Dialogs, Math, Grids, Forms;

type
  TDrob = array[1..2] of Integer;
  TTabl = record
    Tabl: array[1..99] of array[1..99] of TDrob;
    x,y: Integer;
  end;
  TZagl = array[1..2,1..99] of string;
      
const
  InitDrob: TDrob = (0,1);

var
  Prost: array[1..1000] of Integer;

function MOMin(a: TTabl; i,j: Integer): Boolean;
function MFact(a: Integer): Integer;
procedure MRefreshGrid(var a: TStringGrid);
procedure MGridResize(var a: TStringGrid);
procedure MTablToStringGrid(a: TTabl; var b: TStringGrid);
procedure MStringGridToTabl(var a: TTabl; b: TStringGrid);
function MRang(a: TTabl): Integer;
function MDrobToStr(a: TDrob): string;
function MStrToDrob(a: string): TDrob;                  {
function MJordanO(var a: TTabl; x,y: Integer): Boolean;
function MJordanM(var a: TTabl; x,y: Integer): Boolean;    }
function MDSokr(var a: TDrob): TDrob;
procedure MSokr(var a: TTabl; var b: TZagl);
function MMul(a,b: TDrob): TDrob;
function MDiv(a,b: TDrob): TDrob;
function MAdd(a,b: TDrob): TDrob;
function MSub(a,b: TDrob): TDrob;
procedure MProst;
function MDrobToFloat(const a: TDrob): Extended;
function MJordan(var a: TTabl; x,y: Integer; Mode: Boolean = False): Boolean;

implementation
//---------------------------------------------------------------------------
function GCF(a, b: Integer): Integer;
var
  Lfactor: Integer;
begin
  if (a < 1) or (b < 1) then
  begin
    Result := 1;
    Exit;
  end;
  if a = b then
  begin
    Result := a;
    Exit;
  end;
  Result := 1;
  for Lfactor := trunc(max(a, b) / 2) downto 2 do
  begin
    if (frac(a / Lfactor) = 0) and (frac(b / Lfactor) = 0) then
    begin
      Result := Lfactor;
      Exit;
    end;
  end;
end;
//---------------------------------------------------------------------------
function MinRealValue(const Data: array of Real; const n: Integer): Real;
var
  I: Integer;
begin
  Result := MaxInt;
  for I := 1 to n do
   if Data[I]<>0 then
    if Result > Data[I] then
      Result := Data[I];
end;
//---------------------------------------------------------------------------
function MOMin(a: TTabl; i,j: Integer): Boolean;
var
  k: Integer;
  c: array[1..99] of Real;
begin
  Result:=False;
  for k:=1 to a.y do
    if (a.Tabl[k][1][1]>0) and (a.Tabl[k][j][1]>0) then
      c[k]:=(a.Tabl[k][1][1]/a.Tabl[k][j][1])*(a.Tabl[k][j][2]/a.Tabl[k][1][2])
    else
      if a.Tabl[k][1][1]=0 then
        c[k]:=0;
  if c[i]*100=Round(MinRealValue(c,a.y)*100) then
    Result:=True;
end;
//---------------------------------------------------------------------------
function MFact(a: Integer): Integer;
begin
  if a<2 then
    Result:=1
  else
    Result:=a*MFact(a-1);
end;
//---------------------------------------------------------------------------
procedure MSokr(var a: TTabl; var b:TZagl); overload;
var
  i,j,k: Integer;
begin
  for i:=1 to a.x do
    if b[1,i]='  0' then
      begin
        Dec(a.x);
        for j:=1 to a.y do
          for k:=i to a.x do
            a.Tabl[j][k]:=a.Tabl[j][k+1];
        for j:=i to a.x do
          b[1,j]:=b[1,j+1];
      end;
end;
//---------------------------------------------------------------------------
procedure MRefreshGrid(var a: TStringGrid);
var
  i,ACol,ARow: Integer;
begin
  Randomize;
  i:=a.Col;
  ACol:=i;
  if a.ColCount>2 then
    while i=ACol do
      i:=Random(a.ColCount-1)+1;
  a.Col:=i;
  i:=a.Row;
  ARow:=i;
  if a.RowCount>2 then
    while i=ARow do
      i:=Random(a.RowCount-1)+1;
  a.Row:=i;
  a.Col:=ACol;
  a.Row:=ARow;
end;
//---------------------------------------------------------------------------
procedure MGridResize(var a: TStringGrid);
var
  i,j: Integer;
begin
  j:=0;
  if a.BorderStyle=bsSingle then
    j:=2;
  for i:=0 to a.ColCount-1 do
    Inc(j, a.ColWidths[i]+1);
  a.Width:=j;
  j:=0;   
  if a.BorderStyle=bsSingle then
    j:=2;
  for i:=0 to a.RowCount-1 do
    Inc(j, a.RowHeights[i]+1);
  a.Height:=j;
end;
//---------------------------------------------------------------------------
procedure MTablToStringGrid(a: TTabl; var b: TStringGrid);
var
  i,j: Integer;
begin
  for i:=1 to 99 do
    for j:=1 to 99 do
      b.Cells[i,j]:=MDrobToStr(a.Tabl[j][i]);
  b.ColCount:=a.x+1;
  b.RowCount:=a.y+1;
end;

procedure MStringGridToTabl(var a: TTabl; b: TStringGrid);
var
  i,j: Integer;
begin
  for i:=1 to 99 do for j:=1 to 99 do a.Tabl[i][j]:=InitDrob;
  a.y:=b.RowCount-1;
  a.x:=b.ColCount-1;
  for i:=1 to a.y do
    for j:=1 to a.x do
      if b.Cells[j,i]<>'' then
        a.Tabl[i][j]:=MStrToDrob(b.Cells[j,i])
      else
        a.Tabl[i][j]:=InitDrob;
end;

function MRang(a: TTabl): Integer;  // Ранг таблицы
var
  i,j,k: Integer;
  b: Boolean;
  t: TDrob;
begin
  for i:=1 to a.y-1 do
    for j:=i+1 to a.y do
      for k:=a.x downto i do
        begin
          t:=MDiv(a.Tabl[j][i],a.Tabl[i][i]);
          MDSokr(t);
          t:=MMul(a.Tabl[i][k],t);
          MDSokr(t);
          t:=MSub(a.Tabl[j][k],t);
          MDSokr(t);
          a.Tabl[j][k]:=t;
        end;
  k:=a.y;
  for i:=1 to a.y do
    begin
      b:=True;
      for j:=1 to a.x do
        if a.Tabl[i][j][1]<>0 then
          b:=False;
      if b then
        Dec(k);
    end;
  Result:=k;
end;

procedure MProst;              
var
  i,j,k: Integer;
  b: Boolean;
begin
  k:=1; b:=False;
  Prost[1]:=2;
  repeat
    for j:=Prost[k]+1 to 2*Prost[k] do
      begin
        b:=True;
        for i:=1 to k do
          if j mod Prost[i]=0 then
            b:=False;
        if b then
          Break;
      end;
    if b then
      begin
        Inc(k);
        Prost[k]:=j;
      end;
  until k=1000;        //============================================
end;

function MDrobToStr(a: TDrob): string;
begin
  Result:=IntToStr(a[1]);
  if a[2]<>1 then
    Result:=Result+'/'+IntToStr(a[2]);
  if a[2]=0 then
    Result:='';
end;

function MJordan(var a: TTabl; x,y: Integer; Mode: Boolean): Boolean;
var
  i,j: Integer;
  q: TDrob;
  w: TTabl;
begin
  Result:=False;
  if a.Tabl[y][x][1]=0 then
    begin
      ShowMessage('Нельзя выбрать данный элемент!');
      Exit;
    end;
  w:=a;
  Result:=True;
  // Шаг 1
  if w.Tabl[y][x][1]=0 then
    Result:=False;
  a.Tabl[y][x][1]:=w.Tabl[y][x][2];
  a.Tabl[y][x][2]:=w.Tabl[y][x][1];
  MDSokr(a.Tabl[y][x]);
  // Шаг 2
  for i:=1 to w.x do
    if i<>x then
      begin
        q:=MDiv(w.Tabl[y][i],w.Tabl[y][x]);
        if not Mode then
          q[1]:=-q[1];
        MDSokr(q);
        if q[2]=0 then
          Result:=False;
        a.Tabl[y][i]:=q;
      end;
  // Шаг 3
  for j:=1 to w.y do
    if j<>y then
      begin
        q:=MDiv(w.Tabl[j][x],w.Tabl[y][x]);
        if Mode then
          q[1]:=-q[1];
        MDSokr(q);
        if q[2]=0 then
          Result:=False;
        a.Tabl[j][x]:=q;
      end;
  // Шаг 4
  for i:=1 to w.x do
    if i<>x then
      for j:=1 to w.y do
        if j<>y then
          begin
            q:=MMul(w.Tabl[y][i],w.Tabl[j][x]);
            MDSokr(q);
            q:=MDiv(q,w.Tabl[y][x]);
            MDSokr(q);
            q:=MSub(w.Tabl[j][i],q);
            MDSokr(q);
            if q[2]=0 then
              Result:=False;
            a.Tabl[j][i]:=q;
          end;
end;
             {
function MJordanO(var a: TTabl; x,y: Integer): Boolean; // Жордановы исключения
var
  i,j: Integer;
  q: TDrob;
begin
  Result:=False;
  if a.Tabl[y][x][1]=0 then
    begin
      ShowMessage('Нельзя выбрать данный элемент!');
      Exit;
    end;
  i:=a.Tabl[y][x][1]; // 1
  a.Tabl[y][x][1]:=a.Tabl[y][x][2];
  a.Tabl[y][x][2]:=i;
  MDSokr(a.Tabl[y][x]); // ===
  for i:=1 to a.x do  // 2
    if i<>x then
      begin
        a.Tabl[y][i]:=MMul(a.Tabl[y][i],a.Tabl[y][x]);
        a.Tabl[y][i][1]:=-a.Tabl[y][i][1];
        MDSokr(a.Tabl[y][i]);
      end;            // ===
  Result:=True;
  for i:=1 to a.y do   // 3
    if i<>y then
      for j:=1 to a.x do
        if j<>x then
          begin
            q:=MMul(a.Tabl[i][x],a.Tabl[y][j]);
            MDSokr(q);
            a.Tabl[i][j]:=MAdd(a.Tabl[i][j],q);
            MDSokr(a.Tabl[i][j]);
          end;        // ===   
  for i:=1 to a.y do  // 4
    if i<>y then
      begin
        a.Tabl[i][x]:=MMul(a.Tabl[i][x],a.Tabl[y][x]);
        MDSokr(a.Tabl[i][x]);
      end;             // ===
end;

function MJordanM(var a: TTabl; x,y: Integer): Boolean; // Жордановы исключения
var
  i,j: Integer;
  q: TDrob;
begin
  Result:=False;
  if a.Tabl[y][x][1]=0 then
    begin
      ShowMessage('Нельзя выбрать данный элемент!');
      Exit;
    end;
  i:=a.Tabl[y][x][1]; // 1
  a.Tabl[y][x][1]:=a.Tabl[y][x][2];
  a.Tabl[y][x][2]:=i;
  MDSokr(a.Tabl[y][x]); // ===
  for i:=1 to a.y do  // 4
    if i<>y then
      begin
        a.Tabl[i][x]:=MMul(a.Tabl[i][x],a.Tabl[y][x]);
        a.Tabl[i][x][1]:=-a.Tabl[i][x][1];
        MDSokr(a.Tabl[i][x]);
      end;             // ===
  for i:=1 to a.y do   // 3
    if i<>y then
      for j:=1 to a.x do
        if j<>x then
          begin
            q:=MMul(a.Tabl[i][x],a.Tabl[y][j]);
            MDSokr(q);
            a.Tabl[i][j]:=MAdd(a.Tabl[i][j],q);
            MDSokr(a.Tabl[i][j]);
          end;        // ===
  for i:=1 to a.x do  // 2
    if i<>x then
      begin
        a.Tabl[y][i]:=MMul(a.Tabl[y][i],a.Tabl[y][x]);
        MDSokr(a.Tabl[y][i]);
      end;            // ===
  Result:=True;
end;  }

function MStrToDrob(a: string): TDrob;
var
  s1,s2: string;
  i: Integer;
  b: Boolean;
begin
  s1:='';
  s2:='';
  b:=True;
  for i:=1 to Length(a) do
    if a[i]='/' then
      b:=False
    else
      if b then
        s1:=s1+a[i]
      else
        s2:=s2+a[i];
  if s1='' then
    begin
      Result[2]:=1;
    end
  else
    begin
      Result[1]:=StrToInt(s1);
      if s2='' then
        s2:='1';
      Result[2]:=StrToInt(s2);
    end;
end;

function MDSokr(var a: TDrob): TDrob; overload;
var
  i: Integer;
begin
  i:=GCF(Abs(a[1]),Abs(a[2]));
  a[1]:=a[1] div i;
  a[2]:=a[2] div i;
  if a[2]<0 then
    begin
      a[2]:=-a[2];
      a[1]:=-a[1]
    end;
  if Abs(a[1])=0 then
    a[2]:=1;
  Result:=a;
end;

function MDiv(a,b: TDrob): TDrob;
begin
  Result[1]:=a[1]*b[2];
  Result[2]:=a[2]*b[1];
end;

function MMul(a,b: TDrob): TDrob;
begin
  Result[1]:=a[1]*b[1];
  Result[2]:=a[2]*b[2];
end;

function MAdd(a,b: TDrob): TDrob;
begin
  Result[1]:=a[1]*b[2]+b[1]*a[2];
  Result[2]:=a[2]*b[2];
end;

function MSub(a,b: TDrob): TDrob;
begin  
  Result[1]:=a[1]*b[2]-b[1]*a[2];
  Result[2]:=a[2]*b[2];
end;

function MDrobToFloat(const a: TDrob): Extended;
begin
  if a[2]<>0 then
    Result:=a[1]/a[2]
  else
    Result:=0;
end;

end.
