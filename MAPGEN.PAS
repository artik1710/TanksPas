unit MAPGEN;

interface
uses crt, GRAPH;
procedure wall_paint(x,y,color: integer); {texure for wall}
procedure map_generation; {draw map}
procedure readMap(level : integer); {texure for wall}

implementation
const
     {leviy ugol}
     left_x = 10;
     left_y = 10;
     {size of one pice}
     size_block = 34;
     size_map = 12;

{}
type settingmap = array[0..size_map,0..size_map] of integer;
var mapme : settingmap;

procedure wall_paint(x,y,color: integer);
var cube_size :integer;
begin
     cube_size := size_block;
     setfillstyle(1,color);
     bar(x,y,x + cube_size, y + cube_size);
end;

procedure map_generation;
var i,j,x,y : integer;
var type_block : integer;
begin
     setcolor(10);
     x := 10;
     y := 10;
     {around line fire check space 1 - left 2 - up 3 - right 4 - down}
     line (10,10,10,452);
     line (10,10,452,10);
     line (452,10,452,452);
     line (10,452,452,452);
     {///}

     for i:= 0 to 12 do begin
         for j:= 0 to 12 do begin
             type_block := mapme[i,j];

             case type_block of
                 1 : wall_paint(x,y,10);
             end;
             x:= x+size_block;
         end;
         x:= left_x;
         y:= y + size_of_block;
     end;
end;

procedure readMap(level : integer);
var file_map : text;
var i,j: integer;
begin
    assign(file_map,'c:\TPWDB\TANKS\maptest.txt');
    reset(file_map);
    
    for i := 0 to 12 do begin
        for j := 0 to 12 do begin
            read(file_map,mapme[i,j]);
        end;
        writeln;
    end;
    close(file_map);
end;
end.