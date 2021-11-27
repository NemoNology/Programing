program Task_486;


procedure Ran_486(f : Text);

var

  i : integer;

begin
  
  
  
  for i := 1 to 10 do
    
    writeln(f, random(100));
  
  for i := 1 to 10 do
  
    writeln(f, random(100) * -1);
  
end;




var

  f_integer, g : Text;

begin


  Assign(f_integer, 'f_integer.txt');
  Assign(g, 'g.txt');
 
  
  Rewrite(f_integer);
  
  
  Ran_486(f_integer);
  Ran_486(f_integer);
  
  
  Close(f_integer);
  
end.
