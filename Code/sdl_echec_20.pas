program plateau ;
uses sdl, sdl_image,sdl_ttf, Crt,Classes, SysUtils, dos,keyboard;

type tableau = array [1..8,1..8] of string;
var a,r1,r2,t1,t11,t22,t2,i,j,repetitionechec,repetitionpat,constanteposition,x1,y1,x2,y2 : integer;
	tab : tableau;
	k,kk : Tkeyevent;
	x,y,cste,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,compteur,xcursor,ycursor : integer;
	newload,p1,p2,pp1,pp2,p3,p4 : string;
	echecmat, vf,prise_en_passant0,pat0,echec,wsh1,wsh2,nouvellegame,selectionimpossible  : boolean;
	sauvegarde : text;
	//var timer
	
	t,tt,sss,ss,tempsdebase1,tempsdebase2,tps_initial1,tps_initial2,temps_debut_program,delay1,delay2,delay11,delay22,minute,seconde,minute2,seconde2 : integer;
	h,m,s,cent : word;
	window, typecase,curseur, curseurblanc, curseurnoir,curseurrouge,curseurviolet,curseurjaune,curseurbleu,curseurvert,caseblanc,casejaune, casenoir, caseroque, casedeplacementvide, casedeplacementpiece, casedeplacementechec, roiblanc, roinoir, reineblanc, reinenoir, tourblanc, tournoir, cavalierblanc, cavaliernoir, foublanc, founoir, pionblanc, pionnoir, textnoir : psdl_surface;
	votredeplacementestinvalide,veuillezchoisirunedevospieces,joueur1avousdejouer,joueur2avousdejouer, quellepiecevoulezvouschoisir, deplacementnonvalidevousdevezprotegervotreroi, ouvoulezvousdeplacervotrepiece, joueur1vousetesenechec, joueur2vousetesenechec,echecetmatlejoueur1lemporte,echecetmatlejoueur2lemporte,patte,partieterminee : psdl_surface;
	un,deux,trois,quatre,cinq,six,sept,huit,neuf,zero,deuxpoints,timerjoueur1,timerjoueur2,timermin,timersec,chiffrenoir: psdl_surface;
	position, other, tailletext, cursor : tsdl_rect;
	test_event : psdl_event;
	loop : boolean=false;
	
	

const 	adresse ='data\sauvegarde.txt';
		surfacelargeur=900;
		surfacelongueur=600;
		imagelargeur=60;
		imagelongueur=60;
		
procedure damier();
begin
clrscr;
	position.x:=1;
	position.y:=1;
	position.w:=imagelargeur;
	position.h:=imagelongueur;
	for i:= 1 to 8 do begin position.x:=imagelargeur*(i-1) +1;
		for j:=1 to 8 do begin	position.y:=imagelongueur*(j-1) +1;
				
		
		
		
				if ((i=1) or (i=3) or (i=5) or (i=7)) then 				
							case j of
							1:begin sdl_blitsurface(caseblanc, nil, window, @position);end;
							2:begin sdl_blitsurface(casenoir , nil, window, @position);end;
							3:begin sdl_blitsurface(caseblanc, nil, window, @position);end;
							4:begin sdl_blitsurface(casenoir , nil, window, @position);end;
							5:begin sdl_blitsurface(caseblanc, nil, window, @position);end;
							6:begin sdl_blitsurface(casenoir , nil, window, @position);end;
							7:begin sdl_blitsurface(caseblanc, nil, window, @position);end;
							8:begin sdl_blitsurface(casenoir , nil, window, @position);end;
							end
				else	
				case j of
							1:begin sdl_blitsurface(casenoir , nil, window, @position);end;
							2:begin sdl_blitsurface(caseblanc, nil, window, @position);end;
							3:begin sdl_blitsurface(casenoir , nil, window, @position);end;
							4:begin sdl_blitsurface(caseblanc, nil, window, @position);end;
							5:begin sdl_blitsurface(casenoir , nil, window, @position);end;
							6:begin sdl_blitsurface(caseblanc, nil, window, @position);end;
							7:begin sdl_blitsurface(casenoir , nil, window, @position);end;
							8:begin sdl_blitsurface(caseblanc, nil, window, @position);end;
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

procedure save(a,r1,r2,t1,t11,t2,t22,compteur,t,ss,tempsdebase1,tempsdebase2,delay1,delay2,minute,seconde,minute2,seconde2,constanteposition,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,x1,y1,x2,y2: integer; pp1,pp2,p3,p4 : string; echec : boolean);
begin
assign(sauvegarde , adresse);
	rewrite(sauvegarde);
	for i:=1 to 8 do
		for j:=1 to 8 do
		writeln(sauvegarde, tab[i,j]);			
		writeln(sauvegarde, a);
		writeln(sauvegarde, r1);
		writeln(sauvegarde, r2);
		writeln(sauvegarde, t1);
		writeln(sauvegarde, t11);
		writeln(sauvegarde, t2);
		writeln(sauvegarde, t22);
		writeln(sauvegarde, compteur);
		writeln(sauvegarde, t);
		writeln(sauvegarde, ss);
		writeln(sauvegarde, tempsdebase1);
		writeln(sauvegarde, tempsdebase2);
		writeln(sauvegarde, delay1);
		writeln(sauvegarde, delay2);
		writeln(sauvegarde, minute);
		writeln(sauvegarde, seconde);
		writeln(sauvegarde, minute2);
		writeln(sauvegarde, seconde2);
		writeln(sauvegarde, echec);
		writeln(sauvegarde, constanteposition);
		writeln(sauvegarde, x3tab);
		writeln(sauvegarde, y3tab);
		writeln(sauvegarde, x4tab);
		writeln(sauvegarde, y4tab);
		writeln(sauvegarde, x5tab);
		writeln(sauvegarde, y5tab);
		writeln(sauvegarde, x6tab);
		writeln(sauvegarde, y6tab);
		writeln(sauvegarde, x1);
		writeln(sauvegarde, y1);
		writeln(sauvegarde, x2);
		writeln(sauvegarde, y2);
		writeln(sauvegarde, pp1);
		writeln(sauvegarde, pp2);
		writeln(sauvegarde, p3);
		writeln(sauvegarde, p4);
				
close(sauvegarde);
end;

procedure load(var a,r1,r2,t1,t11,t2,t22,compteur,t,ss,tempsdebase1,tempsdebase2,delay1,delay2,minute,seconde,minute2,seconde2,constanteposition,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,x1,y1,x2,y2 :integer ; var pp1,pp2,p3,p4 : string; var echec : boolean);
var chaine : string;
	ytp8 : string;
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
	readln(sauvegarde,a);
	readln(sauvegarde, r1);
	readln(sauvegarde, r2);
	readln(sauvegarde, t1);
	readln(sauvegarde, t11);
	readln(sauvegarde, t2);
	readln(sauvegarde, t22);
	readln(sauvegarde,compteur);
	readln(sauvegarde, t);
	readln(sauvegarde, ss);
	readln(sauvegarde, tempsdebase1);
	readln(sauvegarde, tempsdebase2);
	readln(sauvegarde, delay1);
	readln(sauvegarde, delay2);
	readln(sauvegarde, minute);
	readln(sauvegarde, seconde);
	readln(sauvegarde, minute2);
	readln(sauvegarde, seconde2);
	readln(sauvegarde, ytp8);
	TryStrToBool(ytp8,echec);
	readln(sauvegarde,constanteposition);
	readln(sauvegarde,x3tab);
	readln(sauvegarde,y3tab);
	readln(sauvegarde,x4tab);
	readln(sauvegarde,y4tab);
	readln(sauvegarde,x5tab);
	readln(sauvegarde,y5tab);
	readln(sauvegarde,x6tab);
	readln(sauvegarde,y6tab);
	readln(sauvegarde,x1);
	readln(sauvegarde,y1);
	readln(sauvegarde,x2);
	readln(sauvegarde,y2);
	readln(sauvegarde,pp1);
	readln(sauvegarde,pp2);
	readln(sauvegarde,p3);
	readln(sauvegarde,p4);
	close(sauvegarde);
	
end;

	procedure loadimage();
begin

caseblanc:=img_load('data\caseblanc.png');
casenoir:=img_load('data\casenoir.png');
casejaune:=img_load('data\casejaune.png');
caseroque:=img_load('data\caseroque.png');
casedeplacementvide:=img_load('data\casedeplacementvide.png');
casedeplacementpiece:=img_load('data\casedeplacementpiece.png');
casedeplacementechec:=img_load('data\casedeplacementechec.png');

curseurviolet:=img_load('data\curseurviolet.png');
curseur:=img_load('data\curseur.png');
curseurnoir:=img_load('data\curseurnoir.png');
curseurblanc:=img_load('data\curseurblanc.png');
curseurrouge:=img_load('data\curseurrouge.png');
curseurjaune:=img_load('data\curseurjaune.png');
curseurvert:=img_load('data\curseurvert.png');
curseurbleu:=img_load('data\curseurbleu.png');

