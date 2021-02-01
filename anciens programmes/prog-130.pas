program plateau ;
uses Crt,keyboard,Classes, SysUtils, Process, dos;
type tableau = array [1..8,1..8] of string;
var a,i,j : integer;
	tab : tableau;
	k : Tkeyevent;
	x,y,cste,r1,r2,t1,t11,t22,t2,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab : integer;
	newload,p3,p4 : string;
	echecmat, vf : boolean;
	sauvegarde : text;
	//var timer
	h,he,m,min,s,sec,cent,centieme : word;
	t,tt,tempsdebase : real;

const adresse ='C:\Users\kevga\Desktop\test\sauve.txt';

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

procedure save(a : integer);
begin
assign(sauvegarde , adresse);
	rewrite(sauvegarde);
	
	for i:=1 to 8 do begin
		for j:=1 to 8 do begin
			writeln(sauvegarde, tab[i,j]);			
		end;
	end;
	write(sauvegarde, a);
	

	
close(sauvegarde);
end;

procedure load(var a:integer);
var chaine : string;
	numero_joueur : integer;
begin
	assign(sauvegarde , adresse);
	clrscr;
	reset(sauvegarde);
	for i:=1 to 8 do begin
		for j:=1 to 8 do begin
		readln(sauvegarde, chaine);
		tab[i,j]:=chaine;
		end;
	end;
	readln(sauvegarde, numero_joueur);
	a:=numero_joueur;
	close(sauvegarde);
	
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
		if i<>0 then
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
				if ((tab[xroib,yroib-wow2]='reinen') or (tab[xroib,yroib-wow2]='tourn') or ((tab[xroib,yroib-wow2]='roin')and(wow2=1))) then
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
				if ((tab[xroib,yroib+wow2]='reinen') or (tab[xroib,yroib+wow2]='tourn') or ((tab[xroib,yroib+wow2]='roin')and(wow2=1))) then
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
				if ((tab[xroib-wow2,yroib]='reinen') or (tab[xroib-wow2,yroib]='tourn') or ((tab[xroib-wow2,yroib]='roin')and(wow2=1))) then
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
				if ((tab[xroib+wow2,yroib]='reinen') or (tab[xroib+wow2,yroib]='tourn') or ((tab[xroib+wow2,yroib]='roin')and(wow2=1))) then
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
				if ((tab[xroib+wow2,yroib-wow2]='reinen') or (tab[xroib+wow2,yroib-wow2]='foun') or ((tab[xroib+wow2,yroib-wow2]='roin')and(wow2=1))) then
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
				if ((tab[xroib-wow2,yroib-wow2]='reinen') or (tab[xroib-wow2,yroib-wow2]='foun') or ((tab[xroib-wow2,yroib-wow2]='roin')and(wow2=1))) then
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
				if ((tab[xroib-wow2,yroib+wow2]='reinen') or (tab[xroib-wow2,yroib+wow2]='foun') or ((tab[xroib-wow2,yroib+wow2]='roin')and(wow2=1))) then
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
				if ((tab[xroib+wow2,yroib+wow2]='reinen') or (tab[xroib+wow2,yroib+wow2]='foun') or ((tab[xroib+wow2,yroib+wow2]='roin')and(wow2=1))) then
				begin echec:=true end;
			end;
		until (wow=7)or(xroib+wow2=8)or(yroib+wow2=8);
		//fin diagonale basse droite
		
		//pion ennemi
		if ((tab[xroib-1,yroib-1]='pionn')and(xroib-1>=1)and(yroib-1>=1)) or ((tab[xroib+1,yroib-1]='pionn')and(xroib+1<=8)and(yroib-1>=1)) then
		begin echec:=true end;
		
	end; //fin a=1

	
	if a=2 then
	begin
	
		//cavalier ennemi
		for i:=-2 to 2 do
		begin
		if i<>0 then
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
				if ((tab[xroin,yroin-wow2]='reineb') or (tab[xroin,yroin-wow2]='tourb') or ((tab[xroin,yroin-wow2]='roib')and(wow2=1))) then
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
				if ((tab[xroin,yroin+wow2]='reineb') or (tab[xroin,yroin+wow2]='tourb') or ((tab[xroin,yroin+wow2]='roib')and(wow2=1))) then
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
				if ((tab[xroin-wow2,yroin]='reineb') or (tab[xroin-wow2,yroin]='tourb') or ((tab[xroin-wow2,yroin]='roib')and(wow2=1))) then
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
				if ((tab[xroin+wow2,yroin]='reineb') or (tab[xroin+wow2,yroin]='tourb') or ((tab[xroin+wow2,yroin]='roib')and(wow2=1))) then
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
				if ((tab[xroin+wow2,yroin-wow2]='reineb') or (tab[xroin+wow2,yroin-wow2]='foub') or ((tab[xroin+wow2,yroin-wow2]='roib')and(wow2=1))) then
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
				if ((tab[xroin-wow2,yroin-wow2]='reineb') or (tab[xroin-wow2,yroin-wow2]='foub') or ((tab[xroin-wow2,yroin-wow2]='roib')and(wow2=1))) then
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
				if ((tab[xroin-wow2,yroin+wow2]='reineb') or (tab[xroin-wow2,yroin+wow2]='foub') or ((tab[xroin-wow2,yroin+wow2]='roib')and(wow2=1))) then
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
				if ((tab[xroin+wow2,yroin+wow2]='reineb') or (tab[xroin+wow2,yroin+wow2]='foub') or ((tab[xroin+wow2,yroin+wow2]='roib')and(wow2=1))) then
				begin echec:=true end;
			end;
		until (wow=7)or(xroin+wow2=8)or(yroin+wow2=8);
		//fin diagonale basse droite
		
		//pion ennemi
		if ((tab[xroin-1,yroin+1]='pionb')and(xroin-1>=1)and(yroin+1<=8)) or ((tab[xroin+1,yroin+1]='pionb')and(xroin+1<=8)and(yroin+1<=8)) then
		begin echec:=true end;
		
	
	end; //fin a=2

