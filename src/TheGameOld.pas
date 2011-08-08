unit TheGameOld;

interface
uses LabGen;
procedure gamecycle;
var Steni : TLevel;

implementation
uses
  MyCrt,
  StrtMenu,
  Useful,
  GenInfo,
  SysUtils,
  Globals,
  WorldStruct;

type alltextarr=array[0..20] of string;
type allechoarr=array[0..100] of string;
var allevel:allevarr;
    txts:alltextarr;
    echos:allechoarr;
    progdir:string;
    h:TCharacter;
    levarrf:file of TLevel;

const dlay=10;
const filname='dat';
const a=80;
      b=20;
{==================================================}
{<�� ᤥ���� �� ��������� ��६����� (� �� ����!)>}
function innear(sloi,n,x,y,rad:integer;lev:allevarr):integer;
var kol,ix,iy:integer;
begin;kol:=0;
for ix:=(x-rad) to (x+rad) do begin;
for iy:=(y-rad) to (y+rad) do begin;
if (iy>0)and(iy<b+1)and(ix>0)and(ix<a+1)and(lev[ix,iy,sloi]=n) then kol:=kol+1;
end;end;innear:=kol;end;
{==================================================}
{<�� ᤥ���� �� ��������� ��६�����>}
{0-��� �����}
{>0-���-�� �����, ࠢ��� x*10+random(10)}
procedure genmoney(var level:allevarr);
var sten,chan,i,ix,iy,money:integer;
begin;
for iy:=2 to (b-1) do begin;
for ix:=2 to (a-1) do begin;
sten:=-1;
if level[ix,iy,1]=1 then sten:=innear(1,0,ix,iy,1,level);
if (innear(2,0,ix,iy,3,level)<49) then sten:=-1;
if sten>-1 then
begin;chan:=0;
for i:=1 to (sten div 2+1) do chan:=chan-1+random(5)+random(sten div 6+1);
if (1+random(100)<chan) then begin;money:=random(chan*2+1)+random(sten*5)+random(15)+1;
money:=money div 10;if money>127 then money:=127;level[ix,iy,2]:=money;end;
end;end;end;end;
{==================================================}
{<� 楫�� �������⭮ 祣� �� ��������� ��६����� �� ��।�����>}
procedure drawlev;
var i,i1:integer;
begin;
for i:=1 to a do
begin;
for i1:=1 to b do
begin;
if allevel[i,i1,3]=2 then
begin;
if allevel[i,i1,1]=0   then begin;putstr('#',i,i1+3,8,0);end;
if allevel[i,i1,1]=1   then begin;putstr('.',i,i1+3,7,0);end;
if allevel[i,i1,1]=2   then begin;putstr('>',i,i1+3,8,0);end;
if allevel[i,i1,1]=3   then begin;putstr('<',i,i1+3,8,0);end;
if allevel[i,i1,1]=4   then begin;putstr('/',i,i1+3,6,0);end;
if allevel[i,i1,1]=5   then begin;putstr('+',i,i1+3,6,0);end;
if allevel[i,i1,1]=247 then begin;putstr('*',i,i1+3,8,0);end;
if allevel[i,i1,1]=248 then begin;putstr('"',i,i1+3,10,0);end;
if allevel[i,i1,1]=249 then begin;putstr('&',i,i1+3,2,0);end;
if allevel[i,i1,1]=250 then begin;putstr('.',i,i1+3,6,0);end;
if allevel[i,i1,1]=251 then begin;putstr('~',i,i1+3,6,0);end;
if allevel[i,i1,1]=252 then begin;putstr('"',i,i1+3,2,0);end;
if allevel[i,i1,1]=253 then begin;putstr('=',i,i1+3,1,0);end;
if allevel[i,i1,1]=254 then begin;putstr('^',i,i1+3,8,0);end;
if allevel[i,i1,1]=255 then begin;putstr('^',i,i1+3,15,0);end;
if allevel[i,i1,2]>0   then begin;putstr('$',i,i1+3,14,0);end;
end;
end;
end;
end;
{==================================================}
{<ᤥ���� �� ��������� ��६�����>}
procedure syscopy(n:integer);
var i,i1:integer;
begin;for i:=1 to a do begin;for i1:=1 to b do begin;
allevel[i,i1,n]:=steni[i,i1];end;end;end;
{==================================================}
{<ᤥ���� �� ��������� ��६�����>}
procedure letmeseeit(x,y:integer);
var ix,iy,cx,cy,gox,goy,sten,sten1,sten2:integer;
begin;
for ix:=1 to a do
begin;
for iy:=1 to b do
begin;
if allevel[ix,iy,3]=2 then allevel[ix,iy,3]:=1;
end;
end;

