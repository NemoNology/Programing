program Task_460_a;



function pow(n : real; st : integer): real; // Возведение в степень

var

    i : integer;                        // i - счётчик для циклов
    nn : real;                          // nn - переменная для результата

begin

    nn := 1;                            // Присваиваем переменную

    for i := 1 to st do                 // Перемножаем определённое кол-во раз
                                        //
      nn := n * nn;                    // - возводим в степень

    if st < 0 then                      // Если степень отрицательная, то
                                        // "возвращаем" 1 делённое на результат
      nn := 1 / nn

    else if st = 0 then                      // Если значение степени нулевое
                                        // то результат = 1
      nn := 1;
      
    //else if st = 1 then
    
    //  nn := n;

    pow := nn;

end;



function ctoi(sym : char): integer;    // Char to Integer

begin                       //###### Начало функции ctoi

  case sym of
  
    '0': ctoi := 0; 
    '1': ctoi := 1;
    '2': ctoi := 2;
    '3': ctoi := 3;
    '4': ctoi := 4;
    '5': ctoi := 5;
    '6': ctoi := 6;
    '7': ctoi := 7;
    '8': ctoi := 8;
    '9': ctoi := 9;
    
  else
    
    ctoi := -1;
    //writeln('Дана не цифра!');
      
  end;

end;                  //###### Конец функции ctoi



function is_number(num : string; n : integer): boolean;

var                     // Локальные переменные - переменные процедуры

  i : integer;          // i - счётчик для циклов, n - переменная для счётчика
                        // 
                        // FS - переменная для проверки знака числа
                        
begin

  for i := n to length(num) do
                                            // "Бежим" по всему слову
    if ctoi(num[i]) < 0 then                //  и, если узнаём, что введено
      begin                                 //  не  число, то FT := false
      
        is_number := False;
        break;
        
      end 
      
    else 
      
      is_number := True
   
end;



function stoi(s : string): real;     // String to Integer

var                     // Локальные переменные - переменные функции

  i, n, j : integer;     // i - счётчик для циклов, n - переменная для счётчика
  
  res : real;
                        // FT - переменная для проверки того, что ввелли именно число
  FT, FS : boolean;     // FT - Flag of True; FS - Flag Sign
                        // FS - переменная для проверки знака числа

begin                   //###### Начало функции stoi
  
  
  
  if s[1] = '-' then
    FS := True;

  if FS then                                // Если FS = True, то начинаем 
    begin
    
    n := 2;                                 // отсчёт цикла с 2-ого символа
    j := length(s) - 2;
    
    end
  else
    begin
    
      n := 1;
      j := length(s) - 1;
      
    end;
  
  FT := is_number(s, n);    

  if FT then                                //  Проверяем число ли введено
    begin                                   //  по флагу fl
                                            //  В случае корректности введённого
      for i := n to length(s) do
        begin

          res := res + (ctoi(s[i]) * pow(10, j));
          
          j := j - 1;

        end;                                //  слова переводим строку в целое
        
    end                                     //  число
    
  else
  
    writeln('Введено не число!');
  
  stoi := res;
  
  if FS then
  
    stoi := res * -1;                       // Если число отрицательное, то 
                                            // возвращаем отрицательное число...
  

end;                  //###### Конец функции stoi

var

  s : string;           // s - вводимое число типа string
  
  i : integer;          // i - счётчик для циклов
  

begin                 //###### Начало главного блока/модуля - main

  writeln('Введите число n');
  
  readln(s);
  
  writeln(stoi(s));     // Использование функции...
  
end.
