unit WorldEdit;

interface
Procedure LevelEditor;

implementation
uses MainMenu,MyCrt,SysUtils,Echos,TheGame;

//----------------------------------------------------------------------------------
// Вывод карты на экран [в редакторе]
//----------------------------------------------------------------------------------
Procedure DrawTileOnlyWE(const dx,dy,ix,iy:integer;const ShowBoxes:boolean);
begin;
if LOS[ix,iy]=1 then
begin;
if ((Boxes[ix,iy]=False)or(ShowBoxes=False))and(EntitiesArray[EntitiesMatrix[ix,iy],1] in [0,2,3,4,5,6,8,9]) then
  case Level[ix,iy] of
     0:  Put(ix+dx, iy+dy,  8, 0, '#');
     1:  Put(ix+dx, iy+dy,  7, 0, '.');
     2:  Put(ix+dx, iy+dy,  1, 0, '=');
     3:  Put(ix+dx, iy+dy,  4, 0, '=');
     4:  Put(ix+dx, iy+dy,  1, 0, '=');
     5:  Put(ix+dx, iy+dy,  1, 0, '=');
     6:  Put(ix+dx, iy+dy,  1, 0, '=');
     7:  Put(ix+dx, iy+dy,  1, 0, '=');
     8:  Put(ix+dx, iy+dy,  4, 0, '=');
     9:  Put(ix+dx, iy+dy,  4, 0, '=');
    10:  Put(ix+dx, iy+dy,  4, 0, '=');
    11:  Put(ix+dx, iy+dy,  4, 0, '=');
    12:  Put(ix+dx, iy+dy,  6, 0, '=');
    13:  Put(ix+dx, iy+dy,  8, 0, '=');
    14:  Put(ix+dx, iy+dy,  6, 0, '/');
    15:  Put(ix+dx, iy+dy,  6, 0, '+');
    16:  Put(ix+dx, iy+dy,  6, 0, 'X');
    17:  Put(ix+dx, iy+dy,  8, 0, '/');
    18:  Put(ix+dx, iy+dy,  8, 0, '+');
    19:  Put(ix+dx, iy+dy,  8, 0, 'X');
    20:  Put(ix+dx, iy+dy,  4, 0, '/');
    21:  Put(ix+dx, iy+dy,  4, 0, '+');
    22:  Put(ix+dx, iy+dy,  1, 0, '/');
    23:  Put(ix+dx, iy+dy,  1, 0, '+');
    24:  Put(ix+dx, iy+dy,  2, 0, '/');
    25:  Put(ix+dx, iy+dy,  2, 0, '+');
    26:  Put(ix+dx, iy+dy,  8, 0, '8');
    27:  Put(ix+dx, iy+dy,  4, 0, '_');
    28:  Put(ix+dx, iy+dy,  1, 0, '_');
    29:  Put(ix+dx, iy+dy,  2, 0, '_');
    30:  Put(ix+dx, iy+dy,  7, 0, ',');
    31:  Put(ix+dx, iy+dy,  7, 0, '#');
  end
else
  begin;
    if (EntitiesArray[EntitiesMatrix[ix,iy],1] in [1,7])and(Boxes[ix,iy]=False) then Put(ix+dx,iy+dy, 8, 0, '!');
    if not(Level[ix,iy]in [27,28,29]) then
    begin;
      if (Boxes[ix,iy]=True)and(ShowBoxes=True) then Put(ix+dx, iy+dy,  6, 0, 'O');
    end
    else
    begin;
    if (Level[ix,iy]=27)and(Boxes[ix,iy]=True)then Put(ix+dx, iy+dy,  4, 0, 'Q');
    if (Level[ix,iy]=28)and(Boxes[ix,iy]=True)then Put(ix+dx, iy+dy,  1, 0, 'Q');
    if (Level[ix,iy]=29)and(Boxes[ix,iy]=True)then Put(ix+dx, iy+dy,  2, 0, 'Q');
    end;
  end;
end;
end;