roiblanc:=img_load('data\roiblanc.png');
roinoir:=img_load('data\roinoir.png');
reineblanc:=img_load('data\reineblanc.png');
reinenoir:=img_load('data\reinenoir.png');
tourblanc:=img_load('data\tourblanc.png');
tournoir:=img_load('data\tournoir.png');
cavalierblanc:=img_load('data\cavalierblanc.png');
cavaliernoir:=img_load('data\cavaliernoir.png');
foublanc:=img_load('data\foublanc.png');
founoir:=img_load('data\founoir.png');
pionblanc:=img_load('data\pionblanc.png');
pionnoir:=img_load('data\pionnoir.png');

votredeplacementestinvalide :=img_load('data\txt\votredeplacementestinvalide.png');
veuillezchoisirunedevospieces:=img_load('data\txt\veuillezchoisirunedevospieces.png');
joueur1avousdejouer:=img_load('data\txt\joueur1avousdejouer.png');
joueur2avousdejouer:=img_load('data\txt\joueur2avousdejouer.png');
quellepiecevoulezvouschoisir:=img_load('data\txt\quellepiecevoulezvouschoisir.png');
deplacementnonvalidevousdevezprotegervotreroi:=img_load('data\txt\deplacementnonvalidevousdevezprotegervotreroi.png');
ouvoulezvousdeplacervotrepiece:=img_load('data\txt\ouvoulezvousdeplacervotrepiece.png');
joueur1vousetesenechec:=img_load('data\txt\joueur1vousetesenechec.png');
joueur2vousetesenechec:=img_load('data\txt\joueur2vousetesenechec.png');
echecetmatlejoueur1lemporte:=img_load('data\txt\echecetmatlejoueur1lemporte.png');
echecetmatlejoueur2lemporte:=img_load('data\txt\echecetmatlejoueur2lemporte.png');
patte:=img_load('data\txt\pat.png');
partieterminee:=img_load('data\txt\partieterminee.png');
textnoir:=img_load('data\txt\textnoir.png');

un:=img_load('data\timer\un.png');
deux:=img_load('data\timer\deux.png');
trois:=img_load('data\timer\trois.png');
quatre:=img_load('data\timer\quatre.png');
cinq:=img_load('data\timer\cinq.png');
six:=img_load('data\timer\six.png');
sept:=img_load('data\timer\sept.png');
huit:=img_load('data\timer\huit.png');
neuf:=img_load('data\timer\neuf.png');
zero:=img_load('data\timer\zero.png');
deuxpoints:=img_load('data\timer\deuxpoints.png');
timerjoueur1:=img_load('data\timer\timerjoueur1.png');
timerjoueur2:=img_load('data\timer\timerjoueur2.png');
timermin:=img_load('data\timer\timermin.png');
timersec:=img_load('data\timer\timersec.png');
chiffrenoir:=img_load('data\timer\chiffrenoir.png');
end;
procedure freeimagecase();

begin
sdl_freesurface(caseblanc);
sdl_freesurface(casenoir);
sdl_freesurface(casejaune);
sdl_freesurface(caseroque);
sdl_freesurface(casedeplacementvide);
sdl_freesurface(casedeplacementpiece);
sdl_freesurface(casedeplacementechec);

sdl_freesurface(curseurviolet);
sdl_freesurface(curseur);
sdl_freesurface(curseurnoir);
sdl_freesurface(curseurblanc);
sdl_freesurface(curseurrouge);
sdl_freesurface(curseurjaune);
sdl_freesurface(curseurvert);
sdl_freesurface(curseurbleu);

sdl_freesurface(roiblanc);
sdl_freesurface(roinoir);
sdl_freesurface(tourblanc);
sdl_freesurface(tournoir);
sdl_freesurface(cavalierblanc);
sdl_freesurface(cavaliernoir);
sdl_freesurface(foublanc);
sdl_freesurface(founoir);
sdl_freesurface(pionblanc);
sdl_freesurface(pionnoir);
sdl_freesurface(reineblanc);
sdl_freesurface(reinenoir);

sdl_freesurface(votredeplacementestinvalide);
sdl_freesurface(veuillezchoisirunedevospieces);
sdl_freesurface(joueur1avousdejouer);
sdl_freesurface(joueur2avousdejouer);
sdl_freesurface(quellepiecevoulezvouschoisir);
sdl_freesurface(deplacementnonvalidevousdevezprotegervotreroi);
sdl_freesurface(ouvoulezvousdeplacervotrepiece);
sdl_freesurface(joueur1vousetesenechec);
sdl_freesurface(joueur2vousetesenechec);
sdl_freesurface(echecetmatlejoueur1lemporte);
sdl_freesurface(echecetmatlejoueur2lemporte);
sdl_freesurface(patte);
sdl_freesurface(partieterminee);
sdl_freesurface(textnoir);

sdl_freesurface(un);
sdl_freesurface(deux);
sdl_freesurface(trois);
sdl_freesurface(quatre);
sdl_freesurface(cinq);
sdl_freesurface(six);
sdl_freesurface(sept);
sdl_freesurface(huit);
sdl_freesurface(neuf);
sdl_freesurface(zero);
sdl_freesurface(deuxpoints);
sdl_freesurface(timerjoueur1);
sdl_freesurface(timerjoueur2);
sdl_freesurface(timermin);
sdl_freesurface(timersec);
sdl_freesurface(chiffrenoir);
end;
procedure affichage();
var iaffichage,jaffichage : integer;
begin
for iaffichage:= 1 to 8 do 
	begin for jaffichage :=1 to 8 do
			begin
				position.x:=imagelargeur*(iaffichage-1) +1;
				position.y:=imagelongueur*(jaffichage-1) +1;
				position.w:=imagelargeur;
				position.h:=imagelongueur;
				case  tab[iaffichage,jaffichage] of 
						'tourb' : sdl_blitsurface(tourblanc, nil, window, @position);
						'foub' : sdl_blitsurface(foublanc, nil, window, @position);
						'cavalierb' : sdl_blitsurface(cavalierblanc, nil, window, @position);
						'roib' : sdl_blitsurface(roiblanc, nil, window, @position);
						'pionb' : sdl_blitsurface(pionblanc, nil, window, @position);
						'reineb' : sdl_blitsurface(reineblanc, nil, window, @position);
						'tourn' : sdl_blitsurface(tournoir, nil, window, @position);
						'foun' : sdl_blitsurface(founoir, nil, window, @position);
					    'cavaliern' : sdl_blitsurface(cavaliernoir, nil, window, @position);
						'roin' : sdl_blitsurface(roinoir, nil, window, @position);
						'reinen' : sdl_blitsurface(reinenoir, nil, window, @position);
						'pionn' : sdl_blitsurface(pionnoir, nil, window, @position);
				end;
				
				
				
			end;
	end;
position.x:=650;position.y:=20;				
sdl_blitsurface(textnoir,nil, window,@position);sdl_flip(window);
sdl_blitsurface(timerjoueur1,nil, window,@position);
position.x:=740;
sdl_blitsurface(deuxpoints,nil, window,@position);
position.x:=800;
sdl_blitsurface(timermin,nil, window,@position);
position.x:=870;
sdl_blitsurface(timersec,nil, window,@position);
				
position.x:=650;position.y:=45;				
sdl_blitsurface(textnoir,nil, window,@position);sdl_flip(window);
sdl_blitsurface(timerjoueur2,nil, window,@position);
position.x:=740;
sdl_blitsurface(deuxpoints,nil, window,@position);
position.x:=800;
sdl_blitsurface(timermin,nil, window,@position);
position.x:=870;
sdl_blitsurface(timersec,nil, window,@position);

end;






procedure echek(a : integer; var echec : boolean);
var i_echec,j_echec,xroib,xroin,yroib,yroin,wow, wow2: integer;
begin
	echec:=false;
	
	for i_echec:=1 to 8 do
	begin
		for j_echec:=1 to 8 do
		begin
			if (tab[i_echec,j_echec]='roib') then begin //pour savoir les coordonnées des 2 rois
			xroib:=i_echec;
			yroib:=j_echec end;
			if (tab[i_echec,j_echec]='roin') then begin
			xroin:=i_echec;
			yroin:=j_echec end;
		end;
	end;
	
	if a=1 then
	begin
		//cavalier ennemi
		for i_echec:=-2 to 2 do
		begin
		if i_echec<>0 then
		begin
			if (tab[xroib+i_echec,yroib+abs(3-abs(i_echec))]='cavaliern') then 
			begin 
				echec:=true;
				if ((xroib+i_echec<1)or(xroib+i_echec>8)or(yroib+abs(3-abs(i_echec))<1)or(yroib+abs(3-abs(i_echec))>8)) then
				begin echec:=false end;
			end;
			if (tab[xroib+i_echec,yroib-abs(3-abs(i_echec))]='cavaliern') then
			begin
				echec:=true;
				if ((xroib+i_echec<1)or(xroib+i_echec>8)or(yroib-abs(3-abs(i_echec))<1)or(yroib-abs(3-abs(i_echec))>8)) then
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
		for i_echec:=-2 to 2 do
		begin
		if i_echec<>0 then
		begin
			if (tab[xroin+i_echec,yroin+abs(3-abs(i_echec))]='cavalierb') then 
			begin 
				echec:=true;
				if ((xroin+i_echec<1)or(xroin+i_echec>8)or(yroin+abs(3-abs(i_echec))<1)or(yroin+abs(3-abs(i_echec))>8)) then
				begin echec:=false end;
			end;
			if (tab[xroin+i_echec,yroin-abs(3-abs(i_echec))]='cavalierb') then
			begin
				echec:=true;
				if ((xroin+i_echec<1)or(xroin+i_echec>8)or(yroin-abs(3-abs(i_echec))<1)or(yroin-abs(3-abs(i_echec))>8)) then
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

