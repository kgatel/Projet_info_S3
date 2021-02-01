program plateau ;
uses crt,keyboard;

var k : Tkeyevent;
var x,y,cste : integer;


{programme principal}
begin
	initkeyboard;
	gotoxy(1,17);
	
	begin{curseur}
			x:=1;y:=1; 
			gotoxy(x,y);
		repeat
		k:= getkeyevent;
		k:=translatekeyevent(k);
		writeln(k);
		case k of
				33619751 : y:=y+1;
				33619745 : y:=y-1;
				33619749 : x:=x+1;
				33619747 : x:=x-1;
				7181 : ;
		end;
		case x of 
				0 : x:=1;
		end;
		case y of 
				0 : y:=1;
		end;
		
		gotoxy(x,y);
		until(k=7181 );
	end;
	donekeyboard;     

end.
