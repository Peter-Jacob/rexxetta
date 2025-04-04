/*ช*REXX program  tests  if a number  (or a range of numbers)  is/are  perfect.           */
parse arg low high .                             /*ช*obtain the specified number(s).      */
if high=='' & low==""  then high=34000000        /*ช*if no arguments,  then use a range.  */
if  low==''            then  low=1               /*ช*if no   LOW,  then assume unity.     */
if high==''            then high=low             /*ช*if no  HIGH,  then assume  LOW.      */
w=length(high)                                   /*ช*use  W  for formatting the output.   */
numeric digits max(9,w+2)                        /*ช*ensure enough digits to handle number*/

do i=low  to high                   /*ช*process the single number or a range.*/
if isPerfect(i)  then say  right(i,w)  'is a perfect number.'
end   /*ช*i*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
isPerfect: procedure;  parse arg x 1 y           /*ช*obtain the number to be tested.      */
if x==6  then return 1                /*ช*handle the special case of  six.     */
/*ช*[โ]  perfect number's digitalRoot = 1*/
do  until  y<10                 /*ช*find the digital root of  Y.         */
parse var y r 2;   do k=2  for length(y)-1; r=r+substr(y,k,1); end  /*ช*k*/
y=r                             /*ช*find digital root of the digit root. */
end   /*ช*until*/                 /*ช*wash, rinse, repeat ยทยทยท              */

if r\==1  then return 0               /*ช*Digital root ยฌ 1?   Then  ยฌ perfect. */
s=1                                   /*ช*the first factor of  X.           ___*/
do j=2  while  j*j<=x     /*ช*starting at 2, find the factors โคโ X */
if x//j\==0  then iterate /*ช*J  isn't a factor of X,  so skip it. */
s = s + j + x%j           /*ช*ยทยทยท add it  and  the other factor.   */
end   /*ช*j*/               /*ช*(above)  is marginally faster.       */
return s==x                           /*ช*if the sum matches  X, it's perfect! */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perfect-numbers\perfect-numbers-4.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
