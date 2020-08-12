uses crt, graph;
begin
initgraph();
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
      end.