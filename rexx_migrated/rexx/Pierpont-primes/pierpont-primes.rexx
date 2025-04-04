/*ช*REXX program finds and displays  Pierpont primes  of the  first  and  second  kinds.  */
parse arg n .                                    /*ช*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 50                    /*ช*Not specified?  Then use the default.*/
numeric digits n                                 /*ช*ensure enough decimal digs (bit int).*/
big= copies(9, digits() )                        /*ช*BIG:  used as a max number (a limit).*/
newV1.= '2nd';                      newV1.1= '1st'
do t=1  to -1  by -2;   usum= 0;   vsum= 0;    s= 0       /*ช*T  is  1,  then  -1.*/
newV2= 0                                     /*ช*number of Pierpont primes  (so far). */
newV3=;    do j=0  until newV2>=n                /*ช*$:   the list  "  "      "      "    */
if usum<=s  then usum= get(2, 3);    if vsum<=s  then vsum= get(3, 2)
s= min(vsum, usum);  if \isPrime(s)  then iterate /*ช*get min;  Not prime? */
newV2= newV2 + 1;            newV3= newV3 s                       /*ช*bump counter; append.*/
end   /*ช*j*/
say
w= length(word(newV3, newV2) )                                   /*ช*biggest prime length.*/
say center(n   " Pierpont primes of the "   newV1.t ' kind',  max(10 *(w+1), 80), "โ")

do p=1  by 10  to newV2;      newV4=;      do k=p  for 10;   newV4= newV4 right( word(newV3, k),  w)
end   /*ช*k*/
if newV4\==''  then say substr( strip(newV4, "T"),  2)
end   /*ช*p*/
end     /*ช*t*/
exit 0                                           /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
isPrime: procedure; parse arg x '' -1 newV4; if x<17  then return wordpos(x,"2 3 5 7 11 13")>0
if newV4==5  then return 0;           if x//2==0  then return 0       /*ช*not prime. */
if x//3==0  then return 0;        if x//7==0  then return 0       /*ช* "    "    */
do j=11  by 6  until j*j>x                                     /*ช*skip รท 3's.*/
if x//j==0  then return 0;  if x//(j+2)==0  then return 0      /*ช*not prime. */
end   /*ช*j*/;                                     return 1      /*ช*it's prime.*/
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
get: parse arg c1,c2; m=big;  do   ju=0;  pu= c1**ju;  if pu+t>s  then return min(m, pu+t)
do jv=0;  pv= c2**jv;  if pv  >s  then iterate ju
newV4= pu*pv  +  t;        if newV4   >s  then m= min(newV4, m)
end   /*ช*jv*/
end     /*ช*ju*/           /*ช*see the    RETURN    (above).  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pierpont-primes\pierpont-primes.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
