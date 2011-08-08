unit labgen;

interface
uses WorldStruct;
type TLevel=array[1..80,1..20] of byte;
type allevarr=array[1..80,1..20,1..3] of byte;
procedure genlab(var lev:TLevel;var enx,eny,exx,exy:Byte);
procedure gendung(var lev:TLevel; var enx,eny,exx,exy:Byte; roomqmin,roomqmax:Byte);
procedure generate(const LevelType,LevelNumber,NumberOfExt,NumberOfEnt:Byte; var Ladders:TConnections);

implementation
uses MyCrt, Globals, SysUtils, TheGame{Old};
const a=80;
      b=20;
type levrr=array[1..80,1..20] of shortint;

{==================================================}
procedure draw(level:TLevel;tx,ty:integer);
var i,i1:integer;
       c:char;
begin;
for i:=1 to a do
begin;
for i1:=1 to b do
begin;
if level[i,i1]=0 then begin;put('#',i,i1,8,0);end;
if level[i,i1]=1 then begin;put('.',i,i1,7,0);end;
if level[i,i1]=2 then begin;put('.',i,i1,8,0);end;
end;
end;
putstr('X',tx,ty,14,0);
c:=readkey;if c='q' then halt;
end;
{==================================================}
procedure genlab(var lev:TLevel;var enx,eny,exx,exy:Byte);
var i,i1,ix,iy,dir,dx,dy,xlab,ylab:shortint;
    usl:boolean;
    tupiks:array[1..2,1..100]of shortint;
    en,ex:shortint;

begin;
for i:=1 to a do for i1:=1 to b do lev[i,i1]:=0;

xlab:=a div 2;
if (a mod 2=0) then xlab:=xlab-1;
ylab:=b div 2;
if (b mod 2=0) then ylab:=ylab-1;

for i:=1 to xlab do begin;
for i1:=1 to ylab do begin;

{draw(lev,i*2,i1*2);}
if (lev[i*2,i1*2]=0) then begin;
lev[i*2,i1*2]:=1;ix:=i;iy:=i1;usl:=false;
if (i+1<xlab)and(usl=false) then if (lev[i*2+2,i1*2]=1) then begin;usl:=true;lev[i*2+1,i1*2]:=1;end;
if (i-1>0)and(usl=false) then if (lev[i*2-2,i1*2]=1) then begin;usl:=true;lev[i*2-1,i1*2]:=1;end;
if (i1+1<ylab)and(usl=false) then if (lev[i*2,i1*2+2]=1) then begin;usl:=true;lev[i*2,i1*2+1]:=1;end;
if (i1-1>0)and(usl=false) then if (lev[i*2,i1*2-2]=1) then begin;usl:=true;lev[i*2,i1*2-1]:=1;end;

repeat

dir:=0;
if (ix+1>xlab) then dir:=dir+1
else if (lev[ix*2+2,iy*2]=1) then dir:=dir+1;
if (ix-1<1) then dir:=dir+1
else if (lev[ix*2-2,iy*2]=1) then dir:=dir+1;
if (iy+1>ylab) then dir:=dir+1
else if (lev[ix*2,iy*2+2]=1) then dir:=dir+1;
if (iy-1<1) then dir:=dir+1
else if (lev[ix*2,iy*2-2]=1) then dir:=dir+1;

if dir<4 then begin;
dir:=random(4);
repeat
usl:=true;
if dir=0 then begin;dx:=2;dy:=0;end;
if dir=1 then begin;dx:=-2;dy:=0;end;
if dir=2 then begin;dx:=0;dy:=2;end;
if dir=3 then begin;dx:=0;dy:=-2;end;
if (ix+dx div 2>xlab)or(ix+dx div 2<1)or(iy+dy div 2>ylab)or(iy+dy div 2<1)then begin;dir:=dir+1;usl:=false;end
else if lev[ix*2+dx,iy*2+dy]=1 then begin;dir:=dir+1;usl:=false;end;
if dir>3 then dir:=0;
until usl=true;
end;

if dir<>4 then
begin;
lev[ix*2+dx,iy*2+dy]:=1;
lev[ix*2+dx div 2,iy*2+dy div 2]:=1;
ix:=ix+dx div 2;
iy:=iy+dy div 2;
{draw(lev,ix*2,iy*2);}
end;

until dir=4;

end;

end;end;


