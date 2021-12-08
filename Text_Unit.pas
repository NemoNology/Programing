/// Модуль с частоиспользуемыми методами при работе с текстовыми файлами
unit Text_Unit;



interface //####################################################################


  uses String_Unit, Array_Unit;
  
  
  var
    
    temp : string;                        // temp - строка файла


  /// Процедура чтения файла f и вывода его в консоль
  procedure Show_file(const f : Text);
    
    
  /// Процедура записи файлов в файл copy
  procedure Copy_files(var copy : Text; params f : Array of Text);
    
    
  /// Функция, возвращающая кол-во строк в файле
  function Get_line_amount(const f : Text): integer;
  
  
  /// Функция получения массива типа integer из файла 
  function Get_Int_array(const f : Text): Array of integer;
  
  
  /// Функция получения массива типа real из файла 
  function Get_Real_array(const f : Text): Array of real;
  
  
  /// Функция получения конкретной строки под индексу index
  function Get_line(const f : Text; index : integer): string;
  
  
  /// Процедура записи строки в файл
  procedure Write_Line(const s : string; const f : Text);
  
  
  /// Получение суммы элементов файла, которые записанны в виде массива типа integer
  function Int_Sum_elements(const f : Text): longint;
  
  
  /// Получение суммы элементов файла, которые записанны в виде массива типа real
  function Real_Sum_elements(const f : Text): real;
  
  
  /// Функция получающая кол-во строк, в которых содержиться подстрока ns
  Function Get_All_Line_Amount(const f : Text; const ns : string): integer;
  
  
  /// Функция, возвращающая массив из строк, в которых содержиться подстрока ns
  function Get_All_lines(const f : Text; const ns : string): Array of string;
  
  
    
    
implementation //###############################################################



  procedure Show_file(const f : Text);
    begin
      
      Reset(f);                               // Открываем файл для чтения
      
      while not Eof(f) do
        begin
        
          readln(f, temp);                    // Читаем строку из файла и записываем её в temp
          writeln(temp);                      // Выводим в консоль
          
        end;
    
      Close(f);                               // Закрываем файл
      
    end;
       
       
  
  procedure Copy_files(var Copy : Text; params f : Array of Text);
    
    var
    
      i : integer;                            // Счётчик
  
    begin
    
    
      Rewrite(copy);                          // Открываем файл для записи
      
    
      for i := 0 to length(f) - 1 do
        begin
        
          Reset(f[i]);                        // Открываем файлы для чтения
        
        end;
        
      for i := 0 to length(f) - 1 do
        begin
        
          while not Eof(f[i]) do     
            begin
        
              readln(f[i], temp);             // Читаем строку из файла и записываем её в temp
              
              writeln(copy, temp);            // полученную строку записываем в результирующий файл-копию
          
            end;
        
        end;
      
      
      for i := 0 to length(f) - 1 do
        begin
        
          Close(f[i]);                        // Закрываем файлы
        
        end;
        
      Close(copy);                            // Закрываем файл-копию
      
    end;
  
  
  
  function Get_line_amount(const f : Text): integer;
    
    var 
      
      res : integer;
      
    begin
      
      Reset(f);
      
      res := 0;
      
      while not Eof(f) do
        begin
        
          res := res + 1;
        
          readln(f, temp);
          
        end;
      Get_line_amount := res;
      
      Close(f);
      
    end;
    
  
  
  function Get_Int_array(const f : Text): Array of integer;
    
    var
    
      k, len, i : integer;
      
      res : Array of integer;
      
    begin
    
      Reset(f);
    
      len := Get_line_amount(f);
      
      res := new integer[len];
      
      i := 0;
      
      while not Eof(f) do
        begin
        
          
          readln(f, temp);
          
          res[i] := stoi(temp);
          
          i := i + 1;
          
        
        end;
      
      Get_Int_array := res;
      
      Close(f);
      
    end;
  
  
  
  function Get_real_array(const f : Text): Array of real;
    
    var
    
      k, len, i : integer;
      
      res : Array of real;
      
    begin
    
      
    
      len := Get_line_amount(f);
      
      res := new real[len];
      
      i := 0;
      
      Reset(f);
      
      while not Eof(f) do
        begin
        
          
          readln(f, temp);
          
          res[i] := stor(temp);
          
          i := i + 1;
          
        
        end;
      
      Get_real_array := res;
      
      Close(f);
      
    end;
    
  
  
  function Get_line(const f : Text; index : integer): string;
  
    var
    
      k : integer;                      // Счётчик
  
    begin
      
      if index > Get_line_amount(f) then
      
        writeln('Кол-во строк файла не соответствует введённому индексу искомой строки!')
        
        
      else
        begin
        
      
          Reset(f);
          
          k := 1;
          
          while not Eof(f) do
            begin
            
              readln(f, temp);
              
              if k = index then
                
                Get_line := temp;
                
              k := k + 1;
            
            end;
          
          Close(f);
          
        end;
    end;
  
  
  
  procedure Write_Line(const s : string; const f : Text);
    begin
    
      Rewrite(f);
      
      writeln(f, s);
      
      Close(f);
    
    end;
  
  
  
  function Int_Sum_elements(const f : Text): longint;
    
    var
    
      res : longint;                  // Итоговая сумма
    
    begin
    
      Reset(f);                       // Открываем файл для чтения
      
      while not Eof(f) do
        begin
        
          readln(f, temp);            // Считываем строку, в которой содержится число
          
          res := res + stoi(temp);    // Сама сумма
        
        end;
      
      Int_Sum_elements := res;        // Приравниваем результат
    
    end;
    
    
  
  function Real_Sum_elements(const f : Text): real;
    
    var
    
      res : real;                     // Итоговая сумма
    
    begin
    
      Reset(f);                       // Открываем файл для чтения
      
      while not Eof(f) do
        begin
        
          readln(f, temp);            // Считываем строку, в которой содержится число
          
          res := res + stor(temp);    // Сама сумма
        
        end;
      
      Real_Sum_elements := res;       // Приравниваем результат
    
    end;
  
  
  
  Function Get_All_Line_Amount(const f : Text; const ns : string): integer;
     
    var
     
      res : integer;                  // Результат - кол-во строк
      
    begin
    
      res := 0;                       // Обнуляем результат
    
      Reset(f);                       // Открываем файл для чтения
      
      while not Eof(f) do
        begin
        
        readln(f, temp);             // Читаем строку
        
        if Is_There_Substring(temp, ns) then    // Если в прочитанной строке есть подстрока ns, то:
        
          res := res + 1;             // Увеличиваем счётчик
        
        end;
      
      
      Get_All_Line_Amount := res;     // Присваиваем результат
      
    
    end;
  
  
  
  function Get_All_lines(const f : Text; const ns : string): Array of string;
    
    var
      
      res : Array of string;                  // Результирующий массив
      
      i : integer;                            // Счётчик
      
    begin
    
      Array_Resize(res, Get_All_Line_Amount(f, ns));  // Задаём размерность массива
      
      Reset(f);                               // Открываем файл для чтения
      
      i := 0;                                 // Обнуляем счётчик - начало массива
      
      while not Eof(f) do                     
        begin
          
          readln(f, temp);                   // Считываем строку из файла
          
          if Is_there_substring(temp, ns) then  // Если в прочитанной строке находится подстрока ns, то:
            begin
            
              res[i] := temp;                 // Записываем в массив строку
              
              i := i + 1;                     // Прибавляем счётчик
              
            end;
          
        end;
        
      
      Get_All_lines := res;
      
    
    end;
  
  
  
  
  
begin //########################################################################
    
  temp := '';  
    
end. //#########################################################################