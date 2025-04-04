/*ͺ*REXX program finds & displays  N  Sundaram primes, or displays the Nth Sundaram prime.*/
parse arg n cols .                               /*ͺ*get optional number of primes to find*/
if    n=='' |    n==","  then    n= 100          /*ͺ*Not specified?   Then assume default.*/
if cols=='' | cols==","  then cols=  10          /*ͺ* "      "          "     "       "   */
newV1.= .;                             lim= 16 * n   /*ͺ*default value for array; filter limit*/
do    j=1  for n;   do k=1  for n  until newV2>lim;  newV2= j + k + 2*j*k;  newV1.newV2=
end   /*ͺ*k*/
end      /*ͺ*j*/
w= 10                                            /*ͺ*width of a number in any column.     */
title= 'a list of '   commas(N)   " Sundaram primes"
if cols>0  then say ' index β'center(title,  1 + cols*(w+1)     )
if cols>0  then say 'ββββββββΌ'center(""   ,  1 + cols*(w+1), 'β')
newV3= 0;                         idx= 1             /*ͺ*initialize # of Sundaram primes & IDX*/
newV4=                                               /*ͺ*a list of Sundaram primes  (so far). */
do j=1  until newV3==n                        /*ͺ*display the output (if cols > 0).    */
if newV1.j\==.  then iterate                  /*ͺ*Is the number not prime?  Then skip. */
newV3= newV3 + 1                                  /*ͺ*bump number of Sundaram primes found.*/
a= j                                      /*ͺ*save J for calculating the Nth prime.*/
if cols<=0  then iterate                  /*ͺ*Build the list  (to be shown later)? */
c= commas(j + j + 1)                      /*ͺ*maybe add commas to  Sundaram  prime.*/
newV4= newV4  right(c, max(w, length(c) ) )       /*ͺ*add Sundaram primeβββΊlist, allow big#*/
if newV3//cols\==0  then iterate              /*ͺ*have we populated a line of output?  */
say center(idx, 7)'β'  substr(newV4, 2);  newV4=  /*ͺ*display what we have so far  (cols). */
idx= idx + cols                           /*ͺ*bump the  index  count for the output*/
end   /*ͺ*j*/

if newV4\==''  then say center(idx, 7)"β"  substr(newV4, 2)  /*ͺ*possible display residual output.*/
if cols>0  then say 'ββββββββ΄'center(""   ,  1 + cols*(w+1), 'β')
say
say 'found ' commas(newV3)  " Sundaram primes, and the last Sundaram prime is "  commas(a+a+1)
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV5;  do jc=length(newV5)-3  to 1  by -3; newV5=insert(',', newV5, jc); end;  return newV5
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\The-sieve-of-Sundaram\the-sieve-of-sundaram.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