Procedure DrawTileWE(const dx,dy,X,Y,MaxX,MaxY:integer;const ShowBoxes:boolean);
begin;
if (X>80)or(Y>20)or(X<1)or(Y<1) then Put(x+dx,y+dy,0,0,' ')
else if (((X=MaxX+1)and(Y<MaxY+1))or((X<MaxX+1)and(Y=MaxY+1))) then Put(x+dx,y+dy,14,0,'*')
else if (X=MaxX+1)and(Y=MaxY+1)then Put(x+dx,y+dy,14,0,'x')
else DrawTileOnlyWE(dx,dy,X,Y,ShowBoxes);
end;

Procedure DrawLevelWE(MaxX,MaxY:integer;const ShowBoxes:boolean);
var ix,iy:integer;
begin;
for ix:=1 to 80 do for iy:=1 to 20 do DrawTileWE(0,2,ix,iy,MaxX,MaxY,ShowBoxes);
end;

//----------------------------------------------------------------------------------
// Вывод на экран тайлсета
//----------------------------------------------------------------------------------
Procedure DrawTileSet(const n:integer);
begin;
Put( 1, 23,  8, 0, '#');
Put( 2, 23,  7, 0, '.');
Put( 3, 23,  1, 0, '=');
Put( 4, 23,  4, 0, '=');
Put( 5, 23,  1, 0, '=');
Put( 6, 23,  1, 0, '=');
Put( 7, 23,  1, 0, '=');
Put( 8, 23,  1, 0, '=');
Put( 9, 23,  4, 0, '=');
Put(10, 23,  4, 0, '=');
Put(11, 23,  4, 0, '=');
Put(12, 23,  4, 0, '=');
Put(13, 23,  6, 0, '=');
Put(14, 23,  8, 0, '=');
Put(15, 23,  6, 0, '/');
Put(16, 23,  6, 0, '+');
Put(17, 23,  6, 0, 'X');
Put(18, 23,  8, 0, '/');
Put(19, 23,  8, 0, '+');
Put(20, 23,  8, 0, 'X');
Put(21, 23,  4, 0, '/');
Put(22, 23,  4, 0, '+');
Put(23, 23,  1, 0, '/');
Put(24, 23,  1, 0, '+');
Put(25, 23,  2, 0, '/');
Put(26, 23,  2, 0, '+');
Put(27, 23,  8, 0, '8');
Put(28, 23,  4, 0, '_');
Put(29, 23,  1, 0, '_');
Put(30, 23,  2, 0, '_');
Put(31, 23,  7, 0, ',');
Put(32, 23,  7, 0, '#');
SetColor(n+1,23,7,8);
end;

//----------------------------------------------------------------------------------
// Редактор Entities
//----------------------------------------------------------------------------------
Procedure EntityEditor(const MaxX,MaxY:integer);
var c:char;
    no,x,y,ix,iy,coordno:integer;
begin;
no:=1;x:=1;y:=1;
clrscr(0,0);
Put(1, 1,7,0,'Entity Editor');
Put(1, 2,7,0,'         No:');
Put(1, 3,7,0,'       Type:');
Put(2, 4,7,0,'     act X1:');
Put(2, 5,7,0,'     act Y1:');
Put(2, 6,7,0,'     act X2:');
Put(2, 7,7,0,'     act Y2:');
Put(2, 8,7,0,'     act X3:');
Put(2, 9,7,0,'     act Y3:');
Put(2,10,7,0,'act Trig No:');
GotoXY(70,13);
repeat
Put(14, 2,7,0,IntToStr(no)+'  ');
Put(14, 3,7,0,IntToStr(EntitiesArray[no,1])+'  ');
Put(14, 4,7,0,IntToStr(EntitiesArray[no,2])+'  ');
Put(14, 5,7,0,IntToStr(EntitiesArray[no,3])+'  ');
Put(14, 6,7,0,IntToStr(EntitiesArray[no,4])+'  ');
Put(14, 7,7,0,IntToStr(EntitiesArray[no,5])+'  ');
Put(14, 8,7,0,IntToStr(EntitiesArray[no,6])+'  ');
Put(14, 9,7,0,IntToStr(EntitiesArray[no,7])+'  ');
Put(14,10,7,0,IntToStr(EntitiesArray[no,8])+'  ');