end; //fin echek
		
procedure roc(xtab,x2tab,ytab,y2tab,r1,r2,t1,t11,t2,t22 : integer; p1,p2 : string ; var vf,roque : boolean);
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



procedure prise_en_passant(xtab,x2tab,ytab,y2tab,x3tab,x4tab,y4tab,x5tab,x6tab,a : integer ; p1,p3,p4 : string; var vf,prise_en_passant0 : boolean);
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

procedure timer_sdl(var word_timer_sdl : word );
var mot_timer_sdl : string;
begin
	mot_timer_sdl:=IntToStr(word_timer_sdl);
    case mot_timer_sdl of
		'0' : sdl_blitsurface(zero,nil, window, @position);
		'1' : sdl_blitsurface(un,nil, window, @position);
		'2' : sdl_blitsurface(deux,nil, window, @position);
		'3' : sdl_blitsurface(trois,nil, window, @position);
		'4' : sdl_blitsurface(quatre,nil, window, @position);
		'5' : sdl_blitsurface(cinq,nil, window, @position);
		'6' : sdl_blitsurface(six,nil, window, @position);
		'7' : sdl_blitsurface(sept,nil, window, @position);
		'8' : sdl_blitsurface(huit,nil, window, @position);
		'9' : sdl_blitsurface(neuf,nil, window, @position);
    end;
    sdl_flip(window);
End;

procedure timer(a,tempsdebase1,tempsdebase2,temps_debut_program,delay11,delay22 : integer ;var t,tt,ss,sss,minute,seconde,minute2,seconde2,delay1,delay2,tps_initial1,tps_initial2 : integer; var wsh1,wsh2 : boolean);
var h,he,m,min,s,sec,cent,centieme,chiffre2,chiffre : word;
begin
if a=1 then
	begin
	gettime(h,m,s,centieme);
	tt:=(h*3600+m*60+s);
	for i:=1 to tps_initial1 do
		begin
			if tt-t=i then
				begin
				delay1:=tt-ss;
				t:=tt;
				seconde:=tps_initial1-(tt-temps_debut_program)+delay22; 
				
				minute:=seconde div 60;
				seconde:=seconde-60*minute;
				
							
				chiffre:=minute div 10 ;position.x:=760;position.y:=20;
				sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
				timer_sdl(chiffre);
				chiffre:=minute mod 10; position.x:=780;position.y:=20;
				sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
				timer_sdl(chiffre);
				
				chiffre:=seconde div 10; position.x:=830;position.y:=20;
				sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
				timer_sdl(chiffre);
				chiffre:=seconde mod 10; position.x:=850;position.y:=20;
				sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
				timer_sdl(chiffre);
				
				chiffre2:=minute2 div 10 ;position.x:=760;position.y:=45;
				sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
				timer_sdl(chiffre2);
				chiffre2:=minute2 mod 10; position.x:=780;position.y:=45;
				sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
				timer_sdl(chiffre2);
				position.x:=800;
			
				chiffre2:=seconde2 div 10; position.x:=830;position.y:=45;
				sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
				timer_sdl(chiffre2);
				chiffre2:=seconde2 mod 10; position.x:=850;position.y:=45;
				sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
				timer_sdl(chiffre2);
				
				end;
		end;
	end;
if a=2 then
	begin
	gettime(he,min,sec,cent);
	sss:=(he*3600+min*60+sec);
	for i:=1 to tps_initial2 do
	begin
	if sss-ss=i then
		begin
			delay2:=sss-t;
			ss:=sss;
			seconde2:=tps_initial2-(sss-temps_debut_program)+delay11;
			minute2:=seconde2 div 60;
			seconde2:=seconde2-60*minute2;
			
			chiffre2:=minute2 div 10;	position.x:=760;position.y:=45;
			sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
			timer_sdl(chiffre2);
			chiffre2:=minute2 mod 10; position.x:=780;position.y:=45;
			sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
			timer_sdl(chiffre2);
						
			chiffre2:=seconde2 div 10; position.x:=830;position.y:=45;
			sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
			timer_sdl(chiffre2);
			chiffre2:=seconde2 mod 10; position.x:=850;position.y:=45;
			sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
			timer_sdl(chiffre2);
			
			chiffre:=minute div 10;	position.x:=760;position.y:=20;
			sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
			timer_sdl(chiffre);
			chiffre:=minute mod 10; position.x:=780;position.y:=20;
			sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
			timer_sdl(chiffre);
						
			chiffre:=seconde div 10; position.x:=830;position.y:=20;
			sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
			timer_sdl(chiffre);
			chiffre:=seconde mod 10; position.x:=850;position.y:=20;
			sdl_blitsurface(chiffrenoir,nil, window,@position);sdl_flip(window);
			timer_sdl(chiffre);
			
			
			
		end;
	end;
	end;
	
end;


procedure deplacementvalide(xtab,x2tab,ytab,y2tab,a : integer ; p1 : string; var vf,roque : boolean);
var i,casepleine,casepleine2,c1,c2,constante,constante2 : integer;

begin
vf:=false;
casepleine:=0;
constante:=0;
casepleine2:=0;
constante2:=0;
roque:=false;
//joueur 1
	if a=1 then
	BEGIN
	
	
