/*ช*REXX program  tests  if a  number  (or a range of numbers)  is/are  perfect.          */
parse arg low high .                             /*ช*obtain optional arguments from the CL*/
if high=='' & low==""  then high=34000000        /*ช*if no arguments, then use a  range.  */
if  low==''            then  low=1               /*ช*if no   LOW,  then assume  unity.    */
if high==''            then high=low             /*ช*if no  HIGH,  then assume   LOW.     */
w=length(high)                                   /*ช*use   W   for formatting the output. */
numeric digits max(9,w+2)                        /*ช*ensure enough digits to handle number*/

do i=low  to high                    /*ช*process the single number or a range.*/
if isPerfect(i)  then say  right(i,w)   'is a perfect number.'
end   /*ช*i*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
isPerfect: procedure;  parse arg x               /*ช*obtain the number to be tested.      */
if x<6  then return 0                 /*ช*perfect numbers can't be  <  six.    */
s=1                                   /*ช*the first factor of  X.           ___*/
do j=2  while  j*j<=x     /*ช*starting at 2, find the factors โคโ X */
if x//j\==0  then iterate /*ช*J  isn't a factor of  X,  so skip it.*/
s = s + j + x%j           /*ช* ยทยทยท add it  and  the other factor.  */
end   /*ช*j*/               /*ช*(above)  is marginally faster.       */
return s==x                            /*ช*if the sum matches  X, it's perfect! */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perfect-numbers\perfect-numbers-3.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
