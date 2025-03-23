/*ª*REXX program adds and multiplies   N   elements of a (populated)  array  @. */
numeric digits 200                     /*ª*200 decimal digit #s  (default is 9).*/
parse arg N .;  if N==''  then N=20    /*ª*Not specified?  Then use the default.*/

do j=1  for N                /*ª*build array of  N  elements (or 20?).*/
newV1.j=j                        /*ª*set 1st to 1, 3rd to 3, 8th to 8 Â·Â·Â· */
end   /*ª*j*/
sum=0                                  /*ª*initialize  SUM  (variable) to zero. */
prod=1                                 /*ª*initialize  PROD (variable) to unity.*/
do k=1  for N
sum  = sum  + newV1.k            /*ª*add the element to the running total.*/
prod = prod * newV1.k            /*ª*multiply element to running product. */
end   /*ª*k*/                  /*ª* [â†‘]  this pgm:  same as N factorial.*/

say '     sum of '     m     " elements for the  @  array is: "     sum
say ' product of '     m     " elements for the  @  array is: "     prod
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-and-product-of-an-array\sum-and-product-of-an-array.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
