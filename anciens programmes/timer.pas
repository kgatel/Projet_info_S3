program timer;
uses dos;
var h,he,m,min,s,sec,cent,centieme : word;
	t,tt,tempsdebase : real;

begin
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


end.
