/// Модуль, в котором содержаться процедуры решения задач
Unit Tasks_Unit;


interface //####################################################################


  uses Array_Unit, String_Unit, Text_Unit, Math_Unit, Task_545_Unit;


  
  /// Процедура выполнения задания 137 (в)
  procedure Task_137_v();
  
  
  /// Процедура для выполнения задания 460 (а)
  procedure Task_460_a();
  
  
  /// Процедура для выполнения задания 471 (а)
  procedure Task_471_a();
  
  
  /// Процедура для выполнения задания 476
  procedure Task_476();


  /// Процедура для выполнения задания 486
  procedure Task_486();  
  
  
  /// Процедура для выполнения задания 489 (а)
  procedure Task_489_a();
  
  
  /// Процедура для выполнения задания 501 (а)
  procedure Task_501_a();
  
  
  /// Процедура для выполнения задания 509 (а)
  procedure Task_509_a();
  
  
  /// Процедура для выполнения задания 517 (g)
  procedure Task_517_g();
  
  
  /// Процедура для выполнения задания 519 (a)
  procedure Task_519_a();
  
  
  /// Процедура для выполнения задания 531
  procedure Task_531();
  
  
  /// Процедура для выполнения задания 534 (a)
  procedure Task_534_a();
  
  
  /// Процедура для выполнения задания 545
  procedure Task_545();
  
  