i:=0;usl:=false;
for ix:=1 to xlab do begin;for iy:=1 to ylab do begin;
if ((lev[ix*2-1,iy*2]=0)and(lev[ix*2+1,iy*2]=0)and(lev[ix*2,iy*2+1]=0))or
((lev[ix*2-1,iy*2]=0)and(lev[ix*2+1,iy*2]=0)and(lev[ix*2,iy*2-1]=0))or
((lev[ix*2,iy*2-1]=0)and(lev[ix*2,iy*2+1]=0)and(lev[ix*2+1,iy*2]=0))or
((lev[ix*2,iy*2-1]=0)and(lev[ix*2,iy*2+1]=0)and(lev[ix*2-1,iy*2]=0)) then
begin;inc(i);tupiks[1,i]:=ix*2;tupiks[2,i]:=iy*2;if i=100 then usl:=true;end;
if usl=true then break;end;if usl=true then break;end;

en:=random(i)+1;
repeat ex:=random(i)+1;until ex<>en;

enx:=tupiks[1,en];
eny:=tupiks[2,en];
exx:=tupiks[1,ex];
exy:=tupiks[2,ex];
lev[enx,eny]:=2;
lev[exx,exy]:=3;

end;
{==================================================}
procedure gendung(var lev:TLevel; var enx,eny,exx,exy:Byte; roomqmin,roomqmax:Byte);

function doorcanbe(x,y:shortint):boolean;
begin;doorcanbe:=false;
if lev[x,y]=1 then
if (x>1)and(x<a)and(y>1)and(y<b) then
if (lev[x-1,y]<>4)and(lev[x+1,y]<>4)and(lev[x,y-1]<>4)and(lev[x,y+1]<>4)then
if ((lev[x-1,y]=0)and(lev[x+1,y]=0))or((lev[x,y-1]=0)and(lev[x,y+1]=0)) then doorcanbe:=true;end;


var ix,iy,i,i1,i2:integer;
    usl:boolean;
{rooms}
    roomq,roomn,dlx,dly,next:integer;
    rooms:array[1..8,1..50]of shortint;
    maxdlx,maxdly,mindlx,mindly:shortint;
{corridor}
    x1,y1,x2,y2,x,y,dx,dy:integer;
    ways:array[1..2,1..b*4]of shortint;
{final correction}
    en,ex:shortint;
{rooms array:}
{1 - x лев. верх. угла}
{2 - y лев. верх. угла}
{3 - x прав. ниж. угла}
{4 - y прав. ниж. угла}
{5 - длина по x       }
{6 - длина по y       }
{7 - x начала кишки   }
{8 - y начала кишки   }
begin;
maxdlx:=5;mindlx:=4;
maxdly:=5;mindly:=4;
if maxdlx=mindlx then inc(maxdlx);
if maxdly=mindly then inc(maxdly);
for i:=1 to a do for i1:=1 to b do lev[i,i1]:=0;
for i:=1 to b*4 do begin;ways[1,i]:=0;ways[2,i]:=0;end;
if (roomqmin>=roomqmax) then roomq:=roomqmin
else roomq:=roomqmin+random(roomqmax-roomqmin+1);

{gen rooms}for roomn:=1 to roomq do
begin;
rooms[5,roomn]:=mindlx+random(maxdlx-mindlx+1);
rooms[6,roomn]:=mindly+random(maxdly-mindly+1);
i1:=0;i2:=0;
{}repeat
if (i1>10)then begin;i1:=0;inc(i2);dec(rooms[5,roomn]);dec(rooms[6,roomn]);
if (rooms[5,roomn]<3) then rooms[5,roomn]:=3;
if (rooms[6,roomn]<3) then rooms[6,roomn]:=3;
end;
rooms[1,roomn]:=random(a-rooms[5,roomn]-1)+1;
rooms[2,roomn]:=random(b-rooms[6,roomn]-1)+1;
rooms[3,roomn]:=rooms[1,roomn]+rooms[5,roomn];
rooms[4,roomn]:=rooms[2,roomn]+rooms[6,roomn];
usl:=true;inc(i1);
for i:=1 to (roomn-1) do begin;
for ix:=rooms[1,roomn] to rooms[3,roomn] do begin;
for iy:=rooms[2,roomn] to rooms[4,roomn] do begin;
if (ix>=rooms[1,i])and(ix<=rooms[3,i])and(iy>=rooms[2,i])and(iy<=rooms[4,i])then usl:=false;
if usl=false then break;end;if usl=false then break;end;if usl=false then break;end;
if i2>10 then begin;usl:=true;roomq:=roomn;end;
{}until usl=true;

for ix:=(rooms[1,roomn]+1) to (rooms[3,roomn]-1) do
for iy:=(rooms[2,roomn]+1) to (rooms[4,roomn]-1) do lev[ix,iy]:=2;

ix:=rooms[1,roomn]+1+random(rooms[5,roomn]-2);
iy:=rooms[2,roomn]+1+random(rooms[6,roomn]-2);
{lev[ix,iy]:=2;}
rooms[7,roomn]:=ix;
rooms[8,roomn]:=iy;
{/gen rooms}end;


