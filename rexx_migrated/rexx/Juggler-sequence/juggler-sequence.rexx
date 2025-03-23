/*�*REXX program  calculates and displays  the  juggler sequence  for any positive integer*/
numeric digits 20                                /*�*define the number of decimal digits. */
parse arg LO HI list                             /*�*obtain optional arguments from the CL*/
if LO='' | LO=","  then do; LO= 20; HI= 39; end  /*�*Not specified?  Then use the default.*/
if HI='' | HI=","  then HI= LO                   /*�* "      "         "   "   "     "    */
w= length( commas(HI) )                          /*�*find the max width of any number  N. */
d= digits();     dd= d + d%3 + 1                 /*�*get # numeric digits; another version*/
if LO>0  then say c('n',w)    c("steps",7)    c('maxIndex',8)   c("biggest term"    ,dd)
if LO>0  then say c('' ,w,.)  c(""     ,7,.)  c(''        ,8,.) c(""                ,dd,.)

do n=LO  to HI while n>0; steps= juggler(n)  /*�*invoke JUGGLER: find the juggler num.*/
nc= commas(n)                                /*�*maybe add commas to  N.              */
say right(nc, w)      c(steps, 8)     c(imx, 8)      right( commas(mx), dd-1)
end   /*�*n*/
/*�*biggest term isn't shown for list #s.*/
xtra= words(list)                                /*�*determine how many numbers in list.  */
if xtra==0  then exit 0                          /*�*no special ginormous juggler numbers?*/
w= max(9, length( commas( word(list, xtra) ) ) ) /*�*find the max width of any list number*/
say;             say;             say
say c('n',w)     c("steps",7)     c('maxIndex',8)     c("max number of digits",dd)
say c('' ,w,.)   c(""     ,7,.)   c(''        ,8,.)   c(""                    ,dd,.)

do p=1  for xtra;     n= word(list, p)  /*�*process each of the numbers in list. */
steps= juggler(n);    nc= commas(n)     /*�*get a number & pass it on to JUGGLER.*/
say right(nc, w)   c(steps, 8)   c(imx, 8)      right( commas(length(mx)), dd-1)
end   /*�*p*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
c:      parse arg c1,c2,c3; if c3==''  then c3= ' '; else c3= '─'; return center(c1,c2,c3)
commas: parse arg newV2;  do jc=length(newV2)-3  to 1  by -3; newV2=insert(',', newV2, jc); end;  return newV2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Isqrt:  procedure; parse arg x;  q= 1;  r= 0     /*�*obtain X;  R  will be the Isqrt(X).  */
do until q>x;  q= q * 4               /*�*multiply   Q   by four until > X.    */
end   /*�*until*/
do while q>1;  q= q % 4           /*�*processing while Q>1;  quarter Q.    */
t= x - r - q;  r= r % 2           /*�*set T ──► X-R-Q;       halve R.      */
if t>=0  then do; x= t; r= r + q  /*�*T≥0?  Then set X ──► T;  add Q ──► R.*/
end
end   /*�*while*/;    return r      /*�*return the integer square root of  X.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
juggler: parse arg newV3;  imx= 0;  mx= newV3            /*�*get N;  set index of MX and MX ──► 0.*/
newV1.=0; newV1.1=1; newV1.3=1; newV1.5=1; newV1.7=1; newV1.9=1 /*�*set semaphores (≡1) for odd dec. digs*/
do j=1  until z==1                    /*�*here is where we begin to juggle.    */
parse var  newV3  ''  -1  newV4               /*�*obtain the last decimal digit of  #. */
if newV1.newV4  then do;       cube= newV3*newV3*newV3    /*�*Odd? Then compute integer sqrt(#**3).*/
if pos(., cube)>0  then do    /*�*need to increase decimal digits.*/
parse var  cube    with    'E'  x
if x>=digits()  then numeric digits x+2
end
z= Isqrt(newV3*newV3*newV3)          /*�*compute the integer sqrt(#**3)       */
end
else z= Isqrt(newV3)              /*�*Even? Then compute integer sqrt(#).  */
L= length(z)
if L>=d  then numeric digits L+1      /*�*reduce the number of numeric digits. */
if z>mx  then do;  mx= z; imx= j; end /*�*found a new max;  set MX;  set IMX.  */
newV3= z
end   /*�*j*/;                 return j
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Juggler-sequence\juggler-sequence.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
