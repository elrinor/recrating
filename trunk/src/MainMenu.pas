unit MainMenu;

interface
procedure StartMenu;
var
  ExePath:String;
  CurrentMenu  : Procedure;          // Используется для перемещения между менюшками
  Procedure ReadOk(const X,Y:integer);

const
  CProgVersion = 'v1.0.0';
  CAllLetters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' ','_','-','1','2','3','4','5','6','7','8','9','0','[',']','!','+','@','#','$','%','^','&','(',')'];


implementation
uses
  SysUtils,
  MyCrt,
  TheGame,
  Forms,
  WorldEdit;

type
  TMenuEvent = record
               Event : procedure;
               Launch : Boolean;
               end;
  TMenuItems = array[1..20] of String[30];
  TMenuEvents = array[1..20] of TMenuEvent;
  TPointerPositions = array[1..20] of Byte;
  TScoreTable=array[1..5]of array[1..20]of record
                                           name:string[20];
                                           score:integer;
                                           end;

var
  MenuItems    : TMenuItems;         // Массив, определяющий пункты меню
  MenuEvents   : TMenuEvents;        // Массив, определяющий, какие события будут запущены при установке указателя на пункт меню
  MenuCount    : Byte;               // Количество пунктов меню
  MenuX,MenuY  : Byte;               // Координаты X и Y первого символа первого элемента меню
  MenuLastItem : Byte;               // Номер пункта меню, на котором стоял указатель до обновления
  MenuNowItem  : Byte;               // Номер пункта меню, на котором стоит указатель
  C            : Char;               // Используется при считывании клавиш
  PointPoses   : TPointerPositions = (1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
                                     // Показывает, где находится курсор в определенной менюшке
  LoadedNow : string;

//----------------------------------------------------------------------------------
// Удаление всех событий меню
//----------------------------------------------------------------------------------
procedure NullMenuEvents;
var i : Integer;
begin;
for i := 1 to 20 do MenuEvents[i].Launch := False;
end;

//----------------------------------------------------------------------------------
// Обновление меню в соответствии со старым и новым положением указателя
//----------------------------------------------------------------------------------
Procedure MenuDraw;
begin;
Put(MenuX-2, MenuY+MenuLastItem-1, 0, 0, '  ');
Put(MenuX-2, MenuY+MenuNowItem-1, 4, 0, '->');
GotoXY(MenuX, MenuY+MenuNowItem-1);

Put(MenuX, MenuY+MenuLastItem-1 , 15, 0, MenuItems[MenuLastItem]);
Put(MenuX, MenuY+MenuNowItem-1 , 14, 0, MenuItems[MenuNowItem]);

MenuLastItem := MenuNowItem;
end;

//----------------------------------------------------------------------------------
// Полная перерисовка меню (без очистки экрана)
//----------------------------------------------------------------------------------
Procedure MenuDrawAll;
var i : integer;
begin;
for i := 1 to MenuCount do if (i<>MenuNowItem) then Put(MenuX, MenuY+i-1, 15, 0, MenuItems[i]);

Put(MenuX, MenuY+MenuNowItem-1, 14, 0, MenuItems[MenuNowItem]);
Put(MenuX-2, MenuY+MenuNowItem-1 , 4, 0, '->');
GotoXY(MenuX, MenuY+MenuNowItem-1);
end;

//----------------------------------------------------------------------------------
// Обработчик событий меню
//----------------------------------------------------------------------------------
procedure InitMenuEventHandler;
begin;
repeat
C:=ReadKey;
if (C='8') then dec(MenuNowItem);
if (C='2') then inc(MenuNowItem);
if (C=#27) then MenuNowItem:=MenuCount;
if (MenuNowItem>MenuCount) then MenuNowItem:=1
else if (MenuNowItem<1) then MenuNowItem:=MenuCount;
MenuDraw;
until (C=#13)or(C=#27);
end;

//----------------------------------------------------------------------------------
// Заголовок всех меню
//----------------------------------------------------------------------------------
procedure DrawMenuTitle;
begin;
Put(3,1,4,0,'ReCrating '+CProgVersion);
end;

//----------------------------------------------------------------------------------
// Меню из одного Ok
//----------------------------------------------------------------------------------
Procedure ReadOk(const X,Y:integer);
var c:char;
begin;
PutColored(X,Y,'Ё004->Ё014OkЁ');
repeat
c:=readkey;
until (C=#13)or(C=#27)
end;

//----------------------------------------------------------------------------------
// Предварительное объявление всех меню
//----------------------------------------------------------------------------------
procedure SelectCharName; forward;
procedure Controls; forward;
procedure About; forward;
Procedure LoadSave; forward;
Procedure Exit; forward;
Procedure ContinueGame; forward;
Procedure PlayCustomLevel; forward;
Procedure ChooseLevelToShowScores; forward;

//----------------------------------------------------------------------------------
// Создание сейва
//----------------------------------------------------------------------------------
Procedure CreateSave;
var f : file of integer;
    i,v:integer;
begin;
Assignfile(f,Exepath+'gamedat\saves\'+LoadedNow+'.sav');
rewrite(f);
v:=1;write(f,v);v:=32000;
for i:=1 to 5 do write(f,v);
close(f);
end;

//----------------------------------------------------------------------------------
// Сохранение сейва
//----------------------------------------------------------------------------------
Procedure SaveGame(const LevelDone,Score:integer);
var LevelsAllowed,i:integer;
    Scores:array[1..5] of integer;
    f:file of Integer;
    ScoreFile:file of TScoreTable;
    ScoreTable:TScoreTable;
begin;
Assignfile(f,Exepath+'gamedat\saves\'+LoadedNow+'.sav');
reset(f);
read(f,LevelsAllowed);
for i:=1 to 5 do read(f,Scores[i]);
close(f);

if (Scores[LevelDone]>Score) then Scores[LevelDone]:=Score;
if LevelDone>=LevelsAllowed then inc(LevelsAllowed);
if LevelsAllowed>5 then LevelsAllowed:=5;

rewrite(f);
write(f,LevelsAllowed);
for i:=1 to 5 do write(f,Scores[i]);
close(f);

AssignFile(ScoreFile,Exepath+'gamedat\scores.hi');
reset(ScoreFile);
read(ScoreFile,ScoreTable);
close(ScoreFile);

for i:=20 downto 1 do
begin;
if (ScoreTable[LevelDone][i].score<Score)and(i<20) then
  begin;
  ScoreTable[LevelDone][i+1].score:=Score;
  ScoreTable[LevelDone][i+1].name:=LoadedNow;
  end
else if (i<20) then
  begin;
  ScoreTable[LevelDone][i+1]:=ScoreTable[LevelDone][i];
  end;
if (i=1)and(ScoreTable[LevelDone][i].score>score)then
  begin;
  ScoreTable[LevelDone][i].score:=Score;
  ScoreTable[LevelDone][i].name:=LoadedNow;
  end;
end;

AssignFile(ScoreFile,Exepath+'gamedat\scores.hi');
rewrite(ScoreFile);
write(ScoreFile,ScoreTable);
close(ScoreFile);

end;

//----------------------------------------------------------------------------------
// 3. Выбор загружаемого сейва
//----------------------------------------------------------------------------------
Procedure ContinueGame;
var SearchRec:TSearchRec;
    i:integer;
begin;

FindFirst(ExePath+'gamedat\saves\*.sav',faAnyFile,SearchRec);
Menuitems[1]:=SearchRec.Name;
i:=1;

While FindNext(SearchRec)=0 do
begin;
inc(i);
Menuitems[i]:=SearchRec.Name;
end;

MenuItems[i+1]:='Back';
MenuCount := i+1; MenuX := 3; MenuY := 3;
MenuNowItem := PointPoses[3]; MenuLastItem := PointPoses[3];
NullMenuEvents;

clrscr(0,0);
Put(3,2,8,0,'Load Game');


DrawMenuTitle;
MenuDrawAll;
InitMenuEventHandler;

if (MenuNowItem<MenuCount) then
  begin;
  LoadedNow:=copy(MenuItems[MenuNowItem],1,Length(MenuItems[MenuNowItem])-4);
  CurrentMenu := LoadSave;
  PointPoses[3]:=MenuNowItem;
  end;
if (MenuNowItem=MenuCount) then
  begin;
  PointPoses[3]:=1;
  CurrentMenu := StartMenu;
  end;

end;

//----------------------------------------------------------------------------------
// 2. Загрузка Сейва и выбор загружаемого уровня
//----------------------------------------------------------------------------------
Procedure LoadSave;
var f : file of integer;
    StrScores:array[1..5] of string;
    i,score,Levels:integer;
begin;
assign(f,ExePath+'gamedat\saves\'+LoadedNow+'.sav');
Reset(f);
read(f,Levels);
for i:=1 to Levels do
  begin;
  read(f,Score);
  if score<32000 then
    StrScores[i]:='(Score: '+IntToStr(Score)+')'
  else
    StrScores[i]:='';
  end;

MenuCount:=Levels+1;MenuX := 3; MenuY := 3;
for i:=1 to Levels do Menuitems[i] := 'Level '+IntToStr(i)+' '+StrScores[i];
Menuitems[MenuCount]:='Back';
MenuNowItem := PointPoses[2]; MenuLastItem := PointPoses[2];
NullMenuEvents;

clrscr(0,0);
Put(3,2,8,0,LoadedNow);

DrawMenuTitle;
MenuDrawAll;
InitMenuEventHandler;

if (MenuNowItem>=1)and(MenuNowItem<=Levels) then
  begin;
  PointPoses[2] := MenuNowItem;
  if GameCycle(MenuNowItem,'',Score) then SaveGame(MenuNowItem,Score);
  CurrentMenu := LoadSave;
  end
else
  begin; PointPoses[2] := 1; CurrentMenu := ContinueGame; end;


end;

//----------------------------------------------------------------------------------
// Считывание с клавиатуры имени персонажа
//----------------------------------------------------------------------------------
procedure ReadCharName;
begin;
ShowCursor(True);

case PointPoses[8] of
1: Put(1, 4, 0, 0, '  ');
2: begin;
   clrscr(0,0);
   DrawMenuTitle;
   Put(1,2,7,0,'Enter your name:');
   end;
end;

LoadedNow := '';

LoadedNow:=ReadStrUsingCharSet(1,3,15,0,20,CAllLetters);

CurrentMenu := SelectCharName;

end;

//----------------------------------------------------------------------------------
// 8. Задание имени персонажа
//----------------------------------------------------------------------------------
procedure SelectCharName;
begin;

MenuCount := 3; MenuX := 3; MenuY := 4;
Menuitems[1] := 'Rename';
Menuitems[2] := 'Ok';
Menuitems[3] := 'Back';
MenuNowItem := PointPoses[8]; MenuLastItem := PointPoses[8];
NullMenuEvents;

clrscr(0,0);
Put(1,3,15,0,LoadedNow);
Put(1,2,7,0,'Enter your name:');

DrawMenuTitle;
MenuDrawAll;
InitMenuEventHandler;

case MenuNowItem of
1: begin; PointPoses[8] := MenuNowItem; CurrentMenu := ReadCharName; end;
2: begin; PointPoses[8] := 2; CreateSave; CurrentMenu := LoadSave; end;
3: begin; PointPoses[8] := 2; CurrentMenu := StartMenu; end;
end;

end;

//----------------------------------------------------------------------------------
// 4. Выбор пользовательского уровня
//----------------------------------------------------------------------------------
Procedure PlayCustomLevel;
var SearchRec:TSearchRec;
    i:integer;
begin;

FindFirst(ExePath+'gamedat\*.lev',faAnyFile,SearchRec);
Menuitems[1]:=SearchRec.Name;
i:=1;

While (FindNext(SearchRec)=0)and(i<20) do
begin;
inc(i);
Menuitems[i]:=SearchRec.Name;
end;

MenuItems[i+1]:='Back';
MenuCount := i+1; MenuX := 3; MenuY := 3;
MenuNowItem := PointPoses[4]; MenuLastItem := PointPoses[4];
NullMenuEvents;

clrscr(0,0);
Put(3,2,8,0,'Play Custom Level');


DrawMenuTitle;
MenuDrawAll;
InitMenuEventHandler;

if (MenuNowItem<MenuCount) then
  begin;
  GameCycle(0,MenuItems[MenuNowItem],i);
  PointPoses[4]:=MenuNowItem;
  CurrentMenu := PlayCustomLevel;
  end;
if (MenuNowItem=MenuCount) then
  begin;
  PointPoses[4]:=1;
  CurrentMenu := StartMenu;
  end;
end;

//----------------------------------------------------------------------------------
// Просмотр рекордов
//----------------------------------------------------------------------------------
Procedure ShowScores(const LevelNo:integer);
var ScoreFile:file of TScoreTable;
    ScoreTable:TScoreTable;
    i:integer;
begin;
AssignFile(ScoreFile,Exepath+'gamedat\scores.hi');
reset(ScoreFile);
read(ScoreFile,ScoreTable);
close(ScoreFile);

MenuCount := 1; MenuX := 3; MenuY := 24;
Menuitems[1] := 'Ok';
MenuNowItem := 1; MenuLastItem := 1;
NullMenuEvents;

clrscr(0,0);
Put(3,2,8,0,'Scores for level '+IntToStr(LevelNo));
Put(1,3,6,0,'#');Put(5,3,6,0,'Name');Put(26,3,6,0,'Score');
for i:=1 to 20 do Put(1,3+i,6,0,IntToStr(i)+'.');
for i:=1 to 20 do Put(5,3+i,6,0,ScoreTable[LevelNo][i].name);
for i:=1 to 20 do if (ScoreTable[LevelNo][i].score<>32000) then Put(26,3+i,14,0,IntToStr(ScoreTable[LevelNo][i].score));

DrawMenuTitle;
MenuDrawAll;
InitMenuEventHandler;

CurrentMenu := ChooseLevelToShowScores;
end;

//----------------------------------------------------------------------------------
// Очистка таблицы рекордов
//----------------------------------------------------------------------------------
Procedure ClearScores;
var s:string;
    i,i1:integer;
    ScoreFile:file of TScoreTable;
    ScoreTable:TScoreTable;
begin;
clrscr(0,0);
DrawMenuTitle;
Put(3,2,8,0,'Clear Scores');
Put(3,3,8,0,'Enter password:');
s:=ReadStrUsingCharSet(1,4,15,0,6,['*','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']);
if s<>'******' then
  begin;
  Put(3,5,8,0,'Wrong password!');
  MenuCount := 1; MenuX := 3; MenuY := 6;
  Menuitems[1] := 'Ok';
  MenuNowItem := 1; MenuLastItem := 1;
  NullMenuEvents;
  MenuDrawAll;
  InitMenuEventHandler;
  end
else
  begin;
  for i:=1 to 5 do for i1:=1 to 20 do begin;ScoreTable[i][i1].name:='';ScoreTable[i][i1].score:=32000;end;
  AssignFile(ScoreFile,Exepath+'gamedat\scores.hi');
  rewrite(ScoreFile);
  write(ScoreFile,ScoreTable);
  close(ScoreFile);
  Put(3,5,8,0,'Clearing scores...done!');
  MenuCount := 1; MenuX := 3; MenuY := 6;
  Menuitems[1] := 'Ok';
  MenuNowItem := 1; MenuLastItem := 1;
  NullMenuEvents;
  MenuDrawAll;
  InitMenuEventHandler;
  end;

end;

//----------------------------------------------------------------------------------
// 5. Выбор уровня для просмотра рузультатов
//----------------------------------------------------------------------------------
Procedure ChooseLevelToShowScores;
begin;

MenuCount := 7; MenuX := 3; MenuY := 3;
Menuitems[1] := '1.lev';
Menuitems[2] := '2.lev';
Menuitems[3] := '3.lev';
Menuitems[4] := '4.lev';
Menuitems[5] := '5.lev';
Menuitems[6] := 'Clear Scores';
Menuitems[7] := 'Back';
MenuNowItem := PointPoses[5]; MenuLastItem := PointPoses[5];
NullMenuEvents;

clrscr(0,0);
Put(3,2,8,0,'Show Scores');

DrawMenuTitle;
MenuDrawAll;
InitMenuEventHandler;

case MenuNowItem of
1..5: begin; PointPoses[5] := MenuNowItem; ShowScores(MenuNowItem); CurrentMenu := ChooseLevelToShowScores; end;
6: begin; PointPoses[5] := MenuNowItem; ClearScores; CurrentMenu := ChooseLevelToShowScores; end;
7: begin; PointPoses[5] := 1; CurrentMenu := StartMenu; end;
end;


end;
//----------------------------------------------------------------------------------
// 1. Стартовое меню
//----------------------------------------------------------------------------------
procedure StartMenu;
begin;

MenuCount := 8; MenuX := 3; MenuY := 2;
Menuitems[1] := 'New Game';
Menuitems[2] := 'Load Game';
Menuitems[3] := 'Play Custom Level';
Menuitems[4] := 'Level Editor';
Menuitems[5] := 'High Scores';
Menuitems[6] := 'Controls';
Menuitems[7] := 'About';
Menuitems[8] := 'Exit';
MenuNowItem := PointPoses[1]; MenuLastItem := PointPoses[1];
NullMenuEvents;

clrscr(0,0);

DrawMenuTitle;
MenuDrawAll;
InitMenuEventHandler;

case MenuNowItem of
1: begin; PointPoses[1] := MenuNowItem; CurrentMenu := ReadCharName; end;
2: begin; PointPoses[1] := MenuNowItem; CurrentMenu := ContinueGame; end;
3: begin; PointPoses[1] := MenuNowItem; CurrentMenu := PlayCustomLevel; end;
4: begin; PointPoses[1] := MenuNowItem; CurrentMenu := LevelEditor; end;
5: begin; PointPoses[1] := MenuNowItem; CurrentMenu := ChooseLevelToShowScores; end;
6: begin; PointPoses[1] := MenuNowItem; CurrentMenu := Controls; end;
7: begin; PointPoses[1] := MenuNowItem; CurrentMenu := About; end;
8: begin; PointPoses[1] := MenuNowItem; CurrentMenu := Exit; end;
end;

end;

//----------------------------------------------------------------------------------
// 9. Помощь
//----------------------------------------------------------------------------------
procedure Controls;
begin;
MenuCount := 1; MenuX := 3; MenuY := 25;
Menuitems[1] := 'Ok';
MenuNowItem := PointPoses[9]; MenuLastItem := PointPoses[9];
NullMenuEvents;

clrscr(0,0);
Put(3,2,8,0,'Controls');
Put(1,3,6,0,'In game:');
PutColored(1,4,'Ё006[Ё01412346789Ё006] MoveЁ');
PutColored(1,5,'Ё006[Ё014hЁ006] Handle somethingЁ');
Put(1,7,6,0,'In level editor:');
PutColored(1,8,'Ё006[Ё01412346789Ё006] Move cursorЁ');
PutColored(1,9,'Ё006[Ё014,.Ё006] Change current tileЁ');
PutColored(1,10,'Ё006[Ё014 Ё006] Place tileЁ');
PutColored(1,11,'Ё006[Ё014bЁ006] Place boxЁ');
PutColored(1,12,'Ё006[Ё014BЁ006] Remove boxЁ');
PutColored(1,13,'Ё006[Ё014Ctrl+bЁ006] Show/hide boxesЁ');
PutColored(1,14,'Ё006[Ё014pЁ006] Set player''s starting positionЁ');
PutColored(1,15,'Ё006[Ё014mЁ006] Set maximum map sizeЁ');
PutColored(1,16,'Ё006[Ё014eЁ006] Place entityЁ');
PutColored(1,17,'Ё006[Ё014EЁ006] Remove entityЁ');
PutColored(1,18,'Ё006[Ё014Ctrl+eЁ006] Entity EditorЁ');

Put(1,20,6,0,'In entity editor:');
PutColored(1,21,'Ё006[Ё014-+Ё006] List entitiesЁ');
PutColored(1,22,'Ё006[Ё014,.Ё006] Change entitity typeЁ');
PutColored(1,23,'Ё006[Ё014[]Ё006] Change entity-to-entity pointing valueЁ');
PutColored(1,24,'Ё006[Ё014Shift+123Ё006] Change entity-to-tile pointing coordinates number 1-3Ё');




DrawMenuTitle;
MenuDrawAll;
InitMenuEventHandler;

CurrentMenu := StartMenu;

end;

//----------------------------------------------------------------------------------
// 10.Об авторах
//----------------------------------------------------------------------------------
procedure About;
begin;
MenuCount := 1; MenuX := 3; MenuY := 4;
Menuitems[1] := 'Ok';
MenuNowItem := PointPoses[10]; MenuLastItem := PointPoses[10];
NullMenuEvents;

clrscr(0,0);
Put(3,2,8,0,'About');
//PutColored(1,3,'Ё004ReCratingЁ006 was originally created by Ё014Fokin AlexandrЁ006, Ё014elric2002@mail.ruЁ006.Ё');
PutColored(1,3,'Ё004ReCratingЁ006 was originally created by Ё014Fokin AlexandrЁ006, Ё014fokinizh1987@mail.ruЁ006.Ё');
DrawMenuTitle;
MenuDrawAll;
InitMenuEventHandler;

CurrentMenu := StartMenu;

end;

//----------------------------------------------------------------------------------
// Выход
//----------------------------------------------------------------------------------
Procedure Exit;
begin;
clrscr(0,0);
Put(1,23,7,0,'Have a nice day!');
readkey;
halt;
end;

//----------------------------------------------------------------------------------
// Инитиализация
//----------------------------------------------------------------------------------
begin;

// Выключение курсора
ShowCursor(False);

// Сообщение о загрузке
clrscr(0,0);Put(1,2,15,0,'Loading game data...');

// Инитиализация переменных
Randomize;
CurrentMenu := StartMenu;
ExePath := ExtractFilePath(Application.ExeName);
LoadedNow:='';

// Запуск меню
repeat
Currentmenu;
until 1=2;
end.
