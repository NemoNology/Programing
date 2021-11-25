program Task_486;



procedure Text_File_Read(f : Text);  // Процедура чтения файла f

var 

  temp : char;
  
begin

  Reset(f);
  
  
  while not Eof(f) do
    begin
    
      readln(f, temp);
      writeln(temp);
      
    end;  


  Close(f);

end;


procedure Text_File_Rewrite(h, f : Text);  // Процедура записи файла f в h файл

var 

  temp : char;
  
begin

  Reset(f);
  //Rewrite(h);
  
  
  while not Eof(f) do
    begin
    
      readln(f, temp);
      writeln(h, temp);
    
    end;  


  Close(f);
  //Close(h);

end;



var

  f_char, g_char, h : Text;

begin


  Assign(f_char, 'f_char.txt');
  Assign(g_char, 'g_char.txt');
  Assign(h, 'h.txt');
 
  Rewrite(h);
 
  
  Text_File_Rewrite(h, f_char);
  Text_File_Rewrite(h, g_char);
 
  
  Close(h);
  
  Text_File_Read(h);  
   

end.