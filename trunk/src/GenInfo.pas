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
putstr('Силой измеряется мускульная и физическая мощь вашего  ',x,y   ,6,0);
putstr('персонажа. Эта характеристика особенно важна для      ',x,y+1 ,6,0);
putstr('воинов, варваров, паладинов, монахов и следопытов,    ',x,y+2 ,6,0);
putstr('потому что именно она помогает им добиваться          ',x,y+3 ,6,0);
putstr('превосходства в бою.                                  ',x,y+4 ,6,0);
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
putstr('Ловкостью измеряется координация, проворство, реакция ',x,y   ,6,0);
putstr('и равновесие. Эта характеристика наиболее важна для   ',x,y+1 ,6,0);
putstr('воров, но она также важна для всех персонажей, которые',x,y+2 ,6,0);
putstr('обычно носят легкий или средний доспех или вообще не  ',x,y+3 ,6,0);
putstr('носят доспехов, да и для любого, кто хочет быть       ',x,y+4 ,6,0);
putstr('искусным лучником.                                    ',x,y+5 ,6,0);
putstr('                                                      ',x,y+6 ,6,0);
putstr('                                                      ',x,y+7 ,6,0);
putstr('                                                      ',x,y+8 ,6,0);
putstr('                                                      ',x,y+9 ,6,0);
putstr('                                                      ',x,y+10,6,0);
putstr('                                                      ',x,y+11,6,0);
end;

if stat=3 then
begin;
putstr('Выносливость представляет здоровье и телосложение     ',x,y   ,6,0);
putstr('вашего персонажа. Она увеличивает число хитов         ',x,y+1 ,6,0);
putstr('персонажа, так что является важной характеристикой для',x,y+2 ,6,0);
putstr('каждого искателя приключений.                         ',x,y+3 ,6,0);
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
putstr('Восприятие описывает пять чувств вашего персонажа.    ',x,y   ,6,0);
putstr('От восприятие зависит дальность зрения, острота слуха,',x,y+1 ,6,0);
putstr('вкуса, обоняния и осязания. Персонажи с низким        ',x,y+2 ,6,0);
putstr('восприятием не смогут заметить секретную дверь,       ',x,y+3 ,6,0);
putstr('которая находится у них перед носом, они не услышат   ',x,y+4 ,6,0);
putstr('шагов вора, подкрадывающегося сзади, чтобы всадить    ',x,y+5 ,6,0);
putstr('кинжал им в спину, и попадутся даже на самую простую  ',x,y+6 ,6,0);
putstr('ловушку. Персонажи с высоким восприятием всегда       ',x,y+7 ,6,0);
putstr('настороже, их чувства обострены и они замечают даже   ',x,y+8 ,6,0);
putstr('самые незначительные детали. Восприятие важно для всех',x,y+9 ,6,0);
putstr('персонажей, но в особенности для следопытов, лучников,',x,y+10,6,0);
putstr('убийц, воров, бардов, монахов, друидов и псиоников.   ',x,y+11,6,0);
end;


if stat=5 then
begin;
putstr('Интеллект определяет, насколько успешно ваш персонаж  ',x,y   ,6,0);
putstr('учится и рассуждает. Интеллект важен для магов,       ',x,y+1 ,6,0);
putstr('псиоников и некромантов, потому что он определяет     ',x,y+2 ,6,0);
putstr('количество заклинаний, которое они могут использовать,',x,y+3 ,6,0);
putstr('насколько трудно противостоять их заклинаниям, и      ',x,y+4 ,6,0);
putstr('насколько мощные эти заклинания. Он также важен для   ',x,y+5 ,6,0);
putstr('любого персонажа,который хочет иметь много умений.    ',x,y+6 ,6,0);
putstr('                                                      ',x,y+7 ,6,0);
putstr('                                                      ',x,y+8 ,6,0);
putstr('                                                      ',x,y+9 ,6,0);
putstr('                                                      ',x,y+10,6,0);
putstr('                                                      ',x,y+11,6,0);
end;

if stat=6 then
begin;
putstr('Показатель мудрости описывает волю персонажа, здравый ',x,y   ,6,0);
putstr('смысл, восприятие и интуицию. В то время как интеллект',x,y+1 ,6,0);
putstr('представляет способность анализировать данные,        ',x,y+2 ,6,0);
putstr('мудрость больше связана с осознанием и достижением    ',x,y+3 ,6,0);
putstr('гармонии с окружающей средой. "Рассеянный профессор"  ',x,y+4 ,6,0);
putstr('имеет низкую мудрость и высокий интеллект. Простак    ',x,y+5 ,6,0);
putstr('(низкий интеллект) может иметь высокую мудрость.      ',x,y+6 ,6,0);
putstr('Мудрость - самая важная характеристика для священников',x,y+7 ,6,0);
putstr('и друидов,а также важна для паладинов, следопытов,    ',x,y+8 ,6,0);
putstr('лучников и фермеров. Если вы хотите, чтобы у вашего   ',x,y+9 ,6,0);
putstr('персонажа были обостренные чувства, наделите его      ',x,y+10,6,0);
putstr('высокой мудростью.                                    ',x,y+11,6,0);
end;

