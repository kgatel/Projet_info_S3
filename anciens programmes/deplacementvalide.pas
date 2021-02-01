unit deplacementvalide;

interface
uses crt;
var i,casepleine,casepleine2,c1,c2,constante,constante2 : integer;
	echec: boolean;

procedure deplacementvalide(xtab,x2tab,ytab,y2tab,a : integer ; p1,p2 : string; var vf,roque : boolean);

implementation

procedure deplacementvalide(xtab,x2tab,ytab,y2tab,a : integer ; p1,p2 : string; var vf,roque : boolean);
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

procedure pat(a : integer; var pat0 : boolean);
var xtab,ytab,x2tab,y2tab,xroib,yroib,xroin,yroin,c1,c2,constante,constante2,casepleine,casepleine2 : integer;
	p1,p2 : string;
	vf,roque,echec : boolean;
begin
	vf:=false;
	roque:=false;
	pat0:=true;
	echec:=false;
	for xtab:=1 to 8 do
		for ytab:=1 to 8 do
		begin
			p1:=tab[xtab,ytab];
			for x2tab:=1 to 8 do
				for y2tab:=1 to 8 do
				begin
					p2:=tab[x2tab,y2tab];
					//deplacement valide
					deplacementvalide(xtab,x2tab,ytab,y2tab,a,p1,p2,vf,roque);
					if vf=true then
					begin
						tab[xtab,ytab]:='vide';
						tab[x2tab,y2tab]:=p1;
						echek(a,echec);
						tab[xtab,ytab]:= p1;
						tab[x2tab,y2tab]:= p2;
					if (echec=false) then
						begin
						case a of
							1: begin if ((p1='pionb')or(p1='tourb')or(p1='cavalierb')or(p1='reineb')or(p1='roib')or(p1='foub')) then begin pat0:=false end; end;
							2: begin if ((p1='pionn')or(p1='tourn')or(p1='cavaliern')or(p1='reinen')or(p1='roin')or(p1='foun')) then begin pat0:=false end; end;
						end;
						end;
					end;
				end;
		end;
end;
