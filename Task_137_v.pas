program Task_137_v;

var

  n : word;                 // n - ����� �, ��������  (0 <= n <= 65535)
                            // sum - ����� ���� �
  a, sum, i : integer;      // i - ������� ��� ������

begin

  writeln('������� ����������� ����� n');
  readln(n);

  writeln('������� ����������� ����� � ����� Enter:');

  for i := 1 to n do
    begin

      readln(a);
      sum := sum + a;

      writeln('|a|: ', abs(a));
      writeln('|�0 + ... + a|: ', abs(sum));

    end;

end.
