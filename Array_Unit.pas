/// Модуль с частоиспользуемыми методами при работе с массивами
unit Array_Unit;



interface //####################################################################

  
  
  /// Функция суммирования элементов массива типа integer
  function Sum_elements(const arr : Array of integer): integer;
  
  
  /// Функция суммирования элементов от начала массива (типа integer) до index 
  function Sum_elements(const arr : Array of integer; index : integer): integer;
  
  
  /// Функция суммирования элементов массива типа real
  function Sum_elements(const arr : Array of real): real;
  
  
  /// Функция суммирования элементов от начала массива (типа real) до index 
  function Sum_elements(const arr : Array of real; index : integer): real;
  
  
  /// Процедура заполнения массива случайными числами типа integer
  procedure Random_array(var arr : Array of integer);
  
  
  /// Процедура заполнения массива случайными числами типа real
  procedure Random_array(var arr : Array of real);
  
  
  /// Процедура вывода массива типа integer в консоль
  procedure Show_array(const arr : Array of integer);
  
  /// Процедура вывода массива типа real в консоль
  procedure Show_array(const arr : Array of real);
  
  
  /// Процедура вывода массива типа string в консоль
  procedure Show_array(const arr : Array of string);
  
  
  /// Процедура записи массива типа integer в файл
  procedure Record_array(const arr : Array of integer; var f : Text);
  
  
  /// Процедура записи массива типа real в файл
  procedure Record_array(const arr : Array of real; var f : Text);
  
  
  /// Процедура изменения размера массива типа integer
  procedure Array_Resize(var arr : Array of integer; const new_size: integer);
  
  
  /// Процедура изменения размера массива типа real
  procedure Array_Resize(var arr : Array of real; const new_size: integer);
  
  
  /// Процедура изменения размера массива типа string
  procedure Array_Resize(var arr : Array of string; const new_size: integer);
  
  
  /// Процедура заполняющая весь массив (типа boolean) значением value 
  procedure Filling_Array(var arr : Array of boolean; const value : boolean);
  
    
    
implementation //###############################################################



  function Sum_elements(const arr : Array of integer): integer;
  
    var 
  
      i, sum : integer;                              // Счётчик и результат
    
    begin
    
      for i := 1 to length(arr) do
        
        sum := sum + arr[i];
        
      Sum_elements := sum;
        
    end;
    
    
  
  function Sum_elements(const arr : Array of integer; index : integer): integer;
    
    var
      
      i, sum : integer;                         // Счётчик и результат
    
    begin
    
      for i := 0 to index do
        
        sum := sum + arr[i];
        
      Sum_elements := sum;
    
    end;
  
  
  
  function Sum_elements(const arr : Array of real): real;
  
    var 
  
      i : integer;                              // Счётчик
      
      sum : real;                               // Итоговая сумма
    
    begin
    
      for i := 0 to length(arr) do
        
        sum := sum + arr[i];
        
      Sum_elements := sum;
        
    end;
      
      
  
  function Sum_elements(const arr : Array of real; index : integer): real;
    
    var
      
      i : integer;                              // Счётчик
      
      sum : real;                               // Итоговая сумма
    
    begin
    
      for i := 0 to index do
        
        sum := sum + arr[i];
        
      Sum_elements := sum;
    
    end;
    
    
 
  procedure Random_array(var arr: Array of integer);
  
    var
  
      i : integer;                              // Счётчик
  
    begin
    
      for i := 0 to length(arr) - 1 do
        
        arr[i] := random(200) - 100;
    
    end;
    
    
  
  procedure Random_array(var arr: Array of real);
  
    var
  
      i : integer;                              // Счётчик
  
    begin
    
      for i := 0 to length(arr) - 1 do
        
        arr[i] := (random(600) - 300) / random(2, 9);
    
    end;
    
    
    
  procedure Show_array(const arr: Array of integer);
  
    var
    
      i : integer;                              // Счётчик
  
    begin
    
      for i := 0 to length(arr) - 1 do
        
        write(arr[i], '  ');
        
      writeln();
    
    end;
    
  
  
  procedure Show_array(const arr: Array of real);
    
    var
    
      i : integer;                              // Счётчик
  
    begin
    
      for i := 0 to length(arr) - 1 do
        
        write(arr[i], '  ');
        
      writeln();
    
    end;
  
  
  
  procedure Show_array(const arr: Array of string);
  
    var
    
      i : integer;                              // Счётчик
  
    begin
    
      for i := 0 to length(arr) - 1 do
        
        writeln(arr[i], '  ');
        
      writeln();
    
    end;
  
  
  
  procedure Record_array(const arr: Array of integer; var f : Text);
  
    var
    
      i : integer;                              // Счётчик
  
    begin
    
      Rewrite(f);
      
      for i := 0 to length(arr) - 1 do
        
        writeln(f, arr[i]);
      
      Close(f);
      
    end;
    
    
    
  procedure Record_array(const arr: Array of real; var f : Text);
  
    var
    
      i : integer;                              // Счётчик
  
    begin
    
      Rewrite(f);
      
      for i := 0 to length(arr) - 1 do
        
        writeln(f, arr[i]);
      
      Close(f);
      
    end;  
    
    
  
  procedure Array_Resize(var arr: Array of integer; const new_size: integer);
    
    var
    
      temp_arr : Array of integer;    // Массив для передачи старых данных массива новому массиву
      
      i : integer;                    // Счётчик
    
    begin
    
    
      temp_arr := new integer[length(arr)];     // Создаём временный массив
      
      temp_arr := arr;                // Приравниваем старые значения массива временному массиву
    
      arr := new integer[new_size];   // Изменяем размерность массива...
      
      for i := 0 to length(temp_arr) - 1 do
        
        arr[i] := temp_arr[i];        // Задаём старые значения новому массиву
    
    
    end;  
    
    
    
  procedure Array_Resize(var arr: Array of real; const new_size: integer);
    
    var
    
      temp_arr : Array of real;     // Массив для передачи старых данных массива новому массиву
      
      i : integer;                  // Счётчик
    
    begin
    
    
      temp_arr := new real[length(arr)];    // Создаём временный массив
      
      temp_arr := arr;              // Приравниваем старые значения массива временному массиву
    
      arr := new real[new_size];    // Изменяем размерность массива...
      
      for i := 0 to length(temp_arr) - 1 do
        
        arr[i] := temp_arr[i];      // Задаём старые значения новому массиву
    
    
    end;  
  

  
  procedure Array_Resize(var arr: Array of string; const new_size: integer);
  
    var
    
      temp_arr : Array of string;   // Массив для передачи старых данных массива новому массиву
      
      i : integer;                  // Счётчик
    
    begin
    
    
      temp_arr := new string[length(arr)];    // Создаём временный массив
      
      temp_arr := arr;                // Приравниваем старые значения массива временному массиву
    
      arr := new string[new_size];    // Изменяем размерность массива...
      
      for i := 0 to length(temp_arr) - 1 do
        
        arr[i] := temp_arr[i];        // Задаём старые значения новому массиву
    
    
    end;
    
  
  
  procedure Filling_Array(var arr : Array of boolean; const value : boolean);
    
    var
    
      i : integer;                    // Счётчик
      
    begin
    
      for i := 0 to length(arr) - 1 do
      
        arr[i] := value;
    
    end;
  
    
  
begin //########################################################################
    
    
    
end. //#########################################################################