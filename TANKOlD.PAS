Program Tank;
uses crt, graph;

type
records=record
             name: string[90];
end;

var driver, mode: integer;
    ch,ch1: char;
    napravl:char;
    x,y,x1,y1,b,n:word;
    p,o,i1,u,m,a:word;
    l,k,t,r,z,q,ran,e,e1,s:word;
    res:byte;
    tx,ty:integer;

    f: text;
    winners: array [1..100] of records;
    pole: array [1..50, 1..50] of byte;
    count: byte;
const
  pole_x:byte=24;
  pole_y:byte=26;

procedure fillmap;
var j,i:byte;
begin
     for i:=1 to pole_x do
         begin
              pole[1,i]:=1;
              pole[pole_x,i]:=1;
         end;
     for i:=1 to pole_y do
         begin
              pole[i,1]:=1;
              pole[i,pole_y]:=1;
         end;


     for i:=5 to 14 do pole[i,5]:=1;
     pole[5,6]:=1;
     pole[5,7]:=1;
     {for j:=1 to pole_y do
     begin
         for i:=1 to pole_x do
             write(pole[i,j]);
             writeln;
     end;
     readkey;}
end;

procedure stena;
var i,j:byte;
begin
     for i:=2 to pole_x-1 do
     begin
         for j:=2 to pole_y-1 do
             if pole[i,j]<>0 then
             rectangle(p+(i-2)*18,o+(j-2)*18,p+(i-1)*18,o+(j-1)*18);
     end;
end;

procedure open;
var l:string;
a:byte;
begin
     assign(f, 'file.txt');
     reset(f);
     count:=0;
     while not EOF(f) do
           begin
               inc(count);
               readln(f, winners[count].name);
               readln(f);
           end;
     close(f);
end;

procedure printfile;
var a:byte;
begin
assign(f, 'file.txt');
reset(f);
for a:=1 to count do
begin
     writeln(f, winners[a].name);
     writeln(f);
end;
close(f);
end;

procedure print(var n,y:integer);
var c:string[70];
begin
     outtextxy(20,y+25,winners[n].name);
end;

procedure all;
var a,r:integer;
begin
r:=70;
for a:=1 to count do
begin
print(a,r);
r:=r+40;
end;
end;


procedure ikonkaup;
begin
     if y1>218 then
        begin
             setcolor(15);
             circle(x1,y1,5);
             dec(y1,30);
             fillellipse(x1,y1,7,7);
             setcolor(0);
             circle(x1,y1,5);
        end;
end;

procedure ikonkadown;
begin
     if y1<270 then
        begin
             setcolor(15);
             circle(x1,y1,5);
             inc(y1,30);
             fillellipse(x1,y1,7,7);
             setcolor(0);
             circle(x1,y1,5);
        end;
end;

procedure ikonkaright;
begin
     if l<450 then
        begin
             setcolor(0);
             circle(l,k,18);
             inc(l,290);
             setcolor(15);
             circle(l,k,18);
     end;
end;

procedure ikonkaleft;
begin
     if l>200 then
        begin
             setcolor(0);
             circle(l,k,18);
             dec(l,290);
             setcolor(15);
             circle(l,k,18);
        end;
end;

procedure pauseup;
begin
     if q>405 then
        begin
             setcolor(15);
             circle(z,q,5);
             dec(q,30);
             fillellipse(z,q,7,7);
             setcolor(0);
             circle(z,q,5);
        end;
end;

procedure pausedown;
begin
     if q<400 then
        begin
             setcolor(15);
             circle(z,q,5);
             inc(q,30);
             fillellipse(z,q,7,7);
             setcolor(0);
             circle(z,q,5);
        end;
end;

function pause:byte;
begin
     setfillstyle(1,7);
     bar(460,350,600,440);
     setcolor(0);
     outtextxy(495,360,'Pause');
     outtextxy(510,400,'Back');

     setfillstyle(1,15);
     fillellipse(t,r,8,8);
     setcolor(15);
     circle(t,r,8);

     setcolor(0);
     circle(z,q,5);

     repeat
      begin
      if keypressed then
       begin
       ch1:=readkey;
         case ord(ch1) of
              {72:pauseup;
              80:pausedown;}
              13:begin
                      m:=1;
                      break;
                 end;
              27:begin
                      m:=0;
                      break;
                 end;
              68:begin
                      m:=2;
                      break;
                  end;
         end;
       end;
