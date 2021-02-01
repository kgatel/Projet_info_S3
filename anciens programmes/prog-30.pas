program plateau ;
uses Crt,keyboard,Classes, SysUtils, Process;
type piece = (tourb, tourn, foub, foun, cavalierb, cavaliern, roib, roin, reineb,reinen, pionb, pionn,vide);
type tableau = array [1..8,1..8] of piece;
var a,i,j : integer;
var tab : tableau;
var k : Tkeyevent;
var x,y,cste : integer;
var p1,p2 : piece;
var victoire, vf : boolean;


procedure caze (i,j : integer);

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





procedure damier();

begin
clrscr;
	for i:= 1 to 8 do
	 begin for j:=1 to 8 do
		begin	if ((i=1) or (i=3) or (i=5) or (i=7)) then 				
							case j of
							1:begin textbackground(15);textcolor(0); caze(i,j);end;
							2:begin textbackground(0);textcolor(15); caze(i,j);end;
							3:begin textbackground(15);textcolor(0); caze(i,j);end;
							4:begin textbackground(0);textcolor(15); caze(i,j);end;
							5:begin textbackground(15);textcolor(0); caze(i,j);end;
							6:begin textbackground(0);textcolor(15); caze(i,j);end;
							7:begin textbackground(15);textcolor(0); caze(i,j);end;
							8:begin textbackground(0);textcolor(15); caze(i,j);end;
							end
				else	
				case j of
							1:begin textbackground(0);textcolor(15); caze(i,j); end;
							2:begin textbackground(15);textcolor(0); caze(i,j);end;
							3:begin textbackground(0);textcolor(15); caze(i,j);end;
							4:begin textbackground(15);textcolor(0); caze(i,j);end;
							5:begin textbackground(0);textcolor(15); caze(i,j); end;
							6:begin textbackground(15);textcolor(0); caze(i,j);end;
							7:begin textbackground(0);textcolor(15); caze(i,j);end;
							8:begin textbackground(15);textcolor(0); caze(i,j);end;
							end;
	 end;
	 end;
	
	 


end;

procedure initialisation();
var iplace : integer;

begin

tab[1,8]:=tourb;
tab[2,8]:=cavalierb;
tab[3,8]:=foub;
tab[4,8]:=reineb;
tab[5,8]:=roib;
tab[6,8]:=foub;
tab[7,8]:=cavalierb;
tab[8,8]:=tourb;
tab[1,7]:=pionb;
tab[2,7]:=pionb;
tab[3,7]:=pionb;
tab[4,7]:=pionb;
tab[5,7]:=pionb;
tab[6,7]:=pionb;
tab[7,7]:=pionb;
tab[8,7]:=pionb;
tab[1,1]:=tourn;
tab[2,1]:=cavaliern;
tab[3,1]:=foun;
tab[4,1]:=reinen;
tab[5,1]:=roin;
tab[6,1]:=foun;
tab[7,1]:=cavaliern;
tab[8,1]:=tourn;
tab[1,2]:=pionn;
tab[2,2]:=pionn;
tab[3,2]:=pionn;
tab[4,2]:=pionn;
tab[5,2]:=pionn;
tab[6,2]:=pionn;
tab[7,2]:=pionn;
tab[8,2]:=pionn;
	for iplace :=1 to 8 do
		begin
				tab[iplace,3]:= vide;
				tab[iplace,4]:= vide;
				tab[iplace,5]:= vide;
				tab[iplace,6]:= vide;
		end;
end;

	
procedure affichage();

	var iaffichage,jaffichage : integer;

begin
clrscr;
damier();
for iaffichage:= 1 to 8 do 
	begin for jaffichage :=1 to 8 do
			begin
				gotoxy(4*iaffichage -1, 2*jaffichage);
				case  tab[iaffichage,jaffichage] of 
						tourb : write('t');
						foub : write('f');
						cavalierb : write('c');
						roib : write('r');
						reineb : write('Re');
						pionb : write('p');
						
				end;
				gotoxy(4*iaffichage -2, 2*jaffichage);
				case  tab[iaffichage,jaffichage] of 
						tourn : write('t''');
						foun : write('f''');
					    cavaliern : write('c''');
						roin : write('r''');
						reinen : write('Re''');
						pionn : write('p''');
						
				end;
			end;
	end;
