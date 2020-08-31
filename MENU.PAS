program menu;

uses crt, graph, mapgen, play;
var graph_driver, graph_mode: integer;
var pos_cursor : array [0..2] of byte;
const
	start_pos_y = 100;
       	start_pos_x = 100;

procedure pressed_enter(status_check : integer);

begin
	case status_check of
		0: begin start_game; end;
		1: begin end;
		2: begin end;
        end;
end;

procedure paint_menu(where_is_cursor : integer);
var
	i : byte;
	color : byte;
	menu: array [0..2] of string;
	pos_y, pos_x : integer;
begin
	menu[0] := 'New Game';
	menu[1] := 'Reckords';
	menu[2] := 'Exit';
	pos_y:= 210;
	pos_x:= 235;
	color := 15;

	setcolor(color);
	settextstyle(defaultfont,0,2);
	outtextxy(260,90,'Tank');

	for i:= 0 to 2 do begin
		if (i = where_is_cursor) then begin
			setcolor(4);
		end;
		outtextxy(pos_x,pos_y,menu[i]);
		setcolor(color);
		pos_y:= pos_y + 30;
	end;

end;

var
	check_status : boolean;
	button_pressed : char;
	check_cursor : integer;
begin
	check_status := false;
	check_cursor := 0;

	initgraph(graph_driver,graph_mode,'c:\TPWDB\BGI');
	cleardevice;
	paint_menu(0);

	while(check_status <> true) do begin
	delay(100);
	if (check_cursor >= 0) and (check_cursor <= 2) then begin
		if keypressed then begin
			button_pressed := readkey;
			case button_pressed of
				's': begin
						check_cursor := check_cursor + 1;
						if (check_cursor > 2) then begin check_cursor := check_cursor - 1; end;
						paint_menu(check_cursor);
						end;
				'w': begin
						check_cursor := check_cursor - 1;
						if (check_cursor < 0) then begin check_cursor := check_cursor + 1; end;
						paint_menu(check_cursor);
						end;
				#38: begin
						check_cursor := check_cursor - 1;
						if (check_cursor < 0) then begin check_cursor := check_cursor + 1; end;
						paint_menu(check_cursor);
						end;
				#40: begin
						check_cursor := check_cursor + 1;
						if (check_cursor > 2) then begin check_cursor := check_cursor - 1; end;
						paint_menu(check_cursor);
						end;
				#13: begin
						check_status := true; 
						pressed_enter(check_cursor);
						end;
				#27: begin check_status := true; end;
			end;
		end;

	end;

	end;
end.