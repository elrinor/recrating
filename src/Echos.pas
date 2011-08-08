unit Echos;

interface
Procedure Echo(const S:string);
Function PlayerWantsToDiveIntoTheWater : Boolean;
Function PlayerWantsToDiveIntoTheLava : Boolean;
Function PlayerWantsToOpenDoor : Boolean;
Function AskYesNo(const X,Y,color,bkcolor:integer; const Question:string):boolean;

implementation
uses MyCrt;

//----------------------------------------------------------------------------------
// Процедура вывода сообщения
//----------------------------------------------------------------------------------
Procedure Echo(const S:string);
begin;
Put(1,1,7,0,S);
end;

Function AskYesNo(const X,Y,color,bkcolor:integer; const Question:string):boolean;
var c:char;
begin;
Put(x,y,color,bkcolor,Question);
gotoxy(x+length(Question),y);
repeat C:= readkey; until C in ['Y','y','N','n'];
if C in ['Y','y'] then Result:=true else Result:=false;
end;

Function PlayerWantsToDiveIntoTheWater : Boolean;
var c:char;
begin;
Echo('Do you want to dive into the water? [Y/N]');
repeat C:= readkey; until C in ['Y','y','N','n'];
if C in ['Y','y'] then Result:=true else Result:=false;
Echo(CEmptyString);
end;

Function PlayerWantsToDiveIntoTheLava : Boolean;
var c:char;
begin;
Echo('Do you want to dive into the lava? [Y/N]');
repeat C:= readkey; until C in ['Y','y','N','n'];
if C in ['Y','y'] then Result:=true else Result:=false;
Echo(CEmptyString);
end;

Function PlayerWantsToOpenDoor : Boolean;
var c:char;
begin;
Echo('Do you want to open the door? [Y/N]');
repeat C:= readkey; until C in ['Y','y','N','n'];
if C in ['Y','y'] then Result:=true else Result:=false;
Echo(CEmptyString);
end;

end.