for ix:=x-5 to x+5 do
begin;
for iy:=y-4 to y+4 do
begin;
if not((abs(ix-x)+abs(iy-y)>6))and(ix>0)and(ix<a+1)and(iy>0)and(iy<b+1)then allevel[ix,iy,3]:=2;
end;
end;

for ix:=x-5 to x+5 do
begin;
for iy:=y-4 to y+4 do
begin;
if (ix>0)and(ix<a+1)and(iy>0)and(iy<b+1)then
begin;

{���� 1}
gox:=ix;goy:=iy;cx:=x;cy:=y;sten:=0;
repeat
if cx<gox then cx:=cx+1;if cx>gox then cx:=cx-1;
if cy<goy then cy:=cy+1;if cy>goy then cy:=cy-1;
if ((allevel[cx,cy,1]=0)or(allevel[cx,cy,1]=5)or(allevel[cx,cy,1]=255))and(not((cx=gox)and(cy=goy)))then sten:=1;
until (sten=1)or((cx=gox)and(cy=goy));

{���� 2}
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
if ((allevel[cx,cy,1]=0)or(allevel[cx,cy,1]=5)or(allevel[cx,cy,1]=255))and(not((cx=gox)and(cy=goy)))then sten1:=1;
until (sten1=1)or((cx=gox)and(cy=goy));

if (sten+sten1)>1 then allevel[ix,iy,3]:=0;
end;
end;
end;
end;
{==================================================}
{<� �������� ������ ����饬� �ணࠬ���� 楫��>}
{<�� ��������� ��६����� �� ��।�����>}
procedure nullalllevel(var lev:allevarr);
var ix,iy:integer;
begin;for ix:=1 to a do begin;for iy:=1 to b do begin;
lev[ix,iy,1]:=0;lev[ix,iy,2]:=0;lev[ix,iy,3]:=0;end;end;end;
{==================================================}
procedure nullallechos(var echos:allechoarr);
var ix,iy:integer;
begin;for ix:=1 to 100 do begin;echos[ix]:=txts[0];end;end;
{==================================================}
procedure inittext;
var f:text;
    i:integer;
