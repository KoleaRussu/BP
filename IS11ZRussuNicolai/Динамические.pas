program students;
type student = record
     nume:string;
     prenume:string;
     nota:1..10;
     Data: record
     zi:1..31;
     luna:1..12;
     an:integer;
end;
end;
  Element = ^Nod;
  Nod = record
    info: student;
    next:Element;
  end;
var
  stiva:Element;
  x:Element;
  raspuns: char;
  i:byte;
begin
  stiva:= Nil;
  writeln ('doriti sa adaugati un student, daca Da, apasti litera D ');
  readln(raspuns);
  while((raspuns = 'd') or (raspuns = 'D')) do 
  begin
  New (x);
  writeln ('Introduceti numele studentului');
  readln(x^.info.nume);
  writeln ('Introduceti prenume studentului');
  readln(x^.info.prenume);
  writeln ('Introduceti nota studentului');
  readln(x^.info.nota);
  writeln ('Introduceti zi nasterii studentului');
  readln(x^.info.data.zi);
  writeln ('Introduceti luna nasterii studentului');
  readln(x^.info.data.luna);
  writeln ('Introduceti anul nasterii studentului');
  readln(x^.info.data.an);
  x^.next:=stiva;
  stiva:=x;
  writeln ('doriti sa adaugati un student, daca Da, apasti litera D ');
  readln(raspuns);
  end;
  //writeln ('Informatia despre ultimelor trei studenti');
  writeln ('Informatia despre studenti');
  x:= stiva;
  i:=0;
  while (x<>Nil) and (i < 3) do begin
  writeln ('Nume si prenume' , x^.info.nume, ' ' , x^.info.prenume);
  writeln ('Nota: ' , x^.info.nota);
  writeln ('Data nasterii: ' , x^.info.data.zi, ' ', x^.info.data.luna, ' ', x^.info.data
  .an);
  writeln;
  i:= i + 1;
  x:=x^.next;
  end;
  x:= stiva;
  i:= 0;
  while (x<>Nil) and (i < 2) do begin
  stiva:= stiva^.next;
  dispose(x);
  x:= stiva;
  end;
  writeln;
  writeln ('Informatia despre studenti care au ramas ' );
  while (x<>Nil) do begin
  writeln ('Nume si prenume' , x^.info.nume, ' ' , x^.info.prenume);
  writeln ('Nota: ' , x^.info.nota);
  writeln ('Data nasterii: ' , x^.info.data.zi, ' ', x^.info.data.luna, ' ', x^.info.data
  .an);
  writeln;
  x:=x^.next;
  end;
end.
