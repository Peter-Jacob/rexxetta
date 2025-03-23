/*�*REXX program computes & shows the factorial of an integer,  striping trailing zeroes. */
numeric digits 200                               /*�*start with two hundred digits.       */
parse arg N .                                    /*�*obtain an optional argument from CL. */
if N=='' | N==","  then N= 0                     /*�*Not specified?  Then use the default.*/
newV1= 1                                             /*�*define the factorial product so far. */
do j=2  to N                                 /*�*compute factorial the hard way.      */
oldnewV1= newV1                                      /*�*save old product in case of overflow.*/
newV1= newV1 * j                                     /*�*multiple the old factorial with   J. */
if pos(.,newV1) \==0  then do                    /*�*is the   !   in exponential notation?*/
d= digits()           /*�*D   temporarily stores number digits.*/
numeric digits d+d%10 /*�*add  10%  to the   decimal digits.   */
newV1= oldnewV1 * j           /*�*re─calculate for the  "lost"  digits.*/
end                   /*�*IFF ����ֱ if and only if.  [↓]           */
parse var  newV1  ''  -1  newV2                      /*�*obtain the right-most digit of  !    */
if newV2==0  then newV1= strip(newV1, , 0)               /*�*strip trailing zeroes  IFF  the ...  */
end   /*�*j*/                                  /*�* [↑]  ...  right-most digit is zero. */
z= 0                                             /*�*the number of trailing zeroes in  !  */
do v=5  by 0  while v<=N                     /*�*calculate number of trailing zeroes. */
z= z   +   N % v                             /*�*bump   Z   if multiple power of five.*/
v= v * 5                                     /*�*calculate the next power of five.    */
end   /*�*v*/                                  /*�* [↑]  we only advance  V  by ourself.*/
/*�*stick a fork in it,  we're all done. */
newV1= newV1 || copies(0, z)                             /*�*add water to rehydrate the product.  */
if z==0  then z= 'no'                            /*�*use gooder English for the message.  */
say N'!  is      ['length(newV1)        " digits  with "        z        ' trailing zeroes]:'
say                                              /*�*display blank line  (for whitespace).*/
say newV1                                            /*�*display the factorial product.       */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Factorial\factorial-3.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
