program Task_501_а;



var

  f_FIO, g : Text;
  
  temp, fam, name, otch, iof : string;
  
  i, fam_ind, name_ind, fio_ind, ind : integer;  

begin
  
  fio_ind := 1;
  ind := 1;
  

  Assign(f_FIO, 'f_FIO.txt');
  Assign(g, 'g.txt');
 
  Rewrite(g);
  Reset(f_FIO);
 
 
  while not Eof(f_FIO) do
    begin
      
      readln(f_FIO, temp);
      
      while fio_ind <> 0 do
        begin
          
          
          fam_ind := temp.IndexOf('_', fio_ind) + 1;
          name_ind := temp.IndexOf('_', fam_ind) + 1;
          fio_ind := temp.IndexOf(',', fio_ind) + 1;
          
          
          for i := ind to fio_ind do
            begin
              
              if i < fam_ind then
                
                fam := fam + temp[i]; 
                    
              if (i > fam_ind) and (i < name_ind) then
                  
                name := name + temp[i]; 
                    
              if (i > name_ind) and (i < fio_ind) then 
                    
                otch := otch + temp[i]; 
               
          
            end;
          
          if (name <> '') and (fam <> '') and (otch <> '') then
            begin
            
              iof := name + '_' + otch + '_' + fam + ', ';
              write(g, iof);
            
            end;
          
          
          iof := '';
          fam := '';
          name := '';
          otch := '';
          
          ind := fio_ind + 2;
          
        end;
    end;
  
  
  Close(g);
  Close(f_FIO);
  
  
end.
