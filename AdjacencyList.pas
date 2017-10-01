//fpc 3.0.0

program AdjacencyList;

const
  EMAX = 200000;
  VMAX = 100000;

var
  head: array [1..Vmax] of integer;
  result: array [1..Vmax] of integer;
  next: array [1..Emax] of integer;
  value: array [1..Emax] of integer;
  nextFree: integer;
  
  vnum: integer;
  enum: integer;

procedure clear();
var
  i: integer;
begin
  for i := 1 to Vmax do
  begin
	head[i] := 0;
	result[i] := 0;
  end;
  for i := 1 to Emax do
  begin
    next[i] := 0;
    value[i] := 0;
  end;
end;

procedure add(v, u: integer);
begin
  next[nextFree] := head[v]; 
  value[nextFree] := u;
  head[v] := nextFree;
  inc(nextFree);
end;

procedure goV(v: integer); 
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

//example with subtree vertex count 
//lazy dynamic variant
procedure funV(v: integer);
var
  i, sum: integer;  
begin
  sum := 0;
  result[v] := 1;
  i := head[v]; 
  while i <> 0 do
    begin 
      u := value[i];
      if (result[v] = 0) then
        funV(u);
      inc(sum, result[v]);
      i := next[i];
    end;
  result[v] := sum;  
end;

//subtree gov commutative associative function count
//exaple with subtree vertex count
//also counts number of star edges
procedure countAll();
var
  i: integer;
begin
  for i := 1 to vnum do
    if (result[i] = 0) then
      funV(i);      
end;

begin
end.
