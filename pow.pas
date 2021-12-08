function pow(n : real; st : integer): decimal; // Возведение в степень

var

    i : integer;                        // i - счётчик для циклов
    nn : decimal;                       // nn - переменная для результата

begin

    nn := n;                            // Присваиваем переменную


    for i := 1 to st - 1 do             // Перемножаем определённое кол-во раз
                                        //
      nn := nn * n;                     // - возводим в степень


    if st < 0 then                      // Если степень отрицательная, то                           
                                        // "возвращаем" 1 делённое на результат
      nn := 1 / nn;

    if st = 0 then                      // Если значение степени нулевое
                                        // то результат = 1
      nn := 1;


    //if (nn = 0) or (nn < 0) then
    
      //writeln('The result is out of range decimal')
      
    //else 
    
      pow := nn;
      
    
end;

var

  x : real;
  
  y : integer;
  
  
begin


  writeln('Input x and y (using Enter):');

  readln(x, y);
  
  writeln('x^y: ', pow(x, y));


end.