end; //procedure echek
		
procedure roc(xtab,x2tab,ytab,y2tab : integer; p1,p2 : string ; var vf,roque : boolean);
var echec,vfvf : boolean;
begin
//roque
roque:=false;
vfvf:=false;
if p1='roib' then
	begin
		if ( (tab[5,8]='roib')and(tab[1,8]='tourb')and(t1=0)and(r1=0)and(x2tab=3)and(y2tab=8)and(tab[2,8]='vide')and(tab[3,8]='vide')and(tab[4,8]='vide') ) then
			begin
			tab[4,8]:='roib';
			tab[5,8]:='vide';
			echek(a,echec);
			tab[4,8]:='vide';
			tab[5,8]:='roib';
			if echec=false then
				begin
				tab[3,8]:='roib';
				tab[5,8]:='vide';
				echek(a,echec);
				tab[3,8]:='vide';
				tab[5,8]:='roib';
				if ( (echec=false)and(r1=0)and(t1=0) ) then
					begin
					vfvf:=true;
					roque:=true;
					tab[4,8]:='tourb';
					tab[1,8]:='vide';
					end;
				end;
			end;
		if ( (tab[5,8]='roib')and(tab[8,8]='tourb')and(t11=0)and(r1=0)and(x2tab=7)and(y2tab=8)and(tab[6,8]='vide')and(tab[7,8]='vide') )then
			begin
			tab[6,8]:='roib';
			tab[5,8]:='vide';
			echek(a,echec);
			tab[6,8]:='vide';
			tab[5,8]:='roib';
			if echec=false then
				begin
				tab[7,8]:='roib';
				tab[5,8]:='vide';
				echek(a,echec);
				tab[7,8]:='vide';
				tab[5,8]:='roib';
				if ( (echec=false)and(r1=0)and(t11=0) ) then
					begin
					vfvf:=true;
					roque:=true;
					tab[6,8]:='tourb';
					tab[8,8]:='vide';
					end;
				end;
			end;
	end;

