/*ª*REXX program  calculates and displays  the  juggler sequence  for any positive integer*/
numeric digits 20                                /*ª*define the number of decimal digits. */
parse arg LO HI list                             /*ª*obtain optional arguments from the CL*/
if LO='' | LO=","  then do; LO= 20; HI= 39; end  /*ª*Not specified?  Then use the default.*/
if HI='' | HI=","  then HI= LO                   /*ª* "      "         "   "   "     "    */
w= length( commas(HI) )                          /*ª*find the max width of any number  N. */
d= digits();     dd= d + d%3 + 1                 /*ª*get # numeric digits; another version*/
if LO>0  then say c('n',w)    c("steps",7)    c('maxIndex',8)   c("biggest term"    ,dd)
if LO>0  then say c('' ,w,.)  c(""     ,7,.)  c(''        ,8,.) c(""                ,dd,.)

do n=LO  to HI while n>0; steps= juggler(n)  /*ª*invoke JUGGLER: find the juggler num.*/
nc= commas(n)                                /*ª*maybe add commas to  N.              */
say right(nc, w)      c(steps, 8)     c(imx, 8)      right( commas(mx), dd-1)
end   /*ª*n*/
/*ª*biggest term isn't shown for list #s.*/
xtra= words(list)                                /*ª*determine how many numbers in list.  */
if xtra==0  then exit 0                          /*ª*no special ginormous juggler numbers?*/
w= max(9, length( commas( word(list, xtra) ) ) ) /*ª*find the max width of any list number*/
say;             say;             say
say c('n',w)     c("steps",7)     c('maxIndex',8)     c("max number of digits",dd)
say c('' ,w,.)   c(""     ,7,.)   c(''        ,8,.)   c(""                    ,dd,.)

do p=1  for xtra;     n= word(list, p)  /*ª*process each of the numbers in list. */
steps= juggler(n);    nc= commas(n)     /*ª*get a number & pass it on to JUGGLER.*/
say right(nc, w)   c(steps, 8)   c(imx, 8)      right( commas(length(mx)), dd-1)
end   /*ª*p*/
exit 0                                           /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
c:      parse arg c1,c2,c3; if c3==''  then c3= ' '; else c3= 'â'; return center(c1,c2,c3)
commas: parse arg newV2;  do jc=length(newV2)-3  to 1  by -3; newV2=insert(',', newV2, jc); end;  return newV2
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
Isqrt:  procedure; parse arg x;  q= 1;  r= 0     /*ª*obtain X;  R  will be the Isqrt(X).  */
do until q>x;  q= q * 4               /*ª*multiply   Q   by four until > X.    */
end   /*ª*until*/
do while q>1;  q= q % 4           /*ª*processing while Q>1;  quarter Q.    */
t= x - r - q;  r= r % 2           /*ª*set T âââº X-R-Q;       halve R.      */
if t>=0  then do; x= t; r= r + q  /*ª*Tâ¥0?  Then set X âââº T;  add Q âââº R.*/
end
end   /*ª*while*/;    return r      /*ª*return the integer square root of  X.*/
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
juggler: parse arg newV3;  imx= 0;  mx= newV3            /*ª*get N;  set index of MX and MX âââº 0.*/
newV1.=0; newV1.1=1; newV1.3=1; newV1.5=1; newV1.7=1; newV1.9=1 /*ª*set semaphores (â¡1) for odd dec. digs*/
do j=1  until z==1                    /*ª*here is where we begin to juggle.    */
parse var  newV3  ''  -1  newV4               /*ª*obtain the last decimal digit of  #. */
if newV1.newV4  then do;       cube= newV3*newV3*newV3    /*ª*Odd? Then compute integer sqrt(#**3).*/
if pos(., cube)>0  then do    /*ª*need to increase decimal digits.*/
parse var  cube    with    'E'  x
if x>=digits()  then numeric digits x+2
end
z= Isqrt(newV3*newV3*newV3)          /*ª*compute the integer sqrt(#**3)       */
end
else z= Isqrt(newV3)              /*ª*Even? Then compute integer sqrt(#).  */
L= length(z)
if L>=d  then numeric digits L+1      /*ª*reduce the number of numeric digits. */
if z>mx  then do;  mx= z; imx= j; end /*ª*found a new max;  set MX;  set IMX.  */
newV3= z
end   /*ª*j*/;                 return j
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Juggler-sequence\juggler-sequence.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
