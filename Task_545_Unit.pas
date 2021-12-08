/// Модуль для задания 545
Unit Task_545_Unit;


interface //####################################################################

  uses Array_Unit;

  /// Функция, узнающая остался ли один человек в кругу
  function Is_One(arr : Array of boolean; arr_size : integer): boolean;
  
  
  /// Функция, "вытаскивающая" m-ого человека из круга
  function Take_Out_Task_545(arr : Array of boolean; arr_size, m : integer): integer;

implementation //###############################################################
  

  
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
      
      k, i : integer;                               // Счётчики
      
    begin
    
      Filling_Array(arr, True);                     // "Ставим людей в круг"
      
      
      while not Is_One(arr, arr_size) do            // Пока в кругу не останется один человек
        begin
        
          for i := 0 to arr_size - 1 do             // Проходимся по всему массиву
            begin
            
              if arr[i] then                        // Если человек по месту i всё ещё стоит в круге, то:
                
                k := k + 1;                         // Отсчитываем его
                
              if k = m then                         // Если он идёт m-ым по счёту, то:
                begin 
                
                  arr[i] := False;                  // Выводим его из круга
                  
                  k := 0;                           // И начинаем новый осчёт
                
                end;
                
            end;
            
        end;
      
      
      for i := 0 to arr_size - 1 do                 // После того, как в круге остался один человек
        begin                                       // Вновь идём по массиву
        
          if arr[i] then                            // И находим единственного человека в круге
            begin
            
              Take_Out_Task_545 := i + 1;           // В результат записываем его номер + 1, ибо по условиям первый в круге - не 0, а 1
              break;                                // Выходим из цикла, для оптимизации программы
            
            end;
        
        end;
    
    
    end;

begin //########################################################################
    
    
    
end. //#########################################################################