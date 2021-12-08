program Task_136_a;

var

  n : word;                 // n - число а, итераций  (0 <= n <= 65535)
                            // sum - сумма всех а
  a, sum, i : integer;      // i - счётчик для циклов

begin

  writeln('Введите натуральное число n');
  readln(n);

  writeln('Вводите натуральные числа а через Enter:');

  for i := 1 to n do
    begin

      readln(a);
      sum := sum + a;

    end;

  writeln('Полученная сумма всех чисел а: ', sum);
  
 
end.
