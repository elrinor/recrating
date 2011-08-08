unit geninfo;

interface
procedure infostat(stat,x,y:integer);
procedure InfoHelp;
procedure InfoHelpAboutAuthors;
procedure SplashScreen;


implementation
uses MyCrt, SysUtils, Windows, Globals;
{==================================================}
procedure infostat(stat,x,y:integer);
begin;

if stat=1 then
begin;
putstr('����� ��������� ����쭠� � 䨧��᪠� ���� ��襣�  ',x,y   ,6,0);
putstr('���ᮭ���. �� �ࠪ���⨪� �ᮡ���� ����� ���      ',x,y+1 ,6,0);
putstr('������, ��ࢠ஢, ���������, ����客 � ᫥����⮢,    ',x,y+2 ,6,0);
putstr('��⮬� �� ������ ��� �������� �� ����������          ',x,y+3 ,6,0);
putstr('�ॢ��室�⢠ � ���.                                  ',x,y+4 ,6,0);
putstr('                                                      ',x,y+5 ,6,0);
putstr('                                                      ',x,y+6 ,6,0);
putstr('                                                      ',x,y+7 ,6,0);
putstr('                                                      ',x,y+8 ,6,0);
putstr('                                                      ',x,y+9 ,6,0);
putstr('                                                      ',x,y+10,6,0);
putstr('                                                      ',x,y+11,6,0);
end;

if stat=2 then
begin;
putstr('��������� ��������� ���न����, �஢���⢮, ॠ��� ',x,y   ,6,0);
putstr('� ࠢ����ᨥ. �� �ࠪ���⨪� �������� ����� ���   ',x,y+1 ,6,0);
putstr('��஢, �� ��� ⠪�� ����� ��� ��� ���ᮭ����, �����',x,y+2 ,6,0);
putstr('���筮 ����� ������ ��� �।��� ��ᯥ� ��� ����� ��  ',x,y+3 ,6,0);
putstr('����� ��ᯥ客, �� � ��� ���, �� ��� ����       ',x,y+4 ,6,0);
putstr('����� ��筨���.                                    ',x,y+5 ,6,0);
putstr('                                                      ',x,y+6 ,6,0);
putstr('                                                      ',x,y+7 ,6,0);
putstr('                                                      ',x,y+8 ,6,0);
putstr('                                                      ',x,y+9 ,6,0);
putstr('                                                      ',x,y+10,6,0);
putstr('                                                      ',x,y+11,6,0);
end;

if stat=3 then
begin;
putstr('�뭮᫨����� �।�⠢��� ���஢� � ⥫�᫮�����     ',x,y   ,6,0);
putstr('��襣� ���ᮭ���. ��� 㢥��稢��� �᫮ �⮢         ',x,y+1 ,6,0);
putstr('���ᮭ���, ⠪ �� ���� ������ �ࠪ���⨪�� ���',x,y+2 ,6,0);
putstr('������� �᪠⥫� �ਪ��祭��.                         ',x,y+3 ,6,0);
putstr('                                                      ',x,y+4 ,6,0);
putstr('                                                      ',x,y+5 ,6,0);
putstr('                                                      ',x,y+6 ,6,0);
putstr('                                                      ',x,y+7 ,6,0);
putstr('                                                      ',x,y+8 ,6,0);
putstr('                                                      ',x,y+9 ,6,0);
putstr('                                                      ',x,y+10,6,0);
putstr('                                                      ',x,y+11,6,0);
end;

if stat=4 then
begin;
putstr('�����⨥ ����뢠�� ���� ���� ��襣� ���ᮭ���.    ',x,y   ,6,0);
putstr('�� �����⨥ ������ ���쭮��� �७��, ����� ���,',x,y+1 ,6,0);
putstr('����, ����ﭨ� � ��易���. ���ᮭ��� � ������        ',x,y+2 ,6,0);
putstr('�����⨥� �� ᬮ��� ������� ᥪ���� �����,       ',x,y+3 ,6,0);
putstr('����� ��室���� � ��� ��। ��ᮬ, ��� �� �����   ',x,y+4 ,6,0);
putstr('蠣�� ���, ����ࠤ뢠�饣��� ᧠��, �⮡� �ᠤ���    ',x,y+5 ,6,0);
putstr('������ �� � ᯨ��, � ��������� ���� �� ᠬ�� ������  ',x,y+6 ,6,0);
putstr('������. ���ᮭ��� � ��᮪�� �����⨥� �ᥣ��       ',x,y+7 ,6,0);
putstr('����஦�, �� ���⢠ �����७� � ��� ������� ����   ',x,y+8 ,6,0);
putstr('ᠬ� ������⥫�� ��⠫�. �����⨥ ����� ��� ���',x,y+9 ,6,0);
putstr('���ᮭ����, �� � �ᮡ������ ��� ᫥����⮢, ��筨���,',x,y+10,6,0);
putstr('㡨��, ��஢, ��म�, ����客, ��㨤�� � �ᨮ�����.   ',x,y+11,6,0);
end;


