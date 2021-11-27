program Task_509_а;



type

  Marks = array[1..9] of string;                // Создаём новый тип для передачи массива в процедуру Print_Marks 
  


procedure Print_Marks(mark : Marks);            // Процедура для вывода всех марок для выбора марки по заданию

var

  i : integer;          // Счётчик

begin
  
  for i := 1 to 9 do
    begin
    
      writeln(i, ') ', mark[i]);
    
    end;

end;
  
const
  
  Mark_Arr : Marks = ('Nissan', 'Toyota', 'Hyundai', 'Honda', 'Tesla', 'Ford', 'ЗИЛ', 'КАМАЗ', 'Lada');


var

  f_cars : Text;
  
  temp, matching, num, fam, mark : string;  // temp - строка файла, matching - строка сравнения марок, num - омер авто, fam - владелец авто, mark - выбранная марка для сравнения
                                            //
  i, nom : integer;                         // Счётчик и переменная для будущего сравнения
                                            //
  flag : boolean;                           // flag - проверка корректности введённой марки

begin


  Print_Marks(Mark_Arr);                    // Выводим марки для выбора
  
  writeln('Введите марку (цифрой):');       // Просим выбрать марку
  
  readln(nom);  
  
  if (nom < 1) and (nom > 9) then           // Проверяем введённые данные
    flag := true;
  
  if flag then
  
    writeln('Неккоректный ввод!')
    
  else
    begin
    
      mark := Mark_Arr[nom];                // Присваиваем переменной выбранную марку для будущего сравнения
      
      Assign(f_cars, 'f_cars.txt');         
     
      Reset(f_cars);                        // Открываем файл для чтения
      
      writeln();
      writeln('Вы выбрали марку ', mark);
      writeln();
     
     
      while not Eof(f_cars) do
        begin
         
         
         readln(f_cars, temp);              // Считываем строку из файла
         
         nom := temp.IndexOf(' ');          
         
         matching := copy(temp, 1, nom);
         
         
         if matching = mark then            // Если марка сходится, то выводим её в консоль
          begin
           
           
            delete(temp, 1, nom + 1);
           
            nom := temp.IndexOf(' ');
            
            num := copy(temp, 1, nom);            // Все эти действия направлены для 
                                                  // вывода сначала фамилии
            delete(temp, 1, nom + 1);             // затем номера (как в задании)
            
            fam := copy(temp, 1, length(temp));
           
            writeln(fam, ' ', num);
         
         
          end;
        end;
      
      
      Close(f_cars);                        // Закрываем файл
   
    end;
end.