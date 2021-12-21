/// Модуль с частоиспользуемыми методами при работе со списками
unit List_Unit;



interface //####################################################################

  uses Math_Unit;
  
  
  /// real List_Head - список типа real
  type real_LH = ^ real_List;                   // Объявление типа данных - список, состоящий из элементов типа real
    
      real_List = record
        
        Content : real;                         // Содержимое элемента списка
        
        Next : real_LH;                         // Адрес следующего элемента
        
      end;
      
  
  /// integer List_Head - список типа integer
  type int_LH = ^ int_List;                     // Объявление типа данных - список, состоящий из элементов типа int
    
      int_List = record
        
        Content : integer;                      // Содержимое элемента списка
        
        Next : int_LH;                          // Адрес следующего элемента
        
      end;
  
  
      
      
  /// new_List_Head - nLH - Процедура для создания новой "головы" списка
  /// для real_SP, с заполнением новой "головы" списка случайным числом
  procedure nLH(var LH : real_LH);                                                    
                                                                                        
          
          
  /// new_List_Head - nLH - Процедура для создания новой "головы" списка
  /// для int_SP, с заполнением новой "головы" числом предыдущего элемента - 1
  procedure nLH(var LH : int_LH);
  
  
  
  /// new_List - nL - Процедура для создания нового списка (типа real_LH) с количеством 
  /// элементов равному ea, ссылаясь на начало списка - его первый элемент - LH!
  procedure nL(var LH : real_LH; const ea : integer);
  
  
  
  /// new_List - nL - Процедура для создания нового списка (типа int_LH) с количеством
  /// элементов равному ea, ссылаясь на начало списка - его первый элемент - LH!
  procedure nL(var LH : int_LH; const ea : integer);
  
  
  
  /// Show_List - Процедура для вывода списка в консоль
  procedure Show_List(var LH : real_LH);
  
  
  
  /// Show_List - Процедура для вывода кольцевого списка в консоль
  procedure Show_List(var LH : int_LH);
  
  
  
  /// Get_Value_of_Last_Element - GVoLE - Функция, возвращающая значение последнего элемента списка
  function GVoLE(var LH : real_LH): real;
  
  
  
  /// new_List_Head - nLH - Процедура для создания новой "головы" списка
  /// для real_SP, с заполнением новой "головы" списка числом nv
  procedure nLH(var LH : real_LH; const nv : real);
  
  
  
  /// Get_Value_of_Some_Element - GVoSE - Функция, возвращающая значение элемента списка, находящегося по адресу индекса
  function GVoSE(var LH : real_LH; const index : integer): real;
  
  
  
  /// Get_The_Last_Element - GTLE - Функция, возвращающая последний элемент списка
  function GTLE(var LH : int_LH): int_LH;
  
  
  
  /// Get_Some_Element - GSE - Функция, возвращающая определённый эелемент списка, находящегося по адресу индекса
  function GSE(var LH : int_LH; const ind : integer): int_LH;
  
  

  
    
