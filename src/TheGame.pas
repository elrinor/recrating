unit TheGame;

interface
Function GameCycle(const LevelNo:integer; const LevelName:string; var Score:integer) : Boolean;
Procedure NullAll;
Procedure DrawLevel;
Procedure DrawTile(const ix,iy:integer);

var Level : array[1..80,1..20]of integer;
    EntitiesMatrix : array[1..80,1..20] of integer;
    EntitiesArray : array[1..50,1..8] of integer;
    Boxes : array[1..80,1..20] of boolean;
    Los : array[1..80,1..20]of integer;
    ColoredDoors : array[1..3,1..4] of integer;



implementation
uses MyCrt, SysUtils, Echos, MainMenu;

//----------------------------------------------------------------------------------
// Обнуление массивов
//----------------------------------------------------------------------------------
Procedure NullAll;
var i,i1:integer;
begin;
for i:=1 to 80 do for i1:=1 to 20 do Level[i,i1]:=0;
for i:=1 to 80 do for i1:=1 to 20 do EntitiesMatrix[i,i1]:=0;
for i:=1 to 30 do for i1:=1 to 7 do EntitiesArray[i,i1]:=0;
for i:=1 to 80 do for i1:=1 to 20 do Los[i,i1]:=0;
for i:=1 to 3 do for i1:=1 to 4 do ColoredDoors[i,i1]:=0;
end;

//----------------------------------------------------------------------------------
// Операции с дверями
//----------------------------------------------------------------------------------
// Закрывание двери
Procedure CloseDoor(const X,Y:integer);
begin;
if Boxes[x,y]=False then
  begin;
  if Level[x,y] in [14,17,20,22,24,30] then Inc(Level[x,y]);
  end;
end;

// Запирание двери
Procedure LockDoor(const X,Y:integer);
begin;
if Boxes[x,y]=False then
  begin;
  if Level[x,y] in [20,22,24,30] then Inc(Level[x,y])
  else if Level[x,y] in [14,17] then Level[x,y]:=Level[x,y]+2;
  end;
end;

// Отпирание/Открывание двери двери
Procedure OpenDoor(const X,Y:integer);
begin;
if Level[x,y] in [15,18,21,23,25,31] then Dec(Level[x,y])
else if Level[x,y] in [16,19] then Level[x,y]:=Level[x,y]-2;
end;

// Переключение двери с открытой на закрытую и наоборот
Procedure UseDoor(const X,Y:integer);
begin;
if (x>0)and(y>0) then
if Level[x,y] in [14,17,20,22,24,30] then LockDoor(x,y)
else if Level[x,y] in [15,16,18,19,21,23,25,31] then OpenDoor(x,y)
end;

//----------------------------------------------------------------------------------
// Пересчет установленных на алтари ящиков
//----------------------------------------------------------------------------------
Procedure CountDoors(const x1,y1,x2,y2:integer);
begin;
if (Level[x2,y2] in [27,28,29]) then
  begin;
  inc(ColoredDoors[Level[x2,y2]-26,1]);
  if (ColoredDoors[Level[x2,y2]-26,1]=ColoredDoors[Level[x2,y2]-26,2])then OpenDoor(ColoredDoors[Level[x2,y2]-26,3],ColoredDoors[Level[x2,y2]-26,4])
  end;
if (Level[x1,y1] in [27,28,29]) then
  begin;
  dec(ColoredDoors[Level[x1,y1]-26,1]);
  if (ColoredDoors[Level[x1,y1]-26,1]<ColoredDoors[Level[x1,y1]-26,2])then LockDoor(ColoredDoors[Level[x1,y1]-26,3],ColoredDoors[Level[x1,y1]-26,4])
  end;
end;

//----------------------------------------------------------------------------------
// Процедура активирует/деактивирует entity в заданном месте
//----------------------------------------------------------------------------------
Procedure MakeEntityActive(const N:integer);
begin;
if (N>0) then
if EntitiesArray[N,1] in [4,5] then EntitiesArray[N,1]:=EntitiesArray[N,1]+2
else if EntitiesArray[N,1] in [6,7] then EntitiesArray[N,1]:=EntitiesArray[N,1]-2
else if EntitiesArray[N,1]=8 then EntitiesArray[N,1]:=3
else if EntitiesArray[N,1]=9 then EntitiesArray[N,1]:=1;
end;

//----------------------------------------------------------------------------------
// Дерганье рычага/вставание на триггер
//----------------------------------------------------------------------------------
Procedure ActivateEntity(const N:integer);
begin;
if EntitiesArray[N,1]=3 then EntitiesArray[N,1]:=0;
UseDoor(EntitiesArray[N,2],EntitiesArray[N,3]);
UseDoor(EntitiesArray[N,4],EntitiesArray[N,5]);
UseDoor(EntitiesArray[N,6],EntitiesArray[N,7]);
MakeEntityActive(EntitiesArray[N,8]);
end;

