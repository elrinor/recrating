unit CharStruct;

interface
//----------------------------------------------------------------------------------
// ���� �����, ����������� ��������
//----------------------------------------------------------------------------------
// ������ ��������������
type TStat = record
       Unm : Integer;  // UNM - UNModified
       Max : Integer;  // MAX - MAXimum
       Cmd : Integer;  // CMD - Constant MoDifier
       Tmd : Integer;  // TMD - Time-based MoDifier
       Imd : Integer;  // IMD - Item-based MoDifier
       Now : Integer;  // now - ���� ����� ������
     end;

// ������ �������������
type TStats = array[1..8] of TStat;

// ������ ���� / ��������
type TBaseStat = record
       Max : Integer;
       Now : Integer;
     end;

// ������, ������������ ��� ���� ������ ���������
Type TDefence = record
       DV : Integer;  // Dodge Value - ���� ����������, �� ������� �������� �����
       AV : Integer;  // Armor Value - ���� ����, ��� ���� ��������� �������� �����
       DR : Integer;  // Damage Reduction - ������� ����� �������� �����, ���� ���� ���������
     end;

// ������ ������ (Result = [A]d[B] + [C])
type TDice = record
       A : Byte;
       B : Byte;
       C : Byte;
     end;

// ������ �����+�����
type TAttack = record
       AR : Integer;
       Dmg : TDice;
     end;

// ����� ��������� (������)
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
// ���� ����������
//----------------------------------------------------------------------------------
// ��������
var
  h : TChar;


implementation
//----------------------------------------------------------------------------------
// ����������� ���������� ���������
//----------------------------------------------------------------------------------
constructor TChar.Create;
begin;
Impenetrable := [0,5];
Penetrable := [1,2,3,4];
end;



begin;
end.
