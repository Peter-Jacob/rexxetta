/*�*REXX program counts/displays the number of additive primes under a specified number N.*/
parse arg n cols .                               /*�*get optional number of primes to find*/
if    n=='' |    n==","  then    n= 500          /*�*Not specified?   Then assume default.*/
if cols=='' | cols==","  then cols=  10          /*�* "      "          "     "       "   */
call genP n                                      /*�*generate all primes under  N.        */
w= 10                                            /*�*width of a number in any column.     */
title= " additive primes that are  < "     commas(n)
if cols>0  then say ' index │'center(title,  1 + cols*(w+1) )
if cols>0  then say '───────┼'center(""   ,  1 + cols*(w+1), '─')
found= 0;                  idx= 1                /*�*initialize # of additive primes & IDX*/
newV3=                                               /*�*a list of additive primes  (so far). */
do j=1  for newV6;      p= newV1.j                /*�*obtain the  Jth  prime.              */
newV4= sumDigs(p);      if \newV2.newV4  then iterate /*�*is sum of J's digs a prime? No, skip.*/       /*�* ◄■■■■■■■■ a filter. */
found= found + 1                          /*�*bump the count of additive primes.   */
if cols<0                    then iterate /*�*Build the list  (to be shown later)? */
c= commas(p)                              /*�*maybe add commas to the number.      */
newV3= newV3  right(c, max(w, length(c) ) )       /*�*add additive prime──►list, allow big#*/
if found//cols\==0           then iterate /*�*have we populated a line of output?  */
say center(idx, 7)'│'  substr(newV3, 2);  newV3=  /*�*display what we have so far  (cols). */
idx= idx + cols                           /*�*bump the  index  count for the output*/
end   /*�*j*/

if newV3\==''  then say center(idx, 7)"│"  substr(newV3, 2)  /*�*possible display residual output.*/
if cols>0  then say '───────┴'center(""   ,  1 + cols*(w+1), '─')
say
say 'found '      commas(found)      title
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas:  parse arg newV5; do jc=length(newV5)-3  to 1  by -3; newV5=insert(',', newV5, jc); end;  return newV5
sumDigs: parse arg x 1 s 2;  do k=2  for length(x)-1; s= s + substr(x,k,1); end;  return s
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genP: parse arg n;           newV1.1= 2;  newV1.2= 3;  newV1.3= 5;  newV1.4= 7;  newV1.5= 11;  newV1.6= 13
newV2.= 0;   newV2.2= 1;  newV2.3= 1;  newV2.5= 1;  newV2.7= 1;  newV2.11= 1;  newV2.13= 1
newV6= 6;  sq.newV6= newV1.newV6 ** 2 /*�*the number of primes;  prime squared.*/
do j=newV1.newV6+2  by 2  for max(0, n%2-newV1.newV6%2-1)       /*�*find odd primes from here on. */
parse var  j   ''  -1  newV4                 /*�*obtain the last digit of the  J  var.*/
if     newV4==5  then iterate;  if j// 3==0  then iterate  /*�*J ÷ by 5?   J ÷ by  3? */
if j// 7==0  then iterate;  if j//11==0  then iterate  /*�*" "  " 7?   " "  " 11? */
/*�* [↓]  divide by the primes.   ___    */
do k=6  while sq.k<=j              /*�*divide  J  by other primes ����ֳ √ J     */
if j//newV1.k==0  then iterate j       /*�*÷ by prev. prime?  ¬prime     ___    */
end   /*�*k*/                        /*�* [↑]   only divide up to     √ J     */
newV6= newV6 + 1;    newV1.newV6= j;  sq.newV6= j*j;  newV2.j= 1 /*�*bump prime count; assign prime & flag*/
end   /*�*j*/;                      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Additive-primes\additive-primes.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
