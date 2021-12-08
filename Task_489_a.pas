﻿program Task_489;


var

  f_integer, g : Text;
  
  temp : integer;

begin
  

  Assign(f_integer, 'f_integer.txt');
  Assign(g, 'g.txt');
 
  Rewrite(g);
  Reset(f_integer);
 
  while not Eof(f_integer) do
    begin
      
      
      readln(f_integer, temp);
      writeln(g, temp);
      readln(f_integer, temp);
      
      
    end;
  
  
  Close(g);
  Close(f_integer);
  
  
end.