if stat=5 then
begin;
putstr('��⥫���� ��।����, ��᪮�쪮 �ᯥ譮 ��� ���ᮭ��  ',x,y   ,6,0);
putstr('����� � ���㦤���. ��⥫���� ����� ��� �����,       ',x,y+1 ,6,0);
putstr('�ᨮ����� � ���஬��⮢, ��⮬� �� �� ��।����     ',x,y+2 ,6,0);
putstr('������⢮ ����������, ���஥ ��� ����� �ᯮ�짮����,',x,y+3 ,6,0);
putstr('��᪮�쪮 ��㤭� ��⨢������ �� ����������, �      ',x,y+4 ,6,0);
putstr('��᪮�쪮 ���� �� ����������. �� ⠪�� ����� ���   ',x,y+5 ,6,0);
putstr('��� ���ᮭ���,����� ��� ����� ����� 㬥���.    ',x,y+6 ,6,0);
putstr('                                                      ',x,y+7 ,6,0);
putstr('                                                      ',x,y+8 ,6,0);
putstr('                                                      ',x,y+9 ,6,0);
putstr('                                                      ',x,y+10,6,0);
putstr('                                                      ',x,y+11,6,0);
end;

if stat=6 then
begin;
putstr('������⥫� ����� ����뢠�� ���� ���ᮭ���, ��ࠢ� ',x,y   ,6,0);
putstr('���, �����⨥ � ������. � � �६� ��� ��⥫����',x,y+1 ,6,0);
putstr('�।�⠢��� ᯮᮡ����� �������஢��� �����,        ',x,y+2 ,6,0);
putstr('������ ����� �易�� � �ᮧ������ � ���⨦�����    ',x,y+3 ,6,0);
putstr('��ମ��� � ���㦠�饩 �।��. "����ﭭ� ������"  ',x,y+4 ,6,0);
putstr('����� ������ ������ � ��᮪�� ��⥫����. ���⠪    ',x,y+5 ,6,0);
putstr('(������ ��⥫����) ����� ����� ��᮪�� ������.      ',x,y+6 ,6,0);
putstr('������ - ᠬ�� ������ �ࠪ���⨪� ��� ��饭�����',x,y+7 ,6,0);
putstr('� ��㨤��,� ⠪�� ����� ��� ���������, ᫥����⮢,    ',x,y+8 ,6,0);
putstr('��筨��� � �ଥ஢. �᫨ �� ���, �⮡� � ��襣�   ',x,y+9 ,6,0);
putstr('���ᮭ��� �뫨 �����७�� ���⢠, ������� ���      ',x,y+10,6,0);
putstr('��᮪�� �������.                                    ',x,y+11,6,0);
end;

if stat=7 then
begin;
putstr('��ਧ��� ��������� ᨫ� ��筮�� ���ᮭ���,          ',x,y   ,6,0);
putstr('㡥��⥫쭮���, ���ᮭ���� �����⨧�, ᯮᮡ�����   ',x,y+1 ,6,0);
putstr('�㪮������ � 䨧��᪠� �ਢ����⥫쭮���. ��ਧ��    ',x,y+2 ,6,0);
putstr('�।�⠢��� ��⨭��� ᨫ� ��筮��, �� ��������� ��  ',x,y+3 ,6,0);
putstr('⮣�, ��� ���ᮭ�� ���ਭ������� ��㣨�� 童����     ',x,y+4 ,6,0);
putstr('��㬠. ��ਧ�� �������� ����� ��� ���������, ��म�,',x,y+5 ,6,0);
putstr('�࣮�楢 � �ᨮ�����. ��ਧ�� ⠪�� ����� ���        ',x,y+6 ,6,0);
putstr('��饭�����, ⠪ ��� ��� ���������� �� ��           ',x,y+7 ,6,0);
putstr('ᯮᮡ����� �������� ������.                          ',x,y+8 ,6,0);
putstr('                                                      ',x,y+9 ,6,0);
putstr('                                                      ',x,y+10,6,0);
putstr('                                                      ',x,y+11,6,0);
end;

