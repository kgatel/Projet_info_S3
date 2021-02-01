program plateau ;
uses Crt,keyboard,Classes, SysUtils, Process;
type tableau = array [1..8,1..8] of string;
var a,i,j : integer;
var tab : tableau;
var k : Tkeyevent;
var x,y,cste,r1,r2,t1,t2 : integer;
var p1,p2 : string;
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

tab[1,8]:='tourb';
tab[2,8]:='cavalierb';
tab[3,8]:='foub';
tab[4,8]:='reineb';
tab[5,8]:='roib';
tab[6,8]:='foub';
tab[7,8]:='cavalierb';
tab[8,8]:='tourb';
	for iplace:=1 to 8 do 
		tab[iplace,7]:='pionb';

tab[1,1]:='tourn';
tab[2,1]:='cavaliern';
tab[3,1]:='foun';
tab[4,1]:='reinen';
tab[5,1]:='roin';
tab[6,1]:='foun';
tab[7,1]:='cavaliern';
tab[8,1]:='tourn';
	for iplace:=1 to 8 do 
		tab[iplace,2]:='pionn';

	for iplace :=1 to 8 do
		begin
				tab[iplace,3]:= 'vide';
				tab[iplace,4]:= 'vide';
				tab[iplace,5]:= 'vide';
				tab[iplace,6]:= 'vide';
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
						'tourb' : write('t');
						'foub' : write('f');
						'cavalierb' : write('c');
						'roib' : write('r');
						'pionb' : write('p');
						
				end;
				if tab[iaffichage,jaffichage]='reineb' then begin gotoxy(4*iaffichage-2,2*jaffichage); write('Re') end;
				
				gotoxy(4*iaffichage -2, 2*jaffichage);
				case  tab[iaffichage,jaffichage] of 
						'tourn' : write('t''');
						'foun' : write('f''');
					    'cavaliern' : write('c''');
						'roin' : write('r''');
						'reinen' : write('Re''');
						'pionn' : write('p''');
						
				end;
				
			end;
	end;
end;


procedure echek(a : integer; var echec : boolean);
var i,j,xroib,xroin,yroib,yroin,wow, wow2: integer;