end;
until false;
      if m=1 then
         begin
             if r=405 then
                begin
                     if a=0 then
                     setfillstyle(1,8);
                     bar(460,350,600,460);
                end;
         end;
      if m=0 then
         begin
              setfillstyle(1,8);
              bar(460,350,600,460);
         end;
         pause:=m;
end;

Procedure Tankup;
Begin
	SetfillStyle(1,2);
	Setcolor(6);
	Bar(x,y,x+3,y+12);
	Rectangle(x,y,x+3,y+12);
	Bar(x+13,y,x+16,y+12);
	Rectangle(x+13,y,x+16,y+12);
	Setcolor(2);
	Sector(x+8,y+7,360,360,5,5);
	Setcolor(6);
	Circle(x+8,y+7,5);
	Circle(x+8,y+7,3);
	Bar(x+7,y-4,x+9,y+2);
	Rectangle(x+7,y-4,x+9,y+2);
End;

procedure Tankdown;
Begin
	SetfillStyle(1,2);
	Setcolor(6);
	Bar(x,y-4,x+3,y+8);
	Rectangle(x,y-4,x+3,y+8);
	Bar(x+13,y-4,x+16,y+8);
	Rectangle(x+13,y-4,x+16,y+8);
	Setcolor(2);
	Sector(x+8,y+1,360,360,5,5);
	Setcolor(6);
	Circle(x+8,y+1,5);
	Circle(x+8,y+1,3);
	Bar(x+7,y+6,x++9,y+12);
	Rectangle(x+7,y+6,x++9,y+12);
End;

Procedure Tankleft;
Begin
	SetfillStyle(1,2);
	Setcolor(6);
	Bar(x+4,y-4,x+16,y-1);
	Rectangle(x+4,y-4,x+16,y-1);
	Bar(x+4,y+9,x+16,y+12);
	Rectangle(x+4,y+9,x+16,y+12);
	Setcolor(2);
	Sector(x+11,y+4,360,360,5,5);
	Setcolor(6);
	Circle(x+11,y+4,5);
	Circle(x+11,y+4,3);
	Bar(x,y+3,x+6,y+5);
	Rectangle(x,y+3,x+6,y+5);
End;

Procedure Tankright;
Begin
	SetfillStyle(1,2);
	Setcolor(6);
	Bar(x,y-4,x+12,y-1);
	Rectangle(x,y-4,x+12,y-1);
	Bar(x,y+9,x+12,y+12);
	Rectangle(x,y+9,x+12,y+12);
	Setcolor(2);
	Sector(x+5,y+4,360,360,5,5);
	Setcolor(6);
	Circle(x+5,y+4,5);
	Circle(x+5,y+4,3);
	Bar(x+11,y+3,x+16,y+5);
	Rectangle(x+11,y+3,x+16,y+5);
End;

procedure up;
Begin
	if ty<>2 then
           if pole[tx,ty-1]=0 then
 	Begin
  		SetfillStyle(1,0);
  		Bar(x,y-4,x+16,y+12);
  		if napravl='U' then
                begin
                dec(y,18);
                dec(ty,1);
                end
                else napravl:='U';
  		Setcolor(15);
  		Tankup;
  		putpixel(x,y,4);
 	End;
End;

procedure down;
Begin
	if ty<>pole_y-1 then
           if pole[tx,ty+1]=0 then
 	Begin
  		SetfillStyle(1,0);
  		Bar(x,y-4,x+16,y+12);
                if napravl='D' then
                begin
                inc(y,18);
                inc(ty,1);
                end
                else napravl:='D';
  		Setcolor(15);
  		Tankdown;
 	End;
End;

procedure left;
Begin
	if tx<>2 then
 	Begin
             if pole[tx-1,ty]=0 then
                begin
  		SetfillStyle(1,0);
  		Bar(x,y-4,x+16,y+12);
  		if napravl='L' then
                begin
                dec(x,18);
                dec(tx,1);
                end
                else napravl:='L';
  		Setcolor(15);
  		Tankleft;
                end;
 	End;
End;

