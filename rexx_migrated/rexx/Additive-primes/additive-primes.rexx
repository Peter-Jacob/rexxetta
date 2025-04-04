/*ͺ*REXX program counts/displays the number of additive primes under a specified number N.*/
parse arg n cols .                               /*ͺ*get optional number of primes to find*/
if    n=='' |    n==","  then    n= 500          /*ͺ*Not specified?   Then assume default.*/
if cols=='' | cols==","  then cols=  10          /*ͺ* "      "          "     "       "   */
call genP n                                      /*ͺ*generate all primes under  N.        */
w= 10                                            /*ͺ*width of a number in any column.     */
title= " additive primes that are  < "     commas(n)
if cols>0  then say ' index β'center(title,  1 + cols*(w+1) )
if cols>0  then say 'ββββββββΌ'center(""   ,  1 + cols*(w+1), 'β')
found= 0;                  idx= 1                /*ͺ*initialize # of additive primes & IDX*/
newV3=                                               /*ͺ*a list of additive primes  (so far). */
do j=1  for newV6;      p= newV1.j                /*ͺ*obtain the  Jth  prime.              */
newV4= sumDigs(p);      if \newV2.newV4  then iterate /*ͺ*is sum of J's digs a prime? No, skip.*/       /*ͺ* ββ β β β β β β β  a filter. */
found= found + 1                          /*ͺ*bump the count of additive primes.   */
if cols<0                    then iterate /*ͺ*Build the list  (to be shown later)? */
c= commas(p)                              /*ͺ*maybe add commas to the number.      */
newV3= newV3  right(c, max(w, length(c) ) )       /*ͺ*add additive primeβββΊlist, allow big#*/
if found//cols\==0           then iterate /*ͺ*have we populated a line of output?  */
say center(idx, 7)'β'  substr(newV3, 2);  newV3=  /*ͺ*display what we have so far  (cols). */
idx= idx + cols                           /*ͺ*bump the  index  count for the output*/
end   /*ͺ*j*/

if newV3\==''  then say center(idx, 7)"β"  substr(newV3, 2)  /*ͺ*possible display residual output.*/
if cols>0  then say 'ββββββββ΄'center(""   ,  1 + cols*(w+1), 'β')
say
say 'found '      commas(found)      title
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas:  parse arg newV5; do jc=length(newV5)-3  to 1  by -3; newV5=insert(',', newV5, jc); end;  return newV5
sumDigs: parse arg x 1 s 2;  do k=2  for length(x)-1; s= s + substr(x,k,1); end;  return s
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: parse arg n;           newV1.1= 2;  newV1.2= 3;  newV1.3= 5;  newV1.4= 7;  newV1.5= 11;  newV1.6= 13
newV2.= 0;   newV2.2= 1;  newV2.3= 1;  newV2.5= 1;  newV2.7= 1;  newV2.11= 1;  newV2.13= 1
newV6= 6;  sq.newV6= newV1.newV6 ** 2 /*ͺ*the number of primes;  prime squared.*/
do j=newV1.newV6+2  by 2  for max(0, n%2-newV1.newV6%2-1)       /*ͺ*find odd primes from here on. */
parse var  j   ''  -1  newV4                 /*ͺ*obtain the last digit of the  J  var.*/
if     newV4==5  then iterate;  if j// 3==0  then iterate  /*ͺ*J Γ· by 5?   J Γ· by  3? */
if j// 7==0  then iterate;  if j//11==0  then iterate  /*ͺ*" "  " 7?   " "  " 11? */
/*ͺ* [β]  divide by the primes.   ___    */
do k=6  while sq.k<=j              /*ͺ*divide  J  by other primes βξεχΦ³ β J     */
if j//newV1.k==0  then iterate j       /*ͺ*Γ· by prev. prime?  Β¬prime     ___    */
end   /*ͺ*k*/                        /*ͺ* [β]   only divide up to     β J     */
newV6= newV6 + 1;    newV1.newV6= j;  sq.newV6= j*j;  newV2.j= 1 /*ͺ*bump prime count; assign prime & flag*/
end   /*ͺ*j*/;                      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Additive-primes\additive-primes.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
