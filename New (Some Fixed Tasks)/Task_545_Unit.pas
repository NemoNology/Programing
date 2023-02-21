/// Модуль для задания 545
Unit Task_545_Unit;


interface //####################################################################

  uses List_Unit;



  /// Функция, узнающая остался ли один человек в кругу
  function Is_One(var LH : int_LH): boolean;
  
  
  /// Функция, узнающая "местоположение" (индекс) единтсвенного человека в кругу
  function Who_is_one(var LH : int_LH): integer;
  
  
  /// Функция, "вытаскивающая" m-ого человека из круга
  function Take_Out_Task_545(var LH: int_LH; m : integer): integer;
  
  

implementation //###############################################################
  

  
  function Is_One(var LH : int_LH): boolean;
    
    var

      k : integer;                          // Счётчик
      
      FE : int_LH;                          // Запись "головы"
  
    begin
      
      new (FE);                             // Выделяем память
      
      FE := LH;                             // Запоминаем голову
      
      
      result := False;                      // "Обнуляем" результат
      
      
      repeat
        begin 
        
          if LH^.Content > 0 then           // Если содержимое элемента списка не нулевое/пустое, то:
            
            k := k + 1;                     // вычисляем кол-во людей оставшихся в кругу
            
          LH := LH^.Next;                   // и переключаемся на следующий элемент
        
        end;
        
      until LH^.Next = FE^.Next;
        
      if k = 1 then
            
        result := True;                     // Если остался один, то функция - "Истина"
    
    end;

  
  
  
  function Who_is_one(var LH : int_LH): integer;
    
     var

      FE : int_LH;                          // Запись "головы"
  
  
    begin
      
      
      new (FE);                             // Выделяем память
      
      FE := LH;                             // Запоминаем голову
      

      result := 0;                          // "Обнуляем" результат
    
      repeat
        begin 
        
          if LH^.Content > 0 then           // Если содержимое элемента списка не нулевое/пустое, то:
            begin
            
              result := LH^.Content;        // запоминаем индекс
              
              break;
            
            end;
            
          LH := LH^.Next;                   // и переключаемся на следующий элемент
        
        end;
        
      until LH^.Next = FE^.Next;
        
    
    end;
    
    
  
  function Take_Out_Task_545(var LH: int_LH; m : integer): integer;

    var 
      
      k : integer;                              // Счётчик
      
      FE : int_LH;                              // Запись "головы"
      
    begin
    
    
      new (FE);                                 // Выделяем память
      
      FE := LH;                                 // Запоминаем голову
      
      
      k := 0;                                   // Обнуляем счётчик
      
      
      while not Is_One(LH) do                   // Пока в кругу не останется один человек
        begin
        
        
        
          // Пользуемся именно циклом repeat, ибо список по условиям кольцевой
          repeat
            begin 
            
            
              if LH^.Content > 0 then           // Если содержимое элемента списка не нулевое/пустое, то:
                
                k := k + 1;                     // Отсчитываем его
                
                
              if k = m then                     // Если он идёт m-ым по счёту, то:
                begin 
                
                  LH^.Content := 0;             // Выводим его из круга
                  
                  k := 0;                       // И начинаем новый осчёт
                
                end;
                
                
              LH := LH^.Next;                   // Переключаемся на следующий элемент
              
              
              
              
            end;
          
          // Идём по списку, пока не наткнёмся на голову списка
          until LH^.Next = FE^.Next;
           
            
        end;
      
      
      result := Who_Is_One(LH);
      
    
    end;

begin //########################################################################
    
    
    
end. //#########################################################################