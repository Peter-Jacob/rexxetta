/*�*╔════════════════════════════════════════════════════════════════════╗
║ Calling a function with optional arguments.                        ║
║                                                                    ║
║ Note that not passing an argument isn't the same as passing a null ║
║ argument  (a REXX variable whose value is length zero).            ║
╚════════════════════════════════════════════════════════════════════╝*/

x= 12;   w= x/2;   y= x**2;    z= x//7           /*�* z  is  x  modulo seven.             */
say 'sum of w, x, y, & z='  SumIt(w,x,y,,z)      /*�*pass five args, the 4th arg is "null"*/
exit                                             /*�*stick a fork in it,  we're all done. */

SumIt: procedure
newV1= 0                                      /*�*initialize the sum to zero.          */
do j=1  for arg()                   /*�*obtain the sum of a number of args.  */
if arg(j,'E')  then newV1= newV1 + arg(j)   /*�*the  Jth  arg may have been omitted. */
end   /*�*j*/

return newV1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Call-a-function\call-a-function-3.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