end;






procedure deplacementvalide(xtab,x2tab,ytab,y2tab,a : integer ; p1,p2 : piece; var vf : boolean);
var i,casepleine : integer;

begin
vf:=false;
casepleine:=0;

{joueur 1}
	if a=1 then
	
	BEGIN
	
	
{pion blanc} 		
if p1=pionb then
	begin
		if ( (ytab=7) and (xtab=x2tab) and (   ((y2tab=5)and ((tab[xtab,5]=vide) and (tab[xtab,6]=vide) )) or ((y2tab=6) and (tab[xtab,6]=vide))) ) then
		begin 
			vf:=true;
		end;
		
		if ( (ytab<>7) and (ytab-1=y2tab) and (xtab=x2tab) and (tab[xtab,y2tab]=vide) )then
		begin
			vf:=true;
		end;
		
		if ( ((xtab+1=x2tab) or (xtab-1=x2tab)) and (ytab-1=y2tab) and ((p2= pionn) or (p2=tourn) or (p2= foun) or (p2=cavaliern) or (p2= roin) or (p2=reinen)) ) then
		begin
			vf:=true;
		end;
	end;
	


{tour blanche}
if p1=tourb then
	begin
		{deplacement vertical}
		if xtab=x2tab then
		begin
		
		if ytab<y2tab then
			begin
				for i:=ytab+1 to y2tab do
				begin
					if (tab[xtab,i] <> vide) then
					begin
						casepleine:=1;
						if (   (i=y2tab) and ((tab[xtab,y2tab]=tourn) or  (tab[xtab,y2tab]=cavaliern) or (tab[xtab,y2tab]=foun) or (tab[xtab,y2tab]=reinen) or (tab[xtab,y2tab]=pionn) ) ) then
						begin casepleine:=0 end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
				
				
		if ytab>y2tab then
			begin
				for i:=ytab-1 downto y2tab do
				begin
					if (tab[xtab,i] <> vide) then
					begin
						casepleine:=1;
						if (   (i=y2tab) and ((tab[xtab,y2tab]=tourn) or  (tab[xtab,y2tab]=cavaliern) or (tab[xtab,y2tab]=foun) or (tab[xtab,y2tab]=reinen) or (tab[xtab,y2tab]=pionn) ) ) then
						begin casepleine:=0 end;
					end;
				end;
			
				if casepleine=0 then
				begin
					vf:=true
				end;
			end;
		end;
		{fin vertical}
		
		{deplacement horizontal}
		if ytab=y2tab then
		begin
		
		if xtab<x2tab then
			begin
			for i:=xtab+1 to x2tab do
				begin
				if tab[i,ytab] <> vide then
					begin
						casepleine:=3;
						if (   (i=x2tab) and ((tab[x2tab,y2tab]=tourn) or  (tab[x2tab,y2tab]=cavaliern) or (tab[x2tab,y2tab]=foun) or (tab[x2tab,y2tab]=reinen) or (tab[x2tab,y2tab]=pionn) ) ) then
						begin casepleine:=0 end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
				
				
		if xtab>x2tab then
			begin
			for i:=xtab-1 downto x2tab do
				begin
				if tab[i,ytab] <> vide then
					begin
						casepleine:=4;
						if (   (i=x2tab) and ((tab[x2tab,y2tab]=tourn) or  (tab[x2tab,y2tab]=cavaliern) or (tab[x2tab,y2tab]=foun) or (tab[x2tab,y2tab]=reinen) or (tab[x2tab,y2tab]=pionn) ) ) then
						begin casepleine:=0 end;
					end;
				end;
			
				if casepleine=0 then
				begin
					vf:=true
				end;
			end;
		end;
		
	end;
	{fin tour blanche}

END;
{fin joueur 1}



{joueur 2}
	if a=2 then
	
	BEGIN
	
