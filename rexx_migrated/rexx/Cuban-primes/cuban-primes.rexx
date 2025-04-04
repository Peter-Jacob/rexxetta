/*ͺ*REXX program finds and displays a number of  cuban  primes  or the  Nth  cuban prime. */
numeric digits 20                                /*ͺ*ensure enough decimal digits for #s. */
parse arg N .                                    /*ͺ*obtain optional argument from the CL.*/
if N=='' | N==","  then N= 200                   /*ͺ*Not specified?  Then use the default.*/
Nth= N<0;               N= abs(N)                /*ͺ*used for finding the Nth cuban prime.*/
newV1.=0; newV1.0=1; newV1.2=1; newV1.3=1; newV1.4=1; newV1.5=1; newV1.6=1; newV1.8=1  /*ͺ*ending digs that aren't cubans.*/
sw= linesize() - 1;    if sw<1  then sw= 79      /*ͺ*obtain width of the terminal screen. */
w=12;              newV2= 1;    newV3= right(7, w)       /*ͺ*start with first cuban prime;  count.*/
do j=1  until newV2=>N;    x= (j+1)**3 - j**3   /*ͺ*compute a possible cuban prime.      */
parse var x '' -1 newV4;   if newV1.newV4  then iterate /*ͺ*check last digit for nonβcuban prime.*/
do k=1  until km*km>x;  km= k*6 + 1  /*ͺ*cuban primes can't be   Γ·   by  6k+1 */
if x//km==0  then iterate j          /*ͺ*Divisible?   Then not a cuban prime. */
end   /*ͺ*k*/
newV2= newV2+1                                      /*ͺ*bump the number of cuban primes found*/
if Nth  then do;  if newV2==N  then do;  say commas(x);  leave j;  end /*ͺ*display 1 num.*/
else iterate /*ͺ*j*/                      /*ͺ*keep searching*/
end                            /*ͺ* [β]  try to fit as many #s per line.*/
cx= commas(x);  L= length(cx)               /*ͺ*insert commasβββΊX; obtain the length.*/
cx= right(cx, max(w, L) );   new= newV3  cx     /*ͺ*right justify  CX; concat to new list*/
if length(new)>sw  then do;  say newV3;  newV3= cx  /*ͺ*line is too long, display #'s so far.*/
end                 /*ͺ* [β]  initialize the (new) next line.*/
else              newV3= new /*ͺ*start with cuban # that wouldn't fit.*/
end   /*ͺ*j*/
if \Nth  &  newV3\==''  then say newV3 /*ͺ*check for residual cuban primes in $.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV4;  do jc=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, jc); end;  return newV4
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cuban-primes\cuban-primes.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
