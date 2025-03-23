/*�*REXX program adds and multiplies   N   elements of a (populated)  array  @. */
numeric digits 200                     /*�*200 decimal digit #s  (default is 9).*/
parse arg N .;  if N==''  then N=20    /*�*Not specified?  Then use the default.*/

do j=1  for N                /*�*build array of  N  elements (or 20?).*/
newV1.j=j                        /*�*set 1st to 1, 3rd to 3, 8th to 8 ··· */
end   /*�*j*/
sum=0                                  /*�*initialize  SUM  (variable) to zero. */
prod=1                                 /*�*initialize  PROD (variable) to unity.*/
do k=1  for N
sum  = sum  + newV1.k            /*�*add the element to the running total.*/
prod = prod * newV1.k            /*�*multiply element to running product. */
end   /*�*k*/                  /*�* [↑]  this pgm:  same as N factorial.*/

say '     sum of '     m     " elements for the  @  array is: "     sum
say ' product of '     m     " elements for the  @  array is: "     prod
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-and-product-of-an-array\sum-and-product-of-an-array.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
