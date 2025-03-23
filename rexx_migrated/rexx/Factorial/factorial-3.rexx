/*ª*REXX program computes & shows the factorial of an integer,  striping trailing zeroes. */
numeric digits 200                               /*ª*start with two hundred digits.       */
parse arg N .                                    /*ª*obtain an optional argument from CL. */
if N=='' | N==","  then N= 0                     /*ª*Not specified?  Then use the default.*/
newV1= 1                                             /*ª*define the factorial product so far. */
do j=2  to N                                 /*ª*compute factorial the hard way.      */
oldnewV1= newV1                                      /*ª*save old product in case of overflow.*/
newV1= newV1 * j                                     /*ª*multiple the old factorial with   J. */
if pos(.,newV1) \==0  then do                    /*ª*is the   !   in exponential notation?*/
d= digits()           /*ª*D   temporarily stores number digits.*/
numeric digits d+d%10 /*ª*add  10%  to the   decimal digits.   */
newV1= oldnewV1 * j           /*ª*reâ”€calculate for the  "lost"  digits.*/
end                   /*ª*IFF â‰îå÷Ö± if and only if.  [â†“]           */
parse var  newV1  ''  -1  newV2                      /*ª*obtain the right-most digit of  !    */
if newV2==0  then newV1= strip(newV1, , 0)               /*ª*strip trailing zeroes  IFF  the ...  */
end   /*ª*j*/                                  /*ª* [â†‘]  ...  right-most digit is zero. */
z= 0                                             /*ª*the number of trailing zeroes in  !  */
do v=5  by 0  while v<=N                     /*ª*calculate number of trailing zeroes. */
z= z   +   N % v                             /*ª*bump   Z   if multiple power of five.*/
v= v * 5                                     /*ª*calculate the next power of five.    */
end   /*ª*v*/                                  /*ª* [â†‘]  we only advance  V  by ourself.*/
/*ª*stick a fork in it,  we're all done. */
newV1= newV1 || copies(0, z)                             /*ª*add water to rehydrate the product.  */
if z==0  then z= 'no'                            /*ª*use gooder English for the message.  */
say N'!  is      ['length(newV1)        " digits  with "        z        ' trailing zeroes]:'
say                                              /*ª*display blank line  (for whitespace).*/
say newV1                                            /*ª*display the factorial product.       */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Factorial\factorial-3.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
