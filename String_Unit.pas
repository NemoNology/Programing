/// Модуль с частоиспользуемыми методами при работе со строками
unit String_Unit;


interface //####################################################################

  
  uses Math_Unit;
  
  
  var
  
    temp : string;                    // temp - строка для записи в неё временных данных того же типа
  

  /// Функция-проверка на наличие символа sym в строке s
  function Is_there_symbol(const sym : char; const s : string): boolean;
  
  
  /// Функция получения кол-ва определённого символа в строке
  function Get_symbol_amount(const s : string; const symbol : char): integer;
  
  
  /// Функция перевода цифры в символ
  function ntoc(const num : integer): char;
  
  
  /// Функция перевода символа в цифру
  function cton(const sym : char): real;    
  
  
  /// Функция, узнающая знаковость числа
  function Is_signed_number(const s : string): boolean;
  
  
  /// Функция. узнающая число ли введено в строку
  function Is_number(const num : string): boolean;
  
  
  /// Функция перевода строки (содержащей число типа integer) в число типа integer
  function stoi(const s : string): integer;
  
  
  /// Функция перевода строки (содержащей число типа real) в число типа real
  function stor(const s : string): real;
  
  
  /// Функция получения массива типа integer из строки, в которой элементы массива разделены символом space
  function stoia(const s : string; const space : char): array of integer;
  
  
  /// Функция получения массива типа integer из строки, в которой элементы массива разделены символом space
  function stora(const s : string; const space : char): array of real;
  
  
  /// Метод "согласия": получая 'y' или 'Y' возвратить True, если 'n' или 'N' - наоборот
  function choice(const sym : char): boolean;
  
  
  /// Функция, возвращающая True, если в строке s содержится подстрока ns
  function Is_There_Substring(const s : string; const ns : string): boolean;
  
  
    
