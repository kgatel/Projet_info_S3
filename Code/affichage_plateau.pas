unit affichage_plateau;

interface

uses sdl, sdl_image,sdl_ttf, Crt,Classes, SysUtils, dos,keyboard;

var a,r1,r2,t1,t11,t22,t2,i,j,repetitionechec,repetitionpat,constanteposition,x1,y1,x2,y2 : integer;
	tab : array [1..8,1..8] of string;
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
	
const 	adresse ='data/sauvegarde.txt';
		surfacelargeur=900;
		surfacelongueur=600;
		imagelargeur=60;
		imagelongueur=60;
	
procedure damier();
{procedure initialisation();
procedure save(a,r1,r2,t1,t11,t2,t22,compteur,t,ss,tempsdebase1,tempsdebase2,delay1,delay2,minute,seconde,minute2,seconde2,constanteposition,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,x1,y1,x2,y2: integer; pp1,pp2,p3,p4 : string; echec : boolean);
procedure load(var a,r1,r2,t1,t11,t2,t22,compteur,t,ss,tempsdebase1,tempsdebase2,delay1,delay2,minute,seconde,minute2,seconde2,constanteposition,x3tab,y3tab,x4tab,y4tab,x5tab,y5tab,x6tab,y6tab,x1,y1,x2,y2 :integer ; var pp1,pp2,p3,p4 : string; var echec : boolean);
procedure loadimage();
procedure freeimagecase();
procedure affichage();}

implementation

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


END.



