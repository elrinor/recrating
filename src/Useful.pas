unit Useful;

interface
function RoundUP(const X : Real) : Integer;
function RoundDN(const X : Real) : Integer;
function Sign(const X : Real) : Integer;

implementation
//----------------------------------------------------------------------------------
// ���������� ����� ����� (� ������ �� ����)
//----------------------------------------------------------------------------------
function RoundUP(const X : Real) : Integer;
begin;
if (Int(X) - X = 0) then Result := Trunc(X)
else if (X > 0) then Result := Trunc(X) + 1
else Result := Trunc(X) - 1;
end;

//----------------------------------------------------------------------------------
// ���������� ����� ���� (� ������ ����)
//----------------------------------------------------------------------------------
function RoundDN(const X : Real) : Integer;
begin;
Result:=Trunc(X);
end;

//----------------------------------------------------------------------------------
// ���������� ���� �����
//----------------------------------------------------------------------------------
function Sign(const X : Real) : Integer;
begin;
if X>0 then Result:=1 else if X<0 then Result:=-1 else Result:=0;
end;


begin;
end.







