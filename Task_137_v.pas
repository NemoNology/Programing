program Task_137_v;

var

  n : word;                 // n - число а, итераций  (0 <= n <= 65535)
                            // sum - сумма всех а
  a, sum, i : integer;      // i - счЄтчик дл€ циклов

begin

  writeln('¬ведите натуральное число n');
  readln(n);

  writeln('¬водите натуральные числа а через Enter:');

  for i := 1 to n do
    begin

      readln(a);
      sum := sum + a;

      writeln('|a|: ', abs(a));
      writeln('|а0 + ... + a|: ', abs(sum));

    end;

end.