//----------------------------------------------------------------------------------
// Процедура рисует ту часть уровня, которую видит персонаж
//----------------------------------------------------------------------------------
Procedure DrawTile(const ix,iy:integer);
begin;
if LOS[ix,iy]=1 then
begin;
if (Boxes[ix,iy]=False)and(EntitiesArray[EntitiesMatrix[ix,iy],1] in [0,2,3,4,5,6,8,9]) then
  case Level[ix,iy] of
     0:  Put(ix, iy+2,  8, 0, '#');
     1:  Put(ix, iy+2,  7, 0, '.');
     2:  Put(ix, iy+2,  1, 0, '=');
     3:  Put(ix, iy+2,  4, 0, '=');
     4:  Put(ix, iy+2,  1, 0, '=');
     5:  Put(ix, iy+2,  1, 0, '=');
     6:  Put(ix, iy+2,  1, 0, '=');
     7:  Put(ix, iy+2,  1, 0, '=');
     8:  Put(ix, iy+2,  4, 0, '=');
     9:  Put(ix, iy+2,  4, 0, '=');
    10:  Put(ix, iy+2,  4, 0, '=');
    11:  Put(ix, iy+2,  4, 0, '=');
    12:  Put(ix, iy+2,  6, 0, '=');
    13:  Put(ix, iy+2,  8, 0, '=');
    14:  Put(ix, iy+2,  6, 0, '/');
    15:  Put(ix, iy+2,  6, 0, '+');
    16:  Put(ix, iy+2,  6, 0, '+');
    17:  Put(ix, iy+2,  8, 0, '/');
    18:  Put(ix, iy+2,  8, 0, '+');
    19:  Put(ix, iy+2,  8, 0, '+');
    20:  Put(ix, iy+2,  4, 0, '/');
    21:  Put(ix, iy+2,  4, 0, '+');
    22:  Put(ix, iy+2,  1, 0, '/');
    23:  Put(ix, iy+2,  1, 0, '+');
    24:  Put(ix, iy+2,  2, 0, '/');
    25:  Put(ix, iy+2,  2, 0, '+');
    26:  Put(ix, iy+2,  8, 0, '8');
    27:  Put(ix, iy+2,  4, 0, '_');
    28:  Put(ix, iy+2,  1, 0, '_');
    29:  Put(ix, iy+2,  2, 0, '_');
    30:  Put(ix, iy+2,  7, 0, '.');
    31:  Put(ix, iy+2,  8, 0, '#');
  end
else
  begin;
    if (EntitiesArray[EntitiesMatrix[ix,iy],1] in [1,7])and(Boxes[ix,iy]=False) then Put(ix,iy+2, 8, 0, '!');
    if not(Level[ix,iy]in [27,28,29]) then
    begin;
      if Boxes[ix,iy]=True then Put(ix, iy+2,  6, 0, 'O');
    end
    else
    begin;
    if (Level[ix,iy]=27)and(Boxes[ix,iy]=True)then Put(ix, iy+2,  4, 0, 'Q');
    if (Level[ix,iy]=28)and(Boxes[ix,iy]=True)then Put(ix, iy+2,  1, 0, 'Q');
    if (Level[ix,iy]=29)and(Boxes[ix,iy]=True)then Put(ix, iy+2,  2, 0, 'Q');
    end;
  end;
end;
end;

Procedure DrawLevel;
var ix,iy:integer;
begin;
for ix:=1 to 80 do for iy:=1 to 20 do DrawTile(ix,iy);
end;

//----------------------------------------------------------------------------------
// Вычислитель видимости
//----------------------------------------------------------------------------------
Procedure CalculateLOS(const x,y:integer);
var ix,iy,cx,cy,gox,goy,sten,sten1:integer;
begin;

for ix:=1 to 80 do
begin;
for iy:=1 to 20 do
begin;
LOS[ix,iy]:=0;
end;
end;


for ix:=x-5 to x+5 do
begin;
for iy:=y-5 to y+5 do
begin;
if not((abs(ix-x)+abs(iy-y)>6))and(ix>0)and(ix<81)and(iy>0)and(iy<21)then LOS[ix,iy]:=1;
end;
end;

for ix:=x-5 to x+5 do
begin;
for iy:=y-5 to y+5 do
begin;
if (ix>0)and(ix<81)and(iy>0)and(iy<21)then
begin;

{Їгвм 1}
gox:=ix;goy:=iy;cx:=x;cy:=y;sten:=0;
repeat
if cx<gox then cx:=cx+1;if cx>gox then cx:=cx-1;
if cy<goy then cy:=cy+1;if cy>goy then cy:=cy-1;
if (level[cx,cy]in[0,15,16,18,19,21,23,25,31])and(not((cx=gox)and(cy=goy)))then sten:=1;
until (sten=1)or((cx=gox)and(cy=goy));