implementation //###############################################################



  procedure Task_137_v();
      
    var
      
      res, f_arr, temp_arr : Array of real; // Результат функции и изначальный массив
        
      n, temp, i : integer;                 // Условие задачи
        
      sym : char;                           // Выбор пользователя
      
      Task_137_v_array : Text;              // Текстовый файл с архивом
      
    begin
      
      
        
      writeln('Желаете получить случайные значения а?');
      writeln('Y - да. N - нет');
      writeln('(В случае согласия вам нужно будет ввести число n)');
      writeln('(В случае отказа, массив будет считан из файла Task_137_v_array.txt)');
      
      readln(sym);
      
      
      
      if Choice(sym) then                   // Если выбрано создание случайного массива, то:
        begin
        
          writeln('Введите n:');            // Запрашиваем размернгость массива - число n
          readln(n);
          
          Array_Resize(f_arr, n);           // Изменяем размер массива
          
          Random_array(f_arr);              // Создаём случайный массив
          
          writeln('Изначальный массив:');   // Выводим его в консоль
          Show_array(f_arr);
          
          res := new real[n];               // Создаём новый массив с размерностью n
          
          for i := 0 to n - 1 do            
            begin
            
              res[i] := abs(Sum_elements(f_arr, i));  //  Записываем в него значения суммы предыдущего элемента и "нынешнего" элемента
            
            end;
          
          writeln('Результирующий массив:');          // Выводим полученный массив
          Show_array(res);
          
        end
        
      else                                  // Если было выбрано считывание массива из файла, то:
        begin
        
          Assign(Task_137_v_array, 'Task_137_v_array.txt');     // Связываем файл и переменную
        
          temp := Get_line_amount(Task_137_v_array);  // Считываем кол-во эелементов массива из файла
        
          f_arr := new real[temp];                    // Чтобы задать размерность новому массиву
          
          f_arr := Get_real_array(Task_137_v_array);  // Получаем массив из файла
          
          writeln('Изначальный массив:');             // Выводим изначальный массив - из файла
          Show_array(f_arr);    
          
          res := new real[temp];                      // Создаём новый массив для сохранения результата суммы
          
          for i := 0 to temp - 1 do
            begin
            
              res[i] := abs(Sum_elements(f_arr, i));  // Производим суммирование предыдущего элемента и "нынешнего" элемента
            
            end;
            
          writeln('Результирующий массив:');          // Выводим полученный массив
          Show_array(res);
          
        end;
      
      
      
    end;
      
    
    
  procedure Task_460_a();
    
    var 
    
      line : string;                  // Вводимая строка
    
    begin
    
      writeln('Введите число n:');    // Просим ввести строку
      
      readln(line);                   // Считываем число
      
      if Is_there_symbol('.', line) then        // Если введено нецелое число, то:
        
        writeln('Результат: ', stor(line))      // Используем функцию string to real
        
        
      else                                      // Если введено целое число, то:
      
        writeln('Результат: ', stoi(line));     // спользуем функцию string to integer
      
    
    end;
  
  
  
  procedure Task_471_a();
    
    var
    
      f : Text;                     // Изначальный файл
    
    begin
    
      Assign(f, 'f_real.txt');
      
      writeln('Изначальный файл:'); // Показываем изначальный файл
      Show_file(f);
      
      writeln('Сумма эелементов: ', Real_Sum_Elements(f));
     
    
    end;
    
    
    
  procedure Task_476();
    
    var
  
      f_char, g : Text;                 // Изначальный и файл-копия
      
   
    begin
    
      Assign(f_char, 'f_char.txt');     // Связываем файлы и переменные
      Assign(g, 'g.txt');
      
      writeln('Изначальный файл:');     // Выводим изначальный файл в консоль
      Show_file(f_char);
    
      
      Copy_files(g, f_char);
      
      writeln('Итоговый файл-копия:');  // Выводим результирующий файл-копию
      Show_file(g);
      
    
    end;
    
   
   
   procedure Task_486();
     
    var
  
      f_char, g_char, h : Text;         // Изначальные и результирующий
      
   
    begin
    
      Assign(f_char, 'f_char.txt');     // Связываем файлы и переменные
      Assign(g_char, 'g_char.txt');
      Assign(h, 'h.txt');
      
      
      writeln('Изначальный файл:');     // Выводим изначальные файлы в консоль
      writeln('f_char (Файл f):');
      Show_file(f_char);
      writeln('g_char (Файл g):');
      Show_file(g_char);
      
      
      Copy_files(h, f_char, g_char);
      
      
      writeln('Итоговый файл-химера:');  // Выводим результирующий файл
      Show_file(h);
      
    end;
    
  
  
  procedure Task_489_a();
  
    var

      f_integer, g : Text;                // Файл f и результирующий
    
      temp : integer;                     // Переменная для хранения строки
  
    begin
    
  
      Assign(f_integer, 'f_integer.txt'); // Связываем файлы
      Assign(g, 'g.txt');
      
      
      writeln('Изначальный файл f:');     // Выводим изначальный файл в консоль
      Show_file(f_integer);
      
      
      Rewrite(g);                         // Открываем их для чтения/записи
      Reset(f_integer);
     
      while not Eof(f_integer) do       
        begin
          
          
          readln(f_integer, temp);        // Считываем строку
          writeln(g, temp);               // Записываем её в результирующий файл
          readln(f_integer, temp);        // Вновь читаем строку, чтобы пропустить её, 
                                          // чтобы по итогу получить в 2 раза меньше 
                                          // строк в результирующейм файле
          
        end;
      
      
      Close(g);
      Close(f_integer);
      
      
      writeln('Итоговый файл g:');          // Выводим результирующий файл
      Show_file(g);
    
    end;
  
  
  
  procedure Task_501_a();
    
    var
  
    f_FIO, g : Text;                              // Изначальный файл и результирующий
    
    fam, name, otch, iof : string;                // fam - переменная для хранения фамилии
                                                  // name - имени; otch - отсчества
                                                  // iof - Имени, отчества и фамилии
    
    i, fam_ind, name_ind, fio_ind, ind : integer; // i - счётчик, fam_ind - индекс конца фамилии и другие по анологии
                                                  // ind - индекс следующей ФИО
  
  begin
    
    fio_ind := 1;                                 // Обнуляем индексы
    ind := 1;
    
  
    Assign(f_FIO, 'f_FIO.txt');                   // Связываем файлы
    Assign(g, 'g.txt');
   
   
    writeln('Изначальный файл f:');               // Выводим изначальный файл в консоль
    Show_file(f_FIO);
   
   
    Rewrite(g);                                   // Открываем их для чтения/записи
    Reset(f_FIO);
   
   
    while not Eof(f_FIO) do                       // Пока файл не закончился (хотя в дано указано, что он состоит из одной строки...), то:
      begin
        
        readln(f_FIO, temp);                      // Считываем строку, содержащую последовательность ФИО через запятую, из файла
        
        while fio_ind <> 0 do                     // Условие: если последоватьельность ФИО в строке закончилась, то переходим к следующей строке
          begin                                   // А пока не закончилась последовательность, то:
            
            
            fam_ind := temp.IndexOf('_', fio_ind) + 1;      // Т.к. мы знаем, что Фам., Имя и Отч. разделено символом '_', то находим индекс этого первого символа - конец Фам.
            name_ind := temp.IndexOf('_', fam_ind) + 1;     // Второй символ (Отсчёт начинается от индекса 1-ого + 1) - Имя
            fio_ind := temp.IndexOf(',', fio_ind) + 1;      // Т.к. осталось только Отч., а следующее ФИО идёт после символа ',', то строка от индекса 2 + 1 до запятой - Отч.
                                                            // а также конец ФИО
            
            for i := ind to fio_ind do                      // Начинаем ход от начала ФИО до его конца
              begin
                
                if i < fam_ind then                         // Здесь идёт присвоение переменным Фам., Имя, Отч. с помощью индексов...
                  
                  fam := fam + temp[i]; 
                      
                if (i > fam_ind) and (i < name_ind) then
                    
                  name := name + temp[i]; 
                      
                if (i > name_ind) and (i < fio_ind) then 
                      
                  otch := otch + temp[i]; 
                 
            
              end;
            
            if (name <> '') and (fam <> '') and (otch <> '') then   // Если ФИО полностью считалось, то "строим" ИОФ - Имя, Фамилия, Отчество
              begin
              
                iof := name + '_' + otch + '_' + fam + ', ';
                write(g, iof);                                      // А после выводим в консоль
              
              end;
            
            
            iof := '';                                      // Обнуляем значения для дальнейшего заполнения
            fam := '';
            name := '';
            otch := '';
            
            ind := fio_ind + 2;                             // Запоминаем, что нужно начинать отсчёт от предыдущего ФИО
            
          end;
      end;
    
    
      Close(g);                                             // Закрываем файлы
      Close(f_FIO);
    
      
      writeln('Итоговый файл g:');                          // Выводим результирующий файл
      Show_file(g);
      
      
  end;
  
  
  
  procedure Task_509_a();
    
    const
  
      Marks : Array[1..9] of string = ('Nissan', 'Toyota', 'Hyundai', 'Honda', 'Tesla', 'Ford', 'ЗИЛ', 'КАМАЗ', 'Lada');
    
    
    var
    
      f_cars : Text;                                // Текстовый файл с данными                    
      
      i, nom, len : integer;                        // Счётчик и переменная для будущего сравнения
                                            
      flag : boolean;                               // flag - проверка корректности введённой марки
  
    begin
    
      for i := 1 to 9 do                            // Выводим марки в консоль в виде списка для дальнейшего удобства выбора
        
        writeln(i, ') ', Marks[i]);
        
        
      writeln('Введите марку (цифрой):');           // Просим выбрать марку
      
      readln(nom); 
      
      if (nom < 1) or (nom > 9) then                // Проверяем введённые данные
      
        flag := true;
  
      if flag then
  
        writeln('Неккоректный ввод!')               // При некорректном вводе выводим "ошибку"
        
      else
        begin
        
          Assign(f_cars, 'f_cars.txt');             // Связываем файл
          
          temp := Marks[nom];                       // Получаем марку в виде строки
          
          writeln('Владельцы с выбранной маркой:'); // Выводим результирующий список
          Show_Array(Get_All_Lines(f_cars, temp));  
          
          
        end;
    
    end;
  
  
  
  procedure Task_517_g();
    
    var 
    
      f_toys : Text;                                // Файл с данными
      
      ind1, ind2, age1, age2, err : integer;        // Индекс для разделения строки на Имя игрушки, Цену, Возрастное ограничение (от age1 до age2)
      
      temp, temp2 : string;                         // temp - переменная для записи строки из файла
      
    begin
    
      ind1 := 0;
      ind2 := 0;
    
      Assign(f_toys, 'f_toys.txt');                 // Связываем файл
      
      age1 := 4;                                    // Условия задачи
      age2 := 10;
      
      Reset(f_toys);                                // Открываем файл для чтения
  
  
    while not Eof(f_toys) do
      begin
      
        readln(f_toys, temp);                       // Считываем строку
        
        
        ind2 := temp.LastIndexOf(' ');              // Предпоследний (Хотя должен быть последним...) (' ') - Возрастное ограничение (age1 age2)
        
        ind1 := temp.IndexOf(' ', ind2 + 1);        // Последний пробел, но не работает!
        
        
        
        temp2 := Copy(temp, ind1, ind2);
        
        val(temp2, age1, err);
      
      
      end;
    
    
      Close(f_toys);                                  // Закрываем файл
    
    
    end;
      
      
  
  procedure Task_519_a();
  
    var 
      
      am1, am2 : integer;                 // am1 - кол-во символов '('; am2 - кол-во символов ')'
      
      f : Text;                           // Сам файл
      
    begin
    
    
      Assign(f, 'f_program_519_a.txt');   // Связь с файлом
      
      
      am1 := Get_All_Line_Amount(f, '('); // Считаем am1
      
      am2 := Get_All_Line_Amount(f, ')'); // Считаем am2
    
      if am1 = am2 then                   // Сравниваем
        
        writeln('Кол-во скобок одинаково')
        
      else 
      
        writeln('Кол-во скобок НЕ одинаково!');
      
      
    end;
      
  
  
  procedure Task_531();
    
    var
    
      i, n : integer;                     // n - вводимое значение, i - счётчик
      
      x, res : Array of integer;          // Массив для переменных а, res - результирующий массив
      
    begin
    
      
      writeln('Введите число n (n > 1):');  // Просим...
      readln(n);                          // Получаем размерность будущего массива
      
      if n < 2 then                       // В случае ошибки, так и говорим
        
        writeln('Введено некоректное число!')
        
      else                                // Если всё хорошо, то:
        begin
        
          Array_Resize(res, n);           // Задаём размерность результирующего массива
        
          Array_Resize(x, n);             // Задаём размерность изначального массива
          
          Random_Array(x);                // Заполняем его случайностью
          
          writeln('Изначальный массив:');
          Show_Array(x);                  // Выводим изначальный массив в консоль
          
          for i := 0 to n - 1 do
              
            res[i] := x[i] - x[n - 1];   // Получаем значения для результирующего массива
          
          writeln('Результирующий массив:');
          Show_Array(res);                // Выводим результирующий массив в консоль
        
        end;
    
    end;
  
  
  
  procedure Task_534_a();
  
    var
    
      i, n : integer;                 // n - вводимое значение n, nn - размерность итогового массива - n * 2 (Условия задачи)
      
      x : Array of integer;               // Массив для переменных а
      
      res : decimal;                      // Переменная для вывода результата
      
      
    begin
    
      res := 1;                           // "Обнуляем" результат, т.к. эта переменная будет перемножаться
      
      writeln('Введите число n (n > 0):');  // Просим...
      readln(n);                          // Получаем размерность будущего массива
      
      if n < 1 then                       // В случае ошибки, так и говорим
        
        writeln('Введено некоректное число!')
        
      else                                // Если всё хорошо, то:
        begin
        
          Array_Resize(x, n * 2);         // Задаём новую размерность массива
          
          Random_Array(x);                // Заполняем его случайностью
          
          writeln('Изначальный массив:');
          Show_Array(x);                  // Выводим изначальный массив в консоль
          
          for i := 0 to n - 1 do
    
            res := res * x[2 * i + 1] - x[(2 * n - 1) - i * 2];  // Основная задача программы - вычисление...
            
          writeln('Итоговый результат: ', res);
          
        end;
        
    
    end;
  
  
  
  procedure Task_545();
    
    var 
    
      i, n, m : integer;                          // n - вводимое значение n; i - счётчик; число m
      
      x : Array of boolean;                       // Массив для переменных а
    
    
    begin
    
    
      writeln('Введите число n (кол-во людей):');
      readln(n);                                  // Получаем размерность будущего массива - кол-во людей
      
      
      writeln('Введите число m:');                // Получаем число m
      readln(m);
      
      if (n < 1) or (m < 1) or (m > length(arr)) then
        
        writeln('Введены некоректные значения!')
      
      else
        begin
        
          x := new boolean[n];                    // Задаём новую размерность массива
          
          
          if m <> 1 then
          
            writeln('Result: ', Take_Out_Task_545(x, n, m)) // Выводим результат
            
          else
            
            writeln('Result: ', n);
        
        end;
      
    
    end;
  
      
begin //########################################################################
    
    
    
end. //#########################################################################