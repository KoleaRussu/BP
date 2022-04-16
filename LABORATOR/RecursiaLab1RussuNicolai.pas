program Recursivitate;
var x:integer;
Procedure P(N: Integer);
Begin
If (N<>0) Then begin
Write(N mod 10);
P(N div 10);
end;
end;
begin
writeln('Vvedite cislo');
readln(x);
P(x);
end.