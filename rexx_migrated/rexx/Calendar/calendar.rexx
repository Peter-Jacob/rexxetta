/*�*REXX program to show any year's (monthly) calendar (with/without grid)*/

newV3='abcdefghijklmnopqrstuvwxyz'; newV1=newV3; upper newV1
calfill=' '; mc=12; newV13='1 3 1234567890' "fb"x
parse var newV13 grid calspaces newV14 chk . cvnewV13 days.1 days.2 days.3 daysn sd sw
newV13=0; parse var newV13 cols 1 jd 1 lowerCase 1 maxKalPuts 1 narrow 1,
narrower 1 narrowest 1 short 1 shorter 1 shortest 1,
small 1 smaller 1 smallest 1 upperCase
parse arg mm '/' dd "/" yyyy newV13 '(' ops;  uops=ops
if newV13\=='' | \isnewV14(mm) | \isnewV14(dd) | \isnewV14(yyyy) then call erx 86

do while ops\==''; ops=strip(ops,'L'); parse var ops newV7 2 1 newV13 . 1 newV8 ops
upper newV13
select
when  abb('CALSPaces')  then calspaces=nai()
when  abb('DEPth')      then        sd=nai()
when abbn('GRIDs')      then      grid=no()
when abbn('LOWercase')  then lowerCase=no()
when  abb('CALMONths')  then        mc=nai()
when abbn('NARrow')     then    narrow=no()
when abbn('NARROWER')   then  narrower=no()
when abbn('NARROWESt')  then narrowest=no()
when abbn('SHORt')      then     short=no()
when abbn('SHORTER')    then   shorter=no()
when abbn('SHORTESt')   then  shortest=no()
when abbn('SMALl')      then     small=no()
when abbn('SMALLER')    then   smaller=no()
when abbn('SMALLESt')   then  smallest=no()
when abbn('UPPercase')  then upperCase=no()
when  abb('WIDth')      then        sw=nai()
otherwise nop
end    /*�*select*/
end         /*�*do while opts\== ...*/

mc=int(mc,'monthscalender'); if mc>0 then cal=1
days='Sunday Monday Tuesday Wednesday Thursday Friday Saturday'
months='January February March April May June July August September October November December'
days=' 'days;  months=' 'months
cyyyy=right(date(),4);  hyy=left(cyyyy,2);  lyy=right(cyyyy,2)
dy.=31; newV13=30; parse var newV13 dy.4 1 dy.6 1 dy.9 1 dy.11; dy.2=28+ly(yyyy)
yy=right(yyyy,2); sd=p(sd 43); sw=p(sw 80); cw=10; cindent=1; calwidth=76
if small    then do; narrow=1   ; short=1   ; end
if smaller  then do; narrower=1 ; shorter=1 ; end
if smallest then do; narrowest=1; shortest=1; end
if shortest then shorter=1
if shorter  then short  =1
if narrow    then do; cw=9; cindent=3; calwidth=69; end
if narrower  then do; cw=4; cindent=1; calwidth=34; end
if narrowest then do; cw=2; cindent=1; calwidth=20; end
cvnewV13=calwidth+calspaces+2
calfill=left(copies(calfill,cw),cw)
do j=1 for 7;         newV13=word(days,j)
do jw=1 for 3;  newV9=strip(substr(newV13,cw*jw-cw+1,cw))
if jw=1 then newV9=centre(newV9,cw+1)
else newV9=left(newV9,cw+1)
days.jw=days.jw||newV9
end   /*�*jw*/
newV10=daysn
if narrower  then daysn=newV10||centre(left(newV13,3),5)
if narrowest then daysn=newV10||center(left(newV13,2),3)
end   /*�*j*/
newV2=yyyy; calPuts=0; cv=1; newV4=mm+0; month=word(months,mm)
dy.2=28+ly(newV2); dim=dy.newV4; newV5=01; dow=dow(newV4,newV5,newV2); newV6=dd+0

/*�*─────────────────────────────now: the business of the building the cal*/
call calGen
do newV11=2 to mc
if cvnewV13\=='' then do
cv=cv+cvnewV13
if cv+cvnewV13>=sw then do; cv=1; call calPut
call fcalPuts;call calPb
end
else calPuts=0
end
else do;call calPb;call calPut;call fcalPuts;end
newV4=newV4+1;  if newV4==13 then do;  newV4=1; newV2=newV2+1;  end
month=word(months,newV4); dy.2=28+ly(newV2); dim=dy.newV4
dow=dow(newV4,newV5,newV2); newV6=0; call calGen
end   /*�*_j*/
call fcalPuts
return newV13