{pion noir}
if p1=pionn then
	begin
		if ( (ytab=2) and (xtab=x2tab) and (   ((y2tab=4)and ((tab[xtab,4]=vide) and (tab[xtab,3]=vide) )) or ((y2tab=3) and (tab[xtab,3]=vide))) ) then
		begin 
			vf:=true;
		end;
		
		if ( (ytab<>2) and (ytab+1=y2tab) and (xtab=x2tab) and (tab[x2tab,y2tab]=vide) )then
		begin
			vf:=true;
		end;
		
		if ( ((xtab+1=x2tab) or (xtab-1=x2tab)) and (ytab+1=y2tab) and ((p2= pionb) or (p2=tourb) or (p2= foub) or (p2=cavalierb) or (p2= roib) or (p2=reineb)) ) then
		begin
			vf:=true;
		end;
	end;
{fin pion noir}

{tour noire}
if p1=tourn then
	begin
		{deplacement vertical}
		if xtab=x2tab then
		begin
		
		if ytab<y2tab then
			begin
				for i:=ytab+1 to y2tab do
				begin
					if (tab[xtab,i] <> vide) then
					begin
						casepleine:=1;
						if (   (i=y2tab) and ((tab[xtab,y2tab]=tourb) or  (tab[xtab,y2tab]=cavalierb) or (tab[xtab,y2tab]=foub) or (tab[xtab,y2tab]=reineb) or (tab[xtab,y2tab]=pionb) ) ) then
						begin casepleine:=0 end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
				
				
		if ytab>y2tab then
			begin
				for i:=ytab-1 downto y2tab do
				begin
					if (tab[xtab,i] <> vide) then
					begin
						casepleine:=1;
						if (   (i=y2tab) and ((tab[xtab,y2tab]=tourb) or  (tab[xtab,y2tab]=cavalierb) or (tab[xtab,y2tab]=foub) or (tab[xtab,y2tab]=reineb) or (tab[xtab,y2tab]=pionb) ) ) then
						begin casepleine:=0 end;
					end;
				end;
			
				if casepleine=0 then
				begin
					vf:=true
				end;
			end;
		end;
		{fin vertical}
		
		{deplacement horizontal}
		if ytab=y2tab then
		begin
		
		if xtab<x2tab then
			begin
			for i:=xtab+1 to x2tab do
				begin
				if tab[i,ytab] <> vide then
					begin
						casepleine:=3;
						if (   (i=x2tab) and ((tab[xtab,y2tab]=tourb) or  (tab[xtab,y2tab]=cavalierb) or (tab[xtab,y2tab]=foub) or (tab[xtab,y2tab]=reineb) or (tab[xtab,y2tab]=pionb) ) ) then
						begin casepleine:=0 end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
				
				
		if xtab>x2tab then
			begin
			for i:=xtab-1 downto x2tab do
				begin
				if tab[i,ytab] <> vide then
					begin
						casepleine:=4;
						if (   (i=x2tab) and ((tab[xtab,y2tab]=tourb) or  (tab[xtab,y2tab]=cavalierb) or (tab[xtab,y2tab]=foub) or (tab[xtab,y2tab]=reineb) or (tab[xtab,y2tab]=pionb) ) ) then
						begin casepleine:=0 end;
					end;
				end;
			
				if casepleine=0 then
				begin
					vf:=true
				end;
			end;
		end;
		
	end;

	END;
{fin joueur 2}






end;{fin procedure}




