program Task_531;


var 

  i, n : integer;                             // n - вводимое значение n, i - счётчик
  
  x : Array of integer;                       // Массив для переменных а
  
begin

  
  readln(n);                                  // Получаем размерность будущего массива
  
  x := new integer[n];                        // Задаём новую размерность массива

  for i := 0 to n - 1 do      
    
    x[i] := random(100);                      // Заполняем массив случайными переменными
        
  for i := 0 to n - 1 do
    
    write(x[i] - x[n - 1], '; ');             // Выводим результат программы
    

end.