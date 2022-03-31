Program angajati;
type
  Angajat = Record
    nume: string;
    data: Record
      zi: 1..31;
      luna: 1..12;
      an: integer;
    end;
    domiciliu: string;
    stagiul: byte;
    rol: string;
    salariu: integer;
  end;
  Element = ^Nod;
  Nod = Record
    info: Angajat;
    next: Element;
    pred: Element;
  end;
var
  x: Angajat;
  sant1, sant2, aux: Element;
  raspuns: char;
  key: 1..4;
  numeCaut: string;
  
Procedure AdaugInc(x: Angajat; var sant1: Element);
var y: Element;
begin
  y:= sant1;
  new(sant1);
  y^.info:= x;
  y^.pred:= sant1;
  sant1^.next:=y;
end;
Procedure AdaugCap(x: Angajat; var sant2: Element);
var y: Element;
begin
  y:= sant2;
  new(sant1);
  y^.info:= x;
  y^.next:= sant2;
  sant2^.pred:=y;
end;
Procedure AdaugIna(x: Angajat; var sant1: Element; var sant2: Element);
var 
  poz, tempPoz: byte;
  temp, parc: Element;
  y: Element;
begin
  writeln('Introduceti pozitia: ');
  readln(poz);
  parc:= sant1^.next;
  tempPoz:= 1;
  while((parc <> sant2) and (tempPoz <> poz)) do begin
    tempPoz:= tempPoz + 1;
    temp:= parc;
    parc:= parc^.next;
  end;
  parc^.pred:= temp^.pred;
  parc^.next:= temp;
  parc^.info:= x;
  temp^.pred^.next:= parc;
  temp^.pred:= parc;
end;
Procedure AdaugDup(x: Angajat; var sant1: Element; var sant2: Element);
var 
  poz, tempPoz: byte;
  temp, parc: Element;
  y: Element;
begin
  writeln('Introduceti pozitia: ');
  readln(poz);
  parc:= sant1^.next;
  tempPoz:= 1;
  while((parc <> sant2) and (tempPoz <> poz)) do begin
    tempPoz:= tempPoz + 1;
    temp:= parc;
    parc:= parc^.next;
  end;
  parc^.pred:= temp;
  parc^.next:= temp^.next;
  parc^.info:= x;
  temp^.next^.pred:= parc;
  temp^.next:= parc;
end;
{Procedure Stergerea(var sant1: Element, nume: string);
var

begin

end;}
begin
  new(sant1);
  new(sant2);
  sant1^.next:= sant2;
  sant1^.pred:= Nil;
  sant1^.next:= Nil;
  sant2^.pred:= sant1;
  writeln('Doriti sa adaugauti un student, daca DA, apasati litera D: ');
  readln(raspuns);
  while((raspuns = 'd') or (raspuns = 'D')) do begin
    //new(x);
    writeln('Introduceti numele angjatului: ');
    readln(x.nume);
    writeln('Introduceti ziua nasterii angjatului: ');
    readln(x.data.zi);
    writeln('Introduceti luna nasterii angjatului: ');
    readln(x.data.luna);
    writeln('Introduceti anul nasterii angjatului: ');
    readln(x.data.an);
    writeln('Introduceti domiciliul angjatului: ');
    readln(x.domiciliu);
    writeln('Introduceti stagiul angjatului: ');
    readln(x.stagiul);
    writeln('Introduceti rolul angjatului: ');
    readln(x.rol);
    writeln('Introduceti salariul angjatului: ');
    readln(x.salariu);
    writeln('Unde doriti sa adaugati: ');
    writeln('1. Inceput');
    writeln('2. Capat');
    writeln('3. Inainte de element');
    writeln('4. Dupa element');
    readln(key);
    if (key = 1) then AdaugInc(x, sant1)
    else
      if (key = 2) then AdaugCap(x, sant2)
      else
       if (key = 3) then AdaugIna(x, sant1, sant2)
       else AdaugDup(x, sant1, sant2);
   
    writeln('Doriti sa adaugauti un student, daca DA, apasati litera D: ');
    readln(raspuns);
   end;
   writeln('Introduceti numele studentului: ');
   readln(numeCaut);
   Stergerea(sant1, numeCaut);
end.  