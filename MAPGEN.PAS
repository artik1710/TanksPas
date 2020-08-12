uses crt;
var f:text;

Begin
assign(f,'Map.txt');
rewrite(f);
writeln(f,'sas');
close(f);

end.