begin
	echec:=false;
	
	for i:=1 to 8 do
	begin
		for j:=1 to 8 do
		begin
			if (tab[i,j]='roib') then begin //pour savoir les coordonnées des 2 rois
			xroib:=i;
			yroib:=j end;
			if (tab[i,j]='roin') then begin
			xroin:=i;
			yroin:=j end;
		end;
	end;
	
	if a=1 then
	begin
		//cavalier ennemi
		for i:=-2 to 2 do
		begin
			if (tab[xroib+i,yroib+abs(3-abs(i))]='cavaliern') then 
			begin 
				echec:=true;
				if ((xroib+i<1)or(xroib+i>8)or(yroib+abs(3-abs(i))<1)or(yroib+abs(3-abs(i))>8)) then
				begin echec:=false end;
			end;
			if (tab[xroib+i,yroib-abs(3-abs(i))]='cavaliern') then
			begin
				echec:=true;
				if ((xroib+i<1)or(xroib+i>8)or(yroib-abs(3-abs(i))<1)or(yroib-abs(3-abs(i))>8)) then
				begin echec:=false end;
			end;
				
		end;
		//fin cavalier ennemi
	
	
		//verticale haut
		wow:=0;
		if yroib=1 then begin wow:=-1 end; 
		repeat
		wow:=wow+1;
		wow2:=wow;
			if tab[xroib,yroib-wow]<>'vide' then
			begin
				wow:=7;
				if ((tab[xroib,yroib-wow2]='reinen') or (tab[xroib,yroib-wow2]='tourn') or (tab[xroib,yroib-wow2]='roin')) then
				echec:=true;
			end;
		until (wow=7)or(yroib-wow2=1); //verticale haut

		
		wow:=0;
		if yroib=8 then begin wow:=-1 end;
		//verticale bas
		repeat
			wow:=wow+1;
			wow2:=wow;
			if tab[xroib,yroib+wow]<>'vide' then
			begin
				wow:=7;
				if ((tab[xroib,yroib+wow2]='reinen') or (tab[xroib,yroib+wow2]='tourn') or (tab[xroib,yroib+wow2]='roin')) then
				echec:=true;
			end;
		until (wow=7)or(yroib+wow2=8); //verticale haut

		wow:=0;
		if xroib=1 then begin wow:=-1 end;
		//horizontale gauche
		repeat
			wow:=wow+1;
			wow2:=wow;
			if tab[xroib-wow,yroib]<>'vide' then
			begin
				wow:=7;
				if ((tab[xroib-wow2,yroib]='reinen') or (tab[xroib-wow2,yroib]='tourn') or (tab[xroib-wow2,yroib]='roin')) then
				echec:=true;
			end;
		until (wow=7)or(xroib-wow2=1); // fin horizontale gauche
	
		wow:=0;
		if xroib=8 then begin wow:=-1 end;
		//horizontale droite
		repeat
			wow:=wow+1;
			wow2:=wow;
			if tab[xroib+wow,yroib]<>'vide' then
			begin
				wow:=7;
				if ((tab[xroib+wow2,yroib]='reinen') or (tab[xroib+wow2,yroib]='tourn') or (tab[xroib+wow2,yroib]='roin')) then
				echec:=true;
			end;
			
		until (wow=7)or(xroib+wow2=8); //horizontale gauche
	
		

		wow:=0;
		//diagonale haute droite
		if (xroib=8) or (yroib=1) then begin wow:=-1 end;
		repeat
			wow:=wow+1;
			wow2:=wow;
			if (tab[xroib+wow,yroib-wow]<>'vide') then
			begin
				wow:=7;
				if ((tab[xroib+wow2,yroib-wow2]='reinen') or (tab[xroib+wow2,yroib-wow2]='foun') or (tab[xroib+wow2,yroib-wow2]='roin')) then
				begin echec:=true end;
			end;
		until (wow=7)or(xroib+wow2=8)or(yroib-wow2=1);
		//fin diagonale haute droite
	
		wow:=0;
		//diagonale haute gauche
		if (xroib=1) or (yroib=1) then begin wow:=-1 end;
		repeat
			wow:=wow+1;
			wow2:=wow;
			if (tab[xroib-wow,yroib-wow]<>'vide') then
			begin
				wow:=7;
				if ((tab[xroib-wow2,yroib-wow2]='reinen') or (tab[xroib-wow2,yroib-wow2]='foun') or (tab[xroib-wow2,yroib-wow2]='roin')) then
				begin echec:=true end;
			end;
		until (wow=7)or(xroib-wow2=1)or(yroib-wow2=1);	
		//fin diagonale haute gauche
	

		wow:=0;
		//diagonale basse gauche
		if (xroib=1) or (yroib=8) then begin wow:=-1 end;
		repeat
			wow:=wow+1;
			wow2:=wow;
			if (tab[xroib-wow,yroib+wow]<>'vide') then
			begin
				wow:=7;
				if ((tab[xroib-wow2,yroib+wow2]='reinen') or (tab[xroib-wow2,yroib+wow2]='foun') or (tab[xroib-wow2,yroib+wow2]='roin')) then
				begin echec:=true end;
			end;
		until (wow=7)or(xroib-wow2=1)or(yroib+wow2=8);
		//fin diagonale basse gauche
	
				wow:=0;
		//diagonale basse droite
		if (xroib=8) or (yroib=8) then begin wow:=-1 end;
		repeat
			wow:=wow+1;
			wow2:=wow;
			if (tab[xroib+wow,yroib+wow]<>'vide') then
			begin
				wow:=7;
				if ((tab[xroib+wow2,yroib+wow2]='reinen') or (tab[xroib+wow2,yroib+wow2]='foun') or (tab[xroib+wow2,yroib+wow2]='roin')) then
				begin echec:=true end;
			end;
		until (wow=7)or(xroib+wow2=8)or(yroib+wow2=8);
		//fin diagonale basse droite
		
		//pion ennemi
		if ((tab[xroib-1,yroib+1]='pionn')and(xroib-1>=1)and(yroib+1<=8)) or ((tab[xroib+1,yroib+1]='pionn')and(xroib+1<=8)and(yroib+1<=8)) then
		begin echec:=true end;
		
	end; //fin a=1

	
	if a=2 then
	begin
	
		//cavalier ennemi
		for i:=-2 to 2 do
		begin
			if (tab[xroin+i,yroin+abs(3-abs(i))]='cavalierb') then 
			begin 
				echec:=true;
				if ((xroin+i<1)or(xroin+i>8)or(yroin+abs(3-abs(i))<1)or(yroin+abs(3-abs(i))>8)) then
				begin echec:=false end;
			end;
			if (tab[xroin+i,yroin-abs(3-abs(i))]='cavalierb') then
			begin
				echec:=true;
				if ((xroin+i<1)or(xroin+i>8)or(yroin-abs(3-abs(i))<1)or(yroin-abs(3-abs(i))>8)) then
				begin echec:=false end;
			end;
				
		end;
		//fin cavalier ennemi
	
	
		//verticale haut
		wow:=0;
		if yroin=1 then begin wow:=-1 end; 
		repeat
		wow:=wow+1;
		wow2:=wow;
			if tab[xroin,yroin-wow]<>'vide' then
			begin
				wow:=7;
				if ((tab[xroin,yroin-wow2]='reineb') or (tab[xroin,yroin-wow2]='tourb') or (tab[xroin,yroin-wow2]='roib')) then
				echec:=true;
			end;
		until (wow=7)or(yroin-wow2=1); //verticale haut

		
		wow:=0;
		if yroin=8 then begin wow:=-1 end;
		//verticale bas
		repeat
			wow:=wow+1;
			wow2:=wow;
			if tab[xroin,yroin+wow]<>'vide' then
			begin
				wow:=7;
				if ((tab[xroin,yroin+wow2]='reineb') or (tab[xroin,yroin+wow2]='tourb') or (tab[xroin,yroin+wow2]='roib')) then
				echec:=true;
			end;
		until (wow=7)or(yroin+wow2=8); //verticale haut

		wow:=0;
		if xroin=1 then begin wow:=-1 end;
		//horizontale gauche
		repeat
			wow:=wow+1;
			wow2:=wow;
			if tab[xroin-wow,yroin]<>'vide' then
			begin
				wow:=7;
				if ((tab[xroin-wow2,yroin]='reineb') or (tab[xroin-wow2,yroin]='tourb') or (tab[xroin-wow2,yroin]='roib')) then
				echec:=true;
			end;
		until (wow=7)or(xroin-wow2=1); // fin horizontale gauche
	
		wow:=0;
		if xroin=8 then begin wow:=-1 end;
		//horizontale droite
		repeat
			wow:=wow+1;
			wow2:=wow;
			if tab[xroin+wow,yroin]<>'vide' then
			begin
				wow:=7;
				if ((tab[xroin+wow2,yroin]='reineb') or (tab[xroin+wow2,yroin]='tourb') or (tab[xroin+wow2,yroin]='roib')) then
				echec:=true;
			end;
			
		until (wow=7)or(xroin+wow2=8); //horizontale gauche
	
		

		wow:=0;
		//diagonale haute droite
		if (xroin=8) or (yroin=1) then begin wow:=-1 end;
		repeat
			wow:=wow+1;
			wow2:=wow;
			if (tab[xroin+wow,yroin-wow]<>'vide') then
			begin
				wow:=7;
				if ((tab[xroin+wow2,yroin-wow2]='reineb') or (tab[xroin+wow2,yroin-wow2]='foub') or (tab[xroin+wow2,yroin-wow2]='roib')) then
				begin echec:=true end;
			end;
		until (wow=7)or(xroin+wow2=8)or(yroin-wow2=1);
		//fin diagonale haute droite
	
		wow:=0;
		//diagonale haute gauche
		if (xroin=1) or (yroin=1) then begin wow:=-1 end;
		repeat
			wow:=wow+1;
			wow2:=wow;
			if (tab[xroin-wow,yroin-wow]<>'vide') then
			begin
				wow:=7;
				if ((tab[xroin-wow2,yroin-wow2]='reineb') or (tab[xroin-wow2,yroin-wow2]='foub') or (tab[xroin-wow2,yroin-wow2]='roib')) then
				begin echec:=true end;
			end;
		until (wow=7)or(xroin-wow2=1)or(yroin-wow2=1);	
		//fin diagonale haute gauche
	

		wow:=0;
		//diagonale basse gauche
		if (xroin=1) or (yroin=8) then begin wow:=-1 end;
		repeat
			wow:=wow+1;
			wow2:=wow;
			if (tab[xroin-wow,yroin+wow]<>'vide') then
			begin
				wow:=7;
				if ((tab[xroin-wow2,yroin+wow2]='reineb') or (tab[xroin-wow2,yroin+wow2]='foub') or (tab[xroin-wow2,yroin+wow2]='roib')) then
				begin echec:=true end;
			end;
		until (wow=7)or(xroin-wow2=1)or(yroin+wow2=8);
		//fin diagonale basse gauche
	
				wow:=0;
		//diagonale basse droite
		if (xroin=8) or (yroin=8) then begin wow:=-1 end;
		repeat
			wow:=wow+1;
			wow2:=wow;
			if (tab[xroin+wow,yroin+wow]<>'vide') then
			begin
				wow:=7;
				if ((tab[xroin+wow2,yroin+wow2]='reineb') or (tab[xroin+wow2,yroin+wow2]='foub') or (tab[xroin+wow2,yroin+wow2]='roib')) then
				begin echec:=true end;
			end;
		until (wow=7)or(xroin+wow2=8)or(yroin+wow2=8);
		//fin diagonale basse droite
		
		//pion ennemi
		if ((tab[xroin-1,yroin+1]='pionb')and(xroin-1>=1)and(yroin+1<=8)) or ((tab[xroin+1,yroin+1]='pionb')and(xroin+1<=8)and(yroin+1<=8)) then
		begin echec:=true end;
		
	
	end; //fin a=2