//pion blanc 
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
						if ((constante=0) and (i=x2tab) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
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
						if ((constante=0) and (i=x2tab) and ((tab[x2tab,y2tab]='tourn') or  (tab[x2tab,y2tab]='cavaliern') or (tab[x2tab,y2tab]='foun') or (tab[x2tab,y2tab]='reinen') or (tab[x2tab,y2tab]='pionn') ) ) then
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
						if (  (constante=0) and (i=x2tab) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
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
						if (  (constante=0) and (i=x2tab) and ((tab[x2tab,y2tab]='tourb') or  (tab[x2tab,y2tab]='cavalierb') or (tab[x2tab,y2tab]='foub') or (tab[x2tab,y2tab]='reineb') or (tab[x2tab,y2tab]='pionb') ) ) then
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


procedure pat(a,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab : integer; p1,p2 : string; var pp1,pp2 : string; var constanteposition,x1,y1,x2,y2 : integer; var pat0,nouvellegame : boolean);
var xtab,ytab,x2tab,y2tab,constante : integer;
	pat_p1,pat_p2 : string;
	vf,roque,echec : boolean;
begin
	vf:=false;
	roque:=false;
	pat0:=true;
	echec:=false;
	constante:=constanteposition;
	
	if (constanteposition=1) or (constanteposition=2) or (constanteposition=3) or (constanteposition=4) or (constanteposition=5) then
	begin 		 if a=2 then
				begin
					if (p1=pp2)and(x5tab=x1)and(y5tab=y1) then
					begin
					pp2:=p1; x1:=x3tab; y1:=y3tab;
					constanteposition:=constanteposition+1;
					end
					else
					begin
					constanteposition:=1; pp2:=p1; x1:=x3tab; y1:=y3tab;
					if (nouvellegame=true) or (selectionimpossible=true) then
							begin constanteposition:=constante; nouvellegame:=false end
					end;
				end;
				  if a=1  then
				begin
					if (pp1=p1)and(x6tab=x2)and(y6tab=y2) then
					begin
					pp1:=p1; x2:=x4tab; y2:=y4tab;
					constanteposition:=constanteposition+1;
					end
					else
					begin
					constanteposition:=1; pp1:=p1; x2:=x4tab; y2:=y4tab;
					if (nouvellegame=true)or(selectionimpossible=true) then
							begin constanteposition:=constante; nouvellegame:=false end
					end;						
				end;
	end; //if
	
	for xtab:=1 to 8 do
		for ytab:=1 to 8 do
		begin
			pat_p1:=tab[xtab,ytab];
			for x2tab:=1 to 8 do
				for y2tab:=1 to 8 do
				begin
					pat_p2:=tab[x2tab,y2tab];
					//deplacement valide
					deplacementvalide(xtab,x2tab,ytab,y2tab,a,pat_p1,vf,roque);
					if vf=true then
					begin
						tab[xtab,ytab]:='vide';
						tab[x2tab,y2tab]:=pat_p1;
						echek(a,echec);
						tab[xtab,ytab]:= pat_p1;
						tab[x2tab,y2tab]:= pat_p2;
					if (echec=false) then
						begin
						case a of
							1: begin if ((pat_p1='pionb')or(pat_p1='tourb')or(pat_p1='cavalierb')or(pat_p1='reineb')or(pat_p1='roib')or(pat_p1='foub')) then begin pat0:=false end; end;
							2: begin if ((pat_p1='pionn')or(pat_p1='tourn')or(pat_p1='cavaliern')or(pat_p1='reinen')or(pat_p1='roin')or(pat_p1='foun')) then begin pat0:=false end; end;
						end;
						end;
					end;
				end;
		end;
		if constanteposition=6 then pat0:=true;
		echek(a,echec);
		if echec=true then pat0:=false;
end;

 procedure deplacement2(tempsdebase1,tempsdebase2,delay1,delay2,temps_debut_program : integer; var t,tt,xtab,ytab,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,r1,r2,t1,t11,t2,t22,compteur,delay11,delay22 : integer; var p1,p3,p4 : string; var cste,a : integer; var vf,echec,prise_en_passant0,changementdepion,repetitionaffichage : boolean);
var x2tab, y2tab : integer;
	p2 : string;
	piecechoisie : string;
	roque,echek_loop : boolean;
begin
	changementdepion:=false;
	x2tab:=((x -1) div 4)+1;
	y2tab:=((y -1) div 2)+1;
	p2:=tab[x2tab,y2tab];
	roque:=false;
	echek_loop:= false;
	case a of
		1: begin x5tab:=x2tab; y5tab:=y2tab end;
		2: begin x6tab:=x2tab; y6tab:=y2tab end;
	end;
		
	deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,vf,roque);	
	//roque
	if ( ((p1='roib')and( ((x2tab=3)or(x2tab=7))and(y2tab=8))) or ((p1='roin')and( ((x2tab=3)or(x2tab=7))and(y2tab=1))) ) then
	begin roc(xtab,x2tab,ytab,y2tab,r1,r2,t1,t11,t2,t22,p1,p2,vf,roque) end;
	//prise en passant	
	if ( (a=1)and(p4='pionn')and(y4tab=2)and(y6tab=4)and(x4tab=x6tab) )or( (a=2)and(p3='pionb')and(y3tab=7)and(y5tab=5)and(x3tab=x5tab) ) then
	begin prise_en_passant(xtab,x2tab,ytab,y2tab,x3tab,x4tab,y4tab,x5tab,x6tab,a,p1,p3,p4,vf,prise_en_passant0) end;
		if vf=false then
		begin
			if a=1 then
				case tab[x2tab,y2tab] of
					'pionb','tourb','cavalierb','foub','roib','reineb' : begin changementdepion:=true; xtab:=x2tab; ytab:=y2tab; p1:=tab[xtab,ytab]; p3:=p1; x3tab:=xtab; y3tab:=ytab; end;
				end;
			if a=2 then
				case tab[x2tab,y2tab] of
					'pionn','tourn','cavaliern','foun','roin','reinen' : begin changementdepion:=true; xtab:=x2tab; ytab:=y2tab; p1:=tab[xtab,ytab]; p4:=p1; x4tab:=xtab; y4tab:=ytab; end;
				end;
			cste:=1;
			if changementdepion=false then
			begin
			affichage;
			cste:=1;
			affichage();
			tailletext.x:=80;
			tailletext.y:=500;
			sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
			case a of 
				1 : begin sdl_blitsurface(joueur1avousdejouer, nil, window, @tailletext); sdl_flip(window);end;
				2 : begin sdl_blitsurface(joueur2avousdejouer, nil, window, @tailletext); sdl_flip(window);end;
			end;
			end
			else
			repetitionaffichage:=false;
		end;
	
		if vf=true then
		begin
				tab[x2tab,y2tab]:=p1;
				tab[xtab,ytab]:='vide';
				if ((p1='pionn') and (y2tab=8)) then 
				begin
					tailletext.x:=80;
					tailletext.y:=500;
					sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
					sdl_blitsurface(quellepiecevoulezvouschoisir, nil, window, @tailletext);sdl_flip(window);
					sdl_quit();
					writeln('Quelle piece voulez vous choisir ?');
					writeln('   - t=tour');
					writeln('   - c=cavalier');
					writeln('   - f=fou');
					writeln('   - R=reine');
					repeat
					readln(piecechoisie);
					if ((piecechoisie='t') or (piecechoisie='c') or (piecechoisie='f') or (piecechoisie='R')) then echek_loop:=true else ;
					until (echek_loop=true);
					case piecechoisie of
						't' : tab[x2tab,y2tab]:='tourn';
						'c' : tab[x2tab,y2tab]:='cavaliern';
						'f' : tab[x2tab,y2tab]:='foun';
						'R' : tab[x2tab,y2tab]:='reinen';
					end;
					window :=sdl_setvideomode(surfacelargeur, surfacelongueur, 32, sdl_swsurface);
					loadimage();
					damier();
					affichage();
					sdl_flip(window);
				end;
				if ((p1='pionb') and (y2tab=1)) then 
				begin
					tailletext.x:=80;
					tailletext.y:=500;
					sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
					sdl_blitsurface(quellepiecevoulezvouschoisir, nil, window, @tailletext);sdl_flip(window);
					sdl_blitsurface(quellepiecevoulezvouschoisir, nil, window, @tailletext);sdl_flip(window);
					sdl_quit();
					writeln('Quelle piece voulez vous choisir ?');
					writeln('   - t=tour');
					writeln('   - c=cavalier');
					writeln('   - f=fou');
					writeln('   - R=reine');
					repeat
					read(piecechoisie);
					if ((piecechoisie='t') or (piecechoisie='c') or (piecechoisie='f') or (piecechoisie='R')) then echek_loop:=true else ;
					until (echek_loop=true);
					case piecechoisie of
						't' : tab[x2tab,y2tab]:='tourb';
						'c' : tab[x2tab,y2tab]:='cavalierb';
						'f' : tab[x2tab,y2tab]:='foub';
						'R' : tab[x2tab,y2tab]:='reineb';
					end;	
					window :=sdl_setvideomode(surfacelargeur, surfacelongueur, 32, sdl_swsurface);
					loadimage();
					damier();
					affichage();
					sdl_flip(window);		
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
					prise_en_passant(xtab,x2tab,ytab,y2tab,x3tab,x4tab,y4tab,x5tab,x6tab,a,p1,p3,p4,vf,prise_en_passant0);
					if (a=1)and(p1='pionb')and(prise_en_passant0=true)and(compteur>=3) then
						begin tab[x6tab,y6tab]:='vide' end;
					if (a=2)and(p1='pionn')and(prise_en_passant0=true)and(compteur>=3) then
						begin tab[x5tab,y5tab]:='vide' end;
					affichage();
					cste:=2;
					if a=1 then delay11:=delay11+delay1;
					if a=2 then delay22:=delay22+delay2;
					tailletext.x:=80;
					tailletext.y:=500;
					sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
					case a of
						1 : begin a:=2;sdl_blitsurface(joueur2avousdejouer, nil, window, @tailletext); sdl_flip(window);end;
						2 : begin a:=1;sdl_blitsurface(joueur1avousdejouer, nil, window, @tailletext); sdl_flip(window);end;
					end;
					compteur:=compteur+1;
				end; //end echec=false
				
				if echec=true then
				begin
						tailletext.x:=80;
						tailletext.y:=500;
						sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
						sdl_blitsurface(votredeplacementestinvalide, nil, window, @tailletext);sdl_flip(window);
						sdl_delay(2000);
						tab[xtab,ytab]:=p1;
						tab[x2tab,y2tab]:=p2;
						cste:=2;
						
						affichage();sdl_flip(window);
					
				end; //end echec=true
								
			end; //end vf=true
			damier();
		affichage();sdl_flip(window);
		cursor.y:=ycursor;sdl_blitsurface(curseur,nil, window,@cursor);sdl_flip(window);
	end; //fin procedure

procedure echekmat(a : integer; var echecmat : boolean);
var xtab,ytab,x2tab,y2tab : integer;
	echekmat_p1,echekmat_p2 : string;
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
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
								end;
						end;
					end;
				
				if tab[xtab,ytab]='tourb' then
					begin
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='cavalierb' then
					begin
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='foub' then
					begin
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='reineb' then
					begin
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='roib' then
					begin
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
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
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
								end;
						end;
					end;
				
				if tab[xtab,ytab]='tourn' then
					begin
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='cavaliern' then
					begin
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='foun' then
					begin
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='reinen' then
					begin
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
								end;
						end;
					end;
					
				if tab[xtab,ytab]='roin' then
					begin
					echekmat_p1:=tab[xtab,ytab];
					for x2tab:=1 to 8 do
						for y2tab:=1 to 8 do
						begin
							echekmat_p2:=tab[x2tab,y2tab];
							deplacementvalide(xtab,x2tab,ytab,y2tab,a,echekmat_p1,vf,roque);
							if vf=true then
								begin
								tab[xtab,ytab]:='vide';
								tab[x2tab,y2tab]:=echekmat_p1;
								echek(a,echec);
								if echec=false then
									begin echecmat:=false end;
								tab[xtab,ytab]:=echekmat_p1;
								tab[x2tab,y2tab]:=echekmat_p2;	
								end;
						end;
					end;
			end;
		end; //end a=2
end; //echekmat

procedure affichage_deplacement(p1,p3,p4 : string; a,xtab,ytab,x3tab,x4tab,x5tab,x6tab : integer; var vf : boolean );
var x2tab,y2tab : integer;
	yo : string;
	roque,prise_en_passant0,vfvf,echec : boolean;
	
begin
	other.x:=(xtab-1)*imagelargeur+1;
	other.y:=(ytab-1)*imagelongueur+1;
	other.w:=imagelargeur;
	other.h:=imagelongueur;
	sdl_blitsurface(casejaune, nil, window, @other);
	sdl_flip(window);
	if a=1 then
			begin
				case tab[xtab,ytab] of
					'tourb' : begin sdl_blitsurface(tourblanc, nil, window, @other);sdl_flip(window); end;
					'foub' : begin sdl_blitsurface(foublanc, nil, window, @other);sdl_flip(window); end;
					'cavalierb' : begin sdl_blitsurface(cavalierblanc, nil, window, @other);sdl_flip(window); end;
					'roib' : begin sdl_blitsurface(roiblanc, nil, window, @other);sdl_flip(window); end;
					'pionb' : begin sdl_blitsurface(pionblanc, nil, window, @other);sdl_flip(window); end;
					'reineb' : begin sdl_blitsurface(reineblanc, nil, window, @other);sdl_flip(window); end;	
				end;
			end;
	if a=2 then
			begin 
				case tab[xtab,ytab] of
					'tourn' : begin sdl_blitsurface(tournoir, nil, window, @other);sdl_flip(window); end;
					'foun' : begin sdl_blitsurface(founoir, nil, window, @other);sdl_flip(window); end;
				    'cavaliern' : begin sdl_blitsurface(cavaliernoir, nil, window, @other);sdl_flip(window); end;
					'roin' : begin sdl_blitsurface(roinoir, nil, window, @other);sdl_flip(window); end;
					'reinen' : begin sdl_blitsurface(reinenoir, nil, window, @other);sdl_flip(window); end;
					'pionn' : begin sdl_blitsurface(pionnoir, nil, window, @other);sdl_flip(window); end;
				end;
			end;
	






	for x2tab:=1 to 8 do
		for y2tab:=1 to 8 do
			begin
			deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,vf,roque);
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
			tab[5,8]:='roib';
			tab[6,8]:='vide';
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
			
			prise_en_passant(xtab,x2tab,ytab,y2tab,x3tab,x4tab,y4tab,x5tab,x6tab,a,p1,p3,p4,vf,prise_en_passant0);
			if (vf=true)and (roque=true)and(prise_en_passant0=false) then
				begin
				other.x:=(x2tab-1)*imagelargeur+1;
				other.y:=(y2tab-1)*imagelongueur+1;
				other.w:=imagelargeur;
				other.h:=imagelongueur;
				sdl_blitsurface(caseroque, nil, window, @other);
				sdl_flip(window);
				end;
			if (vf=true)and (roque=false)and(prise_en_passant0=true) then
				begin
				other.x:=(x2tab-1)*imagelargeur+1;
				other.y:=(y2tab-1)*imagelongueur+1;
				other.w:=imagelargeur;
				other.h:=imagelongueur;
				sdl_blitsurface(caseroque, nil, window, @other);
				sdl_flip(window);
				end;
			if (vf=true)and (roque=false)and(prise_en_passant0=false) then
				begin
					
					case tab[x2tab,y2tab] of
						'pionn': typecase:=casedeplacementpiece;
						'tourn': typecase:=casedeplacementpiece;
						'cavaliern': typecase:=casedeplacementpiece;
						'foun': typecase:=casedeplacementpiece;
						'reinen': typecase:=casedeplacementpiece;
						'pionb': typecase:=casedeplacementpiece;
						'tourb': typecase:=casedeplacementpiece;
						'cavalierb': typecase:=casedeplacementpiece;
						'foub': typecase:=casedeplacementpiece;
						'reineb': typecase:=casedeplacementpiece;
						'vide': typecase:=casedeplacementvide;
					end;
					yo:=tab[x2tab,y2tab];
					tab[x2tab,y2tab]:=p1;
					tab[xtab,ytab]:='vide';
					echek(a,echec);
					tab[xtab,ytab]:=p1;
					tab[x2tab,y2tab]:=yo;
					if echec=true then typecase:=casedeplacementechec;
					other.x:=(x2tab-1)*imagelargeur+1;
					other.y:=(y2tab-1)*imagelongueur+1;
					other.w:=imagelargeur;
					other.h:=imagelongueur;
					sdl_blitsurface(typecase, nil, window, @other);
					sdl_flip(window);
					if a=2 then
						begin
						other.x:=(x2tab-1)*imagelargeur+1;
						other.y:=(y2tab-1)*imagelongueur+1;
						case tab[x2tab,y2tab] of
					'tourb' : begin sdl_blitsurface(tourblanc, nil, window, @other);sdl_flip(window); end;
					'foub' : begin sdl_blitsurface(foublanc, nil, window, @other);sdl_flip(window); end;
					'cavalierb' : begin sdl_blitsurface(cavalierblanc, nil, window, @other);sdl_flip(window); end;
					'roib' : begin sdl_blitsurface(roiblanc, nil, window, @other);sdl_flip(window); end;
					'pionb' : begin sdl_blitsurface(pionblanc, nil, window, @other);sdl_flip(window); end;
					'reineb' : begin sdl_blitsurface(reineblanc, nil, window, @other);sdl_flip(window); end;	
						end;
						end;
					if a=1 then
						begin 
						other.x:=(x2tab-1)*imagelargeur+1;
						other.y:=(y2tab-1)*imagelongueur+1;
						case tab[x2tab,y2tab] of
					'tourn' : begin sdl_blitsurface(tournoir, nil, window, @other);sdl_flip(window); end;
					'foun' : begin sdl_blitsurface(founoir, nil, window, @other);sdl_flip(window); end;
				    'cavaliern' : begin sdl_blitsurface(cavaliernoir, nil, window, @other);sdl_flip(window); end;
					'roin' : begin sdl_blitsurface(roinoir, nil, window, @other);sdl_flip(window); end;
					'reinen' : begin sdl_blitsurface(reinenoir, nil, window, @other);sdl_flip(window); end;
					'pionn' : begin sdl_blitsurface(pionnoir, nil, window, @other);sdl_flip(window); end;
						end;
						end;
				end;
			
			
			end;