if p1='roin' then
	begin
		if ( (tab[5,1]='roin')and(tab[1,1]='tourn')and(t2=0)and(r2=0)and(x2tab=3)and(y2tab=1)and(tab[2,1]='vide')and(tab[3,1]='vide')and(tab[4,1]='vide') ) then
			begin

			tab[4,1]:='roin';
			tab[5,1]:='vide';
			echek(a,echec);
			tab[4,1]:='vide';
			tab[5,1]:='roin';
			if echec=false then
				begin
				tab[3,1]:='roin';
				tab[5,1]:='vide';
				echek(a,echec);
				tab[3,1]:='vide';
				tab[5,1]:='roin';

				if ( (echec=false)and(r2=0)and(t2=0) ) then
					begin
					
					vfvf:=true;
					roque:=true;
					tab[4,1]:='tourn';
					tab[1,1]:='vide';
					end;
				end;
			end;

		if ( (tab[5,1]='roin')and(tab[8,1]='tourn')and(t22=0)and(r2=0)and(x2tab=7)and(y2tab=1)and(tab[6,1]='vide')and(tab[7,1]='vide') )then
			begin
			tab[6,1]:='roin';
			tab[5,1]:='vide';
			echek(a,echec);
			tab[6,1]:='vide';
			tab[5,1]:='roin';
			if echec=false then
				begin
				tab[7,1]:='roin';
				tab[5,1]:='vide';
				echek(a,echec);
				tab[7,1]:='vide';
				tab[5,1]:='roin';

				if ( (echec=false)and(r2=0)and(t22=0) ) then
					begin
					vfvf:=true;
					roque:=true;
					tab[6,1]:='tourn';
					tab[8,1]:='vide';
					end;
				end;
			end;
	end;

if vfvf=true then roque:=true;
if roque=true then vf:=true;

end; //end roc



procedure prise_en_passant(xtab,x2tab,ytab,y2tab,x3tab,x4tab,y4tab,x5tab,x6tab,a : integer ; p1,p2,p3,p4 : string; var vf,prise_en_passant0 : boolean);
var vfvf : boolean;
begin
vfvf:=false;
prise_en_passant0:=false;
	if a=1 then
		begin
			if (  (p1='pionb')and(p4='pionn')and(x4tab=x6tab)and(y4tab=2)and(y6tab=4)and(ytab=y6tab)and(ytab-1=y2tab)and((xtab+1=x2tab)or(xtab-1=x2tab))and(x2tab=x4tab) ) then
				begin
				vfvf:=true;
				prise_en_passant0:=true;
				end;
		end;
	if a=2 then
		begin
			if (  (p1='pionn')and(p3='pionb')and(x3tab=x5tab)and(y3tab=7)and(y5tab=5)and(ytab=y5tab)and(ytab+1=y2tab)and((xtab+1=x2tab)or(xtab-1=x2tab))and(x2tab=x3tab) ) then
				begin
				vfvf:=true;
				prise_en_passant0:=true;
				end;
		end;
	if vfvf=true then vf:=true;
end;

procedure timer();

var h,he,m,min,s,sec,cent,centieme : word;
	t,tt,tempsdebase : real;

begin
gotoxy(37,3);
gettime(h,m,s,centieme);
tempsdebase:=(h*3600+m*60+s);
t:=(h*3600+m*60+s);
repeat
repeat
	gettime(he,min,sec,cent);
	tt:=(he*3600+min*60+sec);	
until tt-t = 1;
	write(6-(sec-s),' ');

	t:=tt;
until t-tempsdebase = 5

end;

procedure deplacementvalide(xtab,x2tab,ytab,y2tab,a : integer ; p1,p2 : string; var vf,roque : boolean);
var i,casepleine,casepleine2,c1,c2,constante,constante2 : integer;
	echec: boolean;
