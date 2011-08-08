unit MainMenu;

interface
procedure StartMenu;
var
  ExePath:String;
  CurrentMenu  : Procedure;          // ������������ ��� ����������� ����� ���������
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
  MenuItems    : TMenuItems;         // ������, ������������ ������ ����
  MenuEvents   : TMenuEvents;        // ������, ������������, ����� ������� ����� �������� ��� ��������� ��������� �� ����� ����
  MenuCount    : Byte;               // ���������� ������� ����
  MenuX,MenuY  : Byte;               // ���������� X � Y ������� ������� ������� �������� ����
  MenuLastItem : Byte;               // ����� ������ ����, �� ������� ����� ��������� �� ����������
  MenuNowItem  : Byte;               // ����� ������ ����, �� ������� ����� ���������
  C            : Char;               // ������������ ��� ���������� ������
  PointPoses   : TPointerPositions = (1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
                                     // ����������, ��� ��������� ������ � ������������ �������
  LoadedNow : string;

//----------------------------------------------------------------------------------
// �������� ���� ������� ����
//----------------------------------------------------------------------------------
procedure NullMenuEvents;
var i : Integer;
begin;
for i := 1 to 20 do MenuEvents[i].Launch := False;
end;

//----------------------------------------------------------------------------------
// ���������� ���� � ������������ �� ������ � ����� ���������� ���������
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
// ������ ����������� ���� (��� ������� ������)
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
// ���������� ������� ����
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
// ��������� ���� ����
//----------------------------------------------------------------------------------
procedure DrawMenuTitle;
begin;
Put(3,1,4,0,'ReCrating '+CProgVersion);
end;

//----------------------------------------------------------------------------------
// ���� �� ������ Ok
//----------------------------------------------------------------------------------
Procedure ReadOk(const X,Y:integer);
var c:char;
begin;
PutColored(X,Y,'�004->�014Ok�');
repeat
c:=readkey;
until (C=#13)or(C=#27)
end;

//----------------------------------------------------------------------------------
// ��������������� ���������� ���� ����
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
// �������� �����
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
// ���������� �����
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
// 3. ����� ������������ �����
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
// 2. �������� ����� � ����� ������������ ������
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
// ���������� � ���������� ����� ���������
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
// 8. ������� ����� ���������
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
// 4. ����� ����������������� ������
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
// �������� ��������
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
// ������� ������� ��������
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
// 5. ����� ������ ��� ��������� �����������
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
// 1. ��������� ����
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
// 9. ������
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
PutColored(1,4,'�006[�01412346789�006] Move�');
PutColored(1,5,'�006[�014h�006] Handle something�');
Put(1,7,6,0,'In level editor:');
PutColored(1,8,'�006[�01412346789�006] Move cursor�');
PutColored(1,9,'�006[�014,.�006] Change current tile�');
PutColored(1,10,'�006[�014 �006] Place tile�');
PutColored(1,11,'�006[�014b�006] Place box�');
PutColored(1,12,'�006[�014B�006] Remove box�');
PutColored(1,13,'�006[�014Ctrl+b�006] Show/hide boxes�');
PutColored(1,14,'�006[�014p�006] Set player''s starting position�');
PutColored(1,15,'�006[�014m�006] Set maximum map size�');
PutColored(1,16,'�006[�014e�006] Place entity�');
PutColored(1,17,'�006[�014E�006] Remove entity�');
PutColored(1,18,'�006[�014Ctrl+e�006] Entity Editor�');

Put(1,20,6,0,'In entity editor:');
PutColored(1,21,'�006[�014-+�006] List entities�');
PutColored(1,22,'�006[�014,.�006] Change entitity type�');
PutColored(1,23,'�006[�014[]�006] Change entity-to-entity pointing value�');
PutColored(1,24,'�006[�014Shift+123�006] Change entity-to-tile pointing coordinates number 1-3�');




DrawMenuTitle;
MenuDrawAll;
InitMenuEventHandler;

CurrentMenu := StartMenu;

end;

//----------------------------------------------------------------------------------
// 10.�� �������
//----------------------------------------------------------------------------------
procedure About;
begin;
MenuCount := 1; MenuX := 3; MenuY := 4;
Menuitems[1] := 'Ok';
MenuNowItem := PointPoses[10]; MenuLastItem := PointPoses[10];
NullMenuEvents;

clrscr(0,0);
Put(3,2,8,0,'About');
//PutColored(1,3,'�004ReCrating�006 was originally created by �014Fokin Alexandr�006, �014elric2002@mail.ru�006.�');
PutColored(1,3,'�004ReCrating�006 was originally created by �014Fokin Alexandr�006, �014fokinizh1987@mail.ru�006.�');
DrawMenuTitle;
MenuDrawAll;
InitMenuEventHandler;

CurrentMenu := StartMenu;

end;

//----------------------------------------------------------------------------------
// �����
//----------------------------------------------------------------------------------
Procedure Exit;
begin;
clrscr(0,0);
Put(1,23,7,0,'Have a nice day!');
readkey;
halt;
end;

//----------------------------------------------------------------------------------
// �������������
//----------------------------------------------------------------------------------
begin;

// ���������� �������
ShowCursor(False);

// ��������� � ��������
clrscr(0,0);Put(1,2,15,0,'Loading game data...');

// ������������� ����������
Randomize;
CurrentMenu := StartMenu;
ExePath := ExtractFilePath(Application.ExeName);
LoadedNow:='';

// ������ ����
repeat
Currentmenu;
until 1=2;
end.
