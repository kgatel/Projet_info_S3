unit caze;

interface
uses crt;
var i,j : integer;

procedure caze (i,j : integer);

implementation

procedure caze(i,j : integer);
begin


gotoxy(4*i,2*j);write(' ');
gotoxy(4*i,2*j-1);write(' ');

gotoxy(4*i-1,2*j);write(' ');
gotoxy(4*i-1,2*j-1);write(' ');

gotoxy(4*i-2,2*j);write(' ');
gotoxy(4*i-2,2*j-1);write(' ');

gotoxy(4*i-3,2*j);write(' ');
gotoxy(4*i-3,2*j-1);write(' ');
end;
end.