end;

procedure deplacement(tempsdebase1,tempsdebase2,temps_debut_program : integer ; var t,tt,ss,sss,minute,seconde,minute2,seconde2,delay1,delay2,delay11,delay22,tps_initial1,tps_initial2,x,y,cste,a,r1,r2,t1,t11,t2,t22,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,compteur : integer; var p1,p2,p3,p4 : string; var echecmat,prise_en_passant0,wsh1,wsh2,echec,vf,selectionimpossible: boolean);
	var xtab,ytab : integer;
		changementdepion,repetitionaffichage,roque,vfvf: boolean;
begin
	selectionimpossible:=false;
	cste:=0;
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
	
		tailletext.x:=80;
		tailletext.y:=500;
		sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
		sdl_blitsurface(ouvoulezvousdeplacervotrepiece, nil, window, @tailletext);sdl_flip(window);
		affichage_deplacement(p1,p3,p4,a,xtab,ytab,x3tab,x4tab,x5tab,x6tab,vf);
		repetitionaffichage:=false;
	{curseur 2}
	repeat
	
	if repetitionaffichage=false then
		begin affichage_deplacement(p1,p3,p4,a,xtab,ytab,x3tab,x4tab,x5tab,x6tab,vf); repetitionaffichage:=true; end;
		
	IF SDL_POLLEVENT(test_event)=1 THEN
	BEGIN
	
		CASE test_event^.type_ OF
		
		SDL_KEYDOWN: BEGIN
                    {SDLKey 27 = ESCAPE}
                     
                     case test_event^.key.keysym.sym of
						273 : 	begin 
								
								case (y div 2) of 
								1, 3, 5, 7 :case (((x-2) div 4)+1) of 
											1, 3, 5, 7 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window); end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											end;
								2, 4, 6, 8 :case (((x-2) div 4)+1) of
											1, 3, 5, 7 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											end;
		
								end;
								deplacementvalide(xtab,(x+2) div 4,ytab,y div 2,a,p1,vf,roque);
								if vf=true then
									begin
									sdl_blitsurface(curseurrouge,nil, window,@cursor);sdl_flip(window);
									end;
								begin //roque
								roque:=false;
vfvf:=false;
if p1='roib' then
	begin
		if ( (tab[5,8]='roib')and(tab[1,8]='tourb')and(t1=0)and(r1=0)and((x+2) div 4=3)and(y div 2=8)and(tab[2,8]='vide')and(tab[3,8]='vide')and(tab[4,8]='vide') ) then
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
		if ( (tab[5,8]='roib')and(tab[8,8]='tourb')and(t11=0)and(r1=0)and((x+2) div 4=7)and(y div 2=8)and(tab[6,8]='vide')and(tab[7,8]='vide') )then
			begin
			tab[6,8]:='roib';
			tab[5,8]:='vide';
			echek(a,echec);
			tab[5,8]:='roib';
			tab[6,8]:='vide';
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
		if ( (tab[5,1]='roin')and(tab[1,1]='tourn')and(t2=0)and(r2=0)and((x+2) div 4=3)and(y div 2=1)and(tab[2,1]='vide')and(tab[3,1]='vide')and(tab[4,1]='vide') ) then
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

		if ( (tab[5,1]='roin')and(tab[8,1]='tourn')and(t22=0)and(r2=0)and((x+2) div 4=7)and(y div 2=1)and(tab[6,1]='vide')and(tab[7,1]='vide') )then
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
								end;//end roque
								if roque=true then
									begin
									sdl_blitsurface(curseurviolet,nil, window,@cursor);sdl_flip(window);
									end;
								prise_en_passant(xtab,(x+2) div 4,ytab,y div 2,x3tab,x4tab,y4tab,x5tab,x6tab,a,p1,p3,p4,vf,prise_en_passant0);
								if prise_en_passant0=true then
									begin
									sdl_blitsurface(curseurviolet,nil, window,@cursor);sdl_flip(window);
									end;
								echek(a,echec);
								if (echec=true)and(vf=true) then
									begin
									sdl_blitsurface(curseurvert,nil, window,@cursor);sdl_flip(window);
									end;
								if (((x+2) div 4)=xtab)and((y div 2)=ytab) then
									begin
									sdl_blitsurface(curseurjaune,nil, window,@cursor);sdl_flip(window);
									end;
								ycursor:=ycursor-imagelongueur;
								y:=y-2; 
								if ycursor=1-imagelongueur then ycursor:=1;
								if y=0 then y:=2;		
								cursor.y:=ycursor;sdl_blitsurface(curseur,nil, window,@cursor);sdl_flip(window);
								end;
						274 : 	begin 
								
								case (y div 2) of 
								1, 3, 5, 7 :case (((x-2) div 4)+1) of 
											1, 3, 5, 7 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											end;
								2, 4, 6, 8 :case (((x-2) div 4)+1) of
											1, 3, 5, 7 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											end;
		
								end;
								deplacementvalide(xtab,(x+2) div 4,ytab,y div 2,a,p1,vf,roque);
								if vf=true then
									begin
									sdl_blitsurface(curseurrouge,nil, window,@cursor);sdl_flip(window);
									end;
								begin //roque
								roque:=false;