implementation //###############################################################
  
  
  
  function Is_there_symbol(const sym : char; const s : string): boolean;
    
    var 
    
      i : integer;                    // Счётчик
  
    begin
    
      Is_there_symbol := False;       // Обнуляем результат
    
      for i := 1 to length(s) do
        
        if s[i] = sym then
          begin
            
            Is_there_symbol := True;  // Если находим, то "говорим", что нащли
          
            break;                    // И выходим из цикла (для оптимизации функции)
            
          end;
    end;   


  function Get_symbol_amount(const s : string; const symbol : char): integer;
  
    var
    
      i, k : integer;                               // Счётчики
  
  begin
  
    k := 0;
    
    for i := 1 to length(s) do
      
      if s[i] = symbol then
        
        k := k + 1;
    
    Get_symbol_amount := k;
      
    
  end;
  
  
  
  function cton(const sym : char): real;    

    begin                       
    
      case sym of
        
        '.': cton := 0;
        '0': cton := 0; 
        '1': cton := 1;
        '2': cton := 2;
        '3': cton := 3;
        '4': cton := 4;
        '5': cton := 5;
        '6': cton := 6;
        '7': cton := 7;
        '8': cton := 8;
        '9': cton := 9;
        
      else
        
        cton := -1;
        
        end;
    
      end; 
    
  
  
  function ntoc(const num : integer): char;
    begin
      
      case num of
      
        0: ntoc := '0'; 
        1: ntoc := '1';
        2: ntoc := '2';
        3: ntoc := '3';
        4: ntoc := '4';
        5: ntoc := '5';
        6: ntoc := '6';
        7: ntoc := '7';
        8: ntoc := '8';
        9: ntoc := '9';
        
      else
        
        ntoc := 'E';
        
        end;
      
    end;
  
  
  
  function Is_signed_number(const s : string): boolean;
    begin
      
      Is_Signed_number := false;
      
      if s = '' then 
        
        writeln('Error: Is_signed_number: Дана пустая строка!')
      
      else
      
        if s[1] = '-' then
          
          Is_Signed_number := True;
    
    end;
  
  
  
  function Is_number(const num : string): boolean;

    var        
    
      i, n : integer;             // i - счётчик для циклов; n - начало отсчёта цикла 
          
          
    begin
    
      if Is_Signed_number(num) then
        
        n := 2
        
      else
      
        n := 1;
      
      
      Is_number := True;
      
    
      for i := n to length(num) do
                                                
        if cton(num[i]) < 0 then             
          
            Is_number := False;
       
    end;

  
  
  function stoi(const s : string): integer;     

    var                         
    
      i, j, res, n : integer;     // i - счётчик; j - степень цифры в числе; n - точка отсчёта цикла;
    
    begin                   
      
      
      
      if Is_Signed_number(s) then                 // Если FS = True, то начинаем 
        begin
        
          n := 2;                                 // отсчёт цикла с 2-ого символа
          j := length(s) - 2;
        
        end
        
      else
        begin
        
          n := 1;                                 // отсчёт цикла с 1-ого символа
          j := length(s) - 1;                     
          
        end;
      
    
    
      if Is_number(s) then                        //  Проверяем число ли введено
        begin                                     
                                                  
          for i := n to length(s) do
            begin
            
              res := res + trunc(cton(s[i]) * int_pow(10, j));
              
              j := j - 1;
    
            end;                                  
          
          stoi := res;                            // Результируем
          
        end                                       
        
                                   
        
      else
        begin
        
          stoi := 0;                              // Если дано не число, так и пишем
        
          writeln('Дано не число!');
        
        end;
      
      
      
      if Is_Signed_number(s) then                 // Если число отрицательное, то
      
        stoi := res * -1;                         // возвращаем отрицательное число...  
                                                
      
    
    end;
  
  
  
  function stor(const s : string): real;

    var                         
    
      i, j, n, ind : integer;         // i - счётчик; j - степень цифры в числе; n - точка отсчёта цикла; ind - индекс точки
      
      res : real;                     // Результат
      
    
    begin                   
      
      
      
      if Is_Signed_number(s) then                 // Если FS = True, то начинаем 
        begin
        
          n := 2;                                 // отсчёт цикла с 2-ого символа
        
        end
        
      else
        begin
        
          n := 1;                                 // отсчёт цикла с 1-ого символа
          
        end;
      
    
    
      if Is_number(s) then                        // Проверяем число ли введено
        begin                                     // Если число, то:
          
          ind := s.IndexOf('.');                  // Находим индекс точки
          
          if ind <> -1 then                    // Если это НЕ целое число, то:
            begin
            
            j := ind - n;                         // Узнаём максимальную положительную степень
            
            for i := n to ind do
              begin
      
                res := res + (cton(s[i]) * int_pow(10, j));   // Получаем целую часть
                
                j := j - 1;                       // Уменьшаем степень при каждом шаге
      
              end;
            
            for i := ind + 2 to length(s) do      // Начиная от индекса начала дробной части
              begin
                
                res := res + (cton(s[i]) * real_pow(10, j));  // Вычисляеи дробную часть
                
                j := j - 1;                       // Уменьшаем степень при каждом шаге
              
              end;
              
            end
            
          else                                    // Если введено целое число, то работаем через метод string to integer
            
            res := stoi(s);
            
            
              
          if Is_Signed_number(s) then             // Если число отрицательное, то
              
            res := res * -1;                      // возвращаем отрицательное число...
            
          
            
          stor := res;                            // Результируем
            
        end                                       
        
      else
        begin
        
          stor := 0;                            // Если дано не число, так и пишем
        
          writeln('Дано не число!');
        
        end;
      
    
    end;
    
    
    
  function stoia(const s : string; const space : char): array of integer;
    
    var
      
      res : array of integer;                   // Результат
      
      i, ind1, ind2, len : integer;             // Счётчик и индексы числа
     
    
    begin
      
      ind1 := 0;                                // Обнуляем индексы
      ind2 := 0;
      
      len := Get_symbol_amount(s, space);    // Получаем размерность массива внутри строки, зная что
                                                // кол-во знаков разделяющих переменные массива равно 
      res := new integer[len];                  // общее кол-во перенных - 1. И задаём размерность дин. массива
      
      for i := 0 to len do                      
        begin
          
          ind2 := s.IndexOf(space, ind1);
          
          temp := Copy(s, ind1 + 1, ind2 - ind1);
          
          res[i] := stoi(temp);
          
          ind1 := ind2 + 1;
        
        end;
      
      stoia := res;
      
    end;
    
      
  
  function stora(const s : string; const space : char): array of real;
    
    var
      
      res : array of real;                        // Результат
      
      i, ind1, ind2, len : integer;               // Счётчик и индексы числа
     
    
    begin
      
      ind1 := 0;                                  // Обнуляем индексы
      ind2 := 0;
      
      len := Get_symbol_amount(s, space) + 1;  // Получаем размерность массива внутри строки, зная что
                                                  // кол-во знаков разделяющих переменные массива равно 
      res := new real[len];                       // общее кол-во перенных - 1. И задаём размерность дин. массива
      
      for i := 0 to len - 1 do                      
        begin
          
          ind2 := s.IndexOf(space, ind1);
          
          //if ind2 = -1 then
          
            //ind2 := len;
          
          temp := Copy(s, ind1 + 1, ind2 - ind1);
          
          res[i] := stor(temp);
          
          ind1 := ind2 + 1;
        
        end;
      
      stora := res;
      
    end;
    
    
    
  function choice(const sym : char): boolean;    
    begin
      
      sym.ToLower();
      
      choice := false;
      
      if sym = 'y' then
        
        choice := true;
        
      if (sym <> 'y') and (sym <> 'n') then
        
        writeln('Введен некоректный символ! Результат = False!');
    
    end;
  
  
  
  function Is_There_Substring(const s : string; const ns : string): boolean;
    begin
    
      
      Is_There_Substring := False;          // Обнуляем результат
    
    
      if s.IndexOf(ns) <> -1 then
        
        Is_There_Substring := True;
    
    
    end;
  
  
  
  

begin //########################################################################
    
    
end. //#########################################################################