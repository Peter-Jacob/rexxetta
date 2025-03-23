/*�*REXX program  tests  if a number  (or a range of numbers)  is/are  perfect.           */
parse arg low high .                             /*�*obtain optional arguments from the CL*/
if high=='' & low==""  then high=34000000        /*�*if no arguments,  then use a  range. */
if  low==''            then  low=1               /*�*if no   LOW,  then assume unity.     */
low=low+low//2                                   /*�*if LOW is odd,   bump it by  one.    */
if high==''            then high=low             /*�*if no  HIGH,   then assume  LOW.     */
w=length(high)                                   /*�*use  W  for formatting the output.   */
numeric digits max(9,w+2)                        /*�*ensure enough digits to handle number*/

do i=low  to high  by 2              /*�*process the single number or a range.*/
if isPerfect(i)  then say  right(i,w)   'is a perfect number.'
end   /*�*i*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isPerfect: procedure;  parse arg x 1 y           /*�*obtain the number to be tested.      */
if x==6  then return 1                /*�*handle the special case  of  six.    */

do  until  y<10                   /*�*find the digital root of  Y.         */
parse var y 1 r 2;    do k=2  for length(y)-1; r=r+substr(y,k,1); end /*�*k*/
y=r                               /*�*find digital root of the digital root*/
end   /*�*until*/                   /*�*wash, rinse, repeat ···              */

if r\==1  then return 0               /*�*Digital root ¬ 1 ?    Then ¬ perfect.*/
s=3 + x%2                             /*�*the first 3 factors of X.         ___*/
do j=3  while  j*j<=x     /*�*starting at 3, find the factors ≤√ X */
if x//j\==0  then iterate /*�*J  isn't a factor o f X,  so skip it.*/
s = s + j + x%j           /*�*  ··· add it  and  the other factor. */
end   /*�*j*/               /*�*(above)  is marginally faster.       */
return s==x                           /*�*if sum matches  X, then it's perfect!*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perfect-numbers\perfect-numbers-5.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