if stat=8 then
begin;
putstr('���祩 ��������� �, ��� ��� ���ᮭ��� ����� (���  ',x,y   ,6,0);
putstr('�� �����). �᫨ �� ���易�� ��ન �� ᢮�� ��⨭���  ',x,y+1 ,6,0);
putstr('⮫쪮 � �����⮩ ����⪨ - �����, ��� �஡���� �  ',x,y+2 ,6,0);
putstr('������ 㤠�. �᫨ �� ��, 㯠� � �⮬��஢�� ᪠��,  ',x,y+3 ,6,0);
putstr('��ਫ��� ��祣� �� ᫮����, � �� �����, �� 㤠�',x,y+4 ,6,0);
putstr('ᮯ���⢮���� ���. ���� ����� ��� ��� ���ᮭ���,  ',x,y+5 ,6,0);
putstr('�� � �ᮡ������ ��� ��஢, 㡨��, ��म�, �࣮�楢 �',x,y+6 ,6,0);
putstr('�ଥ஢. �᫨ �� �� ��� � �।��� ���� ��砩��  ',x,y+7 ,6,0);
putstr('���㡨�� ᥡ� ��� � ��⮬ ��� ����� 室��� ���������,',x,y+8 ,6,0);
putstr('� �� ������ �� 㤠�.                             ',x,y+9 ,6,0);
putstr('                                                      ',x,y+10,6,0);
putstr('                                                      ',x,y+11,6,0);
end;

if stat>8 then
begin;
putstr('                                                      ',x,y   ,6,0);
putstr('                                                      ',x,y+1 ,6,0);
putstr('                                                      ',x,y+2 ,6,0);
putstr('                                                      ',x,y+3 ,6,0);
putstr('                                                      ',x,y+4 ,6,0);
putstr('                                                      ',x,y+5 ,6,0);
putstr('                                                      ',x,y+6 ,6,0);
putstr('                                                      ',x,y+7 ,6,0);
putstr('                                                      ',x,y+8 ,6,0);
putstr('                                                      ',x,y+9 ,6,0);
putstr('                                                      ',x,y+10,6,0);
putstr('                                                      ',x,y+11,6,0);
end;


end;

//----------------------------------------------------------------------------------
// ������������ ��������� "�� �������"
//----------------------------------------------------------------------------------
procedure InfoHelpAboutAuthors;
begin;
Coord.Y := 1; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '################################## �� ����� ##################################', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 36, Coord, NOAW);
Coord.X := 36-1;FillConsoleOutputAttribute (ConOutHandle, 14, 11, Coord, NOAW);
Coord.X := 46-1;FillConsoleOutputAttribute (ConOutHandle, 6, 35, Coord, NOAW);
Coord.Y := 2; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, 'Copyright by [ArX] inc, 2002-2003.                                              ', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 14, Coord, NOAW);
Coord.X := 14-1;FillConsoleOutputAttribute (ConOutHandle, 14, 10, Coord, NOAW);
Coord.X := 23-1;FillConsoleOutputAttribute (ConOutHandle, 6, 58, Coord, NOAW);
Coord.Y := 3; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '�㪮����⥫� �஥��, �� �� �����⢥��� �������� � �ணࠬ���� � ����� ���, �', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 80, Coord, NOAW);
Coord.Y := 4; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '���� �: ����ᠭ�� �����.                                                        ', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 9, Coord, NOAW);
Coord.X := 9-1;FillConsoleOutputAttribute (ConOutHandle, 14, 16, Coord, NOAW);
Coord.X := 24-1;FillConsoleOutputAttribute (ConOutHandle, 6, 57, Coord, NOAW);
Coord.Y := 5; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '����� � �஥�� �砢�⢮���� ����� �����, �������訩 ��� � ॠ����樨 ࠧ�����', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 30, Coord, NOAW);
Coord.X := 30-1;FillConsoleOutputAttribute (ConOutHandle, 14, 13, Coord, NOAW);
Coord.X := 42-1;FillConsoleOutputAttribute (ConOutHandle, 6, 39, Coord, NOAW);
Coord.Y := 6; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '�����⬮�, � �������� ����, ��ᠢ訩 ⥪�⮢� ᮮ�饭�� � �����訩 �����    ', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 15, Coord, NOAW);
Coord.X := 15-1;FillConsoleOutputAttribute (ConOutHandle, 14, 14, Coord, NOAW);
Coord.X := 28-1;FillConsoleOutputAttribute (ConOutHandle, 6, 53, Coord, NOAW);
Coord.Y := 7; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, 'ᮢ��� �� ��������� �� 㬠 ஫���� ��⥬�.                                     ', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 80, Coord, NOAW);
end;

