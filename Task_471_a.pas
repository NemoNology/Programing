program Task_471_a;


var

  sum, a : real;

  f : Text;

begin

  Assign(f, 'file.txt');                  // Assign(f, 'f.txt') - связать файл
                                          //
                                          // Reset(f) - Чтение файла & Его открытие
  Reset(f);                               // Rewrite(f) - Запись в файл & Его открытие
                                          // 
                                          // Close(f) - "Закрыть" файл
  while not Eof(f) do
    begin
    
    readln(f, a);
    sum := sum + a;                                      
    
    end;

  Close(f);
  
  writeln('Полученная сумма: ', sum);
  

end.
