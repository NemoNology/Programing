/// Модуль с различными математическими методами
unit Math_Unit;



interface //####################################################################

  
  
  /// Функция возведения в степень
  function pow(n : real; st : integer): decimal;
  
  
  /// Функция возведения в степень
  function pow(n : longint; st : integer): decimal;
  
  
  /// Функция возведения в степень для integer
  function int_pow(n : integer; st : word): longint;
  
  
  /// Функция возведения в степень для real
  function real_pow(n : real; st : integer): real;
  
  
    
implementation //###############################################################



  function pow(n : real; st : integer): decimal;

    var

      i : integer;                        // i - счётчик для циклов
      
      nn : decimal;                       // nn - переменная для результата

    begin

      nn := n;                            // Присваиваем переменную
  
  
      for i := 1 to abs(st) - 1 do        // Перемножаем определённое кол-во раз
                                          //
        nn := nn * n;                     // - возводим в степень
  
  
      if st < 0 then                      // Если степень отрицательная, то                           
                                          // "возвращаем" 1 делённое на результат
        nn := 1 / nn;
  
  
      if st = 0 then                      // Если значение степени нулевое
                                          // то результат = 1
        nn := 1;
  
  
      pow := nn;
      
    
    end;
    
    
  
  function pow(n : longint; st : integer): decimal;

    var

      i : integer;                        // i - счётчик для циклов
      
      nn : decimal;                       // nn - переменная для результата

    begin

      nn := n;                            // Присваиваем переменную
  
  
      for i := 1 to abs(st) - 1 do        // Перемножаем определённое кол-во раз
                                          //
        nn := nn * n;                     // - возводим в степень
  
  
      if st < 0 then                      // Если степень отрицательная, то                           
                                          // "возвращаем" 1 делённое на результат
        nn := 1 / nn;
  
  
      if st = 0 then                      // Если значение степени нулевое
                                          // то результат = 1
        nn := 1;
  
  
      pow := nn;
      
    
    end;
    
    
    
    function int_pow(n : integer; st : word): longint;
  
    var

      i : integer;                        // i - счётчик для циклов
      
      nn : longint;                       // nn - переменная для результата

    begin

      nn := n;                            // Присваиваем переменную
  
      
      if st = 0 then                      // Если значение степени нулевое
                                          // то результат = 1
        nn := 1
        
      else                                // Если степень положительная
        
        for i := 1 to st - 1 do           // Перемножаем определённое кол-во раз
                                          //
          nn := nn * n;                   // - возводим в степень
      
      
      int_pow := nn;
  
  
    end; 
  
  
  
  function real_pow(n : real; st : integer): real;
    var

      i : integer;                        // i - счётчик для циклов
      
      nn : real;                          // nn - переменная для результата

    begin

      nn := n;                            // Присваиваем переменную
  
      
      if st = 0 then                      // Если значение степени нулевое
                                          // то результат = 1
        nn := 1
        
      else                                // Если степень положительная
        
        for i := 1 to abs(st) - 1 do      // Перемножаем определённое кол-во раз
                                          //
          nn := nn * n;                   // - возводим в степень
      
      if st < 0 then
        
        nn := 1 / nn;
      
      real_pow := nn;
  
  
    end; 
  
  
begin //########################################################################
    
    
    
end. //#########################################################################