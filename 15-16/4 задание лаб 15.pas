program FindMinMaxInList;

type
  NodePtr = ^Node;
  Node = record
    data: Integer;
    next: NodePtr;
  end;

function FindMaxMin(head: NodePtr; var max, min: Integer): Boolean;
var
  current: NodePtr;
begin
  if head = nil then
  begin
    FindMaxMin := False;
    Exit;
  end;

  current := head;
  max := current^.data;
  min := current^.data;

  while current <> nil do
  begin
    if current^.data > max then
      max := current^.data;
    if current^.data < min then
      min := current^.data;

    current := current^.next;
  end;

  FindMaxMin := True;
end;

var
  head, node1, node2, node3: NodePtr;
  maxNum, minNum: Integer;

begin
  New(node1);
  New(node2);
  New(node3);

  node1^.data := 1;
  node1^.next := node2;

  node2^.data := 57;
  node2^.next := node3;

  node3^.data := 15;
  node3^.next := nil;

  head := node1;

  if FindMaxMin(head, maxNum, minNum) then
    Writeln('Максимальный элемент: ', maxNum, ', Минимальный элемент: ', minNum)
  else
    Writeln('Список пуст.');

end.
