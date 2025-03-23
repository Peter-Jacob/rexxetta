/*�*REXX program finds and displays a number of  cuban  primes  or the  Nth  cuban prime. */
numeric digits 20                                /*�*ensure enough decimal digits for #s. */
parse arg N .                                    /*�*obtain optional argument from the CL.*/
if N=='' | N==","  then N= 200                   /*�*Not specified?  Then use the default.*/
Nth= N<0;               N= abs(N)                /*�*used for finding the Nth cuban prime.*/
newV1.=0; newV1.0=1; newV1.2=1; newV1.3=1; newV1.4=1; newV1.5=1; newV1.6=1; newV1.8=1  /*�*ending digs that aren't cubans.*/
sw= linesize() - 1;    if sw<1  then sw= 79      /*�*obtain width of the terminal screen. */
w=12;              newV2= 1;    newV3= right(7, w)       /*�*start with first cuban prime;  count.*/
do j=1  until newV2=>N;    x= (j+1)**3 - j**3   /*�*compute a possible cuban prime.      */
parse var x '' -1 newV4;   if newV1.newV4  then iterate /*�*check last digit for non─cuban prime.*/
do k=1  until km*km>x;  km= k*6 + 1  /*�*cuban primes can't be   ÷   by  6k+1 */
if x//km==0  then iterate j          /*�*Divisible?   Then not a cuban prime. */
end   /*�*k*/
newV2= newV2+1                                      /*�*bump the number of cuban primes found*/
if Nth  then do;  if newV2==N  then do;  say commas(x);  leave j;  end /*�*display 1 num.*/
else iterate /*�*j*/                      /*�*keep searching*/
end                            /*�* [↑]  try to fit as many #s per line.*/
cx= commas(x);  L= length(cx)               /*�*insert commas──►X; obtain the length.*/
cx= right(cx, max(w, L) );   new= newV3  cx     /*�*right justify  CX; concat to new list*/
if length(new)>sw  then do;  say newV3;  newV3= cx  /*�*line is too long, display #'s so far.*/
end                 /*�* [↑]  initialize the (new) next line.*/
else              newV3= new /*�*start with cuban # that wouldn't fit.*/
end   /*�*j*/
if \Nth  &  newV3\==''  then say newV3 /*�*check for residual cuban primes in $.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV4;  do jc=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, jc); end;  return newV4
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cuban-primes\cuban-primes.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