end; //procedure echek
		
procedure deplacementvalide(xtab,x2tab,ytab,y2tab,a : integer ; p1,p2 : string; var vf : boolean; r1,r2,t1,t2 : Integer);
var i,casepleine,casepleine2,c1,c2,constante,constante2 : integer;

begin
vf:=false;
casepleine:=0;
constante:=0;
casepleine2:=0;
constante2:=0;
{joueur 1}
	if a=1 then
	
	BEGIN
	
	
{pion blanc} 
if p1='pionb' then
	begin
		{cas ou le pion n'a pas encore bougé}if ( (ytab=7) and (xtab=x2tab) and (   ((y2tab=5)and ((tab[xtab,5]='vide') and (tab[xtab,6]='vide') )) or ((y2tab=6) and (tab[xtab,6]='vide'))) ) then
		begin 
			vf:=true;
		end;
		
		if ( (ytab<>7) and (ytab-1=y2tab) and (xtab=x2tab) and (tab[xtab,y2tab]='vide') )then
		begin
			vf:=true;
		end;
		
		if ( ((xtab+1=x2tab) or (xtab-1=x2tab)) and (ytab-1=y2tab) and ((p2= 'pionn') or (p2='tourn') or (p2= 'foun') or (p2='cavaliern') or (p2= 'roin') or (p2='reinen')) ) then
		begin
			vf:=true;
		end;
	end;
	
{tour blanche}
if p1='tourb' then
	begin
		{deplacement vertical}
		if xtab=x2tab then
		begin
		
		if ytab<y2tab then
			begin
				for i:=y2tab downto ytab+1 do
				begin
					if (tab[xtab,i] <> 'vide') then
					begin
						casepleine:=1;
						if (   (constante=0) and (i=y2tab) and ((tab[xtab,y2tab]='tourn') or  (tab[xtab,y2tab]='cavaliern') or (tab[xtab,y2tab]='foun') or (tab[xtab,y2tab]='reinen') or (tab[xtab,y2tab]='pionn') ) ) then
						begin casepleine:=0; constante:=1 end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
				
				
		if ytab>y2tab then
			begin
				for i:=y2tab to ytab-1 do
				begin
					if (tab[xtab,i] <> 'vide') then
					begin
						casepleine:=1;
						if (   (constante=0) and (i=y2tab) and ((tab[xtab,y2tab]='tourn') or  (tab[xtab,y2tab]='cavaliern') or (tab[xtab,y2tab]='foun') or (tab[xtab,y2tab]='reinen') or (tab[xtab,y2tab]='pionn') ) ) then
						begin casepleine:=0; constante:=1; end;
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
			for i:=x2tab downto xtab+1 do
				begin
				if tab[i,ytab] <> 'vide' then
					begin
						casepleine:=3;
						if (   (constante=0) and(i=x2tab) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
						begin casepleine:=0; constante:=1; end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
				
				
		if xtab>x2tab then
			begin
			for i:=x2tab to xtab-1 do
				begin
				if tab[i,ytab] <> 'vide' then
					begin
						casepleine:=4;
						if (   (constante=0) and(i=x2tab) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
						begin casepleine:=0; constante:=1; end;
					end;
				end;
			
				if casepleine=0 then
				begin
					vf:=true;
					t1:=1;
				end;
			end;
		end;
		
	end;
{fin tour blanche}
	
	{fou blanc}
if p1='foub' then
	begin
	c1:=abs(xtab-x2tab);
	c2:=abs(ytab-y2tab);
	
	if c1<>c2 then begin casepleine:=1 end;
		
	if (c1=c2) then
	begin

	{diagonale haute droite}
	if ( (xtab<x2tab)and(ytab>y2tab) ) then
		begin
			for i:=ytab-y2tab downto 1 do
			begin
				if tab[xtab+i,ytab-i]<>'vide' then
				begin
					casepleine:=1;
					if (  (constante=0) and ((xtab+i=x2tab)and(ytab-i=y2tab)) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
					begin casepleine:=0; constante:=1 end;
				end;
				
			end;
			
		end;{fin deplacement haut droit}
		
	{diagonale haute gauche}
	if ( (xtab>x2tab)and(ytab>y2tab) ) then
		begin
			for i:=ytab-y2tab downto 1 do
			begin
				if tab[xtab-i,ytab-i]<>'vide' then
				begin
					casepleine:=1;
					if (  (constante=0) and ((xtab-i=x2tab)and(ytab-i=y2tab)) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
					begin casepleine:=0; constante:=1 end;
				end;
				
			end;
		end;{fin deplacement haut gauche}
	
	{diagonale basse droite}
	if ( (xtab<x2tab)and(ytab<y2tab) ) then
		begin
			for i:=abs(ytab-y2tab) downto 1 do
			begin
				if tab[xtab+i,ytab+i]<>'vide' then
				begin
					casepleine:=1;
					if (  (constante=0) and ((xtab+i=x2tab)and(ytab+i=y2tab)) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
					begin casepleine:=0; constante:=1 end;
				end;
				
			end;
		end;{fin deplacement bas droit}
		
	{diagonale bas gauche}
	if ( (xtab>x2tab)and(ytab<y2tab) ) then
		begin
			for i:=abs(ytab-y2tab) downto 1 do
			begin
				if tab[xtab-i,ytab+i]<>'vide' then
				begin
					casepleine:=1;
					if (  (constante=0) and ((xtab-i=x2tab)and(ytab+i=y2tab)) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
					begin casepleine:=0; constante:=1 end;
				end;
				
			end;
		end;{fin deplacement bas droit}
	
	
	if c1=0 then begin casepleine:=5 end;		
	if casepleine=0 then vf:=true;
	end;

	end;{fin fou}

{cavalier blanc}
if p1='cavalierb' then
	begin
		if ( (abs(x2tab-xtab)+abs(y2tab-ytab)=3)and(x2tab-xtab<>0)and(y2tab-ytab<>0) ) then
			begin vf:=true end;
			
		if ( (tab[x2tab,y2tab]='pionb') or (tab[x2tab,y2tab]='tourb') or (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='roib') ) then
			begin vf:=false end;
			
	end;
{fin cavalier}
	
if p1='roib' then
	begin
		if ( (abs(x2tab-xtab)<=1) and (abs(y2tab-ytab)<=1) and not( ((xtab-x2tab)=0)and((ytab-y2tab)=0) ) and not( (tab[x2tab,y2tab]='pionb') or (tab[x2tab,y2tab]='tourb') or (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') )   ) then
		vf:=true;
		r1:=1;
	end;

{reine blanche}	
if p1='reineb' then
	begin
	if xtab=x2tab then
		begin
		
		if ytab<y2tab then
			begin
				for i:=y2tab downto ytab+1 do
				begin
					if (tab[xtab,i] <> 'vide') then
					begin
						casepleine:=1;
						if (   (constante=0) and (i=y2tab) and ((tab[xtab,y2tab]='tourn') or  (tab[xtab,y2tab]='cavaliern') or (tab[xtab,y2tab]='foun') or (tab[xtab,y2tab]='reinen') or (tab[xtab,y2tab]='pionn') ) ) then
						begin casepleine:=0; constante:=1 end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
				
				
		if ytab>y2tab then
			begin
				for i:=y2tab to ytab-1 do
				begin
					if (tab[xtab,i] <> 'vide') then
					begin
						casepleine:=1;
						if (   (constante=0) and (i=y2tab) and ((tab[xtab,y2tab]='tourn') or  (tab[xtab,y2tab]='cavaliern') or (tab[xtab,y2tab]='foun') or (tab[xtab,y2tab]='reinen') or (tab[xtab,y2tab]='pionn') ) ) then
						begin casepleine:=0; constante:=1; end;
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
			for i:=x2tab downto xtab+1 do
				begin
				if tab[i,ytab] <> 'vide' then
					begin
						casepleine:=3;
						if (   (constante=0) and(i=x2tab) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
						begin casepleine:=0; constante:=1; end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
				
				
		if xtab>x2tab then
			begin
			for i:=x2tab to xtab-1 do
				begin
				if tab[i,ytab] <> 'vide' then
					begin
						casepleine:=4;
						if (   (constante=0) and(i=x2tab) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
						begin casepleine:=0; constante:=1; end;
					end;
				end;
				if casepleine=0 then
				begin
					vf:=true
				end;
			end;
		end;
		
	c1:=abs(xtab-x2tab);
	c2:=abs(ytab-y2tab);
	
	if c1<>c2 then begin casepleine:=1 end;
	if c1=0 then begin casepleine:=5 end;
	
	if c1=c2 then
	begin

	{diagonale haute droite}
	if ( (xtab<x2tab)and(ytab>y2tab) ) then
		begin
			for i:=ytab-y2tab downto 1 do
			begin
				if tab[xtab+i,ytab-i]<>'vide' then
				begin
					casepleine2:=1;
					if (  (constante2=0) and ((xtab+i=x2tab)and(ytab-i=y2tab)) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
					begin casepleine2:=0; constante2:=1 end;
				end;
				
			end;
			
		end;{fin deplacement haut droit}
		
	{diagonale haute gauche}
	if ( (xtab>x2tab)and(ytab>y2tab) ) then
		begin
			for i:=ytab-y2tab downto 1 do
			begin
				if tab[xtab-i,ytab-i]<>'vide' then
				begin
					casepleine2:=1;
					if (  (constante2=0) and ((xtab-i=x2tab)and(ytab-i=y2tab)) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
					begin casepleine2:=0; constante2:=1 end;
				end;
				
			end;
		end;{fin deplacement haut gauche}
	
	{diagonale basse droite}
	if ( (xtab<x2tab)and(ytab<y2tab) ) then
		begin
			for i:=abs(ytab-y2tab) downto 1 do
			begin
				if tab[xtab+i,ytab+i]<>'vide' then
				begin
					casepleine2:=1;
					if (  (constante2=0) and ((xtab+i=x2tab)and(ytab+i=y2tab)) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
					begin casepleine2:=0; constante2:=1 end;
				end;
				
			end;
		end;{fin deplacement bas droit}
		
	{diagonale bas gauche}
	if ( (xtab>x2tab)and(ytab<y2tab) ) then
		begin
			for i:=abs(ytab-y2tab) downto 1 do
			begin
				if tab[xtab-i,ytab+i]<>'vide' then
				begin
					casepleine2:=1;
					if (  (constante=0) and ((xtab-i=x2tab)and(ytab+i=y2tab)) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
					begin casepleine2:=0; constante2:=1 end;
				end;
				
			end;
		end;{fin deplacement bas droit}
	
			
			
		
		
		
	if casepleine2=0 then vf:=true;
	end;{fin REINE fou}
	if ((xtab=x2tab)and(ytab=y2tab)) then vf:=false
	
	end;	

END;
{fin joueur 1}



{joueur 2}
	if a=2 then
	
	BEGIN
	
{pion noir}
if p1='pionn' then
	begin
		if ( (ytab=2) and (xtab=x2tab) and (   ((y2tab=4)and ((tab[xtab,4]='vide') and (tab[xtab,3]='vide') )) or ((y2tab=3) and (tab[xtab,3]='vide'))) ) then
		begin 
			vf:=true;
		end;
		
		if ( (ytab<>2) and (ytab+1=y2tab) and (xtab=x2tab) and (tab[x2tab,y2tab]='vide') )then
		begin
			vf:=true;
		end;
		
		if ( ((xtab+1=x2tab) or (xtab-1=x2tab)) and (ytab+1=y2tab) and ((p2= 'pionb') or (p2='tourb') or (p2= 'foub') or (p2='cavalierb') or (p2= 'roib') or (p2='reineb')) ) then
		begin
			vf:=true;
		end;
	end;
{fin pion noir}

{tour noire}
if p1='tourn' then
	begin
		{deplacement vertical}
		if xtab=x2tab then
		begin
		
		if ytab<y2tab then
			begin
				for i:=y2tab downto ytab+1 do
				begin
					if (tab[xtab,i] <> 'vide') then
					begin
						casepleine:=1;
						if (  (constante=0) and (i=y2tab) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
						begin casepleine:=0; constante:=1; end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
		
		
				
		if ytab>y2tab then
			begin
				for i:=y2tab to ytab-1 do
				begin
					if (tab[xtab,i] <> 'vide') then
					begin
						casepleine:=1;
						if (  (constante=0) and (i=y2tab) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
						begin casepleine:=0; constante:=1 end;
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
			for i:=x2tab downto xtab+1 do
				begin
				if tab[i,ytab] <> 'vide' then
					begin
						casepleine:=3;
						if (  (constante=0) and (i=x2tab) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
						begin casepleine:=0; constante:=1 end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
				
				
		if xtab>x2tab then
			begin
			for i:=x2tab to xtab-1 do
				begin
				if tab[i,ytab] <> 'vide' then
					begin
						casepleine:=3;
						if (  (constante=0) and (i=x2tab) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
						begin casepleine:=0; constante:=1 end;
					end;
				end;
			
				if casepleine=0 then
				begin
					vf:=true;
					t2:=1;
				end;
			end;
		end;
		
	end;

{fou noir}
if p1='foun' then
	begin
	c1:=abs(xtab-x2tab);
	c2:=abs(ytab-y2tab);
	
	if c1<>c2 then begin casepleine:=1 end;
	if c1=0 then begin casepleine:=5 end;
	
	if c1=c2 then
	begin 

	{diagonale haute droite}
	if ( (xtab<x2tab)and(ytab>y2tab) ) then
		begin
			for i:=ytab-y2tab downto 1 do
			begin
				if tab[xtab+i,ytab-i]<>'vide' then
				begin
					casepleine:=1;
					if (  (constante=0) and ((xtab+i=x2tab)and(ytab-i=y2tab)) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
					begin casepleine:=0; constante:=1 end;
				end;
				
			end;
			
		end;{fin deplacement haut droit}
		
	{diagonale haute gauche}
	if ( (xtab>x2tab)and(ytab>y2tab) ) then
		begin
			for i:=ytab-y2tab downto 1 do
			begin
				if tab[xtab-i,ytab-i]<>'vide' then
				begin
					casepleine:=1;
					if (  (constante=0) and ((xtab-i=x2tab)and(ytab-i=y2tab)) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
					begin casepleine:=0; constante:=1 end;
				end;
				
			end;
		end;{fin deplacement haut gauche}
	
	{diagonale basse droite}
	if ( (xtab<x2tab)and(ytab<y2tab) ) then
		begin
			for i:=abs(ytab-y2tab) downto 1 do
			begin
				if tab[xtab+i,ytab+i]<>'vide' then
				begin
					casepleine:=1;
					if (  (constante=0) and ((xtab+i=x2tab)and(ytab+i=y2tab)) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
					begin casepleine:=0; constante:=1 end;
				end;
				
			end;
		end;{fin deplacement bas droit}
		
	{diagonale bas gauche}
	if ( (xtab>x2tab)and(ytab<y2tab) ) then
		begin
			for i:=abs(ytab-y2tab) downto 1 do
			begin
				if tab[xtab-i,ytab+i]<>'vide' then
				begin
					casepleine:=1;
					if (  (constante=0) and ((xtab-i=x2tab)and(ytab+i=y2tab)) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
					begin casepleine:=0; constante:=1 end;
				end;
				
			end;
		end;{fin deplacement bas droit}
	
			
			
		
		
	if casepleine=0 then vf:=true;
	end;
	end;{fin fou}

{cavalier noir}
if p1='cavaliern' then
	begin
		if ( (abs(x2tab-xtab)+abs(y2tab-ytab)=3)and(x2tab-xtab<>0)and(y2tab-ytab<>0) ) then
			begin vf:=true end;
			
		if ( (tab[x2tab,y2tab]='pionn') or (tab[x2tab,y2tab]='tourn') or (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='roin') ) then
			begin vf:=false end;
			
	end;
{fin cavalier}

if p1='roin' then
	begin
		if ( (abs(x2tab-xtab)<=1) and (abs(y2tab-ytab)<=1) and not( ((xtab-x2tab)=0)and((ytab-y2tab)=0) ) and not( (tab[x2tab,y2tab]='pionn') or (tab[x2tab,y2tab]='tourn') or (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') )  ) then
		vf:=true;
		//{roque à gauche}if ((r2=0)and(t2=0) and (
		r2:=1;
	end;
	
{reine noire}	
if p1='reinen' then
	begin
	if xtab=x2tab then
		begin
		
		if ytab<y2tab then
			begin
				for i:=y2tab downto ytab+1 do
				begin
					if (tab[xtab,i] <> 'vide') then
					begin
						casepleine:=1;
						if (   (constante=0) and (i=y2tab) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
						begin casepleine:=0; constante:=1 end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
				
				
		if ytab>y2tab then
			begin
				for i:=y2tab to ytab-1 do
				begin
					if (tab[xtab,i] <> 'vide') then
					begin
						casepleine:=1;
						if (   (constante=0) and (i=y2tab) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
						begin casepleine:=0; constante:=1; end;
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
			for i:=x2tab downto xtab+1 do
				begin
				if tab[i,ytab] <> 'vide' then
					begin
						casepleine:=3;
						if (   (constante=0) and(i=x2tab) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
						begin casepleine:=0; constante:=1; end;
					end;

				end;
			
			if casepleine=0 then
				begin
					vf:=true
				end;
			end;
				
				
		if xtab>x2tab then
			begin
			for i:=x2tab to xtab-1 do
				begin
				if tab[i,ytab] <> 'vide' then
					begin
						casepleine:=4;
						if (   (constante=0) and(i=x2tab) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
						begin casepleine:=0; constante:=1; end;
					end;
				end;
				if casepleine=0 then
				begin
					vf:=true
				end;
			end;
		end;
		
	c1:=abs(xtab-x2tab);
	c2:=abs(ytab-y2tab);
	
	if c1<>c2 then begin casepleine:=1 end;
	if c1=0 then begin casepleine:=5 end;
	
	if c1=c2 then
	begin

	{diagonale haute droite}
	if ( (xtab<x2tab)and(ytab>y2tab) ) then
		begin
			for i:=ytab-y2tab downto 1 do
			begin
				if tab[xtab+i,ytab-i]<>'vide' then
				begin
					casepleine2:=1;
					if (  (constante2=0) and ((xtab+i=x2tab)and(ytab-i=y2tab)) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
					begin casepleine2:=0; constante2:=1 end;
				end;
				
			end;
			
		end;{fin deplacement haut droit}
		
	{diagonale haute gauche}
	if ( (xtab>x2tab)and(ytab>y2tab) ) then
		begin
			for i:=ytab-y2tab downto 1 do
			begin
				if tab[xtab-i,ytab-i]<>'vide' then
				begin
					casepleine2:=1;
					if (  (constante2=0) and ((xtab-i=x2tab)and(ytab-i=y2tab)) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
					begin casepleine2:=0; constante2:=1 end;
				end;
				
			end;
		end;{fin deplacement haut gauche}
	
	{diagonale basse droite}
	if ( (xtab<x2tab)and(ytab<y2tab) ) then
		begin
			for i:=abs(ytab-y2tab) downto 1 do
			begin
				if tab[xtab+i,ytab+i]<>'vide' then
				begin
					casepleine2:=1;
					if (  (constante2=0) and ((xtab+i=x2tab)and(ytab+i=y2tab)) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
					begin casepleine2:=0; constante2:=1 end;
				end;
				
			end;
		end;{fin deplacement bas droit}
		
	{diagonale bas gauche}
	if ( (xtab>x2tab)and(ytab<y2tab) ) then
		begin
			for i:=abs(ytab-y2tab) downto 1 do
			begin
				if tab[xtab-i,ytab+i]<>'vide' then
				begin
					casepleine2:=1;
					if (  (constante=0) and ((xtab-i=x2tab)and(ytab+i=y2tab)) and ((tab[xtab,y2tab]='tourb') or  (tab[xtab,y2tab]='cavalierb') or (tab[xtab,y2tab]='foub') or (tab[xtab,y2tab]='reineb') or (tab[xtab,y2tab]='pionb') ) ) then
					begin casepleine2:=0; constante2:=1 end;
				end;
				
			end;
		end;{fin deplacement bas droit}
	
			
			
		
		
		
	if casepleine2=0 then vf:=true;
	end;{fin REINE fou}
	if ((xtab=x2tab)and(ytab=y2tab)) then vf:=false
	
	end;

	END;
{fin joueur 2}


end;{fin procedure}


procedure deplacement2(var xtab,ytab : integer; p1 : string; var cste,a : integer; var vf,echec : boolean);

	var a3, a4, x2tab, y2tab,r1,r2,t1,t2 : integer;
		p2 : string;
		piecechoisie : string;
		
	begin
	a3:=x;	a4:=y;
	x2tab:=((x -1) div 4)+1;
	y2tab:=((y -1) div 2)+1;
	p2:=tab[x2tab,y2tab];

		deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,r1,r2,t1,t2);
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
				tab[xtab,ytab]:='vide';
				if ((p1='pionn') and (y2tab=8)) then 
				begin
					repeat
					gotoxy(1,19);
					writeln('Quel piece voulez-vous choisir ?     ');
					readln(piecechoisie);
					until ((piecechoisie='t''') or (piecechoisie='c''') or (piecechoisie='f''') or (piecechoisie='Re'''));
					case piecechoisie of
						't''' : tab[x2tab,y2tab]:='tourn';
						'c''' : tab[x2tab,y2tab]:='cavaliern';
						'f''' : tab[x2tab,y2tab]:='foun';
						'Re''' : tab[x2tab,y2tab]:='reinen';
					end;
				end;
				if ((p1='pionb') and (y2tab=1)) then 
				begin
					repeat
					gotoxy(1,18);
					writeln('Quel piece voulez-vous choisir ?     ');
					read(piecechoisie);
					until ((piecechoisie='t') or (piecechoisie='c') or (piecechoisie='f') or (piecechoisie='Re'));
					case piecechoisie of
						't' : tab[x2tab,y2tab]:='tourb';
						'c' : tab[x2tab,y2tab]:='cavalierb';
						'f' : tab[x2tab,y2tab]:='foub';
						'Re' : tab[x2tab,y2tab]:='reineb';
					end;			
				end;
				
				echek(a,echec);
					
				if echec=false then
				begin	
					affichage();
					cste:=2;
					case a of
						1 : begin a:=2;gotoxy(1,17); write('Joueur ',a,' a vous de jouer'); end;
						2 : begin a:=1;gotoxy(1,17); write('Joueur ',a,' a vous de jouer'); end;
					end;
				end; //end echec=false
				
				if echec=true then
				begin
						gotoxy(1,20);
						write('Deplacement non valide, vous devez proteger votre roi');
						delay(3000);
						gotoxy(1,20);
						write('                                                     ');
						gotoxy(1,18);
						write('                                                     ');
						tab[xtab,ytab]:=p1;
						tab[x2tab,y2tab]:=p2;
						cste:=2;
				end; //end echec=true
								
			end; //end vf=true
			
	end; //fin procedure deplacement2

{procedure echekmat(a : integer; var victoire : boolean);
var xtab,ytab,x2tab,y2tab,r1,r2,t1,t2 : integer;
	p1,p2 : string;
	vf : boolean;
begin
	if a=1 then
	begin
		for xtab:=1 to 8 do
			for ytab:=1 to 8 do
			begin
				if tab[xtab,ytab]='pion' then
					begin
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,r1,r2,t1,t2);
							if deplacementvalide
			
				
			

	
end;
}


procedure deplacement(var x,y,cste,a : integer; var victoire : boolean);
	var xtab,ytab,a1,a2 : integer;
	var p1 : string;
	var echec : boolean;
	
	begin
	cste:=0;
	a1:=x ; a2:=y ;
	xtab:=(((x-1)div 4)+1) ; ytab:=(((y-1)div 2)+1);
	p1:=tab[xtab,ytab];
	{assurer que le joueur a choisi une de ses pièces} 
	{si c'est le tour du joueur 1}
	
	if  ( (a=1) and ((p1= 'tourb')or (p1='foub')or (p1='cavalierb')or (p1='roib')or (p1='reineb')or (p1='pionb') )) or 
	
	{si c'est le joueur 2}

	 ( (a=2) and ((p1= 'tourn')or (p1='foun')or (p1='cavaliern')or (p1='roin') or (p1='reinen') or (p1='pionn') ) ) then 
	
	begin
	
	
	gotoxy(1,18); writeln('Ou voulez-vous deplacer votre piece ?')	;
	gotoxy(x,y);
	{curseur 2}
		repeat
			k:= getkeyevent;
			k:=translatekeyevent(k);
		
			case k of
				33619751 : y:=y+2;
				33619745 : y:=y-2;
				33619749 : x:=x+4;
				33619747 : x:=x-4;
				7181 : deplacement2(xtab, ytab,p1, cste,a,vf,echec);
			end;
			case x of 
				-2 : x:=2;
				34 : x:=30;
			end;
			case y of 
				0 : y:=2;
				18 : y:=16;
			end;
		
		{echekmat(a,victoire);}
		if victoire=false then
		begin
			echek(a,echec);
			if echec=true then
			begin
			gotoxy(1,19);
			writeln('Vous etes en echec !');
			end;
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
	a:=1;  						// si a=1, au tour du joueur 1, sinon a=2
	r1:=0; 						//variable=0 si le roi blanc n'a pas encore bougé, sinon 1
	r2:=0; 						//variable=0 si le roi noir n'a pas encore bougé, sinon 1
	t1:=0; 						//variable=0 si la tour blanche n'a pas encore bougé, sinon 1
	t2:=0; 						//variable=0 si la tour noire n'a pas encore bougé, sinon 1
	victoire:=false;
	begin{curseur}
			x:=2;y:=2; 
			gotoxy(x,y);
		repeat
		k:= getkeyevent;
		k:=translatekeyevent(k);
		
		case k of
				33619751 : y:=y+2;
				33619745 : y:=y-2;
				33619749 : x:=x+4;
				33619747 : x:=x-4;
				7181 : deplacement(x,y,cste,a,victoire);
		end;
		case x of 
				-2 : x:=2;
				34 : x:=30;
		end;
		case y of 
				0 : y:=2;
				18 : y:=16;
		end;
		
		gotoxy(x,y);
		until((getkeyeventchar(k)='x') or (victoire=true));
		gotoxy(1,17);
	end;
	donekeyboard;     

end.
