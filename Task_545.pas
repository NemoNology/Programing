program Task_545;



function Is_One(arr : Array of boolean; arr_size : integer): boolean;

var 

  i, k : integer;                       // Счётчики
  
begin

  Is_One := False;                      // "Обнуляем" результат

  for i := 0 to arr_size - 1 do
   
      if arr[i] then
        
        k := k + 1;                     // Вычисляем кол-во людей оставшихся в кругу
      
    
  if k = 1 then
        
    Is_One := True;                     // Если остался один, то функция - "Истина"

end;



function Take_Out_Task_545(arr : Array of boolean; arr_size, m : integer): integer;

var 
  
  k, i : integer;                                // Счётчики
  
begin
  
  
  while not Is_One(arr, arr_size) do
    begin
    
      for i := 0 to arr_size - 1 do
        begin
        
          if arr[i] then
            
            k := k + 1;
            
          if k = m then
            begin
            
              arr[i] := False;
              
              k := 0;
            
            end;
            
        end;
        
    end;
  
  
  for i := 0 to arr_size - 1 do
    begin
    
      if arr[i] then
        begin
        
          Take_Out_Task_545 := i + 1;
          break;
        
        end;
    
    end;


end;




var 

  i, n, m : integer;                          // n - вводимое значение n, i - счётчик
  
  x : Array of boolean;                       // Массив для переменных а
  
begin


  writeln('Введите число n (кол-во людей):');
  
  readln(n);                                  // Получаем размерность будущего массива - кол-во людей
  
  
  writeln('Введите число m:');
  
  readln(m);
  
  
  
  x := new boolean[n];                        // Задаём новую размерность массива


  for i := 0 to n - 1 do      
    
    x[i] := True;                             // Единица означает, что человек стоит в 1-ом кругу
  
  
  writeln('Result: ', Take_Out_Task_545(x, n, m));
  
  
end.