{Їгвм 2}
gox:=ix;goy:=iy;cx:=x;cy:=y;sten1:=0;
repeat
if (abs(cx-gox)-abs(cy-goy))=0 then
begin;
if cx<gox then cx:=cx+1;if cx>gox then cx:=cx-1;
if cy<goy then cy:=cy+1;if cy>goy then cy:=cy-1;
end
else
begin;
if (abs(cx-gox)-abs(cy-goy))<0 then
begin;if cy<goy then cy:=cy+1;if cy>goy then cy:=cy-1;end;
if (abs(cx-gox)-abs(cy-goy))>0 then
begin;if cx<gox then cx:=cx+1;if cx>gox then cx:=cx-1;end;
end;
if (level[cx,cy]in[0,15,16,18,19,21,23,25,31])and(not((cx=gox)and(cy=goy)))then sten1:=1;
until (sten1=1)or((cx=gox)and(cy=goy));

if (sten+sten1)>1 then LOS[ix,iy]:=0;
end;
end;
end;
end;


//----------------------------------------------------------------------------------
// Процедура игрового цикла
//----------------------------------------------------------------------------------
Function GameCycle(const LevelNo:integer; const LevelName:string; var Score:integer) : Boolean;
var px, py : Integer;   // Текущая позиция перснажа
    dpx, dpy : Integer; // Изменение позиции персонажа при движении (приставка 'd' - сокращение от 'delta', что означает 'изменение')
    TurnNo : Integer;   // Скоко ходов прошло
    Turn : Boolean;     // Сделал персонаж ход, или нет
    i, i1, ix, iy: Integer; // Счетчик
    c : Char;           // Считанная с клавы клавиша
    PossibleKeys : set of char; // Возможные кнопочки
    Hp : Integer;       // Хелсы
    f : text;
    EndGame : Boolean;
    MaxX, MaxY : Integer;
    KeyMode:string;
    DeathReason:string;

begin;
NullAll;

