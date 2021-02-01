unit utils;

interface

uses sdl, sdl_image,sdl_ttf, Crt,keyboard,Classes, SysUtils, Process, dos;

var	window, typecase,curseur, curseurblanc, curseurnoir, caseblanc, casenoir, caseroque, casedeplacementvide, casedeplacementpiece, casedeplacementechec, roiblanc, roinoir, reineblanc, reinenoir, tourblanc, tournoir, cavalierblanc, cavaliernoir, foublanc, founoir, pionblanc, pionnoir, textnoir :psdl_surface;
	votredeplacementestinvalide,veuillezchoisirunedevospieces,joueur1avousdejouer,joueur2avousdejouer, quellepiecevoulezvouschoisir, deplacementnonvalidevousdevezprotegervotreroi, ouvoulezvousdeplacervotrepiece, joueur1vousetesenechec, joueur2vousetesenechec,echecetmatlejoueur1lemporte,echecetmatlejoueur2lemporte,patte,partieterminee : psdl_surface;
	position, other, tailletext, cursor : tsdl_rect;
	i,j : integer;
const 	adresse ='data\sauve.txt';
		surfacelargeur=900;
		surfacelongueur=800;
		imagelargeur=80;
		imagelongueur=80;
procedure damier();
procedure freeimagecase();
procedure loadimage();
procedure timer(a,tempsdebase1,tempsdebase2,temps_debut_program,delay11,delay22,t,tt,ss,sss,minute,seconde,minute2,seconde2,delay1,delay2,tps_initial1,tps_initial2,wsh1,wsh2 : integer);


implementation

procedure timer(a,tempsdebase1,tempsdebase2,temps_debut_program,delay11,delay22,t,tt,ss,sss,minute,seconde,minute2,seconde2,delay1,delay2,tps_initial1,tps_initial2,wsh1,wsh2 : integer);
begin
end;



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



end.
