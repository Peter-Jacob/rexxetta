/*�*REXX program shows a    clockwise   Ulam spiral  of  primes  shown in a square matrix.*/
parse arg size init char .                       /*�*obtain optional arguments from the CL*/
if size=='' | size==","  then size= 79           /*�*Not specified?  Then use the default.*/
if init=='' | init==","  then init=  1           /*�* "      "         "   "   "     "    */
if char==''              then char= "█"          /*�* "      "         "   "   "     "    */
tot=size**2                                      /*�*the total number of numbers in spiral*/
/*�*define the upper/bottom right corners*/
uR.=0; bR.=0;   do od=1  by 2  to tot; newV4=od**2+init;  uR.newV4=1;  newV4=newV4+od;  bR.newV4=1; end /*�*od*/
/*�*define the bottom/upper left corners.*/
bL.=0; uL.=0;   do ev=2  by 2  to tot; newV4=ev**2+init;  bL.newV4=1;  newV4=newV4+ev;  uL.newV4=1; end /*�*ev*/

app=1;    bigP=0;    newV1=0;    inc=0;     minR=1;    maxR=1;    r=1;    newV5=0;    newV2.=;    newV3.=
/*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ construct the spiral #s.*/
do i=init  for tot;    r= r + inc;     minR= min(minR, r);      maxR= max(maxR, r)
x= isPrime(i);   if x  then bigP= max(bigP, i);          newV1= newV1 + x   /*�*bigP, #primes.*/
if app  then newV2.r= newV2.r ||  x                                           /*�*append  token.*/
else newV2.r=  x  || newV2.r                                          /*�*prepend token.*/
if uR.i  then do;  app= 1;  inc= +1;  iterate  /*�*i*/;    end          /*�*advance  ↓    */
if bL.i  then do;  app= 0;  inc= -1;  iterate  /*�*i*/;    end          /*�*   "     ↑    */
if bR.i  then do;  app= 0;  inc=  0;  iterate  /*�*i*/;    end          /*�*   "     ►    */
if uL.i  then do;  app= 1;  inc=  0;  iterate  /*�*i*/;    end          /*�*   "     ◄    */
end   /*�*i*/                                                           /*�* [↓] pack two */
/*�*lines ──► one.*/
do j=minR  to maxR  by 2;    jp= j + 1;              newV5= newV5 + 1         /*�*fold two lines*/
do k=1  for  length(newV2.j);  top= substr(newV2.j, k, 1)                   /*�*the  1st line.*/
bot= word( substr(newV2.jp, k, 1)   0, 1)    /*�*the  2nd line.*/
if top  then if  bot  then newV3.newV5= newV3.newV5'█'                              /*�*has top & bot.*/
else newV3.newV5= newV3.newV5'▀'                              /*�*has top,¬ bot.*/
else if  bot  then newV3.newV5= newV3.newV5'▄'                              /*�*¬ top, has bot*/
else newV3.newV5= newV3.newV5' '                              /*�*¬ top,   ¬ bot*/
end   /*�*k*/
end     /*�*j*/                                  /*�* [↓]  show the  prime  spiral matrix.*/
do m=1  for newV5;     say newV3.m;     end  /*�*m*/
say;  say init 'is the starting point,'  ,
tot  'numbers used,'   newV1   "primes found, largest prime:"   bigP
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isPrime: procedure; parse arg x;  if wordpos(x, '2 3 5 7 11 13 17 19') \==0  then return 1
if x<17  then return 0;                            if x// 2    ==0  then return 0
if x// 3    ==0  then return 0
/*�*get the last digit*/    parse var x  ''  -1  newV4;  if         newV4==5  then return 0
if x// 7    ==0  then return 0
if x//11    ==0  then return 0
if x//13    ==0  then return 0

do j=17  by 6  until  j*j > x;            if x//j     ==0  then return 0
if x//(j+2) ==0  then return 0
end   /*�*j*/;          return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Ulam-spiral-for-primes-\ulam-spiral-for-primes--2.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
