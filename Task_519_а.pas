program Task_519_a;


/// Функция к заданию 519 a - подсчёт круглых скобок
function Is_True_Task_519_a(ln : string): boolean;

var 

                                        // i - счётчик
  i, x1, x2 : integer;                  // x1 - кол-во символов '(' 
                                        // x2 - кол-во символов ')'
  
begin


  for i := 1 to length(ln) do
    begin
    
      if ln[i] = '(' then
        
        x1 := x1 + 1;
      
      if ln[i] = ')' then
        
        x2 := x2 + 1;
    
    end;
    
    
    if x1 = x2 then
      
      Is_True_Task_519_a := True
    
    else
    
      Is_True_Task_519_a := False;


end;



var
  
  temp : string;                        // temp - переменная для записи строки из файла
  
  i : integer;                          // i - счётчик
  
  f_program_519_a : Text;               // Сам текстовый файл
  
  flag : boolean;                       // Флаг для вывода результата

begin
  
  
  flag := True;                         // "Обнуление" флага
  

  Assign(f_program_519_a, 'f_program_519_a.txt');
 
  Reset(f_program_519_a);               // Открываем файл для чтения            
 
 
  while not Eof(f_program_519_a) do
    begin
      
      
      readln(f_program_519_a, temp);
      
      
      if not Is_True_Task_519_a(temp) then
        
        flag := False;
      
      
    end;
  
  
  if flag then
    
    writeln('Кол-во скобок одинаково')
  
  else
    
    writeln('Кол-во скобок НЕ одинаково!');
  
  
  Close(f_program_519_a);               // Закрываем файл
  
  
end.