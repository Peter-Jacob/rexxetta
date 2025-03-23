/*�*REXX program computes some  primorial numbers  for low numbers,  and for various 10^n.*/
parse arg N H .                                  /*�*get optional arguments:  N,  L,  H   */
if N=='' | N==','  then N=     10                /*�*Not specified?  Then use the default.*/
if H=='' | H==','  then H= 100000                /*�* "      "         "   "   "     "    */
numeric digits 600000                            /*�*be able to handle gihugic numbers.   */
w= length( commas( digits() ) )                  /*�*W:  width of the largest commatized #*/
newV1.=.; newV1.0= 1;  newV1.1= 2;  newV1.2= 3;  newV1.3=  5; newV1.4=  7; newV1.5=  11; newV1.6=  13 /*�*some low primes.*/
s.1= 4;  s.2= 9;  s.3= 25; s.4= 49; s.5= 121; s.6= 169 /*�*squared primes. */
newV2= 6                                                                  /*�*number of primes*/
do j=0  for N                               /*�*calculate the first  N  primorial #s.*/
say right(j, length(N))th(j)   " primorial is: "    right(commas(primorial(j) ), N+2)
end   /*�*j*/
say
iw= length( commas(H) ) + 2                      /*�*IW: width of largest commatized index*/
p= 1                                             /*�*initialize the first multiplier for P*/
do k=1  for H                               /*�*process a large range of numbers.    */
p= p * prime(k)                             /*�*calculate the next primorial number. */
parse var  k   L  2  ''  -1  R              /*�*get the left and rightmost dec digits*/
if R\==0              then iterate          /*�*if right─most decimal digit\==0, skip*/
if L\==1              then iterate          /*�* "  left─most    "      "  \==1,   " */
if strip(k, , 0)\==1  then iterate          /*�*Not a power of 10?  Then skip this K.*/
say right( commas(k), iw)th(k)     ' primorial number length in decimal digits is:' ,
right( commas( length(p) ), w)
end   /*�*k*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas:  parse arg newV3;  do newV4=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, newV4); end;   return newV3
th:      parse arg th; return word('th st nd rd', 1+ (th//10)*(th//100%10\==1)*(th//10<4))
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
primorial: procedure expose newV1. s. newV2;  parse arg y;    newV5= 1         /*�*obtain the arg  Y. */
do p=0  to y;   newV5= newV5 * prime(p)                     /*�*calculate product. */
end   /*�*p*/;                           return newV5     /*�*return with the #. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
prime: procedure expose newV1. s. newV2; parse arg n;  if newV1.n\==.  then return newV1.n
numeric digits 9                                             /*�*limit digs to min.*/
do j=newV1.newV2+2  by 2                                           /*�*start looking at #*/
if j//2==0  then iterate;     if j//3==0    then iterate   /*�*divisible by 2│3 ?*/
parse var  j   ''  -1  newV3;     if newV3==5       then iterate   /*�*right─most dig����ֵ5? */
if j//7==0  then iterate;     if j//11==0   then iterate   /*�*divisible by 7│11?*/
do k=6  while s.k<=j;     if j//newV1.k==0  then iterate j /*�*divide by primes. */
end   /*�*k*/
newV2= newV2 + 1;         newV1.newV2= j;     s.newV2= j * j;        return j  /*�*next prime; return*/
end     /*�*j*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Primorial-numbers\primorial-numbers.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