vfvf:=false;
if p1='roib' then
	begin
		if ( (tab[5,8]='roib')and(tab[1,8]='tourb')and(t1=0)and(r1=0)and((x+2) div 4=3)and(y div 2=8)and(tab[2,8]='vide')and(tab[3,8]='vide')and(tab[4,8]='vide') ) then
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
		if ( (tab[5,8]='roib')and(tab[8,8]='tourb')and(t11=0)and(r1=0)and((x+2) div 4=7)and(y div 2=8)and(tab[6,8]='vide')and(tab[7,8]='vide') )then
			begin
			tab[6,8]:='roib';
			tab[5,8]:='vide';
			echek(a,echec);
			tab[5,8]:='roib';
			tab[6,8]:='vide';
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
		if ( (tab[5,1]='roin')and(tab[1,1]='tourn')and(t2=0)and(r2=0)and((x+2) div 4=3)and(y div 2=1)and(tab[2,1]='vide')and(tab[3,1]='vide')and(tab[4,1]='vide') ) then
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

		if ( (tab[5,1]='roin')and(tab[8,1]='tourn')and(t22=0)and(r2=0)and((x+2) div 4=7)and(y div 2=1)and(tab[6,1]='vide')and(tab[7,1]='vide') )then
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
								end;//roque end
								if roque=true then
									begin
									sdl_blitsurface(curseurviolet,nil, window,@cursor);sdl_flip(window);
									end;
									prise_en_passant(xtab,(x+2) div 4,ytab,y div 2,x3tab,x4tab,y4tab,x5tab,x6tab,a,p1,p3,p4,vf,prise_en_passant0);
								if prise_en_passant0=true then
									begin
									sdl_blitsurface(curseurviolet,nil, window,@cursor);sdl_flip(window);
									end;
								echek(a,echec);
								if (echec=true)and(vf=true) then
									begin
									sdl_blitsurface(curseurvert,nil, window,@cursor);sdl_flip(window);
									end;
								if (((x+2) div 4)=xtab)and((y div 2)=ytab) then
									begin
									sdl_blitsurface(curseurjaune,nil, window,@cursor);sdl_flip(window);
									end;
								ycursor:=ycursor+imagelongueur;
								y:=y+2;
								if ycursor=1+8*imagelongueur then ycursor:=1+7*imagelongueur;
								if y=18 then y:=16;
								 
								
								cursor.y:=ycursor;sdl_blitsurface(curseur,nil, window,@cursor);sdl_flip(window);
								end;
						 
						276 : 	begin 
								case (y div 2) of 
								1, 3, 5, 7 :case (((x-2) div 4)+1) of 
											1, 3, 5, 7 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											end;
								2, 4, 6, 8 :case (((x-2) div 4)+1) of
											1, 3, 5, 7 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											end;
		
								end;
								deplacementvalide(xtab,(x+2) div 4,ytab,y div 2,a,p1,vf,roque);
								if vf=true then
									begin
									sdl_blitsurface(curseurrouge,nil, window,@cursor);sdl_flip(window);
									end;
								begin //roque
								roque:=false;
vfvf:=false;
if p1='roib' then
	begin
		if ( (tab[5,8]='roib')and(tab[1,8]='tourb')and(t1=0)and(r1=0)and((x+2) div 4=3)and(y div 2=8)and(tab[2,8]='vide')and(tab[3,8]='vide')and(tab[4,8]='vide') ) then
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
		if ( (tab[5,8]='roib')and(tab[8,8]='tourb')and(t11=0)and(r1=0)and((x+2) div 4=7)and(y div 2=8)and(tab[6,8]='vide')and(tab[7,8]='vide') )then
			begin
			tab[6,8]:='roib';
			tab[5,8]:='vide';
			echek(a,echec);
			tab[5,8]:='roib';
			tab[6,8]:='vide';
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
		if ( (tab[5,1]='roin')and(tab[1,1]='tourn')and(t2=0)and(r2=0)and((x+2) div 4=3)and(y div 2=1)and(tab[2,1]='vide')and(tab[3,1]='vide')and(tab[4,1]='vide') ) then
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

		if ( (tab[5,1]='roin')and(tab[8,1]='tourn')and(t22=0)and(r2=0)and((x+2) div 4=7)and(y div 2=1)and(tab[6,1]='vide')and(tab[7,1]='vide') )then
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
								end;//roque
								if roque=true then
									begin
									sdl_blitsurface(curseurviolet,nil, window,@cursor);sdl_flip(window);
									end;
									prise_en_passant(xtab,(x+2) div 4,ytab,y div 2,x3tab,x4tab,y4tab,x5tab,x6tab,a,p1,p3,p4,vf,prise_en_passant0);
								if prise_en_passant0=true then
									begin
									sdl_blitsurface(curseurviolet,nil, window,@cursor);sdl_flip(window);
									end;
								echek(a,echec);
								if (echec=true)and(vf=true) then
									begin
									sdl_blitsurface(curseurvert,nil, window,@cursor);sdl_flip(window);
									end;
								if (((x+2) div 4)=xtab)and((y div 2)=ytab) then
									begin
									sdl_blitsurface(curseurjaune,nil, window,@cursor);sdl_flip(window);
									end;
								xcursor:=xcursor-imagelargeur; 
								x:=x-4;
								if xcursor=1-imagelargeur then xcursor:=1;
								if x=-2 then x:=2;
								cursor.x:=xcursor;sdl_blitsurface(curseur,nil, window,@cursor);sdl_flip(window);
								end;
						275 : 	begin 
								case (y div 2) of 
								1, 3, 5, 7 :case (((x-2) div 4)+1) of 
											1, 3, 5, 7 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											end;
								2, 4, 6, 8 :case (((x-2) div 4)+1) of
											1, 3, 5, 7 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											end;
		
								end;
								deplacementvalide(xtab,(x+2) div 4,ytab,y div 2,a,p1,vf,roque);
								if vf=true then
									begin
									sdl_blitsurface(curseurrouge,nil, window,@cursor);sdl_flip(window);
									end;
								begin //roque
								roque:=false;
vfvf:=false;
if p1='roib' then
	begin
		if ( (tab[5,8]='roib')and(tab[1,8]='tourb')and(t1=0)and(r1=0)and((x+2) div 4=3)and(y div 2=8)and(tab[2,8]='vide')and(tab[3,8]='vide')and(tab[4,8]='vide') ) then
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
		if ( (tab[5,8]='roib')and(tab[8,8]='tourb')and(t11=0)and(r1=0)and((x+2) div 4=7)and(y div 2=8)and(tab[6,8]='vide')and(tab[7,8]='vide') )then
			begin
			tab[6,8]:='roib';
			tab[5,8]:='vide';
			echek(a,echec);
			tab[5,8]:='roib';
			tab[6,8]:='vide';
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
		if ( (tab[5,1]='roin')and(tab[1,1]='tourn')and(t2=0)and(r2=0)and((x+2) div 4=3)and(y div 2=1)and(tab[2,1]='vide')and(tab[3,1]='vide')and(tab[4,1]='vide') ) then
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

		if ( (tab[5,1]='roin')and(tab[8,1]='tourn')and(t22=0)and(r2=0)and((x+2) div 4=7)and(y div 2=1)and(tab[6,1]='vide')and(tab[7,1]='vide') )then
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
								end;//roque
								if roque=true then
									begin
									sdl_blitsurface(curseurviolet,nil, window,@cursor);sdl_flip(window);
									end;
								prise_en_passant(xtab,(x+2) div 4,ytab,y div 2,x3tab,x4tab,y4tab,x5tab,x6tab,a,p1,p3,p4,vf,prise_en_passant0);
								if prise_en_passant0=true then
									begin
									sdl_blitsurface(curseurviolet,nil, window,@cursor);sdl_flip(window);
									end;
								echek(a,echec);
								if (echec=true)and(vf=true) then
									begin
									sdl_blitsurface(curseurvert,nil, window,@cursor);sdl_flip(window);
									end;
								if (((x+2) div 4)=xtab)and((y div 2)=ytab) then
									begin
									sdl_blitsurface(curseurjaune,nil, window,@cursor);sdl_flip(window);
									end;
								xcursor:=xcursor+imagelargeur;
								x:=x+4;
								if xcursor=1+8*imagelargeur then xcursor:=1+7*imagelongueur;
								if x=34 then x:=30;
								
								
								cursor.x:=xcursor;sdl_blitsurface(curseur,nil, window,@cursor);sdl_flip(window);
								end;
						27  : loop:=TRUE;
						13  : begin deplacement2(tempsdebase1,tempsdebase2, delay1,delay2,temps_debut_program,t,tt,xtab,ytab,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,r1,r2,t1,t11,t2,t22,compteur,delay11,delay22,p1,p3,p4,cste,a,vf,echec,prise_en_passant0,changementdepion,repetitionaffichage) end;

						end;
								
                     
                   END;
      SDL_KEYUP: ;
      SDL_MOUSEMOTION: ;
      SDL_MOUSEBUTTONDOWN: ;
      SDL_MOUSEBUTTONUP: ;
      
    END;
  END
  ELSE ;
	
  	 timer(a,tempsdebase1,tempsdebase2,temps_debut_program,delay11,delay22,t,tt,ss,sss,minute,seconde,minute2,seconde2,delay1,delay2,tps_initial1,tps_initial2,wsh1,wsh2);

	
		
	

		
	until ((loop=true)or (cste=1) or (cste=2)) and (changementdepion=false);
	end
	else
	selectionimpossible:=true;