lev[rooms[7,1],rooms[8,1]]:=1;


for roomn:=2 to roomq do
begin;
lev[rooms[7,roomn],rooms[8,roomn]]:=1;
x1:=rooms[7,roomn];y1:=rooms[8,roomn];i:=0;i1:=1;

repeat
inc(i);
for ix:=(x1-i) to (x1+i) do begin;
if (ix<a)and(ix>1)and(y1+i<b)and(y1+i>1)then if lev[ix,y1+i]=1 then begin;ways[1,i1]:=ix;ways[2,i1]:=y1+i;inc(i1);end;
if (ix<a)and(ix>1)and(y1-i<b)and(y1-i>1)then if lev[ix,y1-i]=1 then begin;ways[1,i1]:=ix;ways[2,i1]:=y1-i;inc(i1);end;
end;
for iy:=(y1-i+1) to (y1+i-1) do begin;
if (x1+i<a)and(x1+i>1)and(iy<b)and(iy>1)then if lev[x1+i,iy]=1 then begin;ways[1,i1]:=x1+i;ways[2,i1]:=iy;inc(i1);end;
if (x1-i<a)and(x1-i>1)and(iy<b)and(iy>1)then if lev[x1-i,iy]=1 then begin;ways[1,i1]:=x1-i;ways[2,i1]:=iy;inc(i1);end;
end;
until (i1>1);

dec(i1);if i1>1 then i:=random(i1)+1 else i:=1;
x2:=ways[1,i];y2:=ways[2,i];
if random(2)=1 then usl:=true else usl:=false;
x:=x1;y:=y1;

repeat
if x>x2 then dx:=-1
else if x<x2 then dx:=1
else if x=x2 then dx:=0;
if y>y2 then dy:=-1
else if y<y2 then dy:=1
else if y=y2 then dy:=0;
if usl=true then if dx<>0 then dy:=0;
if usl=false then if dy<>0 then dx:=0;

x:=x+dx;y:=y+dy;

if lev[x,y]=0 then lev[x,y]:=1;

{gotoxy(1,21);write(x1,' ',y1,' -> ',x2,' ',y2,'  :  ',x,'+',dx,' ',y,'+',dy,'         ');
gotoxy(1,22);write(i,' ');for next:=1 to 10 do begin;write(ways[1,next],' ',ways[2,next],', ');end;
draw(lev,x,y);}

until (x=x2)and(y=y2);
end;
{draw(lev,1,1);}

for i:=1 to a do for i1:=1 to b do if lev[i,i1]=2 then lev[i,i1]:=1;

for roomn:=1 to roomq do begin;
for ix:=(rooms[1,roomn]+1) to (rooms[3,roomn]-1) do
begin;
if doorcanbe(ix,rooms[2,roomn]) then lev[ix,rooms[2,roomn]]:=4;
if doorcanbe(ix,rooms[4,roomn]) then lev[ix,rooms[4,roomn]]:=4;
end;
for iy:=(rooms[2,roomn]+1) to (rooms[4,roomn]-1) do
begin;
if doorcanbe(rooms[1,roomn],iy) then lev[rooms[1,roomn],iy]:=4;
if doorcanbe(rooms[3,roomn],iy) then lev[rooms[3,roomn],iy]:=4;
end;
end;

for i:=1 to a do for i1:=1 to b do if lev[i,i1]=4 then if (random(4)>0) then lev[i,i1]:=5;


en:=random(roomq)+1;
repeat ex:=random(roomq)+1;until ex<>en;
enx:=rooms[1,en]+rooms[5,en] div 2;
eny:=rooms[2,en]+rooms[6,en] div 2;
exx:=rooms[1,ex]+rooms[5,ex] div 2;
exy:=rooms[2,ex]+rooms[6,ex] div 2;
lev[enx,eny]:=2;
lev[exx,exy]:=3;


end;
{==================================================}
procedure generate(const LevelType,LevelNumber,NumberOfExt,NumberOfEnt:Byte; var Ladders:TConnections);
var EnX, EnY, ExX, ExY : Byte;
    F : File of TLevel;
begin;
if LevelType=1 then begin;
GenDung(AllLevel.Level, EnX, EnY, ExX, ExY, 45+random(5), 45+random(5));
Ladders[1].X := EnX;
Ladders[1].Y := EnY;
Ladders[1].IsDown := False;
Ladders[2].X := ExX;
Ladders[2].Y := ExY;
Ladders[2].IsDown := True;

AssignFile(F, ExePath+'GameData\Temp\'+IntToStr(LevelNumber)+'.lev');
ReWrite(F);
Write(F, AllLevel.Level);
CloseFile(F);
end;

end;
{==================================================}
begin;
end.