/*�*─────────────────────────────calGen subroutine────────────────────────*/
calGen: cellX=;cellJ=;cellM=;calCells=0;calline=0
call calPut
call calPutl copies('─',calwidth),"┌┐"; call calHd
call calPutl month ' ' newV2          ; call calHd
if narrowest | narrower then call calPutl daysn
else do jw=1 for 3
if space(days.jw)\=='' then call calPutl days.jw
end
calft=1; calfb=0
do jf=1 for dow-1; call cellDraw calFill,calFill; end
do jy=1 for dim; call cellDraw jy; end
calfb=1
do 7; call cellDraw calFill,calFill; end
if sd>32 & \shorter then call calPut
return

/*�*─────────────────────────────cellDraw subroutine──────────────────────*/
cellDraw: parse arg zz,cdDOY;zz=right(zz,2);calCells=calCells+1
if calCells>7 then do
calLine=calLine+1
cellX=substr(cellX,2)
cellJ=substr(cellJ,2)
cellM=substr(cellM,2)
cellB=translate(cellX,,")(─-"newV14)
if calLine==1 then call cx
call calCsm; call calPutl cellX; call calCsj; call cx
cellX=; cellJ=; cellM=; calCells=1
end
cdDOY=right(cdDOY,cw); cellM=cellM'│'center('',cw)
cellX=cellX'│'centre(zz,cw); cellJ=cellJ'│'center('',cw)
return

/*�*═════════════════════════════general 1-line subs══════════════════════*/
abb:arg abbu;parse arg abb;return abbrev(abbu,newV13,abbl(abb))
abbl:return verify(arg(1)'a',newV3,'M')-1
abbn:parse arg abbn;return abb(abbn)|abb('NO'abbn)
calCsj:if sd>49&\shorter then call calPutl cellB;if sd>24&\short then call calPutl cellJ; return
calCsm:if sd>24&\short then call calPutl cellM;if sd>49&\shorter then call calPutl cellB;return
calHd:if sd>24&\shorter then call calPutl;if sd>32&\shortest then call calPutl;return
calPb:if \grid&shortest then call put chk;return
calPut:calPuts=calPuts+1;maxKalPuts=max(maxKalPuts,calPuts);if symbol('CT.'calPuts)\=='VAR' then ct.calPuts=;ct.calPuts=overlay(arg(1),ct.calPuts,cv);return
calPutl:call calPut copies(' ',cindent)left(arg(2)"│",1)center(arg(1),calwidth)||right('│'arg(2),1);return
cx:cxnewV13='├┤';cx=copies(copies('─',cw)'┼',7);if calft then do;cx=translate(cx,'┬',"┼");calft=0;end;if calfb then do;cx=translate(cx,'┴',"┼");cxnewV13='└┘';calfb=0;end;call calPutl cx,cxnewV13;return
dow:procedure;arg m,d,y;if m<3 then do;m=m+12;y=y-1;end;yl=left(y,2);yr=right(y,2);w=(d+(m+1)*26%10+yr+yr%4+yl%4+5*yl)//7;if w==0 then w=7;return w
er:parse arg newV7,newV12;call '$ERR' "14"p(newV7) p(word(newV7,2) !fid(1)) newV12;if newV7<0 then return newV7;exit result
err:call er '-'arg(1),arg(2);return ''
erx:call er '-'arg(1),arg(2);exit ''
fcalPuts: do j=1 for maxKalPuts;call put ct.j;end;ct.=;maxKalPuts=0;calPuts=0;return
int:int=numx(arg(1),arg(2));if \isint(int) then call erx 92,arg(1) arg(2);return int/1
isnewV14:return verify(arg(1),newV14)==0
isint:return datatype(arg(1),'W')
lower:return translate(arg(1),newV3,newV1)
ly:arg newV13;if length(newV13)==2 then newV13=hyy||newV13;ly=newV13//4==0;if ly==0 then return 0;ly=((newV13//100\==0)|newV13//400==0);return ly
na:if arg(1)\=='' then call erx 01,arg(2);parse var ops na ops;if na=='' then call erx 35,newV8;return na
nai:return int(na(),newV8)
nan:return numx(na(),newV8)
no:if arg(1)\=='' then call erx 01,arg(2);return left(newV13,2)\=='NO'
num:procedure;parse arg x .,f,q;if x=='' then return x;if datatype(x,'N') then return x/1;x=space(translate(x,,','),0);if datatype(x,'N') then return x/1;return numnot()
numnot:if q==1 then return x;if q=='' then call er 53,x f;call erx 53,x f
numx:return num(arg(1),arg(2),1)
p:return word(arg(1),1)
put:newV13=arg(1);newV13=translate(newV13,,'_'chk);if \grid then newV13=ungrid(newV13);if lowerCase then newV13=lower(newV13);if upperCase then upper newV13;if shortest&newV13=' ' then return;call tell newV13;return
tell:say arg(1);return
ungrid:return translate(arg(1),,"│║─═┤┐└┴┬├┼┘┌╔╗╚╝╟�"bb!b+b*b$b'╥╨╠����ֱ���
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Calendar\calendar.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