end;

procedure menu(y : integer; var kk : tkeyevent; var newload : string);
var	xx,yy,i : integer;
begin
case y of
		3 : begin
				clrscr;
				writeln(' ------------------------- ECHECS ---------------------------');
				writeln;
				writeln('  ', '-> Nouvelle partie'); 
				writeln;
				writeln('  ', '-> Charger derniere partie');
				writeln;
				writeln('                         <--');
				xx:=1;yy:=3;
				repeat
					gotoxy(xx,yy);
					write('*');
					gotoxy(xx,yy);
					kk:= getkeyevent;
					kk:=translatekeyevent(kk);
					case kk of
						33619751 : begin gotoxy(xx,yy); write(' '); gotoxy(xx,yy); yy:=yy+2; gotoxy(xx,yy); write('*'); end;
						33619745 : begin gotoxy(xx,yy); write(' '); gotoxy(xx,yy); yy:=yy-2; gotoxy(xx,yy); write('*'); end;
						33619747 : begin
									gotoxy(1,1);
									clrscr;
									writeln(' ------------------------- ECHECS ---------------------------');
									writeln;
									writeln('  ', '-> Jouer une partie'); 
									writeln;
									writeln('  ', '-> Regles du jeu');
									writeln;
									writeln('  ', '-> Credits');
									gotoxy(x,y);
									end;
						3592 : begin
									gotoxy(1,1);
									clrscr;
									writeln(' ------------------------- ECHECS ---------------------------');
									writeln;
									writeln('  ', '-> Jouer une partie'); 
									writeln;
									writeln('  ', '-> Regles du jeu');
									writeln;
									writeln('  ', '-> Credits');
									gotoxy(x,y);
									end;
						33619749,7181 : begin 
								  if yy=3 then newload:='new';
								  if yy=5 then newload:='load'; 
									end;
					end;
					case yy of
					1 : begin gotoxy(xx,yy); write(' '); gotoxy(xx,yy); yy:=3; gotoxy(xx,yy); write('*');end;
					7 : begin gotoxy(xx,yy); write(' '); gotoxy(xx,yy); yy:=5; gotoxy(xx,yy); write('*');end;
					end;
					gotoxy(xx,yy);
				until (kk=7181)or(kk=33619749)or(kk=33619747)or(kk=3592);
			end;
		
		5 : begin
				clrscr;
				writeln(' ------------------------- ECHECS ---------------------------');
				writeln;
				writeln('Les regles des echecs sont tres simples.'); 
				writeln;
				writeln('Le premier joueur mettant le second en echec & mat remporte la partie.');
				writeln;
				writeln('Dans cette version, les deux joueurs possedent un timer de 10min chacun.');
				writeln;
				writeln('Si le timer d''un joueur est egale a 0, alors son temps de jeu est ecoule et implique directement une victoire de');
				writeln('l''adversaire.');
				writeln;
				writeln('Le deplacement de chaque piece est different et suit des lois specifiques pour chaque piece.');
				writeln(' (-> se referer au rapport ecrit pour connaitre le deplacement de chaque piece)');
				writeln;
				writeln('Enfin, la partie est nulle lorsque l''un des joueurs n''est pas en echec et ne peut deplacer une piece sans mettre');
				writeln('son roi en danger.');
				writeln;
				writeln('Maintenant que vous connaissez les regles, bonne chance a vous deux et que le meilleur gagne !');
				writeln;
				writeln('                                                                                           <--');
				writeln('*');gotoxy(1,21);
				repeat
				kk:= getkeyevent;
				kk:=translatekeyevent(kk);
				until (kk=33619747)or(kk=3592);
				gotoxy(1,1);
				clrscr;
				writeln(' ------------------------- ECHECS ---------------------------');
				writeln;
				writeln('  ', '-> Jouer une partie'); 
				writeln;
				writeln('  ', '-> Regles du jeu');
				writeln;
				writeln('  ', '-> Credits');
				gotoxy(x,y);
			end;
			
		7 : begin
				clrscr;
				writeln(' ------------------------- ECHECS ---------------------------');
				writeln;
				writeln('Ce jeu vous est propose par Simon MORIN, SALLE Pascale et Kevin GATEL');
				for i:=1 to 14 do writeln;
				writeln('                            INSA STPI 2 - Projet Info - decembre 2019');
				writeln;
				writeln('                                                                   <--');
				writeln('*');gotoxy(1,21);
				repeat 
				kk:= getkeyevent;
				kk:=translatekeyevent(kk);
				until (kk=33619747)or(kk=3592);
				gotoxy(1,1);
			clrscr;
			writeln(' ------------------------- ECHECS ---------------------------');
			writeln;
			writeln('  ', '-> Jouer une partie'); 
			writeln;
			writeln('  ', '-> Regles du jeu');
			writeln;
			writeln('  ', '-> Credits');
			gotoxy(x,y);
			end;
end;

end;
			
{programme principal}
begin
	//menu
	gotoxy(1,1);
	clrscr;
	writeln(' ------------------------- ECHECS ---------------------------');
	writeln;
	writeln('  ', '-> Jouer une partie'); 
	writeln;
	writeln('  ', '-> Regles du jeu');
	writeln;
	writeln('  ', '-> Credits');
	initkeyboard;
	x:=1;y:=3;
	repeat
gotoxy(x,y);
	write('*');
	gotoxy(x,y);
k:= getkeyevent;
k:=translatekeyevent(k); 
		case k of
				33619751 : begin gotoxy(x,y); write(' '); gotoxy(x,y); y:=y+2; gotoxy(x,y); write('*'); end;
				33619745 : begin gotoxy(x,y); write(' '); gotoxy(x,y); y:=y-2; gotoxy(x,y); write('*'); end; 
				33619749 : menu(y,kk,newload);
				7181 : menu(y,kk,newload);
		end;
		case y of
				1 : begin gotoxy(x,y); write(' '); gotoxy(x,y); y:=3; gotoxy(x,y); write('*');end;
				9 : begin gotoxy(x,y); write(' '); gotoxy(x,y); y:=7; gotoxy(x,y); write('*');end;
		end;
		gotoxy(x,y);
		
