unit CharStruct;

interface
//----------------------------------------------------------------------------------
// Блок типов, описывающих персонаж
//----------------------------------------------------------------------------------
// Запись характеристики
type TStat = record
       Unm : Integer;  // UNM - UNModified
       Max : Integer;  // MAX - MAXimum
       Cmd : Integer;  // CMD - Constant MoDifier
       Tmd : Integer;  // TMD - Time-based MoDifier
       Imd : Integer;  // IMD - Item-based MoDifier
       Now : Integer;  // now - чему равна сейчас
     end;

// Массив характеристик
type TStats = array[1..8] of TStat;

// Запись маны / здоровья
type TBaseStat = record
       Max : Integer;
       Now : Integer;
     end;

// Запись, показывающая все типы защиты персонажа
Type TDefence = record
       DV : Integer;  // Dodge Value - шанс увернуться, не получив никакого урона
       AV : Integer;  // Armor Value - шанс того, что удар полностью поглотит броня
       DR : Integer;  // Damage Reduction - сколько урона поглотит броня, если удар произошел
     end;

// Запись кубика (Result = [A]d[B] + [C])
type TDice = record
       A : Byte;
       B : Byte;
       C : Byte;
     end;

// Запись атаки+урона
type TAttack = record
       AR : Integer;
       Dmg : TDice;
     end;

// Класс персонажа (обьект)
type TChar = class(TObject)
     public
       Stats : TStats;
       HP : TBaseStat;
       MP : TBaseStat;
       Defence : TDefence;
       Attack : TAttack;
       KickAttack : TAttack;
       Race : Byte;
       Prof : Byte;
       Sex : Byte;
       Alignment : Byte;
//       Birth : TDateTime;
       month:Byte;
       day:Byte;
       Name : string[80];
       SaveName : string[20];
       Loaded : Boolean;
       Impenetrable : set of Byte;
       Penetrable : set of Byte;
       constructor Create;
     end;

//----------------------------------------------------------------------------------
// Блок переменных
//----------------------------------------------------------------------------------
// Персонаж
var
  h : TChar;


implementation
//----------------------------------------------------------------------------------
// Конструктор переменной персонажа
//----------------------------------------------------------------------------------
constructor TChar.Create;
begin;
Impenetrable := [0,5];
Penetrable := [1,2,3,4];
end;



begin;
end.
