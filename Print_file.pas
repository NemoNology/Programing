unit Print_file;



interface

  /// Процедура чтения файла f и вывода его в консоль
  procedure Print_file(var f : Text);
  
  /// Процедура чтения файла f и записи его в результирующий файл - result_file
  procedure Print_file(var f : Text; var result_file : Text);
    
    
implementation

var
  
  temp : string;                          // temp - строка файла
  




procedure Print_file(f : Text);


begin
  
  Reset(f);                               // Открываем файл для чтения
  
  while not Eof(f_integer) do
    begin
    
      readln(f_integer, temp);            // Читаем строку из файла и записываем её в temp
      writeln(temp);                      // Выводим в консоль
      
    end;

  
  
end;
     
     
     
procedure Print_file(f : Text; result_file : Text);


begin
  
  Reset(f);                               // Открываем файл для чтения
  
  Rewrite(result_file);                   // Открываем файл для записи
  
  
  while not Eof(f_integer) do
    begin
    
      readln(f_integer, temp);            // Читаем строку из файла и записываем её в temp
      writeln(result_file, temp);
      
    end;

  
  
end;