procedure deplacement2(var xtab,ytab : integer; p1 : piece; var cste,a : integer; var vf : boolean);

	var a3, a4, x2tab, y2tab : integer;
		p2 : piece;
		piecechoisie : string;
		
	begin
	a3:=x;	a4:=y;
	x2tab:=((x -1) div 4)+1;
	y2tab:=((y -1) div 2)+1;
	p2:=tab[x2tab,y2tab];
	
	
		deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf);
		if vf=false then
		begin
			gotoxy(1,18);writeln('Votre deplacement est invalide       ');
			delay(1500);
			gotoxy(1,18);writeln('Veuillez choisir une de vos pieces   ');
			cste:=1;
		end;
	
		if vf=true then
			begin
				tab[x2tab,y2tab]:=p1;
				tab[xtab,ytab]:=vide;
				if ((p1=pionn) and (y2tab=8)) then 
				begin
					repeat
					gotoxy(1,18);
					writeln('Quel piece voulez-vous choisir ?     ');
					readln(piecechoisie);
					gotoxy(1,19); write('                ');
					until ((piecechoisie='t''') or (piecechoisie='c''') or (piecechoisie='f''') or (piecechoisie='Re'''));
					case piecechoisie of
						't''' : tab[x2tab,y2tab]:=tourn;
						'c''' : tab[x2tab,y2tab]:=cavaliern;
						'f''' : tab[x2tab,y2tab]:=foun;
						'Re''' : tab[x2tab,y2tab]:=reinen;
					end;
				end;
				if ((p1=pionb) and (y2tab=1)) then 
				begin
					repeat
					gotoxy(1,18);
					writeln('Quel piece voulez-vous choisir ?     ');
					read(piecechoisie);
					gotoxy(1,19); write('                ');
					until ((piecechoisie='t') or (piecechoisie='c') or (piecechoisie='f') or (piecechoisie='Re'));
					case piecechoisie of
						't' : tab[x2tab,y2tab]:=tourb;
						'c' : tab[x2tab,y2tab]:=cavalierb;
						'f' : tab[x2tab,y2tab]:=foub;
						'Re' : tab[x2tab,y2tab]:=reineb;
					end;
				end;
				affichage();
				cste:=2;
				case a of
					1 : begin a:=2;gotoxy(1,17); write('Joueur ',a,' a vous de jouer'); end;
					2 : begin a:=1;gotoxy(1,17); write('Joueur ',a,' a vous de jouer'); end;
				end;
			end;
			
			{write(deplacementvalideB(xtab,x2tab,ytab,y2tab,p1,p2));}
			{write(xtab);}
	end;

	

	


procedure deplacement(var x,y,cste,a : integer);
	var xtab,ytab,a1,a2 : integer;
	var p1 : piece;
	
	begin
	cste:=0;
	a1:=x ; a2:=y ;
	xtab:=(((x-1)div 4)+1) ; ytab:=(((y-1)div 2)+1);
	p1:=tab[xtab,ytab];
	{assurer que le joueur a choisi une de ses pièces} 
	{si c'est le tour du joueur 1}
	
	if  ( (a=1) and ((p1= tourb)or {(p1=foub)or (p1=cavalierb)or (p1=roib)or (p1=reineb)or} (p1=pionb) )) or 
	
	{si c'est le joueur 2}
	
	 ( (a=2) and ((p1= tourn)or {(p1=foun)or (p1=cavaliern)or (p1=roin)or (p1=reinen)or} (p1=pionn) ) ) then 
	
	begin
	
	
	gotoxy(1,18); writeln('Ou voulez-vous deplacer votre piece ?')	;
	
	{curseur 2}
		repeat
			k:= getkeyevent;
			k:=translatekeyevent(k);
		
			case k of
				33619751 : y:=y+1;
				33619745 : y:=y-1;
				33619749 : x:=x+1;
				33619747 : x:=x-1;
				7181 : deplacement2(xtab, ytab,p1, cste,a,vf);
			end;
			case x of 
				0 : x:=1;
				33 : x:=32;
			end;
			case y of 
				0 : y:=1;
				17 : y:=16;
			end;
		
			gotoxy(x,y);
		until((getkeyeventchar(k)='w')or (cste=1) or (cste=2));
	end;
end;









{programme principal}
begin
	clrscr;
	initialisation();
	affichage();
	initkeyboard;
	gotoxy(1,17);
	writeln('Joueur 1, a vous de jouer');
	a:=1;
	
	begin{curseur}
			x:=1;y:=1; 
			gotoxy(x,y);
		repeat
		k:= getkeyevent;
		k:=translatekeyevent(k);
		
		case k of
				33619751 : y:=y+1;
				33619745 : y:=y-1;
				33619749 : x:=x+1;
				33619747 : x:=x-1;
				7181 : deplacement(x,y,cste,a);
		end;
		case x of 
				0 : x:=1;
				33 : x:=32;
		end;
		case y of 
				0 : y:=1;
				17 : y:=16;
		end;
		
		gotoxy(x,y);
		until((getkeyeventchar(k)='x') or (victoire=true));
		gotoxy(1,17);
	end;
	donekeyboard;     

end.