case EntitiesArray[no,1] of
  0: Put(17,3,7,0,'- nothing                                                       ');
  1: Put(17,3,7,0,'- lever                                                         ');
  2: Put(17,3,7,0,'- trigger                                                       ');
  3: Put(17,3,7,0,'- once-activating trigger                                       ');
  4: Put(17,3,7,0,'- inactive trigger-by-trigger activating trigger                ');
  5: Put(17,3,7,0,'- inactive trigger-by-trigger activating lever                  ');
  6: Put(17,3,7,0,'- active trigger-by-trigger activating trigger                  ');
  7: Put(17,3,7,0,'- active trigger-by-trigger activating lever                    ');
  8: Put(17,3,7,0,'- inactive once-activating trigger-by-trigger activating trigger');
  9: Put(17,3,7,0,'- active once-activating trigger-by-trigger activating trigger  ');
end;

c:=readkey;

if (c='+') then inc(no);
if (c='-') then dec(no);

if (c='<')or(c=',') then dec(EntitiesArray[no,1]);
if (c='>')or(c='.') then inc(EntitiesArray[no,1]);

if (c in ['!','@','#']) then
begin;
  case c of
    '!':coordno:=2;
    '@':coordno:=4;
    '#':coordno:=6;
  end;
  x:=EntitiesArray[no,coordno];
  y:=EntitiesArray[no,coordno+1];
  repeat
    for ix:=x-9 to x+9 do for iy:=y-9 to y+9 do begin;DrawTileWE(70-x,13-y,ix,iy,MaxX,MaxY,True);end;
    c:=readkey;
    if (c='1') then begin; x := x-1; y := y+1; end;
    if (c='2') then begin; x := x+0; y := y+1; end;
    if (c='3') then begin; x := x+1; y := y+1; end;
    if (c='4') then begin; x := x-1; y := y+0; end;
    if (c='6') then begin; x := x+1; y := y+0; end;
    if (c='7') then begin; x := x-1; y := y-1; end;
    if (c='8') then begin; x := x+0; y := y-1; end;
    if (c='9') then begin; x := x+1; y := y-1; end;

    if (c=#13) then
    begin;
    EntitiesArray[no,coordno]:=x;
    EntitiesArray[no,coordno+1]:=y;
    end;

    if (x>80) then x:=80;
    if (x<1) then x:=1;
    if (y>20) then y:=20;
    if (y<1) then y:=1;
  until (c=#13)or(c=#27);
  c:=' ';
end;

if (c=']') then inc(EntitiesArray[no,8]);
if (c='[') then dec(EntitiesArray[no,8]);

if (EntitiesArray[no,8]>50) then EntitiesArray[no,8]:=1;
if (EntitiesArray[no,8]<1) then EntitiesArray[no,8]:=50;
if (EntitiesArray[no,1]>9) then EntitiesArray[no,1]:=0;
if (EntitiesArray[no,1]<0) then EntitiesArray[no,1]:=9;
if (no>50) then no:=1;
if (no<1) then no:=50;

until c=#27;
end;

//----------------------------------------------------------------------------------
// Редактор уровней
//----------------------------------------------------------------------------------
Procedure LevelEditor;
var Filename:string;
    C:char;
    RightFile:boolean;
    f:text;
    i,i1,ix,iy:integer;
    tx,ty:integer;
    // map file
    KeyMode:string;
    MaxX,MaxY,px,py:integer;
    CurrentTile:Integer;
    ShowBoxes:Boolean;
    ColoredDoorNo:Integer;

begin;
NullAll;px:=1;py:=1;maxx:=10;maxy:=10;ShowBoxes:=True;

repeat
  clrscr(0,0);
  Put(1,1,7,0,'Enter the name of the map you want to edit or create:');
  FileName:=ReadStrUsingCharSet(1,2,7,0,20,['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' ','_','-','1','2','3','4','5','6','7','8','9','0','[',']','!','+','@','#','$','%','^','&','(',')','.']);
  RightFile:=false;
  if not(FileExists(ExePath+'Gamedat\'+Filename)) then
    begin;
    clrscr(0,0);
    Put(1,1,7,0,'File '''+Filename+''' not exists.');
    if AskYesNo(1,2,7,0,'Do you want to create it? [Y/N]') then RightFile:=true;
    end
  else
    RightFile:=true;
until (RightFile=true);


if FileExists(ExePath+'Gamedat\'+Filename) then
  begin;
  assign(f,ExePath+'Gamedat\'+Filename);
  reset(f);

  readln(f,KeyMode);
  read(f,MaxX,MaxY);
  read(f,px,py);

  for i:=1 to 3 do readln(f,ColoredDoors[i,1],ColoredDoors[i,2],ColoredDoors[i,3],ColoredDoors[i,4]);

  for i1:=1 to MaxY do
  begin;
  for i:=1 to MaxX do read(f,Level[i,i1]);
  readln(f);
  end;

  for i1:=1 to MaxY do
  begin;
  for i:=1 to MaxX do
  begin;
  read(f,c);
  if c='O' then Boxes[i,i1]:=True else Boxes[i,i1]:=False;
  end;
  readln(f);
  end;

  for i1:=1 to MaxY do
  begin;
  for i:=1 to MaxX do
  begin;
  read(f,EntitiesMatrix[i,i1]);
  end;
  readln(f);
  end;

  readln(f,i1);
  for i:=1 to i1 do
  begin;
  read(f,EntitiesArray[i,1],EntitiesArray[i,2],EntitiesArray[i,3],EntitiesArray[i,4],EntitiesArray[i,5],EntitiesArray[i,6],EntitiesArray[i,7],EntitiesArray[i,8]);
  readln(f);
  end;

  close(f);
  end;


clrscr(0,0);

for i:=1 to 80 do for i1:=1 to 20 do los[i,i1]:=1;
tx:=1;ty:=1;
DrawLevelWE(MaxX,MaxY,True);
ShowCursor(True);


repeat
  DrawTileWE(0,2,tx,ty,MaxX,MaxY,ShowBoxes);
  Put(px,py+2,7,0,'@');
  DrawTileSet(CurrentTile);
  Put(1,24,7,0,'MaxX: '+IntToStr(MaxX)+'  ');
  Put(1,25,7,0,'MaxY: '+IntToStr(MaxY)+'  ');
  Put(10,24,7,0,'PX: '+IntToStr(PX)+'  ');
  Put(10,25,7,0,'PY: '+IntToStr(PY)+'  ');
  Put(20,24,7,0,'KeyMode: '+KeyMode+'  ');
  gotoxy(tx,ty+2);
  if (EntitiesMatrix[tx,ty]<>0) then Put(1,1,7,0,'Entity Number: '+IntToStr(EntitiesMatrix[tx,ty]));
  c:=readkey;
  Put(1,1,7,0,CEmptyString);
  Put(1,2,7,0,CEmptyString);

  if (c='1') then begin; tx := tx-1; ty := ty+1; end;
  if (c='2') then begin; tx := tx+0; ty := ty+1; end;
  if (c='3') then begin; tx := tx+1; ty := ty+1; end;
  if (c='4') then begin; tx := tx-1; ty := ty+0; end;
  if (c='6') then begin; tx := tx+1; ty := ty+0; end;
  if (c='7') then begin; tx := tx-1; ty := ty-1; end;
  if (c='8') then begin; tx := tx+0; ty := ty-1; end;
  if (c='9') then begin; tx := tx+1; ty := ty-1; end;

  if (c='<')or(c=',') then dec(CurrentTile);
  if (c='>')or(c='.') then inc(CurrentTile);

  if (c=' ') then Level[tx,ty]:=CurrentTile;

  if  (c='k')or(c='K') then
  begin;
    if KeyMode='Normal' then KeyMode:='Abnormal'
    else KeyMode:='Normal';
  end;

  if (c='e') then
  begin;
  Put(1,1,7,0,'Enter the number of entity you want to place here:');
    repeat
    EntitiesMatrix[tx,ty]:=StrToInt('0'+ReadStrUsingCharSet(1,2,7,0,2,['0','1','2','3','4','5','6','7','8','9']));
    until (EntitiesMatrix[tx,ty]<51)and(EntitiesMatrix[tx,ty]>0);
  ShowCursor(True);  
  Put(1,1,7,0,CEmptyString);
  Put(1,2,7,0,CEmptyString);
  end;

  if (c='E') then
  begin;
  EntitiesMatrix[tx,ty]:=0;
  end;

  if (c=#5) then
  begin;
  EntityEditor(MaxX,MaxY);
  DrawLevelWE(MaxX,MaxY,ShowBoxes);
  Put(1,1,7,0,CEmptyString);
  Put(1,2,7,0,CEmptyString);
  end;

  if (c='b') then Boxes[tx,ty]:=True;
  if (c='B') then Boxes[tx,ty]:=False;
  if (c=#2) then
  begin;
    if ShowBoxes=True then ShowBoxes:=False
    else ShowBoxes:=True;
    DrawLevelWE(MaxX,MaxY,ShowBoxes);
  end;

  if (c='p')or(c='P')then begin;DrawTileWE(0,2,px,py,MaxX,MaxY,ShowBoxes);px:=tx;py:=ty;end;
  if (c='m')or(c='M')then begin;MaxX:=tx;MaxY:=ty;DrawLevelWE(MaxX,MaxY,ShowBoxes);end;

  if (CurrentTile>31) then CurrentTile:=0;
  if (CurrentTile<0) then CurrentTile:=31;
  if (tx>80) then tx:=80;
  if (tx<1) then tx:=1;
  if (ty>20) then ty:=20;
  if (ty<1) then ty:=1;

until (c=#27)or(c='S');


// Сохранение мапы
  assign(f,ExePath+'Gamedat\'+Filename);
  rewrite(f);

  writeln(f,KeyMode);
  writeln(f,MaxX,' ',MaxY);
  writeln(f,px,' ',py);


  for i:=1 to 3 do for i1:=1 to 4 do ColoredDoors[i,i1]:=0;

  for ColoredDoorNo:=1 to 3 do
  for i:=1 to 80 do for i1:=1 to 20 do
  begin;
  if Level[i,i1]=26+ColoredDoorNo then
  inc(ColoredDoors[ColoredDoorNo,2]);
  if (Level[i,i1]=26+ColoredDoorNo)and (Boxes[i,i1]=True) then inc(ColoredDoors[ColoredDoorNo,1]);
  if (Level[i,i1] div 2=ColoredDoorNo+9) then
  begin;ColoredDoors[ColoredDoorNo,3]:=i;ColoredDoors[ColoredDoorNo,4]:=i1;end;
  end;

  for i:=1 to 3 do writeln(f,ColoredDoors[i,1],' ',ColoredDoors[i,2],' ',ColoredDoors[i,3],' ',ColoredDoors[i,4]);

  for i1:=1 to MaxY do
  begin;
  for i:=1 to MaxX do write(f,Level[i,i1],' ');
  writeln(f);
  end;

  for i1:=1 to MaxY do
  begin;
  for i:=1 to MaxX do
  begin;
  if Boxes[i,i1]=True then write(f,'O') else write(f,'.')
  end;
  writeln(f);
  end;

  for i1:=1 to MaxY do
  begin;
  for i:=1 to MaxX do
  begin;
  write(f,EntitiesMatrix[i,i1],' ');
  end;
  writeln(f);
  end;

  writeln(f,50);
  for i:=1 to 50 do
  begin;
  write(f,EntitiesArray[i,1],' ',EntitiesArray[i,2],' ',EntitiesArray[i,3],' ',EntitiesArray[i,4],' ',EntitiesArray[i,5],' ',EntitiesArray[i,6],' ',EntitiesArray[i,7],' ',EntitiesArray[i,8]);
  writeln(f);
  end;

  close(f);



CurrentMenu:=StartMenu;
ShowCursor(False);
end;


end.
