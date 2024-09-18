var i_ptr: ^integer;
begin
  new(i_ptr);
  i_ptr^:= 2;
  writeln('адрес =', i_ptr); //$A541F0
  writeln('значение =', i_ptr^);//2
end.