if stat=7 then
begin;
putstr('Харизмой измеряется сила личности персонажа,          ',x,y   ,6,0);
putstr('убедительность, персональный магнетизм, способность   ',x,y+1 ,6,0);
putstr('руководить и физическая привлекательность. Харизма    ',x,y+2 ,6,0);
putstr('представляет истинную силу личности, не зависящую от  ',x,y+3 ,6,0);
putstr('того, как персонаж воспринимается другими членами     ',x,y+4 ,6,0);
putstr('социума. Харизма наиболее важна для паладинов, бардов,',x,y+5 ,6,0);
putstr('торговцев и псиоников. Харизма также важна для        ',x,y+6 ,6,0);
putstr('священников, так как она воздействует на их           ',x,y+7 ,6,0);
putstr('способность изгонять нежить.                          ',x,y+8 ,6,0);
putstr('                                                      ',x,y+9 ,6,0);
putstr('                                                      ',x,y+10,6,0);
putstr('                                                      ',x,y+11,6,0);
end;

if stat=8 then
begin;
putstr('Удачей измеряется то, как часто персонажу везет (или  ',x,y   ,6,0);
putstr('не везет). Если вы завязали шнурки на своих ботинках  ',x,y+1 ,6,0);
putstr('только с двадцатой попытки - знайте, ваша проблема в  ',x,y+2 ,6,0);
putstr('низкой удаче. Если же вы, упав со стометровой скалы,  ',x,y+3 ,6,0);
putstr('умудрились ничего не сломать, то это значит, что удача',x,y+4 ,6,0);
putstr('сопутствовала вам. Удача важна для любого персонажа,  ',x,y+5 ,6,0);
putstr('но в особенности для воров, убийц, бардов, торговцев и',x,y+6 ,6,0);
putstr('фермеров. Если вы не хотите в середине игры случайно  ',x,y+7 ,6,0);
putstr('отрубить себе руку и потом всю жизнь ходить инвалидом,',x,y+8 ,6,0);
putstr('то не экономьте на удаче.                             ',x,y+9 ,6,0);
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
// ╨рёъЁр°хээюх ёююс∙хэшх "юс ртЄюЁрї"
//----------------------------------------------------------------------------------
procedure InfoHelpAboutAuthors;
begin;
Coord.Y := 1; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '################################## Об авторах ##################################', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 36, Coord, NOAW);
Coord.X := 36-1;FillConsoleOutputAttribute (ConOutHandle, 14, 11, Coord, NOAW);
Coord.X := 46-1;FillConsoleOutputAttribute (ConOutHandle, 6, 35, Coord, NOAW);
Coord.Y := 2; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, 'Copyright by [ArX] inc, 2002-2003.                                              ', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 14, Coord, NOAW);
Coord.X := 14-1;FillConsoleOutputAttribute (ConOutHandle, 14, 10, Coord, NOAW);
Coord.X := 23-1;FillConsoleOutputAttribute (ConOutHandle, 6, 58, Coord, NOAW);
Coord.Y := 3; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, 'Руководитель проекта, он же единственный дизайнер и программист в одном лице, то', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 80, Coord, NOAW);
Coord.Y := 4; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, 'есть я: Александр Фокин.                                                        ', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 9, Coord, NOAW);
Coord.X := 9-1;FillConsoleOutputAttribute (ConOutHandle, 14, 16, Coord, NOAW);
Coord.X := 24-1;FillConsoleOutputAttribute (ConOutHandle, 6, 57, Coord, NOAW);
Coord.Y := 5; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, 'Также в проекте учавствовали Попов Никита, помогавший мне в реализации различных', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 30, Coord, NOAW);
Coord.X := 30-1;FillConsoleOutputAttribute (ConOutHandle, 14, 13, Coord, NOAW);
Coord.X := 42-1;FillConsoleOutputAttribute (ConOutHandle, 6, 39, Coord, NOAW);
Coord.Y := 6; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, 'алгоритмов, и Дойников Петр, писавший текстовые сообщения и дававший дельные    ', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 15, Coord, NOAW);
Coord.X := 15-1;FillConsoleOutputAttribute (ConOutHandle, 14, 14, Coord, NOAW);
Coord.X := 28-1;FillConsoleOutputAttribute (ConOutHandle, 6, 53, Coord, NOAW);
Coord.Y := 7; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, 'советы по доведению до ума ролевой системы.                                     ', 80, Coord, NOAW);
Coord.X := 1-1;FillConsoleOutputAttribute (ConOutHandle, 6, 80, Coord, NOAW);
end;

//----------------------------------------------------------------------------------
// ╨рёъЁр°хээюх ёююс∙хэшх, т√ырч ∙хх яЁш т√чютх яєэъЄр ьхэ■ "яюью∙№"
//----------------------------------------------------------------------------------
procedure InfoHelp;
begin;
Coord.Y := 1; Coord.X := 0;WriteConsoleOutputCharacter(ConOutHandle, '#################################### Помощь ####################################', 80, Coord, NOAW);
Coord.X := 0;FillConsoleOutputAttribute (ConOutHandle, 6, 38, Coord, NOAW);
Coord.X := 37;FillConsoleOutputAttribute (ConOutHandle, 14, 7, Coord, NOAW);
Coord.X := 43;FillConsoleOutputAttribute (ConOutHandle, 6, 37, Coord, NOAW);
end;

//----------------------------------------------------------------------------------
// ╟рёЄртър
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