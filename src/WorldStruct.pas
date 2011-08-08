unit WorldStruct;

interface
const MaxLevels = 10;
const WildExits = 20;

type TConnection = record
       IsReal : Boolean;
       LevelTo : Integer;
       X : Byte;
       Y : Byte;
       ToX : Byte;
       ToY : Byte;
       IsDown : Boolean;
     end;

type TConnections = array[1..4] of TConnection;


type TWorldStruct = class(TObject)
     private
       Ladders : array[1..MaxLevels] of TConnections;
       Wild : array[1..WildExits] of TConnection;
       Generated : array[1..MaxLevels] of Boolean;
       LevelTypes : array[1..MaxLevels] of Byte;
       LevelNow : Integer;
     public
       procedure Enter(const X,Y : Integer; var NewX,NewY : Integer);
       constructor CreateWorld(var NewX,NewY : Integer);
     end;




var World : TWorldStruct;


implementation
uses LabGen, Globals, SysUtils, TheGame{Old};

//----------------------------------------------------------------------------------
// Конструктор массива структуры мира (использовать только при создании нового перса)
//----------------------------------------------------------------------------------
constructor TWorldStruct.CreateWorld(var NewX,NewY : Integer);
var i, i1 : Integer;
begin;


for i := 1 to MaxLevels do begin;
Generated[i] := False;
LevelTypes[i] := 1;
for i1 := 1 to 4 do begin;
Ladders[i][i1].X := 0;
Ladders[i][i1].Y := 0;
Ladders[i][i1].ToX := 0;
Ladders[i][i1].ToY := 0;
Ladders[i][i1].LevelTo := 0;
if i1=1 then begin; Ladders[i][i1].IsReal := True; Ladders[i][i1].LevelTo := i+1; Ladders[i][i1].IsDown := True; end
else if i1=2 then begin; Ladders[i][i1].IsReal := True; Ladders[i][i1].LevelTo := i-1; Ladders[i][i1].IsDown := False; end
else Ladders[i][i1].IsReal := False;
end;
end;

LevelNow := 2;
Generate(LevelTypes[2],1,1,1,Ladders[2]); Generated[1] := True;
NewX := Ladders[2][1].X;
NewY := Ladders[2][1].Y;
end;

//----------------------------------------------------------------------------------
// Процедура, загоняющая перса в лестницу и соответственно генерящая подземку и возвращающая новые координаты
//----------------------------------------------------------------------------------
// i1 - номер лестницы, в которую зашел персонаж
// i2 - номер лестницы, из которой выйдет персонаж на новом уровне
procedure TWorldStruct.Enter(const X,Y : Integer; var NewX,NewY : Integer);
var i1, i2, NextLevel, Next2Level : Integer;
    F : File of TLevel;
begin;
for i1 := 1 to 4 do if (Ladders[LevelNow][i1].X=X)and(Ladders[LevelNow][i1].Y=Y) then break;
NextLevel := Ladders[LevelNow][i1].LevelTo;


if Generated[NextLevel]=False then
begin;
Generate(1,NextLevel,1,1,Ladders[NextLevel]);

for i1 := 1 to 4 do
begin;
if (Ladders[NextLevel][i1].IsReal=True) then
begin;
Next2Level := Ladders[NextLevel][i1].LevelTo;
if (Generated[Next2Level]=True)and(Ladders[NextLevel][i1].IsReal=True) then
begin;
for i2 := 1 to 4 do if (Ladders[Next2Level][i2].LevelTo=NextLevel) then break;
Ladders[NextLevel][i1].ToX := Ladders[Next2Level][i2].X;
Ladders[NextLevel][i1].ToY := Ladders[Next2Level][i2].Y;
Ladders[Next2Level][i2].ToX := Ladders[NextLevel][i1].X;
Ladders[Next2Level][i2].ToY := Ladders[NextLevel][i1].Y;
if (Ladders[NextLevel][i1].LevelTo=LevelNow) then begin;
NewX := Ladders[NextLevel][i1].ToX;
NewY := Ladders[NextLevel][i1].ToY;
end;end;end;end;

end

else
begin;
AssignFile(F, ExePath+'GameData\Temp\'+IntToStr(NextLevel)+'.lev');
Read(F, Alllevel.level);
Close(F);
NewX := Ladders[LevelNow][i1].ToX;
NewY := Ladders[LevelNow][i1].ToY;
end;


end;


begin;
end.