//----------------------------------------------------------------------------------
// ������������ ���������, ��������� ��� ������ ������ ���� "������"
//----------------------------------------------------------------------------------
procedure InfoHelp;
begin;
Coord.Y := 1; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#################################### ������ ####################################', 80, Coord, NOAW);
Coord.X := 0;FillConsoleOutputAttribute (ConOutHandle, 6, 38, Coord, NOAW);
Coord.X := 37;FillConsoleOutputAttribute (ConOutHandle, 14, 7, Coord, NOAW);
Coord.X := 43;FillConsoleOutputAttribute (ConOutHandle, 6, 37, Coord, NOAW);
end;

//----------------------------------------------------------------------------------
// ��������
//----------------------------------------------------------------------------------
procedure SplashScreen;
begin;
ClrScr(0,0);
Coord.Y := 0; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '################################################################################', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 80, Coord, NOAW);
Coord.Y := 1; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#/                                                                            \#', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 1, Coord, NOAW);
Coord.X := 2-1;FillConsoleOutputAttribute (ConOutHandle, 8, 78, Coord, NOAW);
Coord.X := 80-1;FillConsoleOutputAttribute (ConOutHandle, 6, 1, Coord, NOAW);
Coord.Y := 2; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#                                                                              #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 80, Coord, NOAW);
Coord.Y := 3; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#         -======-          -======================-          -======-         #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 11, Coord, NOAW);
Coord.X := 11-1;FillConsoleOutputAttribute (ConOutHandle, 8, 19, Coord, NOAW);
Coord.X := 29-1;FillConsoleOutputAttribute (ConOutHandle, 6, 35, Coord, NOAW);
Coord.X := 63-1;FillConsoleOutputAttribute (ConOutHandle, 8, 9, Coord, NOAW);
Coord.X := 71-1;FillConsoleOutputAttribute (ConOutHandle, 6, 10, Coord, NOAW);
Coord.Y := 4; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#          ******                                              ******          #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 12, Coord, NOAW);
Coord.X := 12-1;FillConsoleOutputAttribute (ConOutHandle, 7, 60, Coord, NOAW);
Coord.X := 71-1;FillConsoleOutputAttribute (ConOutHandle, 6, 10, Coord, NOAW);
Coord.Y := 5; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#           ****                  DeGENeration                  ****           #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 35, Coord, NOAW);
Coord.X := 35-1;FillConsoleOutputAttribute (ConOutHandle, 4, 31, Coord, NOAW);
Coord.X := 65-1;FillConsoleOutputAttribute (ConOutHandle, 7, 7, Coord, NOAW);
Coord.X := 71-1;FillConsoleOutputAttribute (ConOutHandle, 6, 10, Coord, NOAW);
Coord.Y := 6; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#            **                                                  **            #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 66, Coord, NOAW);
Coord.X := 66-1;FillConsoleOutputAttribute (ConOutHandle, 7, 2, Coord, NOAW);
Coord.X := 67-1;FillConsoleOutputAttribute (ConOutHandle, 6, 14, Coord, NOAW);
Coord.Y := 7; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#           ****               [ArX] inc. Project               ****           #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 13, Coord, NOAW);
Coord.X := 13-1;FillConsoleOutputAttribute (ConOutHandle, 7, 3, Coord, NOAW);
Coord.X := 15-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.X := 16-1;FillConsoleOutputAttribute (ConOutHandle, 7, 17, Coord, NOAW);
Coord.X := 32-1;FillConsoleOutputAttribute (ConOutHandle, 14, 34, Coord, NOAW);
Coord.X := 65-1;FillConsoleOutputAttribute (ConOutHandle, 6, 16, Coord, NOAW);
Coord.Y := 8; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#          ******                                              ******          #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 12, Coord, NOAW);
Coord.X := 12-1;FillConsoleOutputAttribute (ConOutHandle, 7, 2, Coord, NOAW);
Coord.X := 13-1;FillConsoleOutputAttribute (ConOutHandle, 6, 5, Coord, NOAW);
Coord.X := 17-1;FillConsoleOutputAttribute (ConOutHandle, 7, 48, Coord, NOAW);
Coord.X := 64-1;FillConsoleOutputAttribute (ConOutHandle, 6, 17, Coord, NOAW);
Coord.Y := 9; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#         -======-          -======================-          -======-         #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 11, Coord, NOAW);
Coord.X := 11-1;FillConsoleOutputAttribute (ConOutHandle, 8, 19, Coord, NOAW);
Coord.X := 29-1;FillConsoleOutputAttribute (ConOutHandle, 6, 35, Coord, NOAW);
Coord.X := 63-1;FillConsoleOutputAttribute (ConOutHandle, 8, 10, Coord, NOAW);
Coord.X := 72-1;FillConsoleOutputAttribute (ConOutHandle, 6, 9, Coord, NOAW);
Coord.Y := 10; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#                                                                              #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 80, Coord, NOAW);
Coord.Y := 11; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#                                                                              #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 80, Coord, NOAW);
Coord.Y := 12; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#                                                                              #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 80, Coord, NOAW);
Coord.Y := 13; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#                                    ******                                    #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 38, Coord, NOAW);
Coord.X := 38-1;FillConsoleOutputAttribute (ConOutHandle, 2, 35, Coord, NOAW);
Coord.X := 72-1;FillConsoleOutputAttribute (ConOutHandle, 6, 9, Coord, NOAW);
Coord.Y := 14; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#                                 ************                                 #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 35, Coord, NOAW);
Coord.X := 35-1;FillConsoleOutputAttribute (ConOutHandle, 2, 38, Coord, NOAW);
Coord.X := 72-1;FillConsoleOutputAttribute (ConOutHandle, 6, 9, Coord, NOAW);
Coord.Y := 15; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#               T               ****************               T               #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 3-1;FillConsoleOutputAttribute (ConOutHandle, 10, 15, Coord, NOAW);
Coord.X := 17-1;FillConsoleOutputAttribute (ConOutHandle, 2, 56, Coord, NOAW);
Coord.X := 72-1;FillConsoleOutputAttribute (ConOutHandle, 6, 9, Coord, NOAW);
Coord.Y := 16; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#             .....            ******************            .....             #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 3-1;FillConsoleOutputAttribute (ConOutHandle, 10, 18, Coord, NOAW);
Coord.X := 20-1;FillConsoleOutputAttribute (ConOutHandle, 2, 37, Coord, NOAW);
Coord.X := 56-1;FillConsoleOutputAttribute (ConOutHandle, 10, 17, Coord, NOAW);
Coord.X := 72-1;FillConsoleOutputAttribute (ConOutHandle, 6, 9, Coord, NOAW);
Coord.Y := 17; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#  T  T   ...............  T   ******************   T  ...............   T  T  #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 3-1;FillConsoleOutputAttribute (ConOutHandle, 2, 9, Coord, NOAW);
Coord.X := 11-1;FillConsoleOutputAttribute (ConOutHandle, 10, 16, Coord, NOAW);
Coord.X := 26-1;FillConsoleOutputAttribute (ConOutHandle, 2, 31, Coord, NOAW);
Coord.X := 56-1;FillConsoleOutputAttribute (ConOutHandle, 10, 16, Coord, NOAW);
Coord.X := 71-1;FillConsoleOutputAttribute (ConOutHandle, 2, 9, Coord, NOAW);
Coord.X := 79-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.Y := 18; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '# ............................=*****=******=*****=............................ #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 3-1;FillConsoleOutputAttribute (ConOutHandle, 10, 29, Coord, NOAW);
Coord.X := 31-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.X := 32-1;FillConsoleOutputAttribute (ConOutHandle, 2, 6, Coord, NOAW);
Coord.X := 37-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.X := 38-1;FillConsoleOutputAttribute (ConOutHandle, 2, 7, Coord, NOAW);
Coord.X := 44-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.X := 45-1;FillConsoleOutputAttribute (ConOutHandle, 2, 6, Coord, NOAW);
Coord.X := 50-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.X := 51-1;FillConsoleOutputAttribute (ConOutHandle, 10, 29, Coord, NOAW);
Coord.X := 79-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.Y := 19; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '# ............................=*****==****==*****=............................ #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 3-1;FillConsoleOutputAttribute (ConOutHandle, 10, 29, Coord, NOAW);
Coord.X := 31-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.X := 32-1;FillConsoleOutputAttribute (ConOutHandle, 2, 6, Coord, NOAW);
Coord.X := 37-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 39-1;FillConsoleOutputAttribute (ConOutHandle, 2, 5, Coord, NOAW);
Coord.X := 43-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 45-1;FillConsoleOutputAttribute (ConOutHandle, 2, 6, Coord, NOAW);
Coord.X := 50-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.X := 51-1;FillConsoleOutputAttribute (ConOutHandle, 10, 29, Coord, NOAW);
Coord.X := 79-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.Y := 20; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '# ............................==*****======*****==............................ #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 3-1;FillConsoleOutputAttribute (ConOutHandle, 10, 29, Coord, NOAW);
Coord.X := 31-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 33-1;FillConsoleOutputAttribute (ConOutHandle, 2, 6, Coord, NOAW);
Coord.X := 38-1;FillConsoleOutputAttribute (ConOutHandle, 6, 7, Coord, NOAW);
Coord.X := 44-1;FillConsoleOutputAttribute (ConOutHandle, 2, 6, Coord, NOAW);
Coord.X := 49-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 51-1;FillConsoleOutputAttribute (ConOutHandle, 10, 29, Coord, NOAW);
Coord.X := 79-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.Y := 21; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '# .............................===*****==*****===............................. #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 3-1;FillConsoleOutputAttribute (ConOutHandle, 10, 30, Coord, NOAW);
Coord.X := 32-1;FillConsoleOutputAttribute (ConOutHandle, 6, 4, Coord, NOAW);
Coord.X := 35-1;FillConsoleOutputAttribute (ConOutHandle, 2, 6, Coord, NOAW);
Coord.X := 40-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 42-1;FillConsoleOutputAttribute (ConOutHandle, 2, 6, Coord, NOAW);
Coord.X := 47-1;FillConsoleOutputAttribute (ConOutHandle, 6, 4, Coord, NOAW);
Coord.X := 50-1;FillConsoleOutputAttribute (ConOutHandle, 10, 30, Coord, NOAW);
Coord.X := 79-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.Y := 22; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#  ..............................====**==**====..............................  #', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 4, Coord, NOAW);
Coord.X := 4-1;FillConsoleOutputAttribute (ConOutHandle, 10, 31, Coord, NOAW);
Coord.X := 34-1;FillConsoleOutputAttribute (ConOutHandle, 6, 5, Coord, NOAW);
Coord.X := 38-1;FillConsoleOutputAttribute (ConOutHandle, 2, 3, Coord, NOAW);
Coord.X := 40-1;FillConsoleOutputAttribute (ConOutHandle, 6, 3, Coord, NOAW);
Coord.X := 42-1;FillConsoleOutputAttribute (ConOutHandle, 2, 3, Coord, NOAW);
Coord.X := 44-1;FillConsoleOutputAttribute (ConOutHandle, 6, 5, Coord, NOAW);
Coord.X := 48-1;FillConsoleOutputAttribute (ConOutHandle, 10, 32, Coord, NOAW);
Coord.X := 79-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.Y := 23; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#\                                  ========                                  /#', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 2, Coord, NOAW);
Coord.X := 2-1;FillConsoleOutputAttribute (ConOutHandle, 8, 36, Coord, NOAW);
Coord.X := 37-1;FillConsoleOutputAttribute (ConOutHandle, 6, 43, Coord, NOAW);
Coord.X := 79-1;FillConsoleOutputAttribute (ConOutHandle, 8, 1, Coord, NOAW);
Coord.X := 80-1;FillConsoleOutputAttribute (ConOutHandle, 6, 1, Coord, NOAW);
Coord.Y := 24; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '################################################################################', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 80, Coord, NOAW);
Coord.Y := 25; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '                                                                                ', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 15, 80, Coord, NOAW);
end;

{
################################################################################
#/                                                                            \#
#                                                                              #
#         -======-          -======================-          -======-         #
#          ******                                              ******          #
#           ****                  DeGENeration                  ****           #
#            **                                                  **            #
#           ****               [ArX] inc. Project               ****           #
#          ******                                              ******          #
#         -======-          -======================-          -======-         #
#                                                                              #
#                                                                              #
#                                                                              #
#                                    ******                                    #
#                                 ************                                 #
#               T               ****************               T               #
#             .....            ******************            .....             #
#  T  T   ...............  T   ******************   T  ...............   T  T  #
# ............................=*****=******=*****=............................ #
# ............................=*****==****==*****=............................ #
# ............................==*****======*****==............................ #
# .............................===*****==*****===............................. #
#  ..............................====**==**====..............................  #
#\                                  ========                                  /#
################################################################################
}

begin;
end.