until ((k=7181)or(k=33619749)) and (kk<>33619747)and(kk<>3592);
donekeyboard;
	vf:=true;
	a:=1;
	r1:=0; 						//variable=0 si le roi blanc n'a pas encore bougé, sinon 1
	r2:=0; 						//variable=0 si le roi noir n'a pas encore bougé, sinon 1
	t1:=0; 	
	t11:=0;			//variable=0 si la tour blanche n'a pas encore bougé, sinon 1
	t2:=0; 	
	t22:=0;
	compteur:=1;
	x3tab:=-1;
	x4tab:=-1;
	x5tab:=-1;
	x6tab:=-1;
	y3tab:=-1;
	y4tab:=-1;
	y5tab:=-1;
	y6tab:=-1;
	constanteposition:=1;
	echecmat:=false;
	pat0:=false;
	gettime(h,m,s,cent);
	tempsdebase1:=(h*3600+m*60+s);
	tempsdebase2:=(h*3600+m*60+s);
	delay1:=0;
	delay2:=0;
	delay11:=0;
	delay22:=0;
	selectionimpossible:=false;
	minute2:=10;
	seconde2:=0;
	minute:=10;
	seconde:=0;
	pp1:='pp1';
	pp2:='pp2';
	nouvellegame:=true;
	case newload of 
				'new'  : initialisation();
				'load' : begin load(a,r1,r2,t1,t11,t2,t22,compteur,t,ss,tempsdebase1,tempsdebase2,delay1,delay2,minute,seconde,minute2,seconde2,constanteposition,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,x1,y1,x2,y2,pp1,pp2,p3,p4,echec);end;
	end;
	gettime(h,m,s,cent);
	temps_debut_program:=(h*3600+m*60+s);
	t:=(h*3600+m*60+s);
	ss:=(h*3600+m*60+s);
	tps_initial1:=60*minute+seconde;
	tps_initial2:=60*minute2+seconde2;
	
	sdl_init(sdl_init_video);
	tailletext.w:=800;
	tailletext.h:=72;
	window :=sdl_setvideomode(surfacelargeur, surfacelongueur, 32, sdl_swsurface);
	loadimage();
	damier();
	affichage();
	sdl_flip(window);
	repetitionechec:=0;
	repetitionpat:=0;
	tailletext.x:=80;
	tailletext.y:=500;
	
	sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
	if a=1 then begin sdl_blitsurface(joueur1avousdejouer, nil, window, @tailletext); p1:=pp1 end;
	if a=2 then begin sdl_blitsurface(joueur2avousdejouer, nil, window, @tailletext); p1:=pp2 end;
	begin{curseur}
		xcursor:=1; cursor.x:=xcursor;
		ycursor:=1; cursor.y:=ycursor;
		cursor.w:=imagelargeur;
		cursor.h:=imagelongueur;
		x:=2;y:=2;	
	repeat
	timer(a,tempsdebase1,tempsdebase2,temps_debut_program,delay11,delay22,t,tt,ss,sss,minute,seconde,minute2,seconde2,delay1,delay2,tps_initial1,tps_initial2,wsh1,wsh2);
		if (repetitionpat=0)and(vf=true) then
		begin pat(a,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,p1,p2,pp1,pp2,constanteposition,x1,y1,x2,y2,pat0,nouvellegame); repetitionpat:=1; end;
		if pat0=false then
		begin
		echek(a,echec);
		if (echec=true)and(repetitionechec=0) then
			begin
				repetitionechec:=1;
				tailletext.x:=80;
				tailletext.y:=500;
					sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
	
				if a=1 then
				sdl_blitsurface(joueur1vousetesenechec, nil, window, @tailletext);sdl_flip(window);
				if a=2 then	
				sdl_blitsurface(joueur2vousetesenechec, nil, window, @tailletext);sdl_flip(window);
			end;
		save(a,r1,r2,t1,t11,t2,t22,compteur,t,ss,tempsdebase1,tempsdebase2,delay1,delay2,minute,seconde,minute2,seconde2,constanteposition,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,x1,y1,x2,y2,pp1,pp2,p3,p4,echec);
		sdl_blitsurface(curseur,nil, window,@cursor);sdl_flip(window);

		NEW(test_event);



  IF SDL_POLLEVENT(test_event)=1 THEN
  BEGIN
    timer(a,tempsdebase1,tempsdebase2,temps_debut_program,delay11,delay22,t,tt,ss,sss,minute,seconde,minute2,seconde2,delay1,delay2,tps_initial1,tps_initial2,wsh1,wsh2);

    CASE test_event^.type_ OF
      
      SDL_KEYDOWN: BEGIN
                    
                     {SDLKey 27 = ESCAPE}
                     
                     case test_event^.key.keysym.sym of
						273 : 	begin 
								
								case (y div 2) of 
								1, 3, 5, 7 :case (((x-2) div 4)+1) of 
											1, 3, 5, 7 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											end;
								2, 4, 6, 8 :case (((x-2) div 4)+1) of
											1, 3, 5, 7 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											end;
		
								end;
								
								ycursor:=ycursor-imagelongueur;
								y:=y-2; 
								if ycursor=1-imagelongueur then ycursor:=1;
								if y=0 then y:=2;		
								cursor.y:=ycursor;sdl_blitsurface(curseur,nil, window,@cursor);sdl_flip(window);
								end;
						274 : 	begin 
								
								case (y div 2) of 
								1, 3, 5, 7 :case (((x-2) div 4)+1) of 
											1, 3, 5, 7 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											end;
								2, 4, 6, 8 :case (((x-2) div 4)+1) of
											1, 3, 5, 7 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											end;
		
								end;
								
								ycursor:=ycursor+imagelongueur;
								y:=y+2;
								if ycursor=1+8*imagelongueur then ycursor:=1+7*imagelongueur;
								if y=18 then y:=16;
								 
								
								cursor.y:=ycursor;sdl_blitsurface(curseur,nil, window,@cursor);sdl_flip(window);
								end;
						 
						276 : 	begin 
								case (y div 2) of 
								1, 3, 5, 7 :case (((x-2) div 4)+1) of 
											1, 3, 5, 7 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											end;
								2, 4, 6, 8 :case (((x-2) div 4)+1) of
											1, 3, 5, 7 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											end;
		
								end;
								
								xcursor:=xcursor-imagelargeur; 
								x:=x-4;
								if xcursor=1-imagelargeur then xcursor:=1;
								if x=-2 then x:=2;
								cursor.x:=xcursor;sdl_blitsurface(curseur,nil, window,@cursor);sdl_flip(window);
								end;
						275 : 	begin 
								case (y div 2) of 
								1, 3, 5, 7 :case (((x-2) div 4)+1) of 
											1, 3, 5, 7 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											end;
								2, 4, 6, 8 :case (((x-2) div 4)+1) of
											1, 3, 5, 7 : begin sdl_blitsurface(curseurnoir,nil, window,@cursor);sdl_flip(window);end;
											2, 4, 6, 8 : begin sdl_blitsurface(curseurblanc,nil, window,@cursor);sdl_flip(window);end;
											end;
		
								end;
								xcursor:=xcursor+imagelargeur;
								x:=x+4;
								if xcursor=1+8*imagelargeur then xcursor:=1+7*imagelargeur;
								if x=34 then x:=30;
								
								
								cursor.x:=xcursor;sdl_blitsurface(curseur,nil, window,@cursor);sdl_flip(window);
								end;
						27  : loop:=TRUE;
						13  : begin deplacement(tempsdebase1,tempsdebase2,temps_debut_program,t,tt,ss,sss,minute,seconde,minute2,seconde2,delay1,delay2,delay11,delay22,tps_initial1,tps_initial2,x,y,cste,a,r1,r2,t1,t11,t2,t22,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,compteur,p1,p2,p3,p4,echecmat,prise_en_passant0,wsh1,wsh2,echec,vf,selectionimpossible); 
									repetitionpat:=0; repetitionechec:=0; 
							  end;

						end;
                     
                   END;
      SDL_KEYUP: ;
      SDL_MOUSEMOTION: ;
      SDL_MOUSEBUTTONDOWN:;
      SDL_MOUSEBUTTONUP: ;
      
      
    END;
  END
  ELSE timer(a,tempsdebase1,tempsdebase2,temps_debut_program,delay11,delay22,t,tt,ss,sss,minute,seconde,minute2,seconde2,delay1,delay2,tps_initial1,tps_initial2,wsh1,wsh2) end;

	echek(a,echec);
	if echec=true then
	begin
	echekmat(a,echecmat);
			if echecmat=true then
				begin
					tailletext.x:=80;
					tailletext.y:=500;
					sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
					if a=2 then 
						begin sdl_blitsurface(echecetmatlejoueur1lemporte, nil, window, @tailletext);sdl_flip(window);end;
					if a=1 then 
						begin sdl_blitsurface(echecetmatlejoueur2lemporte, nil, window, @tailletext);sdl_flip(window);end;
				end;
	end;

until((loop=true) or (echecmat=true)or(pat0=true) or ( (minute=0)and(seconde=0) ) or ((minute2=0)and(seconde2=0)));


DISPOSE(test_event);
		
		
		
		if (minute=0) and (seconde=0) then
		begin
		tailletext.x:=80;
		tailletext.y:=500;
		sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
		sdl_blitsurface(patte, nil, window, @tailletext);sdl_flip(window);
		textbackground(black); textcolor(2); writeln('Victoire du joueur 2');
		end;
		
		if (minute2=0) and (seconde2=0) then
		begin
		tailletext.x:=80;
		tailletext.y:=500;
		sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
		sdl_blitsurface(patte, nil, window, @tailletext);sdl_flip(window);
		textbackground(black); textcolor(2); writeln('Victoire du joueur 1');
		end;
		if pat0=true then
		begin
		tailletext.x:=80;
		tailletext.y:=500;
		sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
		sdl_blitsurface(patte, nil, window, @tailletext);sdl_flip(window);
		textbackground(black); textcolor(2); writeln('Egalite');
		end;
		if loop=true then
		begin
		tailletext.x:=80;
		tailletext.y:=500;
		sdl_blitsurface(textnoir, nil, window, @tailletext);sdl_flip(window);
		sdl_blitsurface(partieterminee, nil, window, @tailletext);sdl_flip(window);
		end;
		delay(500);
		repeat
		SDL_POLLEVENT(test_event);
	    if test_event^.type_ = SDL_KEYDOWN then
        until test_event^.key.keysym.sym<>13;
        freeimagecase();
		sdl_freesurface(window);
		sdl_quit();
		
	end;{curseur}
if echecmat=true then begin textbackground(black); textcolor(2); case a of 1:a:=2;2:a:=1; end; writeln('Victoire du joueur ',a); end;
end.