begin;
getdir(0,progdir);progdir:=progdir+'/';
i:=-1;assign(f,progdir+'gamedata\alltexts.'+filname);reset(f);
repeat i:=i+1;readln(f,txts[i]);until eof(f);close(f);end;
{==================================================}
{typeecho=0-�� ���� ᮮ�饭��,��� �� ��⠥��� � ���ᨢ� � ��ন���}
{஢�� ���� 室, �� �ᥣ� �� ���� ������ ���ଠ樨}
{typeecho=1-ᮮ�饭�� ��⠥��� � ���ᨢ�, ��� �����}
procedure addecho(st:string;var nofecho:integer;typeecho:integer);
var n,i:integer;
begin;
nofecho:=100;
if typeecho=1 then
begin;
echos[0]:='';
repeat
for i:=2 to 100 do
begin;
echos[i-1]:=echos[i];
end;
if length(st)>80 then begin;n:=80;
repeat
n:=n-1;until (n=0)or(st[n]=' ');
if n>0 then begin;echos[100]:=copy(st,1,n);delete(st,1,n);end
else
begin;echos[100]:=copy(st,1,80);delete(st,1,80);end;end
else begin;echos[100]:=copy(st,1,length(st));st:='';end;
until length(st)=0;
end;
if typeecho=0 then echos[0]:=st;
end;
{==================================================}
procedure writeecho(var n:integer);
begin;if n<3 then n:=3;if n>100 then n:=100;
if echos[0]='' then begin;
putstr(txts[0],1,1,7,0);putstr(echos[n-2],1,1,7,0);
putstr(txts[0],1,2,7,0);putstr(echos[n-1],1,2,7,0);
putstr(txts[0],1,3,7,0);putstr(echos[n  ],1,3,7,0);
end
else if echos[0]='[]' then begin;
putstr(txts[0],1,3,7,0);
putstr(txts[0],1,1,7,0);putstr(echos[n-1],1,1,7,0);
putstr(txts[0],1,2,7,0);putstr(echos[n  ],1,2,7,0);
end
else begin;
putstr(txts[0],1,3,7,0);putstr(echos[0],1,3,7,0);echos[0]:='[]';
putstr(txts[0],1,1,7,0);putstr(echos[n-1],1,1,7,0);
putstr(txts[0],1,2,7,0);putstr(echos[n  ],1,2,7,0);
end
end;
{==================================================}
function yesnoquest(quest:string;var nofecho:integer):boolean;
var c:char;
begin;
addecho(quest,nofecho,0);writeecho(nofecho);
repeat
c:=readkey;
until (c='y')or(c='Y')or(c='n')or(c='N');
if (c='y')or(c='Y') then yesnoquest:=true;
if (c='n')or(c='N') then yesnoquest:=false;
end;
{==================================================}
procedure directionsel(var dirx,diry,nofecho:integer);
var c:char;
begin;
addecho('�롥�� ���ࠢ����� [1234567890]',nofecho,0);writeecho(nofecho);
repeat c:=readkey;if c=#0 then c:=readkey;
until (c='1')or(c='2')or(c=#80)or(c='3')or(c='4')or(c=#75)or(c='6')or(c=#77)or(c='7')or(c='8')or(c=#72)or(c='9');
if (c='1')          then begin;dirx:=-1;diry:= 1;end;
if (c='2')or(c=#80) then begin;dirx:= 0;diry:= 1;end;
if (c='3')          then begin;dirx:= 1;diry:= 1;end;
if (c='4')or(c=#75) then begin;dirx:=-1;diry:= 0;end;
if (c='6')or(c=#77) then begin;dirx:= 1;diry:= 0;end;
if (c='7')          then begin;dirx:=-1;diry:=-1;end;
if (c='8')or(c=#72) then begin;dirx:= 0;diry:=-1;end;
if (c='9')          then begin;dirx:= 1;diry:=-1;end;
end;
{==================================================}
procedure drawinterface(h:TCharacter;time:timrec;gold:longint);
begin;
putstr('��:'+IntToStr(h.hp.now)+'/'+IntToStr(h.hp.max),1,24,7,0);
putstr('��:'+IntToStr(h.mp.now)+'/'+IntToStr(h.mp.max),1,25,7,0);
putstr('����:('+IntToStr(h.uvert)+'/'+IntToStr(h.defen)+')['+IntToStr(h.pu)+']',15,24,7,0);
putstr(' �⠪�:+'+IntToStr(h.att)+'/'+IntToStr(h.dmg.a)+'d'+IntToStr(h.dmg.b)+'+'+IntToStr(h.dmg.c),15,25,7,0);
putstr('$:'+IntToStr(gold),35,24,7,0);
putstr('�६�:'+IntToStr(time.h)+':'+IntToStr(time.m)+':'+IntToStr(time.s)+'   ',35,25,7,0);
end;
{==================================================}
procedure whatisthetime(hodi:longint;var time:timrec);
begin;
time.s:=(hodi mod 10)*6;hodi:=hodi div 10;
time.m:=hodi mod 60;hodi:=hodi div 60;
time.h:=12+hodi mod 24;hodi:=hodi div 24;
time.d:=16+hodi mod 28;hodi:=hodi div 28;
time.g:=7+hodi mod 12;hodi:=hodi div 12;
time.y:=1117+hodi;
if time.s>59 then begin;time.s:=time.s-60;time.m:=time.m+1;end;
if time.m>59 then begin;time.m:=time.m-60;time.h:=time.h+1;end;
if time.h>23 then begin;time.h:=time.h-24;time.d:=time.d+1;end;
if time.d>27 then begin;time.d:=time.d-28;time.g:=time.g+1;end;
if time.g>12 then begin;time.g:=time.g-12;time.y:=time.y+1;end;
end;
{==================================================}
procedure showtime(time:timrec;var nofecho:integer);
var mess:string;
begin;
addecho('������� '+IntToStr(time.d)+'-� ���� ����� '+CMonthNames[time.g]+' '+IntToStr(time.y)+'-�� ����',nofecho,0);
end;
{==================================================}
procedure gamecycle;
var dirx,diry,nofecho,dpx,dpy:Integer;
{st}hodi,gold:longint;
{an}c:char;
{da}name:string;
{rt}i,i1,glub:integer;
{  }enx,eny,exx,exy:Byte;
    hod:boolean;
    time:timrec;
    px,py:Integer;

var
{help}hlpint:integer;
begin
//loadingdata(dlay);
//randomize;
//inittext;
//getdirname(progdir,filname);
//initoptions;
//splashscreen(dlay);
repeat
gold:=0;dpx:=0;dpy:=0;nofecho:=25;hodi:=0;
time.s:=0;time.m:=0;time.h:=12;time.d:=16;time.g:=7;time.y:=1117;
glub:=1;
nullalllevel(allevel);
nullallechos(echos);
{gendung(steni,enx,eny,exx,exy,10,15);}
World:=TWorldStruct.CreateWorld(px,py);
{px:=enx;py:=eny;}
syscopy(1);
genmoney(allevel);


{startmenu(h,gold,hodi);}
whatisthetime(hodi,time);
clrscr(0,0);


repeat
letmeseeit(px,py);drawlev;
drawinterface(h,time,gold);
putstr('@',px,py+3,7,0);
writeecho(nofecho);gotoxy(px,py+3);
c:=readkey;if c=#0 then c:=readkey;
hod:=false;dpx:=0;dpy:=0;


if (c='1')          then begin;dpx:=-1;dpy:= 1;end;
if (c='2')or(c=#80) then begin;dpx:= 0;dpy:= 1;end;
if (c='3')          then begin;dpx:= 1;dpy:= 1;end;
if (c='4')or(c=#75) then begin;dpx:=-1;dpy:= 0;end;
if (c='6')or(c=#77) then begin;dpx:= 1;dpy:= 0;end;
if (c='7')          then begin;dpx:=-1;dpy:=-1;end;
if (c='8')or(c=#72) then begin;dpx:= 0;dpy:=-1;end;
if (c='9')          then begin;dpx:= 1;dpy:=-1;end;

if allevel[px+dpx,py+dpy,1]=0 then begin;addecho(txts[1],nofecho,0);dpx:=0;dpy:=0;end;
if allevel[px+dpx,py+dpy,1]=254 then begin;addecho(txts[14],nofecho,0);dpx:=0;dpy:=0;end;
if allevel[px+dpx,py+dpy,1]=255 then begin;addecho(txts[15],nofecho,0);dpx:=0;dpy:=0;end;

if ((allevel[px+dpx,py+dpy,1]>=1)and(allevel[px+dpx,py+dpy,1]<=4))or(allevel[px+dpx,py+dpy,1]>=247) then
begin;px:=px+dpx;py:=py+dpy;dpx:=0;dpy:=0;hod:=true;end;


if allevel[px,py,1]=2 then addecho(txts[5],nofecho,0);
if allevel[px,py,1]=3 then addecho(txts[6],nofecho,0);
if allevel[px,py,2]>0 then addecho(txts[3]+' ��窠 '+txts[4],nofecho,0);

if allevel[px+dpx,py+dpy,1]=5 then
begin;
if yesnoquest(txts[9],nofecho) then begin;allevel[px+dpx,py+dpy,1]:=4;addecho(txts[10],nofecho,0);dpx:=0;dpy:=0;hod:=true;end;
end;

if c='c' then
begin;
directionsel(dirx,diry,nofecho);
if allevel[px+dirx,py+diry,1]=4 then begin;allevel[px+dirx,py+diry,1]:=5;addecho(txts[11],nofecho,0);dpx:=0;dpy:=0;
hod:=true;end
else addecho(txts[12],nofecho,0);
end;

if c=',' then
begin;
if allevel[px,py,2]>0 then
begin;
hlpint:=allevel[px,py,2]*10+random(10);
addecho(txts[2]+' '+IntToStr(hlpint)+' '+txts[4],nofecho,1);
gold:=gold+hlpint;allevel[px,py,2]:=0;
hod:=true;
end
else addecho(txts[13],nofecho,0);
end;

if c='<' then
begin;
if allevel[px,py,1]=3 then begin;
dec(glub);
if glub>0 then begin;
nullalllevel(allevel);
gendung(steni,enx,eny,exx,exy,10,15);
px:=enx;py:=eny;addecho(txts[0],nofecho,0);
syscopy(1);
genmoney(allevel);
clrscr(0,0);
hod:=true;
end
else begin;nullalllevel(allevel);
assign(levarrf,progdir+'gamedata/wild.'+filname);reset(levarrf);read(levarrf,steni);close(levarrf);
syscopy(1);px:=3;py:=3;clrscr(0,0);hod:=true;end;
end
else addecho(txts[8],nofecho,0);
end;

if c='>' then
begin;
if (allevel[px,py,1]=2)or(allevel[px,py,1]=247) then begin;
inc(glub);
nullalllevel(allevel);
World.Enter(px,py,px,py);
genlab(steni,enx,eny,exx,exy);
px:=exx;py:=exy;addecho(txts[0],nofecho,0);
syscopy(1);
genmoney(allevel);
clrscr(0,0);
hod:=true;
end
else addecho(txts[7],nofecho,0);
end;

if c=']' then nofecho:=nofecho+1;
if c='[' then nofecho:=nofecho-1;

if c='t' then showtime(time,nofecho);

if hod=true then begin;
hodi:=hodi+1;
time.s:=time.s+6;
if time.s>59 then begin;time.s:=time.s-60;time.m:=time.m+1;end;
if time.m>59 then begin;time.m:=time.m-60;time.h:=time.h+1;end;
if time.h>23 then begin;time.h:=time.h-24;time.d:=time.d+1;end;
if time.d>27 then begin;time.d:=time.d-28;time.g:=time.g+1;end;
if time.g>12 then begin;time.g:=time.g-12;time.y:=time.y+1;end;
end;


until (c=#27)or(hodi=5000);

world.destroy;
if c=#27 then endall(h,gold,hodi);
if hodi=5000 then begin;clrscr(0,0);putstr('��� �����祭�',1,1,14,0);
putstr('�� ���௠�� �६����� ����� (8 �ᮢ 20 �����)',1,2,6,0);readok(1,3);
endall(h,gold,hodi);
hodi:=0;gold:=0;end;

until 1=2;

end;



begin;
end.









