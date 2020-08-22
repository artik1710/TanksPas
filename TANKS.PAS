program mainTank;
uses crt, graph, mapgen;

var graph_driver, graph_mode: integer;

procedure our_tank;
begin

end;
     var 
     i,j : integer;
     {-----}
     button_pressed : char;
     vX, vY, size_tank, speed : integer;
begin

     graph_driver := detect;
     InitGraph(graph_driver,graph_mode,'c:\TPWDB\BGI');

     readMap(1);

     map_generation;
     {----------}
     size_tank := 32;
     setfillstyle(1,9);
     vX := 11;
     vY := 11;
     speed := 1;
     bar(vX,vY,vX + size_tank, vY + size_tank);
     while (TRUE) do begin
          delay(10);
          if keypressed then begin
          button_pressed := readkey;
          case button_pressed of
               'd':begin vX := vX + speed end;
               'a':begin vX := vX - speed end;
               'w':begin vY := vY - speed end;
               's':begin vY := vY + speed end;
               #27:begin break end;
          end;
          end;
          bar(vX,vY,vX + size_tank, vY + size_tank);
     end;

     {readkey;}
     clrscr;
end.