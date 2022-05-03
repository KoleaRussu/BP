Program CarteLB;
type
  Carte = Record
    numarul: integer;
    denumirea: string;
    autorulu: string;
    anul: integer;
    exemplare: integer;
  end;
  Element = ^Nod;
  Nod = Record
    info: Carte;
    next: Element;
  end;
var
  stiva, x: Element;
  raspuns:char;
  i: byte;
  g:string;
begin
  stiva:= Nil;
  writeln('Doriti sa adaugauti o carte, daca DA, apasati litera D: ');
  readln(raspuns);
  while((raspuns = 'd') or (raspuns = 'D')) do begin
     new(x);
     writeln('Introduceti numarul cartii: ');
     readln(x^.info.numarul);
     writeln('Introduceti denumirea cartii: ');
     readln(x^.info.denumirea);
     writeln('Introduceti numele autorului: ');
     readln(x^.info.autorulu);
     writeln('Introduceti anul editiei: ');
     readln(x^.info.anul);
     writeln('Introduceti numarul de exemplare: ');
     readln(x^.info.exemplare);
     x^.next:= stiva;
     stiva:= x;
     writeln('Doriti sa adaugauti  o carte, daca DA, apasati litera D: ');
     readln(raspuns);
   end;
   writeln('Introduceti carte care vreti sa gasiti: ');
   readln(g);
   while(x<>Nil) do begin
   if (g = x^.info.denumirea) then
   writeln('Nume denumirea cartei: ', x^.info.denumirea, 'este in lista.');
    x:= x^.next;
   end;
end.