procedure rigth;
Begin
	if tx<>pole_x-1 then
           if pole[tx+1,ty]=0 then
 	Begin
  		SetfillStyle(1,0);
  		Bar(x,y-4,x+16,y+12);
  		if napravl='R'then
                begin
                inc(x,18);
                inc(tx,1);
                end
                else napravl:='R';
  		Setcolor(15);
  		Tankright;
 	End;
End;

procedure Game;
begin
       cleardevice;
     setcolor(15);
     rectangle(p,o,i1,u);
     setfillstyle(1,8);
     bar(430,0,640,480);

     settextstyle(defaultfont,0,2);
     outtextxy(500,5,'Tank');
     outtextxy(460,50,'Flag 0/5');
     outtextxy(460,80,'Kill:0');
     outtextxy(460,110,'Dead:0');
     rigth;
     stena;

     if s=0 then ran:=random(4);
     delay(100);

     res:=0;
repeat
      begin
      if keypressed then
       begin
       ch1:=readkey;
         case ord(ch1) of
              32:begin
                      m:=0;
                      res:=pause;
                      if q=430 then break;
                 end;

		72: up;
                80: down;
                75: left;
                77: rigth;
                 end;
                   delay(2);
         end;
       end;
until res=2;
end;

procedure NewGame;
begin
       cleardevice;
     setcolor(15);
     circle(l,k,18);

     settextstyle(defaultfont,0,2);
     setcolor(15);
     outtextxy(285,5,'Maps');
     rectangle(25,25,610,460);

     line(315,25,315,460);
     settextstyle(defaultfont,0,3);
     outtextxy(160,240,'1');

     outtextxy(450,240,'2');

repeat
      begin
      if keypressed then
       begin
       ch1:=readkey;
         case ord(ch1) of
              77:ikonkaright;
              75:ikonkaleft;
              13:begin
                      m:=1;
                      break;
              end;
              27:begin
                      m:=0;
                      break;
            end;
         end;
       end;
end;
until false;
      if m=1 then
         begin
         if l=168 then Game;
         if l=458 then Game;
         end;
end;

procedure Reckords;
begin
     cleardevice;
     setcolor(15);
     rectangle(5,30,630,460);
     line(5,80,630,80);
     line(355,30,355,460);

     settextstyle(defaultfont,0,2);
     setcolor(15);
     outtextxy(250,10,'Reckords');
     outtextxy(425,50,'Account');
     outtextxy(95,50,'Character');
     open;
     all;

repeat
      begin
      if keypressed then
       begin
       ch1:=readkey;
         case ord(ch1) of
              27:begin
                      m:=0;
                      break;
                  end;
         end;
       end;
end;
until false;
end;

begin
clrscr;
       x1:=215;
       y1:=218;

       b:=215;
       n:=218;

       l:=168;
       k:=249;

       t:=490;
       r:=405;

       z:=490;
       q:=405;

       p:=15;
       o:=24;
       i1:=(pole_x-2)*18+p;
       u:=(pole_y-2)*18+o;

       e:=20;
       e1:=20;

       x:=16;
       y:=29;

       fillmap;
       tx:=2;
       ty:=2;

     driver:=detect;
     initgraph(driver, mode,'C:\TPWDB\BGI');

repeat
      cleardevice;
      setfillstyle(1,15);
      fillellipse(b,n,8,8);
      setcolor(15);
      circle(b,n,8);

      fillellipse(b,n+30,8,8);
      setcolor(15);
      circle(b,n+30,7);

      fillellipse(b,n+60,8,8);
      setcolor(15);
      circle(b,n+60,7);

      setcolor(0);
      circle(x1,y1,5);

      setcolor(15);
      settextstyle(defaultfont,0,2);
      outtextxy(260,90,'Tank');
      outtextxy(235,210,'New Game');
      outtextxy(235,240,'Reckords');
      outtextxy(235,270,'Exit');
      {settextstyle(defaultfont,0,1);}
repeat
      begin
      if keypressed then
       begin
       ch1:=readkey;
         case ord(ch1) of
              72:ikonkaup;
              80:ikonkadown;
              13:begin
                  m:=1;
                  break;
                  end;
              27:begin
                  m:=0;
                  break;
                  end;
         end;
       end;
end;

until false;
      if m=1 then
      begin
           if y1=218 then NewGame;
           if y1=248 then Reckords;
      end;
until y1=278;
closegraph;
end.