program Task_517_g;



var
   
  ind1, ind2, age1, age2, err : integer;          // Индекс для разделения строки на Имя игрушки, Цену, Возрастное ограничение (от age1 до age2)
  
  temp, temp2 : string;                           // temp - переменная для записи строки из файла
  
  f_toys : Text;                                  // Сам текстовый файл                         
  
begin


  age1 := 4;                                      // Условия задачи
  age2 := 10;


  Assign(f_toys, 'f_toys.txt');
  
  
  Reset(f_toys);                                  // Открываем файл для чтения
  
  
  while not Eof(f_toys) do
    begin
    
      readln(f_toys, temp);
      
      
      ind2 := temp.LastIndexOf(' ');              // Предпоследний (Хотя должен быть последним...) (' ') - Возрастное ограничение (age1 age2)
      
      ind1 := temp.IndexOf(' ', ind2 + 1);        // Последний пробел, но не работает!
      
      
      
      temp2 := Copy(temp, ind1, ind2);
      
      val(temp2, age1, err);
    
    
    end;
    
    
  Close(f_toys);                                  // Закрываем файл
    

end.