implementation //###############################################################



  procedure nLH(var LH : real_LH); 
  
    var 
    
      nLH : real_LH;                  // Новая "голова"
    
    begin
    
      
      new (nLH);                      // Выделяем память
    
      
      // Заполняем новую "голову" случайным числом типа real
      
      nLH^.Content := GRRV(10);
      
      
      // И задаём адрес на предыдущую "голову" как на следующий элемент, идущий после новой "головы"
      
      nLH^.next := LH;
      
      
      // Переключаемся на новую "голову", ибо делать в старой нам уже нечего...
      
      LH := nLH;
    
    
    end;  
  
  
  
  procedure nLH(var LH : int_LH);
  
    var 
    
      nLH : int_LH;                   // Новая "голова"
    
    begin
    
      new (nLH);                      // Выделяем память
      
      // Заполняем новую "голову" числом, меньшим числа пред. элемента на единицу
      // При условии, что число "головы" больше 1-цы
      
      if LH^.Content > 1 then
      
        nLH^.Content := LH^.Content - 1;
      
      
      // И задаём адрес на предыдущую "голову" как на следующий элемент, идущий после новой "головы"
      
      nLH^.next := LH;
      
      
      // Переключаемся на новую "голову", ибо делать в старой нам уже нечего...
      
      LH := nLH;
    
    
    end;
  
  
  
  procedure nL(var LH : real_LH; const ea : integer);
    
    var
    
      i : integer;              // Счётчик
    
    begin
    
    
      for i := 1 to ea - 1 do
        begin
        
          nLH(LH);              // Создаём новый первый эелемент списка несколько раз...
        
        end;
      
    
    end;
  
  
  
  
  procedure nL(var LH : int_LH; const ea : integer);
    
    var
    
      i : integer;              // Счётчик
      
      fLH, lLH : int_LH;        // 1-ый и последний элементы списка
    
    begin
    
     
      for i := 1 to ea do
        begin
        
          nLH(LH);              // Создаём новый первый эелемент списка несколько раз...
        
        end;
      
    
    end;
    
    
    
  procedure Show_List(var LH : real_LH);
    
    var
    
      FE : real_LH;                 // Создаём резервный элемент, чтобы сохранить туда "голову" списка
    
    begin
      
      new(FE);                      // Выделяем память
      
      FE := LH;                     // Резервируем нынешный первый элемент
    
    
      while LH <> Nil do            // Пока элемент списка не равен "ничему"
        begin
        
          write(LH^.Content:4:3,'; ');  // Выписываем содержимое элемента
          
          LH := LH^.Next;           // Переходим к следующему элементу списка
        
        end;
        
        
      writeln();                    // Переходим на след. строку - глазам приятнее  
      
      LH := FE;                     // Возвращаем всё "как было"
      
    end;
  
  
  
  function GVoLE(var LH : real_LH): real;
    
    var
    
      FE : real_LH;                   // Создаём резервный элемент, чтобы сохранить туда "голову" списка
    
    begin
      
      new(FE);                        // Выделяем память
      
      FE := LH;                       // Резервируем нынешный первый элемент
    
      while LH <> Nil do
        begin
        
          if LH^.Next = Nil then      // Если после элемента ничего не идёт, то это 
          
            result := LH^.Content;    // Наша остановочка!
            
          LH := LH^.Next;             // Переходим к следующему элементу...
        
        end;
        
        LH := FE;                     // Возвращаем всё "как было"
      
      
    end;
  
  
  
  procedure nLH(var LH : real_LH; const nv : real);
  
    var 
    
      nLH : real_LH;                  // Новая "голова"
    
    begin
      
      new (nLH);                      // Выделяем память
      
      
      // Заполняем новую "голову" числом nv
      
      nLH^.Content := nv;
      
      
      // И задаём адрес на предыдущую "голову" как на следующий элемент, идущий после новой "головы"
      
      nLH^.next := LH;
      
      
      // Переключаемся на новую "голову", ибо делать в старой нам уже нечего...
      
      LH := nLH;
    
    
    end;
    
  
  
  function GVoSE(var LH : real_LH; const index : integer): real;
    
    var
    
      FE : real_LH;                   // Создаём резервный элемент, чтобы сохранить туда "голову" списка
      
      k : integer;                    // Счётчик
    
    begin
      
      new(FE);                        // Выделяем память
      
      FE := LH;                       // Резервируем нынешный первый элемент
      
      k := 0;                         // Обнуляем счётчик
    
      while LH <> Nil do
        begin
          
          k := k + 1;                 // Считаем шаги...
        
          if k = index then           // Если находим нужное нам значение, то...
            
            result := LH^.Content;    // Результируем его
          
          LH := LH^.Next;             // Переходим к следующему элементу...
          
        end;
        
        LH := FE;                     // Возвращаем всё "как было"
      
      
    end;
    
    
    
  function GTLE(var LH : int_LH): int_LH;
    
    var
    
      FE : int_LH;                    // Создаём резервный элемент, чтобы сохранить туда "голову" списка
    
    
    begin
    
    
      new(FE);                        // Выделяем память
      
      FE := LH;                       // Резервируем нынешный первый элемент
      
      while LH <> Nil do
        begin
        
          if LH^.Next = Nil then      // Если после элемента ничего не идёт, то это 
          
            result := LH;             // Наша остановочка!
            
          LH := LH^.Next;             // Переходим к следующему элементу...
        
        end;
        
        LH := FE;                     // Возвращаем всё "как было"
      
      
    end;
  
  
  
  function GSE(var LH : int_LH; const ind : integer): int_LH;
    
    var
    
      FE : int_LH;                    // Создаём резервный элемент, чтобы сохранить туда "голову" списка
    
      k : integer;                    // Счётчик 
    
    begin
    
    
      new(FE);                        // Выделяем память
      
      FE := LH;                       // Резервируем нынешный первый элемент
      
      k := 0;                         // Обнуляем "шагометр"
      
      while LH <> Nil do
        begin
        
          k := k + 1;                 // Считаем шаги...
        
          if k = ind then             // Если находим нужное нам значение, то...
            
            result := LH;             // Результируем его
          
          LH := LH^.Next;             // Переходим к следующему элементу...
        
        end;
        
        LH := FE;                     // Возвращаем всё "как было"
      
      
    end;
    
      
  
  procedure Show_List(var LH : int_LH);
  
    var
    
      FE : int_LH;                  // Создаём резервный элемент, чтобы сохранить туда "голову" списка
    
    
    begin
      
      new(FE);                      // Выделяем память
      
      FE := LH;                     // Резервируем нынешный первый элемент
    
      repeat                        // Выполняем...
        begin
        
          write(LH^.Content,'; ');  // Выписываем содержимое элемента
          
          LH := LH^.Next;           // Переходим к следующему элементу списка
        
        end;
        
      until LH^.Next = FE^.Next;    // ...пока следующий элемент списка не 1-ый элемент списка
      
      writeln();                    // Переходим на след. строку - глазам приятнее
      
      LH := FE;                     // Возвращаем всё "как было"
      
    end;
  
  
  
  
begin //########################################################################
    
    
    
end. //#########################################################################