begin
vf:=false;
casepleine:=0;
constante:=0;
casepleine2:=0;
constante2:=0;
roque:=false;
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
		
		if ( ((xtab+1=x2tab) or (xtab-1=x2tab)) and (ytab-1=y2tab) and ((tab[x2tab,y2tab]= 'pionn') or (tab[x2tab,y2tab]='tourn') or (tab[x2tab,y2tab]= 'foun') or (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]= 'roin') or (tab[x2tab,y2tab]='reinen')) ) then
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
					vf:=true;
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
		if ( (abs(x2tab-xtab)<=1) and (abs(y2tab-ytab)<=1) and not( ((xtab-x2tab)=0)and((ytab-y2tab)=0) ) and not( (tab[x2tab,y2tab]='pionb') or (tab[x2tab,y2tab]='tourb') or (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') ) ) then 
		begin
		vf:=true;
		end;
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
		
		if ( ((xtab+1=x2tab) or (xtab-1=x2tab)) and (ytab+1=y2tab) and ((tab[x2tab,y2tab]= 'pionb') or (tab[x2tab,y2tab]='tourb') or (tab[x2tab,y2tab]= 'foub') or (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]= 'roib') or (tab[x2tab,y2tab]='reineb')) ) then
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
						if (   (constante=0) and (i=y2tab) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
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
						if (   (constante=0) and (i=y2tab) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
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
						if (   (constante=0) and(i=x2tab) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
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
						if (   (constante=0) and(i=x2tab) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
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
					if (  (constante2=0) and ((xtab+i=x2tab)and(ytab-i=y2tab)) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
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
					if (  (constante2=0) and ((xtab-i=x2tab)and(ytab-i=y2tab)) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
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
					if (  (constante2=0) and ((xtab+i=x2tab)and(ytab+i=y2tab)) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
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
					if (  (constante=0) and ((xtab-i=x2tab)and(ytab+i=y2tab)) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
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



end;{fin procedure deplacementvalide}



procedure deplacement2(var xtab,ytab,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab : integer; p1,p3,p4 : string; var cste,a : integer; var vf,echec,prise_en_passant0 : boolean; var r1,r2,t1,t11,t2,t22 : integer);
var a3, a4, x2tab, y2tab : integer;
	p2 : string;
	piecechoisie : string;
	roque : boolean;
begin
	
	a3:=x;	a4:=y;
	x2tab:=((x -1) div 4)+1;
	y2tab:=((y -1) div 2)+1;
	p2:=tab[x2tab,y2tab];
	roque:=false;
	case a of
		1: begin x5tab:=x2tab; y5tab:=y2tab end;
		2: begin x6tab:=x2tab; y6tab:=y2tab end;
	end;
		
	deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
	
	//roque
	if ( ((p1='roib')and( ((x2tab=3)or(x2tab=7))and(y2tab=8))) or ((p1='roin')and( ((x2tab=3)or(x2tab=7))and(y2tab=1))) ) then
	begin roc(xtab,x2tab,ytab,y2tab,p1,p2,vf,roque) end;
	
	//prise en passant	
	if ( (a=1)and(p4='pionn')and(y4tab=2)and(y6tab=4)and(x4tab=x6tab) )or( (a=2)and(p3='pionb')and(y3tab=7)and(y5tab=5)and(x3tab=x5tab) ) then
	begin prise_en_passant(xtab,x2tab,ytab,y2tab,x3tab,x4tab,y4tab,x5tab,x6tab,a,p1,p2,p3,p4,vf,prise_en_passant0) end;

		if vf=false then
		begin
			gotoxy(3,20);
			textbackground(0);textcolor(15);
			writeln('Votre deplacement est invalide       ');
			delay(1500);
			gotoxy(3,21);writeln('Veuillez choisir une de vos pieces   ');
			cste:=1;
			affichage();
		end;
	
		if vf=true then
		begin
				tab[x2tab,y2tab]:=p1;
				tab[xtab,ytab]:='vide';
				if ((p1='pionn') and (y2tab=8)) then 
				begin
					repeat
					gotoxy(3,20);textbackground(0);textcolor(15);
					writeln('Quel piece voulez-vous choisir ?     ');
					gotoxy(3,21);
					writeln(' t'', c'', f'', ou  Re'' ');
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
					gotoxy(3,20);textbackground(0);textcolor(15);
					writeln('Quel piece voulez-vous choisir ?     ');
					gotoxy(3,21);
					writeln('t, c, f, ou Re');
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
					if p1='tourb' then
						begin
						if (x2tab=1)and(y2tab=8) then
							begin t1:=t1+1 end;
						if (x2tab=8)and(y2tab=8) then
							begin t11:=t11+1 end;
						end;
					if p1='tourn' then
						begin
						if (x2tab=1)and(y2tab=1) then
							begin t2:=t2+1 end;
						if (x2tab=8)and(y2tab=1) then
							begin t22:=t22+1 end;
						end;
					if p1='roib' then
						begin r1:=r1+1 end;
					if p1='roin' then
						begin r2:=r2+1 end;
					if (a=1)and(prise_en_passant0=true) then
						begin tab[x6tab,y6tab]:='vide' end;
					if (a=2)and(prise_en_passant0=true) then
						begin tab[x5tab,y5tab]:='vide' end;
					affichage();
					cste:=2;		textbackground(0);textcolor(15);
					case a of
						1 : begin a:=2;gotoxy(3,20); write('Joueur ',a,' a vous de jouer'); end;
						2 : begin a:=1;gotoxy(3,20); write('Joueur ',a,' a vous de jouer'); end;
					end;
				end; //end echec=false
				
				if echec=true then
				begin
						gotoxy(3,20);textbackground(0);textcolor(15);
						write('Deplacement non valide, vous devez proteger votre roi');
						delay(3000);
						gotoxy(3,20);
						write('                                                     ');
						tab[xtab,ytab]:=p1;
						tab[x2tab,y2tab]:=p2;
						cste:=2;
						affichage();
				end; //end echec=true
								
			end; //end vf=true
			
	end; //fin procedure

procedure echekmat(a : integer; var echecmat : boolean);
var xtab,ytab,x2tab,y2tab : integer;
	p1,p2 : string;
	vf,echec,roque : boolean;
begin
	echecmat:=true;
	if a=1 then
	begin
		for xtab:=1 to 8 do
			for ytab:=1 to 8 do
			begin
				if tab[xtab,ytab]='pionb' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
				
				if tab[xtab,ytab]='tourb' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='cavalierb' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='foub' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='reineb' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='roib' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
			end;
		end; //end a=1
			
		if a=2 then
		begin
			for xtab:=1 to 8 do
			for ytab:=1 to 8 do
			begin
				if tab[xtab,ytab]='pionn' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
				
				if tab[xtab,ytab]='tourn' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='cavaliern' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='foun' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='reinen' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='roin' then
					begin
					p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=p1;
								tab[x2tab,y2tab]:=p2;	
								end;
						end;
					end;
			end;
		end; //end a=2
end; //echekmat

procedure affichage_deplacement(p1,p2,p3,p4 : string; a,xtab,ytab,x3tab,x4tab,x5tab,x6tab : integer; var vf : boolean );
var x2tab,y2tab : integer;
	chaine,yo : string;
	roque,prise_en_passant0,vfvf,echec : boolean;
	
begin
	for x2tab:=1 to 8 do
		for y2tab:=1 to 8 do
			begin
			deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
			//roque
			begin
roque:=false;
vfvf:=false;
if p1='roib' then
	begin
		if ( (tab[5,8]='roib')and(tab[1,8]='tourb')and(t1=0)and(r1=0)and(x2tab=3)and(y2tab=8)and(tab[2,8]='vide')and(tab[3,8]='vide')and(tab[4,8]='vide') ) then
			begin
			tab[4,8]:='roib';
			tab[5,8]:='vide';
			echek(a,echec);
			tab[4,8]:='vide';
			tab[5,8]:='roib';
			if echec=false then
				begin
				tab[3,8]:='roib';
				tab[5,8]:='vide';
				echek(a,echec);
				tab[3,8]:='vide';
				tab[5,8]:='roib';
				if ( (echec=false)and(r1=0)and(t1=0) ) then
					begin
					vfvf:=true;
					roque:=true;
					end;
				end;
			end;
		if ( (tab[5,8]='roib')and(tab[8,8]='tourb')and(t11=0)and(r1=0)and(x2tab=7)and(y2tab=8)and(tab[6,8]='vide')and(tab[7,8]='vide') )then
			begin
			tab[6,8]:='roib';
			tab[5,8]:='vide';
			echek(a,echec);
			if echec=false then
				begin
				tab[7,8]:='roib';
				tab[5,8]:='vide';
				echek(a,echec);
				tab[7,8]:='vide';
				tab[5,8]:='roib';
				if ( (echec=false)and(r1=0)and(t11=0) ) then
					begin
					vfvf:=true;
					roque:=true;
					end;
				end;
			end;
	end;

if p1='roin' then
	begin
		if ( (tab[5,1]='roin')and(tab[1,1]='tourn')and(t2=0)and(r2=0)and(x2tab=3)and(y2tab=1)and(tab[2,1]='vide')and(tab[3,1]='vide')and(tab[4,1]='vide') ) then
			begin

			tab[4,1]:='roin';
			tab[5,1]:='vide';
			echek(a,echec);
			tab[4,1]:='vide';
			tab[5,1]:='roin';
			if echec=false then
				begin
				tab[3,1]:='roin';
				tab[5,1]:='vide';
				echek(a,echec);
				tab[3,1]:='vide';
				tab[5,1]:='roin';

				if ( (echec=false)and(r2=0)and(t2=0) ) then
					begin
					
					vfvf:=true;
					roque:=true;
					end;
				end;
			end;

		if ( (tab[5,1]='roin')and(tab[8,1]='tourn')and(t22=0)and(r2=0)and(x2tab=7)and(y2tab=1)and(tab[6,1]='vide')and(tab[7,1]='vide') )then
			begin
			tab[6,1]:='roin';
			tab[5,1]:='vide';
			echek(a,echec);
			tab[6,1]:='vide';
			tab[5,1]:='roin';
			if echec=false then
				begin
				tab[7,1]:='roin';
				tab[5,1]:='vide';
				echek(a,echec);
				tab[7,1]:='vide';
				tab[5,1]:='roin';

				if ( (echec=false)and(r2=0)and(t22=0) ) then
					begin
					vfvf:=true;
					roque:=true;
					end;
				end;
			end;
	end;

if vfvf=true then roque:=true;
if roque=true then vf:=true;

end; //end roc
			
			prise_en_passant(xtab,x2tab,ytab,y2tab,x3tab,x4tab,y4tab,x5tab,x6tab,a,p1,p2,p3,p4,vf,prise_en_passant0);
			if (vf=true)and (roque=true)and(prise_en_passant0=false) then
				begin
				textbackground(5);
				caze(x2tab,y2tab);
				end;
			if (vf=true)and (roque=false)and(prise_en_passant0=true) then
				begin
				textbackground(5);
				caze(x2tab,y2tab);
				end;
			if (vf=true)and (roque=false)and(prise_en_passant0=false) then
				begin
					textbackground(4);
					case tab[x2tab,y2tab] of
						'pionn': textbackground(3);
						'tourn': textbackground(3);
						'cavaliern': textbackground(3);
						'foun': textbackground(3);
						'reinen': textbackground(3);
						'pionb': textbackground(3);
						'tourb': textbackground(3);
						'cavalierb': textbackground(3);
						'foub': textbackground(3);
						'reineb': textbackground(3);
					end;
					yo:=tab[x2tab,y2tab];
					tab[x2tab,y2tab]:=p1;
					tab[xtab,ytab]:='vide';
					echek(a,echec);
					tab[xtab,ytab]:=p1;
					tab[x2tab,y2tab]:=yo;
					if echec=true then textbackground(2);
					caze(x2tab,y2tab);
					if a=2 then
						begin
						gotoxy(x2tab*4-1,y2tab*2);
						case tab[x2tab,y2tab] of
					'tourb' : write('t');
					'foub' : write('f');
					'cavalierb' : write('c');
					'roib' : write('r');
					'pionb' : write('p');
					'reineb' : begin gotoxy(4*x2tab-2,2*y2tab); write('Re') end;
						end;
						end;
					if a=1 then
						begin 
						gotoxy(x2tab*4-2,y2tab*2);
						case tab[x2tab,y2tab] of
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
end;

procedure deplacement(var x,y,cste,a,r1,r2,t1,t11,t2,t22,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab : integer; var p3,p4 : string; var echecmat : boolean);
	var xtab,ytab,a1,a2 : integer;
		p1,p2: string;
		echec,prise_en_passant0: boolean;
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
	
	case a of
		1 : begin p3:=p1; x3tab:=xtab; y3tab:=ytab end;
		2 : begin p4:=p1; x4tab:=xtab; y4tab:=ytab end;
	end;
	
	gotoxy(3,20);textbackground(0);textcolor(15); writeln('Ou voulez-vous deplacer votre piece ?')	;
	gotoxy(x,y);
	affichage_deplacement(p1,p2,p3,p4,a,xtab,ytab,x3tab,x4tab,x5tab,x6tab,vf);
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
				7181 : begin textbackground(0);textcolor(15); deplacement2(xtab,ytab,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,p1,p3,p4,cste,a,vf,echec,prise_en_passant0,r1,r2,t1,t11,t2,t22) end;
			end;
			case x of 
				-2 : x:=2;
				34 : x:=30;
			end;
			case y of 
				0 : y:=2;
				18 : y:=16;
			end;
		
		
		
		echekmat(a,echecmat);
		if echecmat=false then
		begin
			echek(a,echec);
			if echec=true then
			begin
			gotoxy(3,20);textbackground(0);textcolor(15);
			if a=1 then
			writeln('Joueur 1, Vous etes en echec !');
			if a=2 then
			writeln('Joueur 2, Vous etes en echec !');
			end;
		end;
		if echecmat=true then
		begin
		gotoxy(3,20);textbackground(0);textcolor(15);
		if a=1 then 
		begin writeln('Echec et mat !! Le joueur ',2,' l''emporte ! ') end;
		if a=2 then 
		begin writeln('Echec et mat !! Le joueur ',1,' l''emporte ! ') end;
		end;
		gotoxy(x,y);

		
			until((getkeyeventchar(k)='x')or (cste=1) or (cste=2));
	end;
end;



{programme principal}
begin
	repeat
	clrscr;
	writeln('Voulez-vous recommencer une nouvelle partie(new) ou continuer la partie sauvegardées(load)');
	readln(newload);
	until (newload='new')or(newload='load');
	a:=1;
	r1:=0; 						//variable=0 si le roi blanc n'a pas encore bougé, sinon 1
	r2:=0; 						//variable=0 si le roi noir n'a pas encore bougé, sinon 1
	t1:=0; 	
	t11:=0;			//variable=0 si la tour blanche n'a pas encore bougé, sinon 1
	t2:=0; 	
	t22:=0;
	echecmat:=false;
	case newload of 
				'new'  : initialisation();
				'load' : load(a);
	end;
	affichage();
	initkeyboard;
	gotoxy(3,20);textbackground(0);textcolor(15);
	writeln('Joueur ',a,', a vous de jouer');
	begin{curseur}
			x:=2;y:=2; 
			gotoxy(x,y);
		repeat
		save(a);
		k:= getkeyevent;
		k:=translatekeyevent(k);
		
		case k of
				33619751 : y:=y+2;
				33619745 : y:=y-2;
				33619749 : x:=x+4;
				33619747 : x:=x-4;
				7181 : deplacement(x,y,cste,a,r1,r2,t1,t11,t2,t22,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,p3,p4,echecmat);
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
		until((getkeyeventchar(k)='x') or (echecmat=true));
		delay(10000);
		gotoxy(1,17);
	end;
	donekeyboard;     

end.
