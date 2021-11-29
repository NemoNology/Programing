program Task_531;


var 

  i, n : integer;
  
  x : Array of integer;
  
begin

  
  readln(n);

  x := new integer[n];

  for i := 0 to n - 1 do
    
    x[i] := random(100);
      
  for i := 0 to n - 1 do
    
    write(x[i] - x[n - 1], '; ');
    
    writeln();


end.