if LevelNo=0 then
  begin;
  assignfile(f,'gamedat\'+LevelName);
  reset(f);
  end
else
  begin;
  assignfile(f,'gamedat\'+IntToStr(LevelNO)+'.lev');
  reset(f);
  end;

readln(f,KeyMode);
if pos('Normal',KeyMode)<>0 then PossibleKeys:=['1','2','3','4','6','7','8','9','h','H',#27]
else PossibleKeys:=['2','4','6','8','h','H',#27];
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


TurnNo:=1;
hp:=2;
EndGame:=false;
clrscr(0,0);


//----------------------------------------------------------------------------------
// Начало игрового цикла
//----------------------------------------------------------------------------------
  repeat
  CalculateLOS(px,py);
  DrawLevel;
  Put(px,py+2,7,0,'@');
  gotoxy(px, py+2);
  Put(1,23,7,0,' Turns: '+IntToStr(TurnNo));
  Put(1,24,7,0,'Health: '+IntToStr(hp));
// Считывание клавиши (управление)
  repeat
  c:=readkey;
  until (c in PossibleKeys);
// Обнуление некоторых переменных
  Turn := False;
  dpx := 0;
  dpy := 0;
  Echo(CEmptyString);

  if (c='1') then begin; dpx := -1; dpy :=  1; end;
  if (c='2') then begin; dpx :=  0; dpy :=  1; end;
  if (c='3') then begin; dpx :=  1; dpy :=  1; end;
  if (c='4') then begin; dpx := -1; dpy :=  0; end;
  if (c='6') then begin; dpx :=  1; dpy :=  0; end;
  if (c='7') then begin; dpx := -1; dpy := -1; end;
  if (c='8') then begin; dpx :=  0; dpy := -1; end;
  if (c='9') then begin; dpx :=  1; dpy := -1; end;

// Вмаз в стену
  if Level[px+dpx,py+dpy] in [0,31] then
    begin;
    Echo('Argh! You run into the wall!');
    end;

// Шаг
  if ((dpx<>0)or(dpy<>0))and(Level[px+dpx,py+dpy] in [1,12,13,14,17,20,22,24,26,27,28,29,30])and(Boxes[px+dpx,py+dpy]=False) then
    begin;
    px:=px+dpx;dpx:=0;
    py:=py+dpy;dpy:=0;
    Turn:=True;
    if (Level[px,py]=26) then begin;Result:=True;EndGame:=True;end;
    if (EntitiesArray[EntitiesMatrix[px,py],1] in [2,3,6]) then ActivateEntity(EntitiesMatrix[px,py])
    end;

// Плавание в воде
  if (Level[px+dpx,py+dpy] in [2,4,5,6,7]) then
    begin;
    if (Level[px,py] in [2,4,5,6,7]) then
      begin;
      px:=px+dpx;dpx:=0;
      py:=py+dpy;dpy:=0;
      Turn := true;
      dec(hp);
      end
    else if PlayerWantsToDiveIntoTheWater then
      begin;
      px:=px+dpx;dpx:=0;
      py:=py+dpy;dpy:=0;
      Turn := true;
      dec(hp);
      end;
    end;

// Плавание в лаве
  if (Level[px+dpx,py+dpy] in [3,8,9,10,11]) then
    begin;
    if (Level[px,py] in [3,8,9,10,11]) then
      begin;
      px:=px+dpx;dpx:=0;
      py:=py+dpy;dpy:=0;
      Turn := true;
      dec(hp);
      end
    else if PlayerWantsToDiveIntoTheLava then
      begin;
      px:=px+dpx;dpx:=0;
      py:=py+dpy;dpy:=0;
      Turn := true;
      hp:=0;
      end;
    end;

// Открывание двери
  if Level[px+dpx,py+dpy] in [15,16,18,19,21,23,25] then
    begin;
    if (PlayerWantsToOpenDoor) then
      begin;
      if Level[px+dpx,py+dpy] in [15,18] then
        begin;
        OpenDoor(px+dpx,py+dpy);
        Echo('You open the door.');
        Turn:=true;
        end;
      if Level[px+dpx,py+dpy] in [16,19,21,23,25] then
        begin;
        Echo('This door is locked!');
        Turn:=true;
        end;
      end;
    end;

// Двигание ящика
  if Boxes[px+dpx,py+dpy]=True then
    begin;
    if (Level[px+2*dpx,py+2*dpy] in [0,15,16,18,19,21,23,25,31])or(Boxes[px+2*dpx,py+2*dpy]=True)then Echo('You can''t move this box!');
    if (Level[px+2*dpx,py+2*dpy] in [1,12,13,14,17,22,24,27,28,29,30])and(Boxes[px+2*dpx,py+2*dpy]=False) then
      begin;
      Boxes[px+dpx,py+dpy]:=False;
      Boxes[px+2*dpx,py+2*dpy]:=True;
      CountDoors(px+dpx,py+dpy,px+2*dpx,py+2*dpy);
      px:=px+dpx;dpx:=0;
      py:=py+dpy;dpy:=0;
      Turn:=true;
      if (EntitiesArray[EntitiesMatrix[px,py],1] in [2,3,6]) then ActivateEntity(EntitiesMatrix[px,py])
      end;
    if (Level[px+2*dpx,py+2*dpy] in [2,4,5,6,7]) then
      begin;
      Boxes[px+dpx,py+dpy]:=False;
      Level[px+2*dpx,py+2*dpy]:=12;
      px:=px+dpx;dpx:=0;
      py:=py+dpy;dpy:=0;
      Turn:=true;
      if (EntitiesArray[EntitiesMatrix[px,py],1] in [2,3,6]) then ActivateEntity(EntitiesMatrix[px,py])
      end;
    if (Level[px+2*dpx,py+2*dpy] in [3,8,9,10,11]) then
      begin;
      Boxes[px+dpx,py+dpy]:=False;
      px:=px+dpx;dpx:=0;
      py:=py+dpy;dpy:=0;
      Turn:=true;
      if (EntitiesArray[EntitiesMatrix[px,py],1] in [2,3,6]) then ActivateEntity(EntitiesMatrix[px,py])
      end;
    end;

// Дерганье рычага
  if (C in ['h','H']) then
    begin;
    if EntitiesArray[EntitiesMatrix[px,py],1] in [0,2,3,4,5,6] then Echo('What do you want to handle?')
    else
      begin;
      Echo('You switch the lever. You hear a squeaking sound in the distance.');
      ActivateEntity(EntitiesMatrix[px,py]);
      end;
    end;

// Эскейп
  if (C=#27) then begin;Result:=false;EndGame:=true;DeathReason:='Esc pressed';end;
  
// Счетчик ходов
  if Turn then inc(TurnNo);

// Счетчик HP
  if hp<=0 then begin;Echo('You have died...');EndGame:=true;Result:=false;DeathReason:='Death';end;
  until (EndGame=True);
//----------------------------------------------------------------------------------
// Конец игрового цикла
//----------------------------------------------------------------------------------
  
  clrscr(0,0);
  if Result=false then begin;Put(1,1,7,0,'You haven''t completed the level. Reason: '+DeathReason+'.');readok(1,2);end
  else begin;Put(1,1,7,0,'You have completed the level. Your score: '+IntToStr(TurnNo));readok(1
  ,2);end;

  Score:=TurnNo;
end;


//----------------------------------------------------------------------------------
// Инитиализация
//----------------------------------------------------------------------------------
begin;
//GameCycle;
end.



