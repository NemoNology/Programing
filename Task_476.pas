program Task_476;


var

  f_char, g : Text;
  
  temp : char;

begin


  Assign(f_char, 'f_char.txt');
  Assign(g, 'g.txt');
   
  Reset(f_char);
  Rewrite(g);
  
  
  while not Eof(f_char) do
    begin
    
      readln(f_char, temp);
      writeln(g, temp);
    
    end;  
 
 
  Close(f_char);
  Close(g);
   

end.