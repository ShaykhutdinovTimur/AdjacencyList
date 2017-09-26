//fpc 3.0.0

program AdjacencyList;

const
  EMAX = 200000;
  VMAX = 100000;

var
  head: array [1..Vmax] of integer;
  next: array [1..Emax] of integer;
  value: array [1..Emax] of integer;
  nextFree: integer;

procedure Add(v, u: integer);
begin
  next[nextFree] := head[v]; 
  value[nextFree] := u;
  head[v] := nextFree;
  inc(nextFree);
end;

procedure GoV(v: integer); 
var
  u, i: integer; 
begin
  i := head[v]; 
  while i <> 0 do
    begin 
      u := value[i];
      //...
      i := next[i];
    end;
